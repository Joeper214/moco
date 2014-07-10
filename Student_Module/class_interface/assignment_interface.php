<?PHP
require_once "../../Student_Module/class_models/assignment_model.php";

class AssignmentInterface{
  protected $ass_model;

  public function __construct(){
    $this->ass_model = new AssignmentModel();
    $this->ass_model->connect_to_db();
  }
  public function showABadge($id){
    $AbadgeCount;
    $ass_list = $this->ass_model->getAllCourseAss($id);
    foreach($ass_list as $key){
         if($this->ass_model->isSubmitted($_SESSION['studC_id'],$key['assign_id'])){
	   
	 }else{
	   $AbadgeCount++;
	 }
    }
    echo "<span class='badge pull-right alert-danger'>".
           $AbadgeCount
          ."</span>";
  }
  public function subAssignment(){
    $date_submitted = new DateTime();
    $ass_params = array(":scr_id"=>$_POST['scr_id'],
			":assign_id"=>$_POST['assign_id'],
			":ds"=>$date_submitted->format('Y-m-d'));
    $stat = null;
    if($this->ass_model->subAssignment($ass_params)){
      $stat = "?stat=ok";
        header("Location: ../../Student_Module/pages/Assignment.php".$stat);
    }else{
      $stat = "?stat=fail";
        header("Location: ../../Student_Module/pages/sub_assignment.php".$stat);
    }
     
  }
  public function addAssignment(){
    $due = new DateTime(sanitize($_POST['dd']));
    $da = new DateTime(sanitize($_POST['da']));    
    $ass_params  = array(":ic_id"=>$_POST['ic_id'],
			 ":title"=>$_POST['title'],
			 ":i"=>$_POST['instruction'],
			 ":dd"=>$due->format('Y-m-d'),
			 ":da"=>$da->format('Y-m-d'));
    $stat = null;
    if($this->ass_model->addAssignment($ass_params)){
      $stat = "?stat=ok";
      header("Location: assignment_page.php");
    }else{
      $stat = "?stat=fail";
    }
    header("Location: ../../instructor_module/pages/add_assignment.php".$stat);
  }


  public function updateAssigment(){
    $due = new DateTime(sanitize($_POST['dd']));
    $da = new DateTime(sanitize($_POST['da']));    
    $ass_params  = array(":ass_id"=>$_POST['assignment_id'],
			 ":ic_id"=>$_POST['ic_id'],
                         ":i"=>$_POST['instruction'],
			 ":im"=>$_POST['im_url'],
			 ":dd"=>$due,
			 "da"=>$da);
    if($this->updateAssignment($ass_params))
      echo "ok";
    else{
      echo "err";
    }
  }
  
  public function displayAssignments($ic_id){
    $ass_list = $this->ass_model->getAllCourseAss($ic_id);
    if(count($ass_list)>0){
	echo "<div id='accordion' class='navbar-inverse''>";
      foreach ($ass_list as $ass){

	$this->showAssInfo($ass);

      }
        echo "</div>";
    }else{
      echo "No Assignments Yet.";
    }
  }
  /*
  public function showAssInfo($ass_info){
    $due = new DateTime ($ass_info['due_date']);
    if($ass_info!=null){
     echo " <h3>Section 1</h3>
	<div>
	<p>
	Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
	ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
	amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
	odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
	</p>
	</div>";
    }
  }
  */
  public function showAssInfo($ass_info){
    $due = new DateTime($ass_info['due_date']);
    $today = new DateTime();
    $interval = $today->diff($due);
    // print_r($ass_info);
    if($ass_info!=null){
      $URL = "../../assignment_attachment/{$ass_info['inst_material']}";
      echo "<h3>{$ass_info['title']}</h3>
            <div><p>";
      if($this->ass_model->isSubmitted($_SESSION['studC_id'],$ass_info['assign_id'])){
	$submitInfo = $this->ass_model->getSubAssInfo($_SESSION['studC_id'],$ass_info['assign_id']);
	foreach ($submitInfo as $key){
	  $file = $key['file_url'];
	  $date_sub = new DateTime($key['date_submitted']);
	  $rating = $key['rating'];
	  $message = $key['message'];
          $stud_msg = $key['stud_msg'];
	}
	echo " <nav class='navbar-right navbar-top'>
               <label class='form-inline'> Date Submitted: </label>
                {$date_sub->format('F j, Y, l')} || 
                <label class='form-inline'> Rating: </label> {$rating} 
                </br>
                <label>File Submitted: </label> {$file}
               </nav> ";

          echo    "<nav class='panel-body'>
                   <strong> Instructor {$_SESSION['inst']}: </strong></br>
                      &nbsp&nbsp&nbsp {$message}
                ";
      }else{
      echo "     <nav class='navbar-right'>
                  <label class='form-inline'> Deadline: </label>
                  {$due->format('F j, Y, l')}
                  </nav>
                 <nav class='panel-body'>
                   <nav id='instruction' name='instruction'>
                       <strong>Instruction: </strong></br>
                      &nbsp&nbsp&nbsp {$ass_info['instruction']}
                   </nav>
                 </nav>
                
                <nav class='navbar-right'>";
     
      if($interval->format('%R%d')<=0&&$interval->format('%R%d')>=0){
	if($ass_info['inst_material']!=null){
		       echo "<a href='{$URL}' class='btn btn-danger' style='width: 250px'>
                              Download Instruction Material

                           </a>&nbsp";
	    echo "<form action='../pages/sub_assignment.php' method='post'>
                             <input type='hidden' value='{$ass_info['assign_id']}' name='assignID'>
                             <input type='hidden' value='{$ass_info['ic_id']}' name='ic_id'>
                             <input type='submit' class='form-inline btn btn-default' value='Submit Assignment' style='width: 250px'>
                           </form>";
	}else{
	  //	  echo                               $interval->format('%R%d');
		    echo "<form action='../pages/sub_assignment.php' method='post'>
                             <input type='hidden' value='{$ass_info['assign_id']}' name='assignID'>
                             <input type='hidden' value='{$ass_info['ic_id']}' name='ic_id'>
                             <input type='submit' class='form-inline btn btn-default' value='Submit Assignment' style='width: 250px'>
                           </form>";
	}
      }else{
	echo "{$due->format('F j Y')}{$today->format('F j Y')}<p class='text text-danger'><span class='glyphicon glyphicon-warning-sign'></span> The due date has elapsed! </br>you cannot submit this assignment </p>";
      }
      }             
        
              echo "</nav></p> </div>";
      
    } //end of if function
    }
}



?>