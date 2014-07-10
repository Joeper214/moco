 
  <!--- content--->
 <div id="about_cont_con">
 <!--<div class="col-md-9 col-md-push-3">-->
     <!---header-->
     <div id="about_hdr">
	<span class='h3'>
	   About the Course
	</span>
        <span style="position: absolute;left: 260px;top:5px;">
         
        </span>
		
	<!--description-->
     </div>
     <div id='sub-content'>
         <div class="info-con">
             <div>
                <span class="info-label">Course Code:</span>
             </div>
             <div>
                <span class="info-desc">
                <?php echo $course_info['course_id']; ?>
                </span>
             </div>
         </div>

         <?php if ($course_info['course_overview']!=''){ ?>
            <div class="info-con">
               <div>
                  <span class="info-label">Course Overview:</span>
               </div>
            </div>


            <div class="info-con">
               <p>
     	         <?php echo $course_info['course_overview'];?>
               </p>
            </div>
	 <?php }?>
         

         <div class="info-con">
             <div>
                <span class="info-label">Department:</span>
             </div>
             <div>
               <span class="info-desc">
     	        <?php echo $course_info['dept_name'];?>
               </span>
             </div>
         </div>

         <div class="info-con">
             <div>
                <span class="info-label">Course Type:</span>
             </div>
             <div>
                <span class="info-desc">
                  <form action="#">
                <?php if($course_info['course_type']==1){
                         echo "Online Course ";
                      }else{
                         echo "Open Courseware ";
                      }
                ?>
                 </form>
               </span>
             </div>
         </div>
	 <div class="info-con">
            <?php if($course_info['course_type']==1){ ?>
             <div>
                <span class="info-label">Course key:</span>
             </div>
             <div>
                <span class="info-desc">
	     <?php echo $course_info['ck_key']; ?>
               </span>
             </div>
	     <?php }?>
         </div>

        
	 <div class="info-con">
             <form action="add_course.php" method="post">
                 <input type="hidden" name="cc" value="<?php echo $course_info['course_id']; ?>">
                 <input type="hidden" name="cdesc" value="<?php echo $course_info['course_desc']; ?>">
                 <input type="hidden" name="deptid" value="<?php echo $course_info['dept_id']; ?>">
                 <input type="hidden" name="ov" value="<?php echo $course_info['course_overview']; ?>">
                 <input type="hidden" name="ctype" value="<?php echo $course_info['course_type'];?>">
                 <input type="hidden" name="instcourse_id" value="<?php echo $course_info['ic_id'];?>">
                 <input type="hidden" name="start_date" value="<?php echo $course_info['date_start'];?>">
                 <input type="hidden" name="end_date" value="<?php echo $course_info['date_end'];?>">
     
                 <button class='btn btn-primary' name='edit' value='edit'>
                    <span class="glyphicon glyphicon-edit"></span>
                     Update
                 </button>
             </form>
         </div>
      </div> <!---end of sub content--->
  </div>