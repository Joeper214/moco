<?php
  session_start();
  ob_start();
  include "../../libraries/php/sanitizer.php";
  include "../../libraries/database/pdo/db_connect.php";
  
  
  class Commit{
     private $connector;
     
     public function __construct(){
        $this->connector = new DBConnector();
        $this->connector->connect();
     }
  
     public function commitAction($action, $target){
        if($action=="add"){
           $this->commitAddAction($target);
        }
	if($action=="edit"){
          $this->commitUpdateAction($target);
	}
	if($action=="take"){
          $this->commitTakeAction();
	}  
	if($action=="SubmitAns"){
	  $this->commitAnsSubmission();
	}
	if($action=="SubmitAss"){
	  $this->commitAssSubmision();
	}
	if($action=="review"){
	  $this->commitReview();
	}        
        if($action=="login"){
	      $this->login();
        }    
	if($action=="enroll"){
	      $this->commitEnrollAction();
        }
        if($action=="Unenroll"){
	      $this->commitUnEnrollAction();
	}else{
	  echo "No ACTION!";
	}
 
     }

     private function commitReview(){
       if($_POST['Operation']=="quiz"){
	 $test_id = $_POST['test_id'];
	 $QT = $_POST['title'];
	 $TOT = $_POST['TotalP'];
	 header("Location: ../../Student_Module/pages/Review_Quiz.php?testID=$test_id&QT=$QT&TOT=$TOT");
	 exit();
       }else if($_POST['Operation']=="exam"){
       }else{}
     }

     private function commitTakeAction(){
       if($_POST['Operation']=="quiz"){
	 $test_id = $_POST['test_id'];
	 $QT = $_POST['title'];
	 $duration = $_POST[''];
	 header("Location: ../../Student_Module/pages/Start_Quiz.php?testID=$test_id&QT=$QT");
	 exit();
       }else if($target=="exam"){
       }
     }
     private function commitAssSubmision(){
       require_once  "../../Student_Module/class_interface/assignment_interface.php";
       $assignment = new AssignmentInterface();
       $assignment->subAssignment();
     }
     private function commitAnsSubmission(){
       if($_POST['SOperation']=="quiz"){
	 $date_taken = new DateTime();
	 $Values = $_POST['Ans_Sheet'];
	 $items = $_POST['item_types'];
	 $StoreAns = array();
	 $AnsInfo = array();
	 for($i=0;$i<count($Values);$i++){
	   echo $Values[$i];
           echo "</br>";
	   echo $_POST[$Values[$i]];
	   $Ans = $_POST[$Values[$i]];
	   $StoreAns [] = array("item_id"=>$Values[$i],
				"item_type"=>$items[$i],
			   "choice_id"=>$Ans);
	   echo "</br>";
	 }
	 $AnsInfo = array("DateTaken"=>$date_taken->format('Y-m-d'),
			    "Course_id"=>$_POST['Course_id'],
			    "test_id"=>$_POST['test_id'],
			    "Answers"=>$StoreAns);
	 //print_r($AnsInfo);
          require_once '../../Student_Module/classes/sm_takeQ.php';
	  $quiz = new TakeQuizInterface();
	  $quiz->CheckAnswers($AnsInfo);
	  $quiz->storeStudentAnswers($AnsInfo);
	  header("Location: ../../Student_Module/pages/Quiz.php");
	 // unset($_SESSION['test_id']);
	  unset($_SESSION['Qtitle']);
        
	 exit();
       }
     }

	 private function commitEnrollAction(){
          //echo "Enroll Course Redirected!";

          require_once "../../Student_module/classes/Student_Checker.php";
	      $course = new Student_Checker($this->connector);
	      $course->enrollACourse(); 
	      
     }

	 private function commitUnEnrollAction(){
          //echo "Unenroll Course Redirected!";
          require_once "../../Student_module/classes/Student_Checker.php";
	      $course = new Student_Checker($this->connector);
              $course->UnenrollACourse(); 
	      header ("Location: ../../Student_Module/pages/Course_Dashboard.php");
     }
	 
	 
     private function commitAddAction($target){
       if($target == "course"){
          //echo "Add Course Redirected!";
          require_once "../../instructor_module/class_models/course.php";
	  $course = new IMCourse($this->connector);
          $course->teachACourse();
	  
        }else if($target=="announcement"){
          require_once "../../instructor_module/classes/im_announcement.php";
          $announcement = new IM_Announcement($this->connector);
          $announcement->addNewCourseAnnouncement();
        }
     }

     private function commitUpdateAction($target){
      if($target=="course"){
         require_once '../../instructor_module/class_models/course.php';
         require_once '../../instructor_module/class_models/im_instructor.php';
         $instructor = new IM_Instructor();
         $instructor->updateTeachCourse();
         //$course->updateCourse();       
         header ("Location: ../../instructor_module/pages/course_dashboard.php");
       }else if($target=="announcement"){
         require_once '../../instructor_module/classes/im_announcement.php';
         $announcement = new IM_Announcement($this->connector);
         
         $announcement->updateAnnouncementPanel();
       }
     }

     private function login(){
       require_once '../../libraries/proj_abs_cls/account.php';
       $account = new Account($this->connector);
       $account->validatingAccess();
     }

    
  }

  $commit = new Commit();
 
  if(count($_POST) > 0){
     $commit->commitAction($_POST['action'], $_POST['target']);       
  }else if(count($_GET)>0){  
     $commit->commitAction($_GET['action'], $_GET['target']);
  }


?>
