<?php
echo 'Entering connection';
DEFINE ('DB_USER', 'S18336Pteam8');
DEFINE ('DB_PASSWORD', 'passaic');
DEFINE ('DB_HOST', '134.74.146.21');
DEFINE ('DB_NAME', 'S18336Pteam8');

// $dbc will contain a resource link to the database
// @ keeps the error from showing in the browser

$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
OR die('Could not connect to MySQL: ' .
mysqli_connect_error());
echo 'Exit connection';
?>



//this is just to check if we can excees data in the datatabase

<?php
// Get a connection for the database
require_once('conn_detail.php');

// Create a query for the database
$query = "SELECT passenger_id,passenger_lname, passenger_fname FROM Passengers;";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($dbc, $query);

// If the query executed properly proceed
if($response){

echo '<table align="left"
cellspacing="5" cellpadding="8">

<tr><td align="left"><b>passenger id</b></td>
<td align="left"><b>Last Name</b></td>
<td align="left"><b>First Name</b></td>
</tr>';

// mysqli_fetch_array will return a row of data from the query
// until no further data is available
while($row = mysqli_fetch_array($response)){

echo '<tr><td align="left">' . 
$row['passenger_id'] . '</td><td align="left">' . 
$row['passenger_lname'] . '</td><td align="left">' .
$row['passenger_fname'] . '</td><td align="left">';

echo '</tr>';
}

echo '</table>';

} else {

echo "Couldn't issue database query<br />";

echo mysqli_error($dbc);

}

// Close connection to the database
mysqli_close($dbc);

?>
