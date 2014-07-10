
<?php
  session_start();
  ob_start();
  include '../../libraries/php/sanitizer.php';
  
  //remove previous session 
   if(isset($_SESSION['scr_id']))
     unset($_SESSION['scr_id']);

   if(isset($_SESSION['pcr_id']))
     unset($_SESSION['pcr_id']);


   if(isset($_SESSION['inst']))
     unset($_SESSION['inst']);



   if(isset($_SESSION['studC_id']))
     unset($_SESSION['studC_id']);
   
   require_once "../../libraries/database/pdo/db_connect.php";
   
   //variables
   //instantiate database connector
   $db_connector = new DBConnector();
   //connect to the database
   $db_connector->connect();
   
   $student_pic = null;
   $student_name = null;
   
   $course_type=null;
   $enrolled_list=null;
   
   if(isset($_SESSION['stud_id'])){
  include "../templates/header.php";
  //include "../templates/moco_banner.php";
  //include "../components/cd_head.php";
   require_once "../classes/Student_Checker.php";
   
     $student=new Student_Checker($db_connector);
     
       $enrolled_list = $student->getEnrolledCourses($_SESSION['stud_id']);
     
     if(count($enrolled_list)>0){
       include  "../components/cd_courses.php";
     }else{
       include "../components/fresh_start.php";
     }
   }else{//display page not found error message
     header("Location: ../../login.php");
     exit();
   }

   //footer
?>