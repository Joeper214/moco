<?php
require_once '../../instructor_module/class_models/im_syllabus.php';

class CoursematInterface{

  protected $IM_SYLLABUS;

  protected $lectures;  
 
  public function __construct(){
    $this->IM_SYLLABUS = new IMSyllabus();
  }

  public function addDisplayNewLecture(){
    $q_params = array(sanitize($_POST['title']), $_POST['chapter_id']);

    if($this->IM_SYLLABUS->isLectExist(0, $q_params[1], $q_params[0])){
      return "dup";
    }else{
      $this->IM_SYLLABUS->addLecture($q_params);
      $new_lecture = $this->IM_SYLLABUS->getNewLecture();
      $str_output = "<tr id='{$new_lecture['lect_id']}'>";
      $str_output .= "<td width='30'><a href='javascript:delLect(\"{$new_lecture['lect_id']}\");' title='Delete this Lecture'><span class='glyphicon glyphicon-remove text-danger'></span></a></td>";
      $str_output .= "<td width='30'><a href='javascript:showEditLectForm(\"popup_background\", \"popup_div\", \"{$new_lecture['lect_id']}\", \"{$new_lecture['ch_id']}\")' title='Update this Lecture'><span class='glyphicon glyphicon-edit'></span></a></td>";
      $str_output .= "<td width='30'><a href='javascript:showAddLectureMaterialForm(\"{$new_lecture['lect_id']}\")' title='Upload Lecture material for this lecture'><span class='glyphicon glyphicon-upload'></span></button></td>";
      $str_output .= "<td>{$new_lecture['tittle']}</td>";//lecture title
      $str_output .= "<td width='40%'>";
      $str_output .= "<nav>";
      $str_output .= "<ul id='ab"."{new_lecture['lect_id']}'>";
      $str_output .= "</ul>";
      $str_output .= "</nav>";
      $str_output .= "</td>";
      $str_output .= "</tr>";
      return $str_output;
    }
    
  }

  public function updateLecture(){
    $q_params = array($_POST['title'], $_POST['chapter_id'], $_POST['lecture_id']);
    if($this->IM_SYLLABUS->updateLecture($q_params)){
      return $_POST['title'];
    }else{
      return 'dup';
    }
  }

  public function delLecture(){
    return $this->IM_SYLLABUS->delLect($_POST['lecture_id']);
  }

  public function addDisplayNewMaterial(){
    if($this->IM_SYLLABUS->addMaterial()){
      header('Location: ../../instructor_module/pages/course_mat.php');
    }else{
      header('Location: ../../instructor_module/pages/course_mat.php?stat=error');
    }
  }

  public function showLectureOptions(){
    foreach($this->lectures as $lecture){
       echo "<option value='{$lecture['lect_id']}'>";
       echo "{$lecture['title']}";
       echo "</option>";
    }
  }

  public function showChapterOptions($icr_id){
    $chapters = $this->IM_SYLLABUS->getAllChapters($icr_id);
    
    foreach($chapters as $chapter){
        echo "<option value='{$chapter['ch_id']}'>";
          echo "{$chapter['chapter_id']}"." {$chapter['title']}";
        echo "</option>";
     }
  }

  public function displayLectsAndMats($icr_id){
    /* precondition: $icr -> instructor course record id

       postcondition: display all lectures axnd its
                     corresponding materials
     */
    $chapters = $this->IM_SYLLABUS->getSyllabus($icr_id);
    if(count($chapters)>0){
      foreach($chapters as $chapter){
	echo "<div class='exp-header'>";
	echo "<form id='frm_chid' name='frm_chid'>";
	echo     "<input type='hidden' 
                          id='chapter_id' 
                          name='chapter_id' 
                          value='{$chapter['chapter_id']}'>";
	echo     "<input type='hidden' 
                         id='displayed' 
                         name='displayed' value='0'>";
	//chapter title
//javascript:showpopup_form(\"popup_background\",\"popup_div\")
	echo      "<div class='header'>

                       <a href='javascript:showAddLectForm(\"addlect\")' 
                          title='Add Lecture' onclick='$(\"#ch_id\").val({$chapter['chapter_id']})'
                        >
                          <span class='glyphicon glyphicon-plus-sign'></span>
                       </a>&nbsp;
                        <span style='font-size:1.15em'>{$chapter['title']}</span>
                   </div>";
	echo      "<a id='{$chapter['chapter_id']}' href='javascript:hide(\"".$chapter['chapter_id']."\")'>";
		  echo "</a>";
		  echo "</form>";
		  echo "</div>";  
		  echo "<div id='{$chapter['chapter_id']}'
                    class='exp-content'>";
		  echo "<table id='{$chapter['chapter_id']}' class='table'>";
		  //content
		  foreach($chapter['lectures'] as $lecture){
		    $this->lectures[] = array('lect_id'=>$lecture['lect_id'], 
                                      'title'=>$lecture['tittle']);  
	            echo "<tr id='{$lecture['lect_id']}'>";
		    echo "<td width='30'><a href='javascript:delLect(\"{$lecture['lect_id']}\");' title='Delete this Lecture'><span class='glyphicon glyphicon-remove text-danger'></span></a></td>";
		    echo "<td width='30'><a href='javascript:showEditLectForm( \"popup_background\", \"popup_div\", \"{$lecture['lect_id']}\",\"{$lecture['ch_id']}\")' title='Update this Lecture'><span class='glyphicon glyphicon-edit'></span></a></td>";
		    echo "<td width='30'><a href='javascript:showAddLectureMaterialForm(\"{$lecture['lect_id']}\")' title='Upload Lecture material for this lecture'><span class='glyphicon glyphicon-upload'></span></a></td>";
		    echo "<td>{$lecture['tittle']}</td>"; 
                    echo "<td width='40%'>";
                    $this->displayLectMat($lecture['lect_id'], $lecture['materials']);
                    echo "</td>";
		    echo "</tr>";
		  }
		  echo "</table>";
		  echo "</div>"; 
      }//end of foreach

    }else{//end of if
      echo "<h3>Currently no syllabus content found!</h3>";
      echo "<p>To manage this page you need create syllabus<p>";
    }//end of if else
    
  }

  public function displayLectMat($lect_id, $lecture_material){
       echo "<nav>";
	echo "<ul id='ab".$lect_id."'>";
        foreach($lecture_material as $lm){
	  echo "<li id='{$lm['lectmat_id']}'>";
	    $URL = "../../lecture_media_storage/{$lm['file_url']}";
	    echo "<a title='{$lm['file_url']}' href='../../lecture_media_storage/{$lm['file_url']}'>";
	      $this->displayMatType($lm['file_type']);
	      echo "<span class='caret'></span>";
	    echo "</a>";
	    echo "<ul>"; 
	      echo "<li>"; 
	        echo "<a href='$URL' target='_blank'>";
		  echo "download";
                echo "</a>";
		echo "</li>";
              echo "<li>";
                echo "<a href='javascript:dellm(\"{$lm['lectmat_id']}\")'>";
		  echo "remove";
                echo "</a>";
	      echo "</li>";
	    echo "</ul>";
	  echo "</li>";
	 }  
	echo "</ul>";
       echo "</nav>"; 
  }
 
  public function  displayMaterial($material){

    $URL = "../../lecture_media_storage/{$material['file_url']}";
    echo "<li id='{$material['lectmat_id']}'>";
      echo "<a href='$URL'>";
        $this->displayMatType($material['file_type']);
        echo "<span class='caret'></span>";
      echo "</a>";
      echo "<ul>";
        echo "<li>";
          echo "<a href='$URL'>";
	    echo "download";    
	  echo "</a>";
        echo "</li>";
        echo "<li>";
	  echo "<a href=''>";
	    echo "delete";
	  echo "</a>";
        echo "</li>";
      echo "</ul>";
    echo "</li>";

  }

  public function displayMatType($file_type){
    //this function display the coprresponding 
    //image if a file
     switch($file_type){
     case 'doc':
       echo "<img src='../../images/Word.bmp'/>";
       break;
     case 'docx':
       echo "<img src='../../images/Word.bmp'/>";
       break;
     case 'mp4':
       echo "<img src='../../images/Video.bmp'/>";
       break;
     case 'mp3':
       echo "<img src='../../images/Audio.bmp'/>";
       break;
     case 'webm':
       echo "<img src='../../images/Video.bmp'/>";
       break;
     case 'pdf':
       echo "<img src='../../images/PDF.bmp'/>";
       break;
     case 'txt':
       echo "<img src='../../images/note_24.png'/>";
       break;

     }
  }

  public function del_lm(){
    if($this->IM_SYLLABUS->del_lm($_GET['lm_id'])){
      echo 'ok';
    }else{
      echo 'err';
    }
  }
}
?>