<?php  
    session_start();  
    $_SESSION["userid"]="tmp";  
    if (1)//这个地方可以填写上传文件的限制，比如格式大小要求等，为了方便测试，这里没有写上传限制。  
    {  
        if ($_FILES["file"]["error"] > 0)  
        {  
            echo "Return Code: " . $_FILES["file"]["error"] . "<br />";//获取文件返回错误  
        }  
        else  
        {  
            //打印文件信息  
            echo "Upload: " . $_FILES["file"]["name"] . "<br />";//获取文件名  
            echo "Type: " . $_FILES["file"]["type"] . "<br />";//获取文件类型  
            echo "Size: " . ($_FILES["file"]["size"] / 1024) . " Kb<br />";//获取文件大小  
            echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br />";//获取文件临时地址  
            echo "Upload: " . $_FILES["file_"]["name"] . "<br />";//获取文件名
            echo "Type: " . $_FILES["file_"]["type"] . "<br />";//获取文件类型
            echo "Size: " . ($_FILES["file_"]["size"] / 1024) . " Kb<br />";//获取文件大小
            echo "Temp file: " . $_FILES["file_"]["tmp_name"] . "<br />";//获取文件临时地址
            //自定义文件名称  
            $array=$_FILES["file"]["type"];  
            $array=explode("/",$array);  
            $newfilename="tmp1";//自定义文件名（测试的时候中文名会操作失败）  
            $_FILES["file"]["name"]=$newfilename.".".$array[1];
            $array_=$_FILES["file_"]["type"];
            $array_=explode("/",$array_);
            $newfilename_="tmp2";//自定义文件名（测试的时候中文名会操作失败）
            $_FILES["file_"]["name"]=$newfilename_.".".$array_[1];

            if (!is_dir("/var/www/html/".$_SESSION["userid"]))//当路径不穿在  
            {  
                mkdir("/var/www/html/".$_SESSION["userid"]);//创建路径  
            }  
            $url="/var/www/html/".$_SESSION["userid"]."/";//记录路径
            $url_="/var/www/html/".$_SESSION["userid"]."/";//记录路径
            if (file_exists($url.$_FILES["file"]["name"]))//当文件存在  
            {  
                $url=$url.$_FILES["file"]["name"];
                $url_=$url_.$_FILES["file_"]["name"];
                if(!move_uploaded_file($_FILES["file"]["tmp_name"],$url))
                    {echo 'y';};
                if(!move_uploaded_file($_FILES["file_"]["tmp_name"],$url_))
                    {echo 'y';};
                echo $_FILES["file"]["name"] . " already exists. ";  

            }  
            else//当文件不存在  
            {  
                $url=$url.$_FILES["file"]["name"];
                $url_=$url_.$_FILES["file_"]["name"];
                if(!move_uploaded_file($_FILES["file"]["tmp_name"],$url))
                    {echo 'y';};
                if(!move_uploaded_file($_FILES["file_"]["tmp_name"],$url_))
                    {echo 'y';};
                echo "Stored in: " . $url . "and" . $url_;
            }  
        }  
     }  
    else  
    {  
        echo "Invalid file";  
    }


shell_exec('python /var/www/html/python_scripts/SIFTprototype.py /var/www/html/tmp/tmp1.jpeg /var/www/html/tmp/tmp2.jpeg');
?>  
  
<html>  
<body>  
    <br><br>  
    <img src="<?php echo "tmp/";?>">
    <img src="<?php echo "tmp/";?>">
</body>  
</html>  