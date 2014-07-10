<?php
	$c_type="Open Courseware";
	if(isset($_GET['c']) && $_GET['c']=="oc"){
	   $c_type="Online";
	}
	if(isset($_GET['c']) && $_GET['c']=="ocw"){
	   $c_type="Open Courseware";
	}
?>

<div id="add_course_form_container">
   <!--title-->
   <div id="add_course_header">
     <span id="add_course_title">
	    <?php
		  echo "Add new $c_type Course";
		?>
	 </span>
   </div>
   <!--form elems-->
   <div id="add_course_form">
     <form action="../pages/course_dashboard.php" method="post">
	    <div id="form_el">
		    <label>Course Code</label></br>
	        <input type="search" id="cc" name="cc" placeholder="Course Code">
		</div>
		
		<div id="form_el"> 
		   <label>Course Title</label></br>
	       <input type="search" id="title" name="title" placeholder="Course Title">
		</div>
		
		<div id="form_el">  
		    <label>Course Description</label></br>
		    <textarea id="cdesc" name="cdesc" placeholder="Course Description">
		    </textarea>
		</div>
		
		<div id="form_el">
		    <label>Department</label></br>
		    <select>
		      <option>Computer Science</option>
		      <option>Electrical Engineering</option>
		      <option>English</option>
		      <option>Biology</option>
		      <option>Information Science</option>
		    </select>
		</div>
		
		<div id="form_el">
		  <input class="btn-primary" type="submit" id="addc" name="addc" value="Save">
		  </br>
		  </br>
		</div>
	 </form>
   </div>
</div>