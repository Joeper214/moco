<?php
  session_start();

//Variable declaration
 
  $announce = null;

if(isset($_SESSION['stud_id']) && isset($_SESSION['scr_id'])){
  include '../templates/header.php';
  

  include "../templates/c_title.php";
  include "../templates/side_bar.php";
  //establish database connection
  require_once "../../libraries/database/pdo/db_connect.php";
  $db_connector = new DBConnector();
  $db_connector->connect();

  //initialize announcement class
  include "../classes/im_announcement.php";
  $announcement = new IM_Announcement($db_connector);
  $ann = $announcement->getAllAnnouncement($_SESSION['scr_id']);
  //load page content
  if(count($ann)>0){
     include '../components/ca_content.php';
  }else{
     echo "<div id='about_cont_con'>";
     echo "<div id='about_hdr'>";
     echo "<span id='about_hdr_title'> Course Announcement";
     echo "</br> <h3> No Annoucements yet.</h3>";
     echo "</span>";
     echo "</div> </div>";
  }

  }else {
  // Show error page
  }
  ?>

       </center>
  </body>
</html>
  
  