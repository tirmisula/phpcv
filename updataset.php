<?php

class mysql {

     private $db_host;       //数据库主机
     private $db_user;       //数据库登陆名
     private $db_pwd;        //数据库登陆密码
     private $db_name;       //数据库名
     private $db_charset;    //数据库字符编码
     private $db_pconn;      //长连接标识位
     private $debug;         //调试开启
     private $conn;          //数据库连接标识
     private $msg = "";      //数据库操纵信息

 //    private $sql = "";      //待执行的SQL语句

     public function __construct($db_host, $db_user, $db_pwd, $db_name, $db_chaeset = 'utf8', $db_pconn = false, $debug = false) {
         $this->db_host = $db_host;
         $this->db_user = $db_user;
         $this->db_pwd = $db_pwd;
         $this->db_name = $db_name;
         $this->db_charset = $db_chaeset;
         $this->db_pconn = $db_pconn;
         $this->result = '';
         $this->debug = $debug;
         $this->initConnect();
     }

     public function initConnect() {
         if ($this->db_pconn) {
             $this->conn = @mysql_pconnect($this->db_host, $this->db_user, $this->db_pwd);
         } else {
             $this->conn = @mysql_connect($this->db_host, $this->db_user, $this->db_pwd) or die(mysql_error());
         }
         if ($this->conn) {
             $this->query("SET NAMES " . $this->db_charset);
         } else {
             $this->msg = "数据库连接出错，错误编号：" . mysql_errno() . "错误原因：" . mysql_error();
         }
         $this->selectDb($this->db_name);
     }

     public function selectDb($dbname) {
         if ($dbname == "") {
             $this->db_name = $dbname;
         }
         if (!mysql_select_db($this->db_name, $this->conn)) {
             $this->msg = "数据库不可用";
         }
     }

     public function query($sql, $debug = false) {
         if (!$debug) {
             $this->result = @mysql_query($sql, $this->conn);
         } else {

         }
         if ($this->result == false) {
             $this->msg = "sql执行出错，错误编号：" . mysql_errno() . "错误原因：" . mysql_error();
         }
 //        var_dump($this->result);
     }

     public function select($tableName, $columnName = "*", $where = "") {
         $sql = "SELECT " . $columnName . " FROM " . $tableName;
         $sql .= $where ? " WHERE " . $where : null;
         $this->query($sql);
     }

     public function findAll($tableName) {
         $sql = "SELECT * FROM $tableName";
         $this->query($sql);
     }

     public function insert($tableName, $column = array()) {
         $columnName = "";
         $columnValue = "";
         foreach ($column as $key => $value) {
             $columnName .= $key . ",";
             $columnValue .= "'" . $value . "',";
         }
         $columnName = substr($columnName, 0, strlen($columnName) - 1);
         $columnValue = substr($columnValue, 0, strlen($columnValue) - 1);
         $sql = "INSERT INTO $tableName($columnName) VALUES($columnValue)";
         $this->query($sql);
         if($this->result){
             $this->msg = "数据插入成功。新插入的id为：" . mysql_insert_id($this->conn);
             echo $this->msg;
         }
         else
         {
             echo "该用户已存在";
         }
     }

     public function update($tableName, $column = array(), $where = "") {
         $updateValue = "";
         foreach ($column as $key => $value) {
             $updateValue .= $key . "='" . $value . "',";
         }
         $updateValue = substr($updateValue, 0, strlen($updateValue) - 1);
         $sql = "UPDATE $tableName SET $updateValue";
         $sql .= $where ? " WHERE $where" : null;
         $this->query($sql);
         if($this->result){
             $this->msg = "数据更新成功。受影响行数：" . mysql_affected_rows($this->conn);
         }
         else
         {
            echo "卡组更新失败";
         }
     }

     public function delete($tableName, $where = ""){
         $sql = "DELETE FROM $tableName";
         $sql .= $where ? " WHERE $where" : null;
         $this->query($sql);
         if($this->result){
             $this->msg = "数据删除成功。受影响行数：" . mysql_affected_rows($this->conn);
         }
     }

     public function fetchArray($result_type = MYSQL_BOTH){
         $resultArray = array();
         $i = 0;
         while($result = mysql_fetch_array($this->result, $result_type)){
             //print_r($result);
             $resultArray[$i] = $result;
             $i++;
         }
         return $resultArray;
     }

 //    public function fetchObject(){
 //        return mysql_fetch_object($this->result);
 //    }

     public function printMessage(){
         return $this->msg;
     }

     public function freeResult(){
         @mysql_free_result($this->result);
     }

     public function __destruct() {
         if(!empty($this->result)){
             $this->freeResult();
         }
         mysql_close($this->conn);
     }
 }

 $set_id = $_GET['setid'];
 $user_id = $_GET['playerid'];
 $set_name = $_GET['name'];
 $set_class = $_GET['classs'];
 $set_cards = $_GET['cards'];
 $insert = false;
 $update = false;
 $delete = false;
 if ($set_id==-1)
 {
     $insert = true;
 }
 if ($set_id>=1)
 {
     $update = true;
 }
 $db = new mysql('localhost', 'hpugqpbu_wangx', 'wx1q2w3e', "hpugqpbu_wordpress");
 
 //select    查
 $db->select("heartstone_user", "sets", "id = '$user_id'");
 $result = $db->fetchArray(MYSQL_ASSOC);
 //如果新增一个卡组, 将卡组id设为end+1，将卡组字符串信息添加到sets最后
 if ($insert)
 {
     $last_set_id = substr($result[0]['sets'],strrpos($result[0]['sets'],"@")+1,1);
     $set_id = $last_set_id + 1;
     $sets = $set_id . '&' . $set_name . '&' . $set_class . '&' . $set_cards;

     //echo "result" . $result[0]['sets'] . "\n";
     //echo "sets" . $sets . "\n";     
     $userInfo_ = $result[0]['sets'] . "@" . $sets;
     //echo "userinfo" . $userInfo_ . "\n";
 }
 if ($update)
 {
    $set = $set_id . '&';
    $sets = $set_id . '&' . $set_name . '&' . $set_class . '&' . $set_cards;
    //$substr是set卡组在sets中的位置到sets字符串尾
    $substr = substr($result[0]['sets'],strpos($result[0]['sets'],$set),strlen($result[0]['sets']));
    //找到set卡组字符串长度$original_str_len
    if(strpos($substr,'@')==false)
    {
        $original_str_len = strlen($substr);
    }
    if(strpos($substr,'@')!=false)
    {
        $original_str_len = strpos($substr,'@');
    }
    //找到set卡组字符串自身$set_str
    $set_str = substr($substr,0,$original_str_len);
 
    $userInfo_ = str_replace($set_str,$sets,$result[0]['sets']);
 }

 //insert    增
 
 //$userInfo = array('name'=>$user_name, 'password' => $user_password, 'nickname' =>$user_nickname, 'email' => $user_email);
 //$db->insert("heartstone_user", $userInfo);
 //dump($db->printMessage());

 //update    改
 
 $userInfo = array('sets' => $userInfo_);
 //$tableName, $column = array(), $where = ""
 $db->update("heartstone_user", $userInfo, "id = $user_id");
 echo $set_id;
 //return int.Parse(ret);
 //dump($db->printMessage());

 //delete    删
 //$db->delete("user", "id = 1");
 //dump($db->printMessage());

 //findAll   查询全部
 //$db->findAll("user");
 //$result = $db->fetchArray();
 //dump($result);