<?php

echo "request sent succesfully";

// require_once "../../libraries/database/pdo/db_connect.php";
// include "../../libraries/php/sanitizer.php";
  
 

/*$connect = new DBConnector();
 $connect->connect();
       
//$icr_id = sanitize($_POST['icr_id']);//instructor course record id
 $icr_id = 2;
 $ann_stmt = sanitize($_POST['stmt']));
   
 $query = "INSERT INTO moco.announcement(ic_id, ann_stmt)
           VALUES(?,?)";
      
 $connect->prepare_exec_query($query, array($icr_id, $ann_stmt));

 $query = "SELECT *
           FROM moco.announcement
           WHERE ann_id = (SELECT MAX(ann_id)
                          FROM announcement)";

 $rs = $connect->selectAll($query)->fetch();
 
 $data = '{"ann_id":'.$rs['ann_id'].',
           "icr_id":'.$rs['ic_id'].',
           "date_posted":'.$rs['date_posted'].',
           "ann_stmt":'.$rs['ann_stmt'].'}';

	   print $data;*/
 
?>