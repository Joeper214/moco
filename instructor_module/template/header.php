
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">  
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width"> 
  
	<title>
          <?php echo $page_title;?>
        </title> 
        <style type='text/css'>
          @import "../../libraries/bootstrap-3.1.1-dist/css/bootstrap.min.css";
          @import "../../libraries/bootstrap-3.1.1-dist/css/bootstrap-theme.min.css";
          @import "../../libraries/themes/jquery-ui.css";
          @import "../../libraries/themes/moco-theme.css";
        </style>
	
	<script type="text/x-mathjax-config">
	   MathJax.Hub.Config({
	     tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
	     });
        </script>
	<script type="text/javascript" src="../../libraries/mathjax2.3/MathJax.js?config=TeX-AMS_HTML-full"></script>

        <script type="text/javascript" src="../../libraries/jQuery/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="../../libraries/jQuery/jquery-ui.js"></script>
        <script type="text/javascript" src="../../libraries/bootstrap/js/bootstrap.min.js"></script>        
        <script type="text/javascript" src="../../libraries/ajax/ajax_modal_script.js"></script>
        <script type="text/javascript" src="../../libraries/js/input_validator.js"></script>
	<script type="text/javascript" src="../../libraries/js/date.js"></script>
        <script type="text/javascript" src="../javascript/moco.js"></script>
  </head>


<body>
  <div id="h_bar">
      <div id="sys-logo">
	 <img src='../../images/moco_logo.png' width='90px' height='60px'>
      </div>
      <div id='cur-date'>
         <b>Today</b> <?php echo date('F j, Y');?>
      </div>
          <?php 
	    if(isset($_SESSION)){
	      echo  "<div id='user-menu'>";
	       echo "<ul class='user'>";
                 echo "<li><a href='../../instructor_module/pages/course_dashboard.php'>Dashboard</a></li>";
                 echo "<li><a href='../../login.php'>Logout</a></li>";
                 echo "<li><a href='#'>{$_SESSION['instructor_name']}</a></li>";
               echo "</ul>";
            }
          ?>             
       </div>
     </div>
  <center>
		 
		
		