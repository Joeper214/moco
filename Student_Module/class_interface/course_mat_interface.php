<?php
require_once '../../instructor_module/class_models/im_syllabus.php';

class CoursematInterface{

  protected $IM_SYLLABUS;

  protected $lectures;  
 
  public function __construct(){
    $this->IM_SYLLABUS = new IMSyllabus();
  }

  public function addDisplayNewLecture(){
    $this->IM_SYLLABUS->addLecture();
    $new_lecture = $this->IM_SYLLABUS->getNewLecture();
    
    echo "<tr id='{$new_lecture['lect_id']}'>";
      echo "<td>{$new_lecture['tittle']}</td>";//lecture title
      echo "<td>";
        echo "<nav>";
	  echo "<ul id='ab"."{$new_lecture['lect_id']}'>";
          echo "</ul>";
        echo "</nav>";
      echo "</td>";
    echo "</tr>";
  }

  public function addDisplayNewMaterial(){
    if($this->IM_SYLLABUS->addMaterial()){
      header('Location: ../../instructor_module/pages/course_mat.php');
    }else{
      echo 'error';
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
      echo "<div id='accordion'>";
     foreach($chapters as $chapter){
       echo "<div class='exp-header'>";
         echo "<form id='frm_chid' name='frm_chid'>";
            echo "<input type='hidden' 
                  id='chapter_id' 
                  name='chapter_id' 
                  value='{$chapter['chapter_id']}'>";
            echo "<input type='hidden' 
                  id='displayed' 
                  name='displayed' value='0'>";
              echo "<span class='header'>{$chapter['title']}</span>";
                echo "<a id='{$chapter['chapter_id']}' href='javascript:hide(\"".$chapter['chapter_id']."\")'>";
		echo "<span id='{$chapter['chapter_id']}' class='caret-down'>";
                   
                  echo "</span>";
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
		    
		    echo "<td>{$lecture['tittle']}</td>"; 
                    echo "<td width='40%'>";
                    $this->displayLectMat($lecture['lect_id'], $lecture['materials']);
                    echo "</td>";
                  echo "</tr>";
                }
	        echo "</table>";
              echo "</div>"; 
     }
     echo "</div>";
    }else{
      echo "<h3> No Course Materials yet! </h3>";
    }
  }
  public function displayLectMat($lect_id, $lecture_material){
       echo "<nav>";

        foreach($lecture_material as $lm){

	    $URL = "../../lecture_media_storage/{$lm['file_url']}";
	     echo "<a title='{$lm['file_url']}'  href='$URL'  data-gal='prettyPhoto[prettyPhoto]'>";
	      $this->displayMatType($lm['file_type']);
	      echo "</a>  ";
	 }  
       echo "</nav>"; 
  }
 
  public function  displayMaterial($material){

    $URL = "../../lecture_media_storage/{$material['file_url']}";
    echo "<li id='{$material['lectmat_id']}'>";
      echo "<a href='$URL' title='{$material['file_url']}'>";
        $this->displayMatType($material['file_type']);
        
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
       echo "<img src='../../images/word.bmp'>";
       break;
     case 'docx':
       echo "<img src='../../images/word.bmp'>";
       break;
     case 'mp4':
       echo "<img src='../../images/video.bmp'>";
       break;
     case 'pdf':
       echo "<img src='../../images/pdf.bmp'>";
       break;
     }
  }
}
?>