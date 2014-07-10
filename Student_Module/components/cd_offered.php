

<div id="cl_container_stud">
   <!--header-->
   <div class="navbar navbar-inverse" role="navigation">
     <div class='navbar-header'>
     <span id="c_title_header">
	    Offered Courses
	 </span>
     </div>
   </div>
<div id='dashboard-disp-opt'>
   <div style='position:absolute;top:0px;left:0px'>
   <label>
   <?php
         $checked = '';
         if(!isset($_GET) || (isset($_GET)&&$_GET['course']=='all'))
            $checked='checked';
      ?>
       <input type='radio' name='ctype' checked='true' value='All'
              onclick="javascript:loadStudentCourse('all');"
              checked="<?php echo $checked; ?>">
       All
      </label>
    </div>

    <div  style='position:absolute;top:0px;left: 50px;'>
      <label>
        <?php
         $checked = '';
         if(isset($_GET) && $_GET['course']=='online')
            $checked='checked';
        ?>
        <input type='radio' name='ctype' value='Online Course'
               onclick="javascript:loadStudentCourse('online')"
	   <?php echo $checked; ?>
               >
        Online Course
      </label>
    </div>
    <div  style='position:absolute;top:0px;left: 215px;'>
      <label>
       <?php
          $checked = '';
          if(isset($_GET) && $_GET['course']=='open')
            $checked='checked';
        ?>
        <input type="radio" name="ctype" value="OpenCourseware"
               onclick="javascript:loadStudentCourse('open')"
	    <?php echo $checked; ?>
               >
        Open Courseware
      </label>
    </div>
    </br>
  </div>
   

   <!--course list-->
 
     <table class="table table-hover">
	 <tr class="alert alert-success">
	  <th> Department </th>
		 <th> Course Code </th>
                 <th> Instructor </th>
		 <th> Course Title </th>		
		 <th> Type </th>
	         <th> Course Start </th>
                 <th> Course Ends </th>
	    <th>    </th>
            <th>    </th> <th>      </th>                 <th>      </th>
                 <th>      </th>
     </tr> 
	 
	    <?php
		    //$courses = $_SESSION['courses'];
   
//echo $Start->format('D,M d Y');

   $link = "Open_Course.php?";
$about = "../pages/About_Course.php?";
    
  foreach($offered_list as $offered){
    $Start = new DateTime($offered['date_start']);
     $End = new DateTime($offered['date_end']);
     $today = new DateTime();
    echo "<tr>";
    echo "<td>".$offered['dept_name']."</td>";
    echo "<td>".$offered['course_id']."</td>";

    echo "<td>".$offered['LASTNAME'].', '.$offered['FIRSTNAME']."</td>";
  if($offered['course_type']==1){
    if($student->isEnrolledExist($_SESSION['stud_id'],$offered['ic_id'])){
      echo "<td>".$offered['course_desc']."</td>";   
      echo "<td> Online Course </td>";
    echo "<td>".$Start->format('D,M d Y')."</td>";
    echo "<td>".$End->format('D,M d Y')."</td>";
    echo "<td> <b> Already Enrolled </b></td>";
    }else{  
    echo "<td><a href='$about"."scrid={$offered['ic_id']}'>".$offered['course_desc']."</a></td>";    
    echo "<td> Online Course </td>";
    echo "<td>".$Start->format('D,M d Y')."</td>";
    echo "<td>".$End->format('D,M d Y')."</td>";
    echo "<td>"; 
    if(($today<=$End)&&($today>=$Start)){
    include "enroll_dialog.php";
    include "enroll.php";
    }else{
      echo "<a href='#' class='btn btn-danger disabled'> Un Available </a>"; 
    }
  echo"</td>";
    }
  }else{
    echo "<td>".$offered['course_desc']."</td>";   
    echo "<td> Open Courseware </td>";
    echo "<td>  </td>";
    //echo "<td>".$Start->format('D,M d Y')."</td>";
    echo "<td> </td>";
    $_SESSION['Open_Courseware'] = 0;
    echo "<td>"; 
echo "<a href='$link"."opcrid={$offered['ic_id']}"."' class='btn btn-default''>
       <span class='glyphicon glyphicon-eye-open'></span> View Course</a>";
    echo "</td>";
   }
	  
   echo "<td>";
   echo "<td>";
   echo "<td>";
	   //../pages/about_course.php
	   echo "</td>";
	   echo "</tr>";
	   echo "</tbody>";
	   
    }
if(isset($_SESSION['CourseID'])&& isset($_SESSION['CourseName']) && (!$student->isEnrolledExist($_SESSION['stud_id'],$_SESSION['CourseID']))){
       include "LoadEnroll.php";
       unset($_SESSION['CourseID']);
       unset($_SESSION['CourseName']);
}else if(isset($_SESSION['CourseID']) && isset($_SESSION['CourseName'])){ 
    include "Error_Dialog.php";
    include "click.php";
        unset($_SESSION['CourseID']);
        unset($_SESSION['CourseName']);
     }else {}  
?>
</table>
   

</div>