<?php 
session_start();
$title = null;
if(isset($_SESSION['stud_id']) && isset($_SESSION['scr_id'])){
  $title = $_SESSION['title'];
  require_once '../../Student_Module/classes/sm_takeQ.php';
  $QuizStart = new TakeQuizInterface();
  include "../templates/header.php";
  include "../templates/c_title.php";
  echo "<center>";
  include "../components/Review_now.php";
  // echo $_SESSION['item_id'];
  echo "</center>";
}
else{
  echo "Page not found!";
}