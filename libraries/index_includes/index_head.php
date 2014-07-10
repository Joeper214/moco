<?php
ob_start();
session_start();

if(isset($_SESSION['scr_id'])){
  unset($_SESSION['scr_id']);
}
if(isset($_SESSION['pcr_id'])){
  unset($_SESSION['pcr_id']);
}else
  {}



?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">  
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width"> 
  
	<title> </title> 
   <style type='text/css'>
   @import  "libraries/bootstrap-3.1.1-dist/css/bootstrap.css";
   @import  "libraries/themes/jquery-ui.css";
   @import  "libraries/themes/moco-theme-stud.css";
   
    </style>

        <script type="text/javascript" src="libraries/jQuery/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="libraries/jQuery/jquery-ui.js"></script>        
        <script type="text/javascript" src="libraries/ajax/ajax_modal_script.js"></script>
        <script type="text/javascript" src="libraries/js/input_validator.js"></script>
        <script type="text/javascript" src="libraries/bootstrap/js/bootstrap.js"></script>

        <script type="text/javascript" src="libraries/index_includes/javascript/moco.js"></script>
        
        <script type="text/javascript" src="Student_Module/javascript/moco.js"></script>
        <script type="text/javascript" src="Student_Module/javascript/quiz.js"></script>

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
	   
        </script>
<script type="text/javascript">


function ReadMore(){
  $('#RMore').show();
  $('#ReadM').hide();

}

</script>
  </head>

<nav id="h_bar_stud"> 
	  <!--univ name-->
	  <div id="sys-logo">
	    <img src='images/moco_logo.png' width='90px' height='60px'>
	  </div>
          <div id='cur-date-stud'>
            <b>Today</b> <?php echo date('F j, Y');?>
          </div>
   </nav>
