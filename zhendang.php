<?php
function zhendang()
{
$filename="1.txt";

$handle=fopen($filename,"w");

$str=fwrite($handle,$_POST['ciou1']);

fclose($handle);

// system("zhendang.exe $ks >>log.txt &");
// system ("sleep 10 > /dev/null &")
system ("zhendang.exe");
}

zhendang();
?>
