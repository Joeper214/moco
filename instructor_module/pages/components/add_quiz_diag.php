<script type="text/javascript">
   $(function(){
       $("#da").datepicker();
       $("#dd").datepicker();       
     });

/*
   function validate(){
     var title = $("#q_title").val();
     var da = $("#da").val();//date available
     var dd = $("#dd").val();//due date
     var duration = $("#duration").val();
     var ok = true;
     var message = "";

     if(emptyStr(title) || title.length<0){
       message+="Please Input quiz title\n";
       ok = false;
     }
     if(!isValidDateFormat(da)){
       message+="Date Available must be a valid date in a format like 07/01/2013";
       ok = false;
     }
     if(!isValidDateFormat(dd)){
       message+="Due date must be a valid date in a format like 07/01/2013";
       ok = false;
     }
     return ok;
     }*/
</script>


<div id='popup_div' style='z-index:50'>
  <div id='pd-header'>  
     <span id="pd-header-title">
        Quiz Details
     </span>
     
     <span>
        <button type="button" class="close" aria-hidden="true" 
                onclick="javascript:hide_form('popup_background','popup_div')">&times;</button>
     </span>
  </div>

  <div id='pd-content'>
    <form id='addquiz' method='post' class="form-horizontal" role="role" action="javascript:manageQuiz('addquiz')"> 
      <input type='hidden' id='icr_id' name='icr_id' value="<?php echo $_SESSION['icr_id']?>">  
      <input type='hidden' id='action' name='action' value='add'>
      <input type='hidden' id='target' name='target' value='quiz'>
      <input type='hidden' id='test_id' name='test_id' value=''>
      <input type="hidden" name="ttype" value="0">
      
   
      <div class="form-group">
         <label class="col-sm-3 control-label">Quiz Title</label>
         <div class="col-sm-7">
           <input type="text" id="q_title" name="q_title" class="form-control"/>
         </div>
      </div>

      <div class="form-group">
         <label class="col-sm-3 control-label">Date Available</label>
         <div class="col-sm-7">
           <input type="text" id="da" name="da" class="form-control hasDatepicker"/>
         </div>
      </div>

      <div class="form-group">
         <label class="col-sm-3 control-label">Due Date</label>
         <div class="col-sm-7">
           <input type="text" id="dd" name="dd" class="form-control hasDatepicker"/>
         </div>
      </div>

      <div class="form-group">
         <label class="col-sm-3 control-label">Duration(min.)</label>
         <div class="col-sm-7">
           <input type="text" id="duration" name="duration" class="form-control" onkeydown="return allNumbers(event);" maxlength="3"/>
         </div>
      </div>
      <div id='pd-footer'>
        <span style='position: absolute;
                    left: 70%;
                    top:5px;'>

          <input type='button' class="btn btn-default" name='cancel' value='Cancel' 
                      onclick="javascript:hide_form('popup_background','popup_div')">

         <input type='submit' class="btn btn-primary" name='save' value='Save'>
        
        </span>
      </div>
    </form>
  </div>
</div>
