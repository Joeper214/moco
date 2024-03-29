<?php 
include "libraries/index_includes/index_head.php";  
?>
<body style="font-family: verdana; padding-bottom: 70px;">
	
<div id="about" class="jumbotron">
  <h1> About MOCO </h1>
  <p>MSU Online Courseware System is an online e-learning system that combines some functionalities of an online course and open courseware where course materials will be accessible online. Students and other interested individuals may have the freedom to download and study the course materials at anytime and anywhere with an internet connection.</p> 
  <p id="RMore"> Upon creation of the course the instructor has the freedom to choose whether the course is open courseware or online course. In the case of an open courseware, course materials can be accessible by anyone, so they can have it anytime anywhere they want. However, online courses will be opened for MSU students only who are currently enrolled to a specific course. Students, who belong to online courses can also take quizzes, exams and assignments.
	If implemented and deployed, this project will enable instructors to upload lecture materials online and make those materials become available at any time and distributed electronically to students. Students can do advance study, so that, during class discussion they can highly interact in the class. 
	Unlike, in traditional lecture methods, instructions and lectures are direct from the instructor where students can learn through listening and observation. Learning materials are mainly based from textbooks, lectures and individual assignments. However, these resources are limited. </p>
 <a id="ReadM" class="btn btn-primary btn-lg" role="button" onclick="ReadMore()">Read more</a>
 </div>	</center>

       <div id="Latest_Courses">
       <div class="panel panel-danger">
       <div  id="header" class="panel-heading">
          <h3 class="panel-header">Latest Courses</h3>
        </div>
   <?php include "libraries/index_includes/Course_Query.php"; ?>
 <table class="table table-hover" id="LatestCourse">
         

<?php
 $link = "Student_Module/pages/Open_Course.php?";
 $about = "Student_Module/pages/About_Course.php?";
    $offered_list = $student->getLatestCourses();

     foreach($offered_list as $offered){
      
       $Start = new DateTime ($offered['date_start']);
     echo "<tr>";
     if($offered['course_type']==1){
     echo "<td><a href='$about"."scrid={$offered['ic_id']}' title='Click This Link to View Course'>".$offered['course_desc']."</a></td>";
     echo "<td> Online Course </td>";
     echo "<td>".$Start->format('D,M d Y')."</td>";
     echo "<td>".$offered['LASTNAME'].", ".$offered['FIRSTNAME']."</td>";
      
     }else{
echo "<td><a href='$link"."opcrid={$offered['ic_id']}'>".$offered['course_desc']."</a></td>";
echo "<td> Open Courseware </td>";
     echo "<td></td>";     
      
     }
   }
?>
           
          </tr>
	  </table>

       </div>
       </div>
       

<div id="accessB">
<ul class="nav nav-pills navbar-right btn-default">
  <li class="active"><a href="index.php" class="glyphicon glyphicon-home">Home</a></li>
  <li><a href="Courses.php" class="glyphicon glyphicon-briefcase">Courses </a></li>
  <li><a href="login.php" class="glyphicon glyphicon-user">Login</a>
</ul>
</div>
							 <?php include "libraries/index_includes/index_foot.php"; ?>

<div id="Powered" class="container">
<h4> <b> Powered by: </b> </h4>
  <img height="50px" src="images/powered/php.jpg" /></br>
  <img  height="50px" src="images/powered/mysql.jpg" />
   <img  height="50px" src="images/powered/jquery.jpg" /></br>
   <img src="images/powered/bootstrap.jpg" />
   <img height="50px" src="images/powered/html5.jpg" /></br>
   <img height="50px" src="images/powered/mathjax.jpg" />
</div>

</body>		
		
		
