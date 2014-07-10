<?php
 $_Courses=array(array("title" => "Introduction to algorithm"),
				 array("title" => "Artificial Intelligence")
                  );
 
?>

<div id="cl_container">
   <!--header-->
   <div id="cl_head">
     <span id="cl_head_title">
	     Enrolled Courses
	 </span>
   </div>
   
   <!--course list-->
   <div>
     <table>
	    <?php
		    //$courses = $_SESSION['courses'];
		    foreach($_Courses as $course){
		       echo "<tr>";
			   echo "<td>".$course['title']."</td>";
			   echo "<td>";
			   echo "<a href='../pages/Announcement.php' class='ui-state-default ui-corner-all'
								  style='padding: .2em 1em; text-decoration: none;'>Go to Class</a>";
			   echo "</td>";
			   echo "<td>";
			   echo "<a href=' #' class='ui-state-default ui-corner-all'
								  style='padding: .2em 1em; text-decoration: none;'>Un Enroll</a>";
			   //../pages/about_course.php
			   echo "</td>";
		       echo "</tr>";
		    }
		  
		?>
	 </table>
   
   </div>
</div>