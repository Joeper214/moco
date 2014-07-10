<script type="text/javascript" scr="../javascript/quiz.js"> </script>

<div id="page-container">
   <!-- course title --->
   
   <!-- content --->
   <div id="about_cont_con2">
     <!--- header --->
    
     <div id="about_hdrStartQ">
       <span id="about_hdr_title"><h2>
   <?php echo $_POST['title'];

      ?>
      </h2></span>
     </div>

   <!--- Take Quiz Content --> 

   <?php  
   $QuizStart->setQuestionsBox($_POST['test_id'],$_SESSION['scr_id']);
   ?>