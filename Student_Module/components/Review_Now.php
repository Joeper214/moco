<script type="text/javascript" scr="../javascript/quiz.js"> </script>

<div id="page-container">
   <!-- course title --->
   
   <!-- content --->
   <div id="about_cont_con2">
     <!--- header --->
    
     <div id="about_hdrStartQ"></br>
       <span id="about_hdr_title"><h2>
   <?php echo $_GET['QT'];
      ?>
      </h2></span>
     </div></br>

   <!--- Take Quiz Content --> 

   <?php  
   $QuizStart->setReviewBox($_GET['testID'],$_SESSION['scr_id'],$_GET['TOT']);
   ?>