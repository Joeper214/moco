<?php
   session_start();

   //include directives
   require_once "../../libraries/database/pdo/db_connect.php";
   require_once "../class_models/course.php";

   //page variables
   $title = null;
   $course_info = null;
   $db_connector = null;
   $course = null; 

   //page content
   include "../template/header.php";

   if(isset($_SESSION['inst_id']) && isset($_SESSION['icr_id'])){
     loadDB();
     loadContent();
   }else if(isset($_SESSION['inst_id']) && isset($_GET) && isset($_GET['icrid'])){
     $_SESSION['icr_id'] = $_GET['icrid'];//instructor courese record id
     loadDB();
     loadContent(); 
   }else{
     //show page not found error
     print '</br></br></br></b></br></br>';
     print 'Page not found Error!';
   } 

   //procedures
   function loadDB(){
     //establish database connection
     global $db_connector;

     $db_connector = new DBConnector();
     $db_connector->connect();//connect to db
   }   
   
   
   function loadContent(){
     global $db_connector, $course;
     //initialize course class
     $course = new IMCourse($db_connector);
     //get Course Information
     $course_info = $course->getCourseInfo($_SESSION['icr_id']);

     if($course_info){
        $title = $course_info['course_desc'];
        $_SESSION['title'] = $title;
	echo "<div class='content-container'>";
	  include "../template/c_title.php";
	  echo "<div class='c-nav-container'>";
	     include "../template/side_bar.php";
	     include "components/about_course_content.php";
          echo "</div>";
        echo "</div>";
     }else{
       //show error page 
       print "Course not Found";
     }
    
   }
   

?>
    </center>
   </body>
</html>