<?php
   $links=array(array("lbl"=>"Announcement","url"=>"../pages/announcement.php"),
                array("lbl"=>"Syllabus","url"=>"../pages/syllabus.php"),
				array("lbl"=>"Course Materials","url"=>"../pages/Course_materials.php"),
				array("lbl"=>"Quiz","url"=>"../pages/quiz.php"),
				array("lbl"=>"Assignment","url"=>"#"),
				array("lbl"=>"Exam","url"=>"#"),
                );
			
?>

<div id="sbar_con"> 
  <?php
     
     foreach($links as $lnk){
	    echo "<div id='side_menu'>";
		  echo "<span id='side_menu_link'>";
		    echo "<a href='".$lnk['url']."' 
											style='padding: .2em 1em; text-decoration: none;'>";
			echo $lnk['lbl'];
			echo "</a>";
		  echo "</span>";
		echo "</div>";
	 }
  ?>
</div>