<?php
   //parse qui
  $title="Introduction to Algorithms";
         
  $quiz=array(
	      array(
 	       "q_id"=>"q11",
	       "q_name"=>"Quiz 1: Blah",
               "items"=>20,
               "dd"=>"June 12 2014  : 12:00 PM Pacific Time",
               "da"=>"June 12 2014  : 12:00 PM Pacific Time"),
	       array(
               "q_id"=>"q12",
               "q_name"=>"Quiz 1: Blah",
               "items"=>20,
               "dd"=>"June 12 2014  : 12:00 PM Pacific Time",
               "da"=>"June 12 2014  : 12:00 PM Pacific Time")     
           );

?>

<script type="text/javascript" src="../javascript/quiz.js"> </script>

<div id="add_course_form_container"> 
  <!-- course title --->
  <div id="c_title_header_container">
    <span id="c_title_header">
       <?php
	  echo $title;
	  echo "  [<a href='#'>";
	  echo "edit";
	  echo "</a>]";
       ?>	   
    </span>
  </div>
  
  <!--- side bar --->
  <?php 
     include("../template/side_bar.php");
  ?>
  
  <!--- content --->
  <div id="about_cont_con">
     <!--- header --->
     <div id="about_hdr">
	<span id="about_hdr_title">
	   Quizzes
	</span>
        <form action="javascript:showpopup_form('popup_background','popup_div');">
          <span style='position: absolute;
                     left: 85%;
                     top: 0px;'>
          <input type='submit' name='add_q' value='Add Quiz'>
          </span>
        </form>
     </div>

    <!------- quiz content --->


    <div id='sub-content'>
    <?php 
	 $q_id = null;   
	  foreach($quiz as $q){
            $q_id=$q['q_id'];
	    echo "<div id='page_dialog' class='$q_id'>";
	     //header 
	      echo "<div id='hdr'>";
	       echo "<span id='hdr-title'>";
	       echo $q['q_name'];
	      echo "</span>";
	      echo "<span id='xbutton'>
		      <a href=\"javascript:removeQuiz('$q_id')\" 
		         title='Delete this quiz'>";
	      echo "<img src='../../libraries/themes/icons/close.png'>";
              echo "</a>";
	      echo "</span>";
              echo "</div>";
            //end-header
            
            //dialog-content
            echo "<div id='pg-diag-content'>";
	     echo "Total Items: {$q['items']} </br>";
	     echo "Due Date: {$q['dd']}</br>";
	     echo "Date Available: {$q['da']} </br>";
	     echo "</br>";
             echo "<form action='#' method='post'>";
	       echo "<input type='hidden' id='q_id' value=\'{$q['q_id']}\'>";
	       echo "<input type='hidden' id='q_name' value=\'{$q['q_name']}\'>";
               echo "<input type='hidden' id='dd' value=\'{$q['dd']}\'>";
               echo "<input type='hidden' id='da' value=\'{$q['da']}\'>";
               echo "<input type='button' name='edit' value='Edit'>";
               echo "<input type='button' name='view' value='View'>";
	     echo "</form>";
            echo "</div>";
            //end-dialog-content

	    echo "</div>";
           
	 }
      ?> 
    </div>
 </div>
	 
	 
  
  
