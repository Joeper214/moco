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
  include "../components/Quiz_now.php";

  echo "</center>";
}