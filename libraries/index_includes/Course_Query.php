 <?php //Libraries includes
  include 'libraries/php/sanitizer.php';
  
  require_once "libraries/database/pdo/db_connect.php";

   //connect to the database
   $db_connector = new DBConnector();
   $db_connector->connect();
   $course_type=null;
   $offered_list=null;
   require_once "libraries/index_includes/Course_Checker.php";
   $student = new Student_Checker($db_connector);
   
  
?>