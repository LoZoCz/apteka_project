<?php
  $name = 'localhost';
  $login = 'root';
  $paswd = '';
  $base = 'apteka';
  
  $conn = mysqli_connect($name, $login, $paswd, $base);
  
  if(!$conn){
    echo('Nie działa');
  } else {
    // echo('Działa');
  }
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
    
    <link rel="stylesheet" href="styles/style.css" />
    <script src="js/main.js" defer></script>
    <script src="js/img.js" defer></script>
    <script src="js/modal.js" defer></script>
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
          <button class="open-client-form">
            <i class="fa-regular fa-user"></i>
          </button>
          <label class="switch">
            <input type="checkbox" class="switch-box" data-theme='light'/>
            <span class="slider round"></span>
          </label>
        </nav>
      </div>
    </header>
    <nav class="filter-bar">
      <a href="products.php">Leki</a>
      <a href="products.php">Suplementy diety</a>
      <a href="products.php">Inne</a>
    </nav>
    <dialog class="new-client-form">
      <form action="" class="client-form" method="post">
        <div>
          <label for="client-name">Imię:</label><br>
          <input type="text" name="client-name" id="client-name">
        </div>
        <div>
          <label for="client-surname">Nazwisko:</label><br>
          <input type="text" name="client-surname" id="client-surname">
        </div>
        <div>
          <label for="client-mail">Email:</label><br>
          <input type="text" name="client-mail" id="client-mail">
        </div>
        <div>
          <label for="client-number">Numer telefonu:</label><br>
          <input type="text" name="client-number" id="client-number">
        </div>
        <div>
          <label for="client-address">Adres, Miasto:</label><br>
          <input type="text" name="client-address" id="client-address">
        </div>

        <button class="submit-client-form" type="submit" name="submit-client-form">Stwórz profil</button>

        <button class="close-client-form">
          <i class="fa-solid fa-xmark"></i>
        </button>
        <?php
          @$imie = $_POST['client-name'];
          @$nazwisko = $_POST['client-surname'];
          @$email = $_POST['client-mail'];
          @$numer = $_POST['client-number'];
          @$adres = $_POST['client-address'];

          if(isset($_POST['submit-client-form'])){
            // echo($imie);
            // echo($nazwisko);
            // echo($email);
            // echo($numer);
            // echo($adres);

            if(empty($imie) || empty($nazwisko) || empty($email) || empty($numer) || empty($adres)) {
              echo('<p class="submit-info">Uzupełnij formularz</p>');
            } else {
              $clientQuery = "INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `email`, `numer_telefonu`, `adres`) VALUES (NULL, '$imie', '$nazwisko', '$email', '$numer', '$adres')";

              $clientAsk = mysqli_query($conn, $clientQuery);

              echo('<p class="submit-info">Dodawanie konta powiodło się</p>');
            }
          }
        ?>
      </form>
    </dialog>
    <main class="main-site">
      <div class="slider-box">
        <div class="sliding-wrapper">
          <img src="images/apteka1.jpg" alt="" class="image1-slider images"/>
          <img src="images/apteka2.jpg" alt="" class="image2-slider images"/>
          <img src="images/apteka3.jpg" alt="" class="image3-slider images"/>
          <img src="images/apteka4.jpg" alt="" class="image4-slider images"/>
        </div>
      </div>
      <div class="specific-section">
        <h1>STREFA PIĘKNA</h1>
        <div class="items-box">
          <div class="image-block block">
            <img src="images/zdrowie.jpg" alt="" class="block-img" />
            <div class="title-box">
              <h3>STREFA PIĘKNA</h3>
              <a href="products.php">
                <button class="check-btn">SPRAWDŹ</button>
              </a>
            </div>
          </div>
          <!-- SKRYPT PHP -->
            <?php
              $query1 = 'SELECT `nazwa_leku`, `kategoria`, `cena_jednostkowa`, `zdjecie_leku` FROM `lekarstwa` WHERE `kategoria`="Suplement diety";';

              $zapytanie1 = mysqli_query($conn, $query1);

              while($data1 = mysqli_fetch_assoc($zapytanie1)){
                $cena = number_format($data1['cena_jednostkowa'], 2, ',', '');

                echo('<div class="block lek">');
                echo('<picture>');
                echo('<img src="images/' . $data1['zdjecie_leku'] . '" alt="lek">');
                echo('</picture>');
                echo('<div class="item-info-box">');
                echo('<h3 class="name">' . $data1['nazwa_leku'] . '</h3>');
                echo('<p class="desc">' . $data1['kategoria'] . '</p>');
                echo('<h1 class="price">' . $cena . 'zł</h1>');
                echo('<a href="buy.php"><button class="buyBtn">Kup teraz</button></a>');
                echo('</div>');
                echo('</div>');
              }
            ?>
        </div>
      </div>
      <div class="specific-section">
        <h1>ZDROWA STREFA</h1>
        <div class="items-box">
          <div class="image-block block">
            <img src="images/zdrowie2.jpg" alt="" class="block-img" />
            <div class="title-box">
              <h3>ZDROWA STREFA</h3>
              <a href="products.php">
                <button class="check-btn">SPRAWDŹ</button>
              </a>
            </div>
          </div>
          <?php
              $query2 = 'SELECT `nazwa_leku`, `kategoria`, `cena_jednostkowa`, `zdjecie_leku` FROM `lekarstwa` WHERE kategoria LIKE "%lek%" LIMIT 6;';

              $zapytanie2 = mysqli_query($conn, $query2);

              while($data2 = mysqli_fetch_assoc($zapytanie2)){
                $cena = number_format($data2['cena_jednostkowa'], 2, ',', '');
                
                echo('<div class="block lek">');
                echo('<picture>');
                echo('<img src="images/' . $data2['zdjecie_leku'] . '" alt="lek">');
                echo('</picture>');
                echo('<div class="item-info-box">');
                echo('<h3 class="name">' . $data2['nazwa_leku'] . '</h3>');
                echo('<p class="desc">' . $data2['kategoria'] . '</p>');
                echo('<h1 class="price">' . $cena . 'zł</h1>');
                echo('<button class="buyBtn">Kup teraz</button>');
                echo('</div>');
                echo('</div>');
              }
            ?>
        </div>
      </div>
      <div class="comments-wrapper">
        <div class="comment-box comment1">
          <img src="images/doctor2.jpg" alt="" class="comment-pfp" />
          <div class="comment">
            <h1>Dr Maria G.</h1>
            <p>
              "Jako doświadczona lekarka, chciałabym polecić aptekę VitaFarm.
              Jest to miejsce, w którym pacjenci zawsze mogą liczyć na pomoc i
              fachową poradę ze strony wykwalifikowanego personelu. W ofercie
              apteki znajdują się produkty, które pomogą utrzymać zdrowie i
              witalność, a także poprawić samopoczucie. Bardzo ważne jest
              również to, że VitaFarm zawsze dba o jakość swoich produktów, co
              dla mnie, jako lekarki, jest niezwykle istotne. Z całego serca
              polecam tę aptekę każdej osobie, która ceni sobie profesjonalizm,
              jakość i fachową pomoc farmaceutyczną."
            </p>
          </div>
        </div>
        <div class="comment-box comment2">
          <div class="comment">
            <h1>Dr Tomasz K.</h1>
            <p>
              "Jako lekarz z wieloletnim doświadczeniem, mogę z czystym
              sumieniem polecić aptekę VitaFarm. Ich personel jest kompetentny i
              zawsze służy pomocą, a ich asortyment produktów jest bogaty i
              urozmaicony. Dodatkowo, zawsze dbają o jakość oferowanych leków i
              suplementów diety, co jest niezwykle ważne dla zdrowia pacjentów.
              Gorąco polecam tę aptekę każdemu, kto szuka nie tylko produktów
              wysokiej jakości, ale także fachowej porady farmaceuty."
            </p>
          </div>
          <img src="images/doctor1.jpg" alt="" class="comment-pfp" />
        </div>
      </div>
    </main>
    <footer>
      <div class="grid-box">
        <div class="grid-col1">
          <h4>VitaFarm</h4>
          <ul>
            <li><a href="#">O nas</a></li>
            <li><a href="#">Regulamin</a></li>
            <li><a href="#">Kontakt</a></li>
            <li><a href="#">Nota prawna</a></li>
          </ul>
        </div>
        <div class="grid-col2">
          <h4>Zakupy</h4>
          <ul>
            <li><a href="#">Płatności</a></li>
            <li><a href="#">Koszty dotawy</a></li>
            <li><a href="#">Reklamacje / Zwroty</a></li>
            <li><a href="#">Polityka prywatności</a></li>
          </ul>
        </div>
        <div class="grid-col3">
          <h4>Śledź nas na</h4>
          <ul>
            <li>
              <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa-brands fa-instagram"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa-brands fa-twitter"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa-brands fa-youtube"></i></a>
            </li>
          </ul>
        </div>
      </div>
      <div class="bottom-text">
        <p>VitaFarm</p>
        <p>Strone stworzył: Mateusz Czernik</p>
        <p>
          Mail: <a href="mialto:m.czernik12@gmail.com">m.czernik12@gmail.com</a>
        </p>
      </div>
    </footer>
    <?php
      mysqli_close($conn);
    ?>
  </body>
</html>
