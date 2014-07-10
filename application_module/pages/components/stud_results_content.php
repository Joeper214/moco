<?php
  $title="Introduction to Cryptography";
?>

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
  
  <!--- side bar ---->
  <?php 
     include("../template/side_bar.php");
  ?>
  
  <!--- content--->
  <div id="about_cont_con">
     <!---header-->
     <div id="about_hdr">
	    <div id="stud_res_hdr">
		  Student Results
		</div>
		<div id="stud_res_opt"> 
		  <a href="#" title="Delete Table Below">
		    <img src=""/>
			Delete
		  </a>
		   <a href="#" title="Delete Table Below">
		    <img src=""/>
			Export
		  </a>
		   <a href="#" >
		    <img src="" title="Delete Table Below"/>
			Print
		  </a>
		</div>
	 </div>
	 
	 <!----result option table--->
	 <div id="stud_res_display_option">
	    <form action="" method="post">
		  <select>
		    <option>Semester</option>
			<option>1st</option>
			<option>2nd</option>
			<option>Summer</option>
		  </select>
		  <select>
		    <option>Year</option>
			<option>2013</option>
			<option>2012</option>
			<option>2011</option>
		  </select>
		  
		  <select>
		    <option>Quiz Results</option>
			<option>Assignment Rating</option>
			<option>Exam Results</option>
		  </select>
		  
		  <input type="submit" value="Display">
		 
		</form>
	 </div>
	 
	 <!----result table--->
	 <div>
	 
	 </div>
	 </br>
  </div>
</div>