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
                
    if (isset($_POST['sub-btn'])) {
        $username = $_POST['user-name'];
        $password = $_POST['user-password'];

        // zabezpieczenie przed atakami SQL Injection
        $username = mysqli_real_escape_string($conn, $username);
        $password = mysqli_real_escape_string($conn, $password);

        $sql = "SELECT * FROM konta WHERE login='$username' AND haslo='$password'";
        $result = mysqli_query($conn, $sql);

        // sprawdzenie, czy znaleziono wiersz w bazie danych
        if (mysqli_num_rows($result) == 1) {
            // jeśli znaleziono, ustawiamy sesję i przekierowujemy na inną stronę
            session_start();
            $_SESSION['username'] = $username;
            header('Location: userTables.php');
            exit();
        } else {
            // jeśli nie znaleziono, wyświetlamy komunikat o błędzie
            $error = "Nieprawidłowa nazwa użytkownika lub hasło.";
        }
    }
    mysqli_close($conn);
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

    <link rel="stylesheet" href="styles/style2.css" />
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
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" class="user-login" method="post">
            <h1>Logowanie do konta pracownika</h1>
            <div class="user-name-inp">
                <label for="user-name">Nazwa użytkownika: </label>
                <input type="text" name="user-name" id="user-name">  
            </div>
            <div class="user-paswd-inp">
                <label for="user-password">Hasło użytkownika: </label>
                <input type="password" name="user-password" id="user-password">
            </div>
            <button class="sub-btn" name="sub-btn" type="submit">ZALOGUJ</button>
            <?php if(isset($error)) { echo "<p>$error</p>"; } ?>
        </form>
    </main>
    <?php
      mysqli_close($conn);
    ?>
  </body>
</html>
