<?php
  session_start();
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="shortcut icon"
      href="images/logo_transparent.png"
      type="image/x-icon"
    />
    <title>VitaFarm - Apteka</title>

    <link rel="stylesheet" href="styles/style5.css" />
    <script src="js/main.js" defer></script>
    <script
      src="https://kit.fontawesome.com/c4587b3804.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <header class="heading-bar">
      <a href="index.php" title="Strona główna">
        <img
          src="images/facebook_cover_photo_1.png"
          alt="main-logo"
          class="main-logo"
        />
      </a>
      <div class="options-box">
        <button class="option-btn" aria-expanded="false">
          <i class="fa-solid fa-bars"></i>
        </button>
        <nav class="options-nav-box" data-visible="false">
        <a href="user.php">
            <button class="user-menu">
            <i class="fa-solid fa-arrow-right-to-bracket"></i>
            </button>
          </a>
          <label class="switch">
            <input type="checkbox" class="switch-box" data-theme='light'/>
            <span class="slider round"></span>
          </label>
        </nav>
      </div>
    </header>
    <main class="main-site">
      <form action="" method="post" class="checking-form">
        <div class="inpWrapper">
          <div class="checkWrapper">
          <div>
            <label for="check-name">Imię:</label><br>
            <input type="text" name="check-name" id="check-name" class="checkInp">
          </div>
          <div>
            <label for="check-surname">Nazwisko:</label><br>
            <input type="text" name="check-surname" id="check-surname" class="checkInp">
          </div>
          <button class="check-client-form" type="submit" name="check-client-form">Sprawdź profil</button>
          <?php
            $name = 'localhost';
            $login = 'root';
            $paswd = '';
            $base = 'apteka';

            $conn = mysqli_connect($name, $login, $paswd, $base);

            if (!$conn) {
              die("Connection failed: " . mysqli_connect_error());
            }

            if(isset($_POST['check-client-form'])){
              @$imie = $_POST['check-name'];
              @$nazwisko = $_POST['check-surname'];

              if(empty($imie) && empty($nazwisko)){
                echo('Uzupelnij formularz');
              } else {
                $checkQue = "SELECT `imie`, `nazwisko` FROM `klienci` WHERE imie='$imie' AND nazwisko='$nazwisko'";
                $sqlQuery = mysqli_query($conn, $checkQue);
              
                if(!$sqlQuery){
                  echo('<p class="checkInfo">Error: 0000</p>');
                } else {
                  if(mysqli_num_rows($sqlQuery) > 0){
                    echo('<p class="checkInfo">Twoje konto istnieje</p>');
                    
                    $klient = "SELECT `id_klienta` FROM `klienci` WHERE imie='$imie' AND nazwisko='$nazwisko'";
                    $klientQuery = mysqli_query($conn, $klient);
                    $klientID = mysqli_fetch_assoc($klientQuery);
                    $globalID = $klientID['id_klienta'];

                    $_SESSION['globalID'] = $globalID;
                    // echo($globalID);
                  } else {
                    echo('<p class="checkInfo">Nie jesteś zapisany do naszej bazy danych</p>');
                  }
                }
              }
            }
          ?>
          </div>
          <div class="liczbaIBtn">
            <input type="number" name="iloscLekow" class="iloscLekow" placeholder="Podaj ilość produktów">
            <button class="zamowBtn" type="submit" name="zamowBtn">ZAMÓW</button>
          </div>
        </div>
        <div class="zamowWrapper">
          <div class="leki">
            <?php
                $nazwyLekow = 'SELECT `nazwa_leku` FROM `lekarstwa` WHERE 1;';
                $zapLeki = mysqli_query($conn, $nazwyLekow);
                while($lekData = mysqli_fetch_assoc($zapLeki)){
                  echo('<div>');
                  echo('<label for="' . $lekData['nazwa_leku'] . '">' . $lekData['nazwa_leku'] . '</label><br>');
                  echo('<label for="' . $lekData['nazwa_leku'] . '" class="container">');
                  echo('<input type="radio" value="' . $lekData['nazwa_leku'] . '" class="chooseLek" id="' . $lekData['nazwa_leku'] . '" name="lek">');
                  echo('<span class="checkmark"></span>');
                  echo('</label>');
                  echo('</div>');
                }
            ?>
          </div>
        </div>
        <?php
          if(isset($_POST['zamowBtn'])){
            if(!empty($_SESSION['globalID'])){
              if(!empty($_POST['iloscLekow'])){
                $ilosc = $_POST['iloscLekow'];
                if(!empty($_POST['lek'])){
                  $lekInp = $_POST['lek'];
  
                  $lekarstwo = "SELECT `id_lekarstwa` FROM `lekarstwa` WHERE nazwa_leku='$lekInp'";             
                  $lekQuery = mysqli_query($conn, $lekarstwo);
                  $szukLekID = mysqli_fetch_assoc($lekQuery);
                  $lekID = $szukLekID['id_lekarstwa'];
  
                  $dataDnia = date("Y-m-d");
  
                  $zamIDKlienta = $_SESSION['globalID'];
  
                  $idZam = "SELECT `id_zamowienia`FROM `szczegoly_zamowienia` WHERE 1 ORDER BY `id_zamowienia` DESC LIMIT 1;";             
                  $zamIdQuery = mysqli_query($conn, $idZam);
                  $szukZamID = mysqli_fetch_assoc($zamIdQuery);
                  $zamID = $szukZamID['id_zamowienia'];
                  $newZamID = $zamID + 1;
  
  
                  $zamowienieQuery = "INSERT INTO `zamowienia`(`id_klienta`, `data_zamowienia`, `status_zamowienia`) VALUES ('$zamIDKlienta','$dataDnia','Złożone')";
                  mysqli_query($conn, $zamowienieQuery);
            
                  // Pobierz wartość id_zamowienia dla nowo dodanego zamówienia
                  $lastInsertedId = mysqli_insert_id($conn);
            
                  // Dodaj rekord do tabeli szczegoly_zamowienia
                  $szczegolyQuery = "INSERT INTO `szczegoly_zamowienia`(`id_zamowienia`, `id_lekarstwa`, `ilosc_produktow`) VALUES ('$lastInsertedId','$lekID','$ilosc')";
                  mysqli_query($conn, $szczegolyQuery);
            
                  // echo('Nazwa leku: ' . $lekInp . '<br> ID lekarstwa: ' . $lekID . '<br> Data: ' . $dataDnia . '<br> ID zamowienia: ' . $lastInsertedId . '<br> Ilosc leków: ' . $ilosc . '<br> ID klienta: ' . $_SESSION['globalID']);
                  echo('Twoje zamówienie zostało złożone.');

                  session_destroy();
                }
              }
            } else {
              echo('Sprawdz profil klienta.');
            }
          }
        ?>
      </form>
    </main>
    <?php
      mysqli_close($conn);
    ?>
  </body>
</html>