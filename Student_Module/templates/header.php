<?php ?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">  
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width"> 
  
	<title> </title> 
   <style type='text/css'>
  @import  "../../libraries/bootstrap-3.1.1/bootstrap-3.1.1/dist/css/bootstrap.css";

   
   @import  "../../libraries/themes/jquery-ui.css";
   @import  "../../libraries/themes/moco-theme-stud.css";
  
    </style>
 <script type="text/x-mathjax-config">
	   MathJax.Hub.Config({
	     tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
	     });
        </script>
	<script type="text/javascript" src="../../libraries/mathjax2.3/MathJax.js?config=TeX-AMS_HTML-full"></script>  
        <script type="text/javascript" src="../../libraries/jQuery/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="../../libraries/jQuery/jquery-ui.js"></script>
        <script type="text/javascript" src="../../libraries/jQuery/jquery.timer.js"></script>        
        <script type="text/javascript" src="../../libraries/ajax/ajax_modal_script.js"></script>
        <script type="text/javascript" src="../../libraries/js/input_validator.js"></script>
     <script type="text/javascript" src="../../libraries/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>


        <script type="text/javascript" src="../javascript/moco.js"></script>
        <script type="text/javascript" src="../javascript/quiz.js"></script>


        <script type="text/javascript">
          $(function(){
	      $('#dd').datepicker();
              
	      });
          
           $(function(){
	      $('#da').datepicker();
              
	   });
	    function hide(){
             $("#c1").hide();

           }

function loadEnrollC(){
     document.frm1.submit();
     ducoment.timerStart.submit();
}
	   
        </script>
  </head>


<body style="font-family: verdana">
	<nav id="h_bar_stud"> 
	  <!--univ name-->
	  <div id="sys-logo">
	    <img src='../../images/moco_logo.png' width='90px' height='60px'>
	  </div>
          <div id='cur-date-stud'>
            <b>Today</b> <?php echo date('F j, Y');
if(isset($_POST['test_id'])&&$_POST['duration']>0){
	        
	      $duration = $_POST['duration'] * 6000;
	      echo "<ul class'user'>";
	      echo "<li>".$_SESSION['student_name']."</li>";
	      echo "</ul>";
	      echo "<div style='position: fixed; left: 80%;z-index:500; 
                    background-color: rgba(0,0,0,.3)'>
              <h3> Time Remaining: 
	      <span id='countdown'> 00:00:00:00 </span></h3>
              
              <form id='example2form'>
                 <input type='hidden' id='stipTime' value='$duration' />
              </form>
              </div>";
	      echo "<script type='text/javascript' src='../javascript/Qtimer.js'></script>";
            }else{
          ?>
          </div>
	


	  
	  <?php

    if(isset($_SESSION)&&!isset($_POST['test_id'])){
echo " <div id='Offered_Courses' style='left:45%; width: 54%; top:40px;'>
	  <ul class='nav nav-pills btn-default'>
		<li id='h_bar_link'><a id='studNav' href='Course_Dashboard.php'>
           <span class='glyphicon glyphicon-inbox'></span> COURSE DASHBOARD</a></li>
           <li class='divider'></li>
                <li id='h_bar_link'><a id='studNav' href='Offered_Courses.php'>
           <span class='glyphicon glyphicon-new-window'></span> OFFERED COURSES</a></li>
                <li class='disabled'> <a  href='#'>{$_SESSION['student_name']}</a> </li>
          <li id='h_bar_link'><a id='studNav' href='../../logout.php'>
           <span class='glyphicon glyphicon-off'></span> SIGN OUT</a></li>
          </ul>
	  </div>";
	 
	  }
  }
	  ?>
	  </nav>
	</nav>
	<center>
</body>		

		
		
