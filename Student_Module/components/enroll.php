<?php
if(isset($_SESSION['stud_id'])&&isset($_SESSION['scr_id'])){
echo "     <form id='{$_SESSION['scr_id']}' action='javascript:showEnrollDg(\"popup_background\",\"popup_div\",\"{$_SESSION['scr_id']}\");' method='post'>

          <input type='hidden' id='mode' value='enroll'>
	   <input type='hidden' id='ic_id' value='{$_SESSION['scr_id']}'>
  
          <input type='submit' name='add' class='btn btn-primary' value='Enroll Course'
                 onclick='javascript:$('#action').val('enroll')'>
       </form>
";  
}else{
 echo "     <form id='{$offered['ic_id']}' action='javascript:showEnrollDg(\"popup_background\",\"popup_div\",\"{$offered['ic_id']}\");' method='post'>

          <input type='hidden' id='mode' value='enroll'>
	   <input type='hidden' id='ic_id' value='{$offered['ic_id']}'>
          <input type='hidden' id='Course_cor' value='{$offered['course_id']}'>
          <button type='submit' name='add' class='btn btn-primary'
                 onclick='javascript:$('#action').val('enroll')'><span class=' glyphicon glyphicon-log-in'></span> Enroll Course</button>
       </form>
";
}

?>