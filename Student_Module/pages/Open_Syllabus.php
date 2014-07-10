<?php
  session_start();
  //Include directive
  require_once "../../libraries/database/pdo/db_connect.php";
  include "../classes/sm_syllabus.php";
 //Variable declaration
$topic_list = null;


if(isset($_SESSION['stud_id']) && isset($_SESSION['pcr_id'])){
  include '../templates/header.php';
  //establish database connection
  loadDB();
  loadContent();
}else if($_SESSION['pcr_id']){
  include '../templates/index_head.php';
  loadDB();
  loadContent(); 
}else{
 header("Location: ../../index.php");
  exit();

}
  function loadDB(){
  $db_connector = new DBConnector();
  $db_connector->connect();
  }
  //initialize syllabus  class
  function loadContent(){
    global $db_connector, $syllabus;
  $syllabus = new SM_Syllabus($db_connector);
  $topic_list = $syllabus->getAllOpenSyllabus($_SESSION['pcr_id']);
  if(count($topic_list)>0){
  include '../templates/c_title.php';
  include '../templates/Open_sidebar.php';
    include '../components/syllabus_content.php';
  }
  include '../templates/c_title.php';
  include '../templates/Open_sidebar.php';
  echo "<div id='about_cont_con' class='jumbotron'> <h3> No Syllabus Yet</h3> </div>";
  //print_r($topic_list);
  }
?>