<?php
  session_start();
  include '../../libraries/php/sanitizer.php';
  //remove previous session 
   if(isset($_SESSION['scr_id']))
     unset($_SESSION['scr_id']);
   if(isset($_SESSION['pcr_id']))
     unset($_SESSION['pcr_id']);
   
   require_once "../../libraries/database/pdo/db_connect.php";

   //variables
   //instantiate database connector
   $db_connector = new DBConnector();
   //connect to the database
   $db_connector->connect();
   $course_type=null;
   $offered_list=null;
   
  if(isset($_SESSION['stud_id'])){
  include "../templates/header.php";
  //include "../templates/moco_banner.php";
  //include "../components/cd_head.php";

  
   require_once "../classes/Student_Checker.php";
   $student = new Student_Checker($db_connector);
   $totalRows = $student->getMaxRows();
   
     $pageNum = 0;
     $maxRows = 9;
     $startRow = $pageNum * $maxRows;
     ?>

     <div style="position: relative; top:130px;">
     <ul class='pager'>

        
<?php
     
if(isset($_GET) && $_GET['course']=='online'){//Online Course
       $offered_list = $student->getOfferedOnline();
}else if(($_GET) && $_GET['course']=='open'){//Open Courseware
       $offered_list = $student->getOfferedOpen();
}else if(($_GET)&& $_GET['page']=='next'){
  $offered_list = $student->getOfferedCourses($startRow+$maxRows,$maxRows);
}
else if(($_GET)&& $_GET['page']=='first'){
  $offered_list = $student->getOfferedCourses($startRow,$maxRows);
  echo "<li> <a href='../../Student_Module/pages/Offered_Courses.php?page=next'>Next</a></li>
        <li> <a href='../../Student_Module/pages/Offered_Courses.php?page=last'>Last</a></li>";

}

else if(($_GET)&& $_GET['page']=='last'){
  $offered_list = $student->getOfferedCourses($totalRows-$maxRows,$maxRows);
  echo "<li> <a href='../../Student_Module/pages/Offered_Courses.php?page=first'>First</a></li>
  <li> <a href='#'>Previous</a></li>";
     
}
else {
       $offered_list = $student->getOfferedCourses($startRow,$maxRows);
echo "<li> <a href='../../Student_Module/pages/Offered_Courses.php?page=next'>Next</a></li>
        <li> <a href='../../Student_Module/pages/Offered_Courses.php?page=last'>Last</a></li>";
     }
echo"  </ul>
       </div>";
     //include "components/cd_head.php";
     include "../components/cd_offered.php";
     
     
	}else{//display page not found error message
     header("Location: ../../login.php");
   }
  


?>

