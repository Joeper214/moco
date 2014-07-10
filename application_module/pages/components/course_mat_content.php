<!-- script --->
<script>
    $(document).ready(function(){
	$("#accordion").accordion();
    });
</script>  


<!--- content --->
  <div id="page-container">
     <!--- header --->
     <div id="about_hdr">
	<span id="about_hdr_title">
	   Course Materials
	</span>
     </div>
    <div id='sub-content'>
      <div id="accordion">
         <?php
            foreach($course_mat as $cmat){
              echo "<h4>{$cmat['title']}</h4>";
              echo "<div style='heigt:auto;'>";
              echo "<table>";
	      //echo "<ul class='bordered_list'>";
	      foreach($cmat['lect'] as $lect){
                //echo "<li>";
                echo "<tr style='border-bottom: 1px solid rgb(204,204,204);'>";
                echo "<td style='width: 50%;'>";
                echo "{$lect['title']}";
                echo "</td>";
                echo "<td style='text-align:right;'>";
                foreach($lect['mat'] as $mat){
                  echo "{$mat['ftype']}";
                  echo " ";
                }
                echo "</td>";
                echo "<td style='text-align: right;width: 80px;'>";
                  echo "<span><img src=''></span>";
		  echo "<span><img src='../../images/exit.png' title='delete this lecture'></span> ";
                echo "</td>";
                echo "</tr>";
                //echo "</li>"; 
                
              }   
              //echo "</ul>";
              echo "</table>";
              echo "</div>";
            }
         ?>
      </div>
    </div>
  </div>