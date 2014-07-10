<?php
  $title="Introduction to Cryptography";
  
  $course_ann=array(
              array("date"=>"Feb 10, 2013 Monday 8:00 AM",
			        "ann"=>"Online education is a modality of teaching that has proliferated throughout higher education in such a rapid form and without any guidelines that its quality and merit is largely unknown, hotly debated, and still evolving. Institutions have used online education as a method of reducing costs and increasing enrollments and students have flocked to online classes for their convenience and often perceived ease. This is very apparent in California's community colleges were students are filling online course offerings in record numbers. Many studies and analyses have been done citing the relative equivalence of online education to traditional face-to-face education and sometimes the relative superior learning outcomes of online courses."),
			  array("date"=>"Feb 10, 2013 Monday 8:00 AM",
			        "ann"=>"Online education is a modality of teaching that has proliferated throughout higher education in such a rapid form and without any guidelines that its quality and merit is largely unknown, hotly debated, and still evolving. Institutions have used online education as a method of reducing costs and increasing enrollments and students have flocked to online classes for their convenience and often perceived ease. This is very apparent in California's community colleges were students are filling online course offerings in record numbers. Many studies and analyses have been done citing the relative equivalence of online education to traditional face-to-face education and sometimes the relative superior learning outcomes of online courses."),
			   array("date"=>"Feb 10, 2013 Monday 8:00 AM",
			        "ann"=>"Online education is a modality of teaching that has proliferated throughout higher education in such a rapid form and without any guidelines that its quality and merit is largely unknown, hotly debated, and still evolving. Institutions have used online education as a method of reducing costs and increasing enrollments and students have flocked to online classes for their convenience and often perceived ease. This is very apparent in California's community colleges were students are filling online course offerings in record numbers. Many studies and analyses have been done citing the relative equivalence of online education to traditional face-to-face education and sometimes the relative superior learning outcomes of online courses."),
			  );
?>

<div id="page-container">
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
	    <span id="about_hdr_title">
		  Course Announcement
		</span>
		
		<!--description-->
	 </div>
	 
	 <!---display announcement--->
	 <?php
	    foreach($course_ann as $ca){
		   echo "<div id='ca_ann_con'>";
		      //announcement date
		      echo "<div id='ca_date_con'>";
			    echo "<span id='ca_date_cont'>";
			    echo "Date Updated : ".$ca['date'];
				echo "</span>";
			  echo "</div>";
			  //announcement content
			  echo "<div id='ca_content'>";
			  echo $ca['ann'];
			  echo "</div>";
		      echo "<div id='ca-edit-pane'>";
		      echo "[<a href='#'>edit</a>]";
		      echo "</div>";
			  echo "</br></br>";
		   echo "</div>";
		}
	 ?>
  </div>
</div>