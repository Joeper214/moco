<?php
  $title="Introduction to Cryptography";
  
  $topic_list=array(array("title"=>"Information Theoritic Security"),
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
		  echo "  [<a href='#'>";
		  echo "edit";
		  echo "</a>]";
       ?>	   
	</span>
  </div>
  
  <!--- side bar ---->
  <?php 
     include("../template/side_bar.php");
  ?>
  
  <!--- content--->
  <div id="about_cont_con">
     <!---header-->
     <div id="about_hdr">
	    <span id="about_hdr_title">
		  Course Syllabus
		</span>
	 </div>
	 
	<!----add topic pane-->
    <div id="topic_add_pane">
	   <form action="#" method="post"> 
	      <input class="topic" type="text" id="topic" name="topic" placeholder="New Topic Title">
		  <input type="submit" value="Add">
	   </form>
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
				    echo $tpl['title'];
				  echo "</td>";
				  echo "<td>";
				    echo "[<a href=''>delete</a>]";
					echo "  [<a href=''>edit</a>]";
				  echo "</td>";
			   echo "</tr>";
			}
		  ?>
		</table>
	 </div>
  </div>
</div>