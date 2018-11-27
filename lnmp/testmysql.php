<pre>
<?PHP
$con = new mysqli('192.168.1.60','web','123456','mydb');
$sql = "select * from myusers,myscript order by myusers.uid limit 3";
if(!$con)
    die("connect error:".mysqli_connect_error());
$rs = $con->query($sql);
$c = array();
while($r = $rs->fetch_row()){
    print_R($r);
}
$con->close();
?>
