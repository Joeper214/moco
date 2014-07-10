
<?php
session_start();
require_once '../../Student_Module/class_models/quiz_model.php';
require_once '../../libraries/php/time_lib.php';

class QuizInterface{

  protected $_quizmodel;
  protected $time_lib;

  public function __construct(){
    $this->_quizmodel = new QuizModel();
    $this->time_lib = new TimeLib();
  }
  public function showQBadge($id){
    $QbadgeCount;
    $quizzes = $this->_quizmodel->getQuizzes($id);
    $s_id = $this->_quizmodel->getSCR_ID($_SESSION['stud_id'],$id);
    foreach($s_id as $key){
      $scr_id = $key['scr_id'] ;
    }
    foreach($quizzes as $badge){
      if($badge['test_type']){
      }else if($badge['test_type']==0&&$badge['total_items']>0&&
	       !$this->_quizmodel->isTaken($badge['test_id'],$scr_id)){
	$QbadgeCount++;
      }else{}
    }
    echo "<span class='badge pull-right alert-danger'>".
          $QbadgeCount
         ."</span>";
  }
public function showEBadge($id){
    $EbadgeCount;
    $quizzes = $this->_quizmodel->getExams($id);
    $s_id = $this->_quizmodel->getSCR_ID($_SESSION['stud_id'],$id);
    foreach($s_id as $key){
      $scr_id = $key['scr_id'] ;
    }
    foreach($quizzes as $badge){
     if($badge['test_type']&&$badge['total_items']>0&&
	       !$this->_quizmodel->isTaken($badge['test_id'],$scr_id)){
	$EbadgeCount++;
      }else{}
    }
    echo "<span class='badge pull-right alert-danger'>".
          $EbadgeCount
         ."</span>";
  }
  public function showQuizList($icr_id){
    $quizzes = $this->_quizmodel->getQuizzes($icr_id);
    $s_id = $this->_quizmodel->getSCR_ID($_SESSION['stud_id'],$icr_id);
    foreach($s_id as $key){
       $scr_id = $key['scr_id'];
       }
    if(count($quizzes)>0){
      echo "<div id='accordion'>";
    foreach($quizzes as $quiz){
      if($quiz['test_type']==1){
         
      }else{
	if(!$this->_quizmodel->isTaken($quiz['test_id'],$scr_id)){
	   $this->showQuizBox($quiz);
	 }else{
	   $this->showReviewBox($quiz,$scr_id);
	 }
      }
    }
    echo "</div>";
    }else{
      echo "<h3> No Quizzes Yet! </h3>";
    }
  }
  public function showExamList($icr_id){
    $quizzes = $this->_quizmodel->getExams($icr_id);
    $scr_id = $this->_quizmodel->getSCR_ID($_SESSION['stud_id'],$icr_id);
    foreach($scr_id as $key){
       $scr_id = $key['scr_id'];
       }

    if(count($quizzes)>0){
      echo "<div id='accordion'>";
    foreach($quizzes as $quiz){
      // echo ($quiz['test_type'])."</br>";
      //  echo ($scr_id);
      if($quiz['test_type']){
	if(!$this->_quizmodel->isTaken($quiz['test_id'],$scr_id)){
	  $this->showQuizBox($quiz);
	}else{
	   $this->showReviewBox($quiz,$scr_id);
	}        
      }else{

      }
    }
      echo "</div>";
    }else{
      echo "<h3> No Exams Yet! </h3>";
    }
  }
  public function addQuiz(){
    if($this->_quizmodel->addQuiz()){
      $new_quiz = $this->_quizmodel->getNewQuiz();
      $this->showQuizBox($new_quiz);
    }else{
      echo "err";
    }    
  }

  public function getQuizInfo($id){
    return $this->_quizmodel->getQuiz($id);
  }
  
  public function updateQuiz(){
    if($this->_quizmodel->updateQuiz()){
      $quiz = $this->_quizmodel->getQuiz($_POST['test_id']);
      $this->setQuizBox($quiz);
    }else{
      echo "err";
    }
    
  }

  public function showQuizBox($quiz){
   
    $this->setQuizBox($quiz);
    //end-dialog-content
   
  }
  public function showReviewBox($quiz,$scr_id){
   
    $this->setReviewBox($quiz,$scr_id);
    //end-dialog-content
   
  }
  public function setQuizBox($quiz){
    //header 
    $due = new DateTime($quiz['due_date']);
    $today = new DateTime();
    $start = new DateTime($quiz['test_date']);
    $duration = $this->time_lib->formatTime($quiz['duration']);
    $dueInterval = $today->diff($due);
    $startInterval = $today->diff($start);
	if($quiz['total_items']==0){
	 
	}else{
      echo "<div class='alert alert-success'>";
	echo "<span id='page-header'>";
	 echo $quiz['title'];
	 $_SESSION['Qtitle'] = $quiz['title'];
	 
	echo "</span>";
	echo "</div>";
        //end-header

        //dialog-content
        echo "<div id='pg-diag-content'>";
	  echo "<table border='0' style='width:70%' class='quiz-details'>";
          //total items row
	  echo "<tr>";
	  echo "<td><b>Total Items: </b></td><td>{$quiz['total_items']}</td>";
          echo "</tr>";
	  echo "<tr>";
	  echo "<td><b>Total Points: </b></td><td>{$quiz['total_points']}</td>";
          echo "</tr>";
          //due date row
          echo "<tr>";
         
	  echo "<td><b>Due Date:</b></td><td>{$due->format('F j, Y, l')}</td> </tr>";
	  //date avaailability row
          echo "<tr>"; 
	  echo "<td><b>Date Available:</b></td><td>{$start->format('F j, Y, l')} </td>";
          echo "</tr>";
          echo "<tr><td><b>Duration:  </b></td>";
          echo "<td>";
	  if($duration>0){
	    echo $duration;
	  }else{
	    echo "<b class='text-warning'>No Time Limit</b>";
	  }
          echo "</td></tr>";
          echo "</table>";
          //end of table
          echo "</br>";
          
          echo "<div class='right-buttons'>";

	  if($dueInterval->format('%R%d')>=0&&$startInterval->format('%R%d')<=0){
            echo "<form id='".$quiz['test_id']."' action='../pages/Start_Quiz.php' method='post'>";
	      echo "<input type='hidden' name='action' value='take'>";
	      echo "<input type='hidden' name='Operation' value='quiz'>";
	      echo "<input type='hidden' id='test_id' name='test_id' value='{$quiz['test_id']}'>";
              //echo $quiz['test_id'];
	      echo "<input type='hidden' id='title' name='title' value='{$quiz['title']}'>";
              echo "<input type='hidden' id='dd' name='dd' value='{$quiz['due_date']}'>";
              echo "<input type='hidden' id='da' name='dd' value='{$quiz['test_date']}'>";
              echo "<input type='hidden' id='duration' name='duration' value='{$quiz['duration']}'>";
              echo "<button type='submit' class='btn btn-primary' name='take' onclick='$(\"#{$quiz['test_id']} #action\").val(\"TakeQ\")'> Take <span class=' glyphicon glyphicon-pencil'></span> </button>";
	    echo "</form>";
	  }else if($today<=$due&&$today<=$start){
	    echo "<p class='text text-warning'><span class='glyphicon glyphicon-exclamation-sign'></span> Quiz unavailable! Please wait until date availability.</p>";
	      }else{
	    echo "<p class='text text-danger'><span class='glyphicon glyphicon-warning-sign'> </span> Due date Elapsed! <small>You cannot take {$quiz['title']} anymore.</p>";
	  }
          echo "</div>";
	  echo "</div>";}
  }

  public function setReviewBox($quiz,$scr_id){
    //header 
    $StudentTestRec = $this->_quizmodel->getStudentTestRec($quiz['test_id'],$scr_id);
    foreach($StudentTestRec as $info){
      $Score = $info['score'];
      $date_taken = new DateTime($info['date_taken']);
    }
    $due = new DateTime($quiz['due_date']);
    $start = new DateTime($quiz['test_date']);
    $duration = $this->time_lib->formatTime($quiz['duration']);
	if($quiz['total_items']==0){
	}else{
      echo "<div class='alert alert-info'>";
	echo "<span id='page-header'>";
	echo $quiz['title'];
	echo "</span>";
	echo "</div>";
        //end-header

        //dialog-content
        echo "<div id='pg-diag-content'>";
	  echo "<table border='0' style='width:70%' class='quiz-details'>";
          //total items row
	  echo "<tr>";
	  echo "<td><b>Date Taken: </b></td><td>{$date_taken->format('F j, Y, l')}</td>";
          echo "</tr>";

	  echo "<tr>";
	  echo "<td><b>Score: </b></td><td>";
	  if($Score){
            	 echo " $Score / {$quiz['total_points']}";
	  }else {
	    echo "0 / {$quiz['total_points']}";
	  }
          echo "</td>";
          echo "</tr>";
  	  echo "<tr>";
	  echo "<td><b>Total Items: </b></td><td>{$quiz['total_items']}</td>";
          echo "</tr>";

          //due date row
          echo "<tr>";
         
	  echo "<td><b>Due Date:</b></td><td>{$due->format('F j, Y, l')}</td> </tr>";
	  //date avaailability row
          echo "<tr>"; 
	  echo "<td><b>Date Available:</b></td><td>{$start->format('F j, Y, l')} </td>";
          echo "</tr>";
          echo "<tr><td><b>Duration</b></td>";
          echo "<td>";
	  if($duration>0){
	    echo $duration;
	  }else{
	    echo "<b class='text-warning'>No Time Limit</b>";
	  }
          echo "</td></tr>";
          echo "</table>";
          //end of table
          echo "</br>";
          echo "<div class='right-buttons'>";
            echo "<form id='".$quiz['test_id']."' action='../../libraries/php/executeAction.php' method='post'>";
	      echo "<input type='hidden' name='action' value='review'>";
	      echo "<input type='hidden' name='Operation' value='quiz'>";
	      echo "<input type='hidden' id='test_id' name='test_id' value='{$quiz['test_id']}'>";
              //echo $quiz['test_id'];
	      echo "<input type='hidden' id='title' name='title' value='{$quiz['title']}'>";
              echo "<input type='hidden' id='dd' name='dd' value='{$quiz['due_date']}'>";
	      echo "<input type='hidden' name='TotalP' value='{$quiz['total_points']}'>";
              echo "<input type='hidden' id='da' name='dd' value='{$quiz['test_date']}'>";
              echo "<input type='hidden' id='duration' name='duration' value='{$quiz['duration']}'>";
              echo "<button type='submit' class='btn btn-success' name='take' onclick='$(\"#{$quiz['test_id']} #action\").val(\"TakeQ\")'>
                <span class='glyphicon glyphicon-floppy-saved'></span> Review Answers</button>";
	    echo "</form>";
          echo "</div>";
	  echo "</div>";}
  }

  /*
   *  quiz item form scripts
   */

  public function addItem(){
    if($this->_quizmodel->addItem()){
      
    }
  }
}

?>