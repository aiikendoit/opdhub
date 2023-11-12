<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/animations.css">  
    <link rel="stylesheet" href="css/main.css">  
    <link rel="stylesheet" href="css/login.css">
        
    <title>Login</title>

    
    
</head>
<body>

    <?php

     
        //Unset all the server side variables

        session_start();

        $_SESSION["user"]="";
        $_SESSION["usertype"]="";
        
        // Set the new timezone
        date_default_timezone_set('Asia/Singapore');
        $date = date('Y-m-d');

        $_SESSION["date"]=$date;
        

        //import database
        include("connection.php");


        if ($_POST) {
            $email = $_POST['useremail'];
            $password = $_POST['userpassword'];
            
            $error = '<label for="promter" class="form-label"></label>';
        
            $stmt = $database->prepare("SELECT * FROM webuser WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
        
            if ($result->num_rows == 1) {
                $user = $result->fetch_assoc();
                $utype = $user['usertype'];
                $storedPassword = ''; // Retrieve the hashed password from the database
        
                if ($utype == 'a') {
                    // $stmt = $database->prepare("SELECT ppassword FROM patient WHERE pemail = ?");
                    $stmt = $database->prepare("SELECT apassword FROM admin WHERE aemail = ?");
                } else if ($utype == 'p') {
                    // $stmt = $database->prepare("SELECT apassword FROM admin WHERE aemail = ?");
                    $stmt = $database->prepare("SELECT ppassword FROM patient WHERE pemail = ?");
                } else if ($utype == 'd') {
                    $stmt = $database->prepare("SELECT docpassword FROM doctor WHERE docemail = ?");
                } else{
                    
                }
        
                $stmt->bind_param("s", $email);
                $stmt->execute();
                $checker = $stmt->get_result();
        
                if ($checker->num_rows == 1) {
                    $passwordRow = $checker->fetch_assoc();
                    $storedPassword = $passwordRow[array_keys($passwordRow)[0]];
        
                    if (password_verify($password, $storedPassword)) {
                        $_SESSION['user'] = $email;
                        $_SESSION['usertype'] = $utype;
        
                        if ($utype == 'p') {
                            header('location: patient/index.php');
                        } elseif ($utype == 'a') {
                            header('location: admin/index.php');
                        } elseif ($utype == 'd') {
                            header('location: doctor/index.php');
                        }
                        exit; // Ensure to halt further execution
                    } else {
                        $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">Wrong credentials: Invalid email or password</label>';
                    }
                }
            } else {
                $error = '<label for="promter" class="form-label" style="color:rgb(255, 62, 62);text-align:center;">We couldnt find any account for this email.</label>';
            }
        } else {
            $error = '<label for="promter" class="form-label">&nbsp;</label>';
        }
    
    ?>





    <center>
    <div class="container">
        <table border="0" style="margin: 0;padding: 0;width: 60%;">
            <tr>
                <td>
                    <p class="header-text">Welcome Back!</p>
                </td>
            </tr>
        <div class="form-body">
            <tr>
                <td>
                    <p class="sub-text">Login with your details to continue</p>
                </td>
            </tr>
            <tr>
                <form action="" method="POST" >
                <td class="label-td">
                    <label for="useremail" class="form-label">Email: </label>
                </td>
            </tr>
            <tr>
                <td class="label-td">
                    <input type="email" name="useremail" class="input-text" placeholder="Email Address" required>
                </td>
            </tr>
            <tr>
                <td class="label-td">
                    <label for="userpassword" class="form-label">Password: </label>
                </td>
            </tr>

            <tr>
                <td class="label-td">
                    <input type="Password" name="userpassword" class="input-text" placeholder="Password" required>
                </td>
            </tr>


            <tr>
                <td><br>
                <?php echo $error ?>
                </td>
            </tr>

            <tr>
                <td>
                    <input type="submit" value="Login" class="login-btn btn-primary btn">
                </td>
            </tr>
        </div>
            <tr>
                <td>
                    <br>
                    <label for="" class="sub-text" style="font-weight: 280;">Don't have an account&#63; </label>
                    <a href="signup.php" class="hover-link1 non-style-link">Sign Up</a>
                    <br><br><br>
                </td>
            </tr>
                        
                        
    
                        
                    </form>
        </table>

    </div>
</center>
</body>
</html>