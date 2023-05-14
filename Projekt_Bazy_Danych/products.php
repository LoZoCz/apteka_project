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

    <link rel="stylesheet" href="styles/style4.css" />
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
        <?php
            $name = 'localhost';
            $login = 'root';
            $paswd = '';
            $base = 'apteka';
  
            $conn = mysqli_connect($name, $login, $paswd, $base);
  
            if (!$conn) {
              die("Connection failed: " . mysqli_connect_error());
            }
            
            $sql = "SELECT nazwa_leku, kategoria, opakowanie, cena_jednostkowa, zdjecie_leku FROM lekarstwa";
            $result = mysqli_query($conn, $sql);

            $i = 0;

            while($data = mysqli_fetch_assoc($result)){

                $i++;

                $cena = number_format($data['cena_jednostkowa'], 2, ',', '');

                echo('<div class="product lek' . $i . '">');
                echo('<picture>');
                echo('<img src="images/' . $data['zdjecie_leku'] . '" alt="lek">');
                echo('</picture>');
                echo('<div class="title">');
                echo('<h3>' . $data['nazwa_leku'] . '</h3>');
                echo('<p>' . $data['kategoria'] . ', ' . $data['opakowanie'] . '</p>');
                echo('<h1>' . $cena . '</h1>');
                echo('<a href="buy.php"><button class="buyBtn">KUP TERAZ</button></a>');
                echo('</div>');
                echo('</div>');
            }
        ?>
    </main>
    <?php
      mysqli_close($conn);
    ?>
  </body>
</html>
