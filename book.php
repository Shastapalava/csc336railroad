
<html>
<body>
<?php
session_start();

//      if(empty($_SESSION['user_info'])){
//      //
//      //              echo "<script type='text/javascript'>alert('Please login before proceeding further!');</script>";
//
      //      }

      $conn = mysqli_connect("134.74.146.21","S18336Pteam8","passaic","S18336Pteam8");


      if(!$conn){

              echo "<script type='text/javascript'>alert('Database failed');</script>";

                      die('Could not connect: '.mysqli_connect_error());

                      }

                      if(isset($_POST['trip_date']) && isset($_POST['trip_start']) && isset($_POST['trip_end']) && isset($_POST['time_of_day']) && isset($_POST['day_of_week']) )

                      {
                      $response = mysqli_query($conn, "CALL get_avail_trains ('{$_POST["trip_date"]}','{$_POST["trip_start"]}','{$_POST["trip_end"]}','{$_POST["time_of_day"]}', '{$_POST["day_of_week"]}', @some_trains)");
                      //var_dump($_POST);     

                      while ( $row = mysqli_fetch_array( $response ) ) {

                              echo  $row["trip_direction"] . "/" .  $row["seg0"] . "/" .  $row["seg1"] . "/" .  $row["tod_start_time"] . "/" .  $row["tod_end_time"] . "/" .  $row["trip_start"] . "/" .  $row["trip_end"] . "/" .  $row["trip_start_id"] . "/" .  $row["trip_end_id"];

                              }
                 }
?>
                              </body>
                              </html>
