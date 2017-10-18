<?
     echo $_POST['ciou1'];
     echo $_POST['ciou2'];
    $filename1="txt/ciou1.txt";
    $filename2="txt/ciou2.txt";

    $handle1=fopen($filename1,"w");
    $handle2=fopen($filename2,"w");

    $str1=fwrite($handle1,$_POST['ciou1']);
    $str2=fwrite($handle2,$_POST['ciou2']);

    fclose($handle1);
    fclose($handle2);

 system("ciou.exe");

?>
