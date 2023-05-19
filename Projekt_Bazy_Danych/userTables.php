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

    <link rel="stylesheet" href="styles/style3.css" />
    <script src="js/tabels.js" defer></script>
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
      <aside class="table-options">
        <form action="" method="post">
        <ul>
          <li><button class="lekarstwaBtn" name="lekarstwaBtn">Lekarstwa</button></li>
          <li><button class="dostawcyBtn" name="dostawcyBtn">Dostawcy</button></li>
          <li><button class="dostawyBtn" name="dostawyBtn">Dostawy</button></li>
          <li><button class="pracownicyBtn" name="pracownicyBtn">Pracownicy</button></li>
          <li><button class="klienciBtn" name="klienciBtn">Klienci</button></li>
          <li><button class="zamowieniaBtn" name="zamowieniaBtn">Zamowienia</button></li>
          <li><button class="szczegolyBtn" name="szczegolyBtn">Szczegóły zam.</button></li>
        </ul>
        </form>
      </aside>
      <section class="table-view">
        <table>
        <?php
          $name = 'localhost';
          $login = 'root';
          $paswd = '';
          $base = 'apteka';

          $conn = mysqli_connect($name, $login, $paswd, $base);

          if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
          }

          if (isset($_POST['lekarstwaBtn'])) {
            $sql = "SELECT * FROM lekarstwa";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela produktów</caption>');
            echo('<thead>');
            echo('<th>id lekarstwa</th><th>nazwa leku</th><th>kategoria</th><th>substacje czynne</th><th>dawka</th><th>opakowanie</th><th>cena jednostkowa</th><th>ilosc</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td><td>" . $row[6] . "</td><td>" . $row[8] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }
        
          if (isset($_POST['dostawcyBtn'])) {
            $sql = "SELECT * FROM dostawcy";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela dostawców</caption>');
            echo('<thead>');
            echo('<th>id dostawcow</th><th>nazwa</th><th>email</th><th>numer telefonu</th><th>adres</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }

          if (isset($_POST['dostawyBtn'])) {
            $sql = "SELECT * FROM dostawy";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela dostawców</caption>');
            echo('<thead>');
            echo('<th>id dostawy</th><th>id dostawcy</th><th>id lekarstwa</th><th>ilosc</th><th>data dostawy</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }

          if (isset($_POST['pracownicyBtn'])) {
            $sql = "SELECT * FROM pracownicy";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela dostawców</caption>');
            echo('<thead>');
            echo('<th>id pracownika</th><th>imie</th><th>nazwisko</th><th>email</th><th>numer telefonu</th><th>stanowisko</th><th>wyanagrodzenie</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td><td>" . $row[6] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }

          if (isset($_POST['klienciBtn'])) {
            $sql = "SELECT * FROM klienci";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela dostawców</caption>');
            echo('<thead>');
            echo('<th>id klienta</th><th>imie</th><th>nazwisko</th><th>email</th><th>numer telefonu</th><th>adres</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td><td>" . $row[4] . "</td><td>" . $row[5] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }

          if (isset($_POST['zamowieniaBtn'])) {
            $sql = "SELECT * FROM zamowienia";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela dostawców</caption>');
            echo('<thead>');
            echo('<th>id zamowienia</th><th>id klienta</th><th>data zamówienia</th><th>status zamówienia</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }

          if (isset($_POST['szczegolyBtn'])) {
            $sql = "SELECT szczegoly_zamowienia.id_zamowienia, szczegoly_zamowienia.id_lekarstwa, lekarstwa.nazwa_leku, szczegoly_zamowienia.ilosc_produktow FROM szczegoly_zamowienia INNER JOIN lekarstwa ON szczegoly_zamowienia.id_lekarstwa = lekarstwa.id_lekarstwa;";
            $result = mysqli_query($conn, $sql);

            echo('<caption>Tabela szczegółów zamówień</caption>');
            echo('<thead>');
            echo('<th>id zamowienia</th><th>id lekarstwa</th><th>nazwa leku</th><th>ilość produktow</th>');
            echo('</thead>');
          
            if (mysqli_num_rows($result) > 0) {
              while ($row = mysqli_fetch_row($result)) {
                echo "<tr><td>" . $row[0] . "</td><td>" . $row[1] . "</td><td>" . $row[2] . "</td><td>" . $row[3] . "</td></tr>";
              }
            } else {
              echo "0 results";
            }
          }
        ?>
        </table>
      </section>
    </main>
    <?php
      mysqli_close($conn);
    ?>
  </body>
</html>
</body>
</html>