<?php
  $title="Introduction to Cryptography";
  
  $topic_list=array(array("title"=>"Information Theoritic Security","icon"=>"../../images/PDF.bmp"),
                    array("title"=>"Data Encryption Standard"),
					array("title"=>"Many Time Key Security"),
					array("title"=>"Information Theoritic Security"),
					array("title"=>"Information Theoritic Security"),
                   );

?>

<div id="page-container">
  <!-- course title --->
  <div id="c_title_header_container">
    <span id="c_title_header">
	   <?php
	      echo $title;
       ?>	   
	</span>
  </div>
  
  <!--- side bar ---->
  <?php 
     include("../templates/side_bar.php");
  ?>
  
  <!--- content--->
  <div id="about_cont_con">
     <!---header-->
     <div id="about_hdr">
	    <span id="about_hdr_title">
		  Course Syllabus
		</span>
	 </div>
	 
	
	<!---topic table--->
	
	<!---table content option--->
	<div id="table_option">
	    
	</div>
	<!----topic list table---->
	 <div id="tbl_container">
	    <table>
		  <th>No.</th>
		  <th>Title</th>
		  <?php
		    $i=0;
		    foreach($topic_list as $tpl){
			   echo "<tr>";
			      echo "<td>";
				    echo (++$i);  
				  echo "</td>";
			      echo "<td>";
				    echo "<a href='#'> {$tpl['title']} </a>";
				  echo "</td>";
				 /** echo "<td width='30%' style='text-align:right'>";
					echo "<a href='#'> 
										<img src={$tpl['icon']}> </a>";
				  echo "</td>";**/
			   echo "</tr>";
			}
		  ?>
		</table>
	 </div>
  </div>
</div>