//*********global variables**********//
var duplicates = new Array(); //storing duplicates mp choice items


function valid_file(){

    file = $("#lect_mat #file").val();
    valid_types = new Array("mp3", "mp4", "webm", "avi", "doc", "docx", "txt", "pdf", 'ppt', 'pptx');

    if(emptyStr(file) && file.length<=0){
	$('#fb').removeClass().addClass('text text-danger').html('<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<b>Please</b> browse a file');
	return false;
    }else if(file.indexOf('.')<0){
	$('#fb').removeClass().addClass('text text-danger').html('<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<b>Please</b> browse a valid file type');
	return false;
    }else if(valid_types.indexOf(file.substring(file.indexOf('.')+1, file.length))<0){
	$('#fb').removeClass().addClass('text text-danger').html('<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<b>Please</b> browse a valid file type');	
	return false;
    }else{
	return true;
    }
}


function valid_ass_file(file){

    valid_types = new Array("doc", "docx", "txt", "pdf");

    if(emptyStr(file) && file.length<=0){
	return false;
    }else if(file.indexOf('.')<0){
	return false;
    }else if(valid_types.indexOf(file.substring(file.indexOf('.')+1, file.length))<0){
	return false;
    }else{
	return true;
    }
}


function sat(){//switch announcement target
  $("#ann_target").attr('href', $('#go_ann').val());
}

/* assignment rate modal */
function showRateMod(ass_id){
  $("#rate_mod").modal('show');
  $("#arf #sub_id").val(ass_id);
  $("p#rs").removeClass('');
  $("p#rs").html("");
    
}

function rate_ass(){
  var url = "../../libraries/php/exec_controller.php";
  var inputs  = {'action': 'edit',
		'target': 'ass_rate',
                'sub_id': $("#arf #sub_id").val(),
		'rate': $("#arf #rate").val(),
		'msg': $("#arf #msg").val()};

  $.post(url, inputs, function (data){
      data = new String(data).trim();
      $("#"+inputs['sub_id']+" td").eq(3).html(data);
      $("p#rs").addClass('text text-success');      
      $("p#rs").html("<b>Score and Message</b> succesfully submitted!");
  });
}


function conf_del_chapter(title){
    var r = confirm("Warning!\nIf you delete this chapter all of the lectures  and its materials will also be removed.\nAre you sure to delete '"+title+"'");
    if(r) return true;
    return false;
}


/**
   assignment script
*/

function edit_ass(ass_id){
    window.location = "add_assignment.php?action=edit&ass_id="+ass_id;
}

function del_ass(ass_id, title){
    var conf = confirm("Are you sure to delete '"+ title + "' ?");
    
    if(conf){
	var server = "../../libraries/php/exec_controller.php";
	var data = {'action':'del',
		'target':'assignment',
		'id':ass_id};

	$.post(server, data, function(response){
	    response = new String(response).trim();
	    
	    if(response=='deleted'){
		$("div#"+ass_id).remove();
	    }else{
		alert("Failed to Delete Assignment");
	    }
	});
    }
}

function accord(div_id){
    if($("#body-"+div_id+" #display-stat").val()=='none'){
	$("#body-"+div_id+" #display-stat").val('block');
	$("div#body-"+div_id).css('display', 'block');
    }else{
	$("#body-"+div_id+" #display-stat").val('none');
	$("div#body-"+div_id).css('display', 'none');
    }
}

/**
   switching course type script
*/
/*
function switchCType(icrd, c_type){
    var ctype_desc = "Open Courseware";
    if(c_type==1){
	ctype_desc = "Online Course";
    }
    var r = confirm("Are you sure to switch this course into "+ ctype_desc);
    if(r){
	ajaxswitchCType(icrd, c_type);
    }
	
}


function ajaxswitchCType(icrd, c_type){
  var url = "../../libraries/php/exec_controller.php";
  var action = "switch_ck";
  var ajax = ajaxCreate();  
  var str_inputs = "icrd="+icrd+"&c_type="+c_type;
  var response_text = null;
  
  
  ajax.open("POST", url);
  //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
	 response_text = new String(ajax.responseText).trim();
	 if(c_type==1){
	     $("#c-type-info").html("Online Course <a class='btn btn-link'> Switch to OpenCourseware</a>");
	     $("#ck").html(response_text);
	 }else{
     	     $("#c-type-info").html("Online Course <a class='btn btn-link'> Switch to Online Course</a>");
	 }
     }
  }
  ajax.send(str_inputs);
}
*/

/**
* accordion script for course lectures
*/
/*function show(id){
  //$('span#'+id+' img').attr('src','../../images/d_arrow_up.ico');
  //$('a#'+id).attr('href','javascript:hide('+id+')');
  $("div#"+id).show();
}*/

function hide(id){
// $('span#'+id+' img').attr('src','../../images/d_arrow_down.ico');
 //$('a#'+id).attr('href','javascript:show('+id+')');
 $("div#"+id).hide();
  
}

/*
  course scripts
*/
//add course
function showAddCourseItem(){
    showpopup_form("popup_background", "add-course-item-diag");
}

//add department
function showAddDeptItem(){
    showpopup_form("popup_background", "add-dept-item-diag");
}
/*
  end of course script 
*/


/*
* quiz and exam item
*/

//item form slide effect
 // run the currently selected effect
/*
function nextItemSlide(){
   
  var cur_item_no = new Number($("#c_item").val());
  //alert(cur_item_no);
  var max_item = new Number($("#max").val());
  //alert(max_item);
  alert("div#"+cur_item_no);
  if(cur_item_no < max_item){//do slide     
     //hide
     $("div#"+cur_item_no).css("display", "none");
     //update current item
     cur_item_no +=1;
     $("#c_item").val(cur_item_no);
    
     alert($("div#2").html());
     // get effect type from
     var selectedEffect = "slide";
     // most effect types need no options passed by default
     var options = {};     
     // run the effect
     //$("div#2").effect( selectedEffect, options, 500, callback("div#2"));
     
  }
}

function callback(form_id) {
  setTimeout(function() {
                  $(form_id).removeAttr( "style" ).hide().fadeIn();
             },
             1000 );
}
*/


//********end of slide effect**********//

function showItemForm(){
  var item_type = $("#item_type").val();
  
  if(item_type==1){//multiple choice
    //visible
    MPItemFormMode(1);
    showpopup_form("popup_background",'mp-item-con');
  }
  if(item_type==2){//true or false
    //visible
    //clean field
    TFItemMode(1);
    showpopup_form("popup_background",'tf-item-con');
  }

  if(item_type==3){//modified true or false
    clearMTFItemFormFields(false);
    showpopup_form("popup_background",'mtf-item-con');
  }

  if(item_type==4){//identification
    showpopup_form("popup_background",'ident-item-con');
  }
}


function MPItemFormMode(mode){
   
  /*mode is ant integer value where:
   * mode = 1 add mode
   * mode = 0 edit mode
  */

  //clean the form
  $("#mp-item-con #mp-alert").removeClass();
  $("#mp-item-con #mp-alert").html("");
  
  if(mode==1){
    $("#mp_item_form #action").val("add");
    $("#mp_item_form #question").val("");  
  }else{
    $("#mp_item_form #action").val("edit");
  }
}

function TFItemMode(mode){
  
  $("#tf-item-con #tf-alert").removeClass();
  $("#tf-item-con #tf-alert").html("");
  
  if(mode==1){//add
    $("#tf_item #action").val("add");
    $("#tf_item #question").val("");
  }else{
    $("#tf_item #action").val("edit");
  }
}

function clearMTFItemFormFields(alert){
  if(!alert){
    $("#mtf-item-con #mtf-alert").html("");
  }

  $("#mtf_item_form #question").val("");
}

function isValidPoints(form_id){

  if($("#"+form_id+" #points").val()<=0){
     $("#tf-alert").addClass("alert alert-danger");
     $("#tf-alert").html("<b>Points</b> must be greater than 0!");
     return false;
  }
  return true;
}

function validateMPItem(){
   var dup_count = duplicateChoices();//returns list of duplicates
   var points = $("#mp_item_form #points").val();
   var message = null;
   var ok = false;

   if(dup_count>0 && points<=0){
     message="<b>Error 1: </b>Item choices contains duplicate Entries: " + showDuplicates(duplicates);
     message+="Be sure to make choice entry unique</br>";
     message+="<b>Error 2: </b> Points must be more than zero";
   }else if(dup_count>0){
     message="<b>Error : </b>Item choices contains duplicate Entries: "+showDuplicates(duplicates);
     message+="Be sure to make choice entry unique</br>";
   }else if(points<=0){
     message = "<b>Error: </b> Points must be more than zero";
   }else{
     ok = true;
   }   

   if(!ok){
     $("#mp-alert").addClass("text-danger");
     $("#mp-alert").html(message);
   }

   return ok;
}

/*****functions for checkng duplicate choices inputs********/

function duplicateChoices(){
  var choices = new Array(new String($("#a").val()).toLowerCase(),
                          new String($("#b").val()).toLowerCase(),
                          new String($("#c").val()).toLowerCase(),
                          new String($("#d").val()).toLowerCase());  
  var choice_arr = new Array("A", "B", "C", "D");
  duplicates = new Array();
  var found_dups = new Array();
  var dup_vals = 0; //if dup_vals>0 then choice i has duplicates  
  var dup_count = 0;
  var dup_ident = new Array(1,2,4,8);
  for( var i=0; i<choices.length; i++){
    for(var j=0; j<choices.length; j++){
      if(i!=j && choices[i]==choices[j] && (found_dups.indexOf(j)<0)){//has duplicate
        
        if(found_dups.indexOf(i)<0){
          found_dups[dup_count] = i;
          dup_count++;
        }

        dup_vals+=dup_ident[j];
        found_dups[dup_count] = j;
        dup_count++;
      }
    }
    if(dup_vals>0){
      duplicates[i]=dup_vals;
    }else{
      duplicates[i]=0;
    }
    
    dup_vals=0;
  }
  
  return dup_count;
}

function showDuplicates(){
   var str_dups = "";
   var choice_arr = new Array("A", "B", "C", "D");
  
   for(var i=0; i<duplicates.length; i++){
     if(duplicates[i]>0){
	str_dups = str_dups + "Choice <b>"+choice_arr[i]+ "</b> has duplicates on Choice <b>" + strDupsChoice(duplicates[i]) + "</b>";
        str_dups = str_dups + ". ";
     }
   }
   return str_dups;
}


function strDupsChoice(num){
  var bits = intBitArr(num);
  var choices = new Array("A", "B", "C", "D");
  var str_duplicates = "";

  for(var i=0;i<bits.length; i++){
    if(bits[i]==1){
      str_duplicates+=choices[i];
      if(i<(bits.length-1)){ 
	  str_duplicates+=", ";
      }
    }
  }
  return str_duplicates;
}

function intBitArr(num){
    var bits = new Array();
    var count = 0;
    while(num>0){
	bits[count] = num%2;
	num = Math.floor(num/2);
        count++;
    }
    return bits;
}

/***end of duplicate choices checker****/

function addUpdateMPItem(form_id){

  var url = "../../libraries/php/exec_controller.php";
  var action = $("#"+form_id+" #action").val();
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
  
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();

       if(response_text=="err"){
         
       }else if(response_text=="dup"){
         $("#mp-alert").addClass("alert alert-danger");
         $("#mp-alert").html("<b> Warning! </b> Question already taken, revision is needed");
       }else{
         if(action==="add"){
           $("#mp-alert").removeClass();
           $("#mp-alert").addClass("alert alert-success");
           $("#mp-alert").html("<b> Inserted! </b>This Item was succesfully inserted");
           $("#sub-content").append(response_text);
         }
         if(action==="edit"){
           $("#mp-alert").removeClass();
           $("#mp-alert").addClass("alert alert-success");
           $("#mp-alert").html("<b> Updated! </b>This Item was succesfully updated");  
           var div_id = $("#" + form_id + " #item_id").val();
           $("div#"+div_id).html(response_text);
         }
       }
     }
  }
  ajax.send(str_inputs);
}


function au_mpitem(form){
    var url = "../../libraries/php/exec_controller.php";
    var inputs = {'action': $("#"+form+" #action").val(),
		  'test_id': $("#"+form+" #test_id").val(),
		  'item_id': $("#"+form+" #item_id").val(),
		  'target': 'item_mp',
		  'points': $("#"+form+" #points").val(),
		  'question': $("#"+form+" #question").val(),
		  'ans': $("#"+form+" #ans").val(),
		  'c1': $("#"+form+" #c1").val(),
		  'a': $("#"+form+" #a").val(),
		  'c2': $("#"+form+" #c2").val(),
		  'b': $("#"+form+" #b").val(),
		  'c3': $("#"+form+" #c3").val(),
		  'c': $("#"+form+" #c").val(),
		  'c4': $("#"+form+" #c4").val(),
		  'd': $("#"+form+" #d").val()};
    $.post(url, inputs, function(response){
	response = new String(response).trim();

	if(response=="err"){
         
       }else if(response=="dup"){
         $("#mp-alert").addClass("alert alert-danger");
         $("#mp-alert").html("<b> Warning! </b> Question already taken, revision is needed");
       }else{
         if(inputs['action']==="add"){
           $("#mp-alert").removeClass();
           $("#mp-alert").addClass("alert alert-success");
           $("#mp-alert").html("<b> Inserted! </b>&nbsp; This Item was succesfully inserted");
           $(response).prependTo("#sub-content");
         }
         if(inputs['action']==="edit"){
           $("#mp-alert").removeClass();
           $("#mp-alert").addClass("alert alert-success");
           $("#mp-alert").html("<b> Updated! </b>This Item was succesfully updated");  
           var div_id = $("#" + form + " #item_id").val();
           $("div#"+div_id).html(response);
         }
	 setTimeout(function(){
		$('#mp_close').click();
	    }, 1000);  
	 MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
       }
    });
}

function au_tf(form){
    var url = "../../libraries/php/exec_controller.php";
    var inputs = {'action': $("#"+form+" #action").val(),
		  'test_id': $("#"+form+" #test_id").val(),
		  'item_id': $("#"+form+" #item_id").val(),
		  'target': 'item_tf',
		  'tf_item_id': $("#"+form+" #tf_item_id").val(),
		  'points': $("#"+form+" #points").val(),
		  'question': $("#"+form+" #question").val(),
		  'ans': $("#"+form+" #ans").val()};
    
    $.post(url, inputs, function(response){
       response = new String(response).trim();
       if(response=="err"){
	   
       }else if(response=="dup"){
         $("#tf-alert").addClass("alert alert-danger");
         $("#tf-alert").html("<b>Question</b>  already taken, it needs revision");
       }else{
         if(inputs['action']=="add"){
           $("#tf-alert").addClass("alert alert-success");
           $("#tf-alert").html("<b>Added</b>&nbsp;New Item succesfully added");
	   var new_item = $(response).prependTo("#sub-content");
	   
         }
         if(inputs['action']=="edit"){
           $("#tf-alert").addClass("alert alert-success");
           $("#tf-alert").html("<b>Updated!</b>&nbsp;Quiz Item succesfully updated");
           var div_id = $("#" + form + " #item_id").val();
           $("div#"+div_id).html(response);
         }
	   setTimeout(function(){
		$('#tf_close').click();
	    }, 1000);
	   MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
       }
    });
}

/*
function addUpdateTFItem(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var action = $("#"+form_id+" #action").val();
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
 
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();
       if(response_text=="err"){
       }else if(response_text=="dup"){
         $("#tf-alert").addClass("alert alert-danger");
         $("#tf-alert").html("<b>Question</b>  already taken, it needs revision");
       }else{
         if(action=="add"){
           $("#tf-alert").addClass("alert alert-success");
           $("#tf-alert").html("<b>Added</b>New Item succesfully added");
	   $("#sub-content").append(response_text); 
         }
         if(action=="edit"){
           $("#tf-alert").addClass("alert alert-success");
           $("#tf-alert").html("Quiz Item succesfully updated");
           var div_id = $("#" + form_id + " #item_id").val();
           $("div#"+div_id).html(response_text);
         }
       }
     }
  }
  ajax.send(str_inputs);
  
}
*/

/*
function addUpdateMTFItem(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var action = $("#"+form_id+" #action").val();
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
 
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();
       if(response_text=="err"){
         $("#mtf-alert").addClass("text-danger");
         $("#mtf-alert").html("<b>Technical Error!</b> .");
       }else if(response_text=="dup"){
         $("#mtf-alert").addClass("text-warning");
         $("#mtf-alert").html("<b>Warning!</b> Question already taken, It needs revision.");
       }else{
         if(action=="add"){

           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").text("New True or False Quiz Item added");
	   $("#sub-content").append(response_text); 
         }
         if(action=="edit"){

           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").text("Quiz Item succesfully updated");
         }
       }
     }
  }
  ajax.send(str_inputs);
}
*/

/*

function au_mtf(form){
    var url = "../../libraries/php/exec_controller.php";
    var inputs = {'action': $("#"+form+" #action").val(),
		  'target': 'mtf_item',
		  'test_id': $("#"+form+" #test_id").val(),
		  'item_id': $("#"+form+" #item_id").val(),
		  'mtf_item_id': $("#"+form+" #mtf_item_id").val(),
		  'points': $("#"+form+" #points").val(),
		  'question': $("#"+form+" #question").val(),
		  'ans_sel': $("#"+form+" #ans_sel").val(),
		  'ans_text': $("#"+form+" #ans_text").val()};

    $.post(url, inputs, function(response){
       response = new String(response).trim();

       if(response=="err"){
         $("#mtf-alert").addClass("text-danger");
         $("#mtf-alert").html("<b>Technical Error!</b> .");
       }else if(response=="dup"){
         $("#mtf-alert").addClass("text-warning");
         $("#mtf-alert").html("<b>Warning!</b> Question already taken, It needs revision.");
       }else{
         if(inputs['action']=="add"){
           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").html("<b>Successful</b>&nbsp;New Quiz Item added");
	   $(response).prependTo("#sub-content"); 
         }
         if(inputs['action']=="edit"){
           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").text("Quiz Item succesfully updated");
	   var div_id = $("#" + form + " #item_id").val();
           $("div#"+div_id).html(response);
         }
       }
    });
}
*/


function au_mtf(form){
    var url = "../../libraries/php/exec_controller.php";
    var inputs = {'action': $("#"+form+" #action").val(),
		  'target': 'mtf_item',
		  'test_id': $("#"+form+" #test_id").val(),
		  'item_id': $("#"+form+" #item_id").val(),
		  'mtf_item_id': $("#"+form+" #mtf_item_id").val(),
		  'points': $("#"+form+" #points").val(),
		  'question': $("#"+form+" #question").val(),
		  'ans_sel': $("#"+form+" #ans_sel").val(),
		  'ans_text': $("#"+form+" #ans_text").val()};

    $.post(url, inputs, function(response){
       response = new String(response).trim();

       if(response=="err"){
         $("#mtf-alert").addClass("text-danger");
         $("#mtf-alert").html("<b>Technical Error!</b> .");
       }else if(response=="dup"){
         $("#mtf-alert").addClass("text-warning");
         $("#mtf-alert").html("<b>Warning!</b> Question already taken, It needs revision.");
       }else{
         if(inputs['action']=="add"){
           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").html("<b>Successful</b>&nbsp;New Quiz Item added");
	   $(response).prependTo("#sub-content"); 
         }
         if(inputs['action']=="edit"){
           $("#mtf-alert").addClass("alert alert-success");
           $("#mtf-alert").text("Quiz Item succesfully updated");
	   var div_id = $("#" + form + " #item_id").val();
           $("div#"+div_id).html(response);
         }
	   setTimeout(function(){
		$('#mtf_close').click();
	    }, 1000);
	   MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
       }
    });
}

function au_iditem(form){
    var url = "../../libraries/php/exec_controller.php";
    var inputs = {'action': $("#"+form+" #action").val(),
		  'target': 'id_item',
		  'test_id': $("#"+form+" #test_id").val(),
		  'item_id': $("#"+form+" #item_id").val(),
		  'ident_item_id': $("#"+form+" #ident_item_id").val(),
		  'points': $("#"+form+" #points").val(),
		  'question': $("#"+form+" #question").val(),
		  'ans': $("#"+form+" #ans").val()
		 };

    $.post(url, inputs, function(response){
	response = new String(response).trim();

	if(response=="err"){
            $("#ident-alert").addClass("text-danger");
            $("#ident-alert").html("<b>Technical Error!</b> .");
	}else if(response=="dup"){
            $("#ident-alert").addClass("text-warning");
            $("#ident-alert").html("<b>Warning!</b> Question already taken, It needs revision.");
	}else{
            if(inputs['action'] == "add"){
		$("#ident-alert").addClass("alert alert-success");
		$("#ident-alert").html("<b>Added! </b>&nbsp;New True or False Quiz Item added");
		$(response).prependTo("#sub-content");
            }
            if(inputs['action'] == "edit"){
		$("#ident-alert").addClass("alert alert-success");
		$("#ident-alert").html("<b>Quiz</b>&nbsp; Item succesfully updated");
		var div_id = $("#" + form + " #item_id").val();
		$("div#"+div_id).html(response);
            }
	    setTimeout(function(){
		$('#id_close').click();
	    }, 1000);
	   MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
	}
    });
}

function addUpdateIdenItem(form_id){

  var url = "../../libraries/php/exec_controller.php";
  var action = $("#"+form_id+" #action").val();
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
 
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();
       if(response_text=="err"){
         $("#ident-alert").addClass("text-danger");
         $("#ident-alert").html("<b>Technical Error!</b> .");
       }else if(response_text=="dup"){
         $("#ident-alert").addClass("text-warning");
         $("#ident-alert").html("<b>Warning!</b> Question already taken, It needs revision.");
       }else{
         if(action=="add"){
           $("#ident-alert").addClass("alert alert-success");
           $("#ident-alert").text("New True or False Quiz Item added");
	   $("#sub-content").append(response_text); 
         }
         if(action=="edit"){
	   alert(response_text);
           $("#ident-alert").addClass("alert alert-success");
           $("#ident-alert").text("Quiz Item succesfully updated");
         }
       }
     }
  }
  ajax.send(str_inputs);


}


function showEditItemForm(form_id, item_type){
  var question = $("#"+form_id+" #q"+form_id).text();
  var item_id = $("#"+form_id+" #item_id").val();
  
  
  if(item_type == 1){//Multiple Choice
    $("#mp_item_form #action").val("edit");
    $("#mp_item_form #question").val(question);
    $("#mp_item_form #item_id").val(item_id);
    var points = $("#"+form_id+" #points").val();
    $("#mp_item_form #points").val(points);
    var answer = $("#"+form_id+" #ans").val();
    $("#mp_item_form #ans").val(answer);
    //choices id's
    var cid1 = $("#"+form_id+" #c1").val();
    var cid2 = $("#"+form_id+" #c2").val();
    var cid3 = $("#"+form_id+" #c3").val();
    var cid4 = $("#"+form_id+" #c4").val();
    //set choices id's to form
    $("#mp_item_form #c1").val(cid1);
    $("#mp_item_form #c2").val(cid2);
    $("#mp_item_form #c3").val(cid3);
    $("#mp_item_form #c4").val(cid4);
    //choices value
    var c1 = $("#"+form_id+" #1").val();
    var c2 = $("#"+form_id+" #2").val();
    var c3 = $("#"+form_id+" #3").val();
    var c4 = $("#"+form_id+" #4").val();
    //set choice value to form
    $("#mp_item_form #a").val(c1);
    $("#mp_item_form #b").val(c2);
    $("#mp_item_form #c").val(c3);
    $("#mp_item_form #d").val(c4);
    //display form
    showpopup_form("popup_background",'mp-item-con');
    //$("div.mp-item-con").css("display","block");
  }
 
  if(item_type==2){//True or False
     TFItemMode(0);
     var tf_item_id = $("#"+form_id+" #tf_item_id").val();
     $("#tf_item #question").text(question); 
     $("#tf_item #item_id").val(item_id);
     $("#tf_item #tf_item_id").val(tf_item_id);
     var points = $("#"+form_id+" #points").val();
     $("#tf_item #points").val(points);
     var answer = $("#"+form_id+" #ans").val();
     $("#tf_item #ans").val(answer);
     showpopup_form("popup_background",'tf-item-con');
  }

  if(item_type==3){//Modified True or False
      var mtf_id = $("#"+form_id+" #mtf_item_id").val();
      var points = $("#"+form_id+" #points").val();
      var ans = $("#"+form_id+" #ans").val();
      
      $("#mtf_item #mtf_item_id").val(mtf_id);
      $("#mtf_item #action").val('edit');
      $("#mtf_item #item_id").val(form_id);
      $("#mtf_item #question").text(question);

      if(ans=='True'){
	  $("#mtf_item #ans_sel").val('True');
      }else{
	  $("#mtf_item #ans_sel").val('False');
	  $("#mtf_item #ans_text").val(ans);
	  $("#mtf_item #ans_text").css('visibility', 'visible');
      }

      $("#mtf_item #points").val(points);
      showpopup_form("popup_background",'mtf-item-con');
  }

  if(item_type==4){//Identification
      var id_id = $("#"+form_id+" #id_id").val();
      var points = $("#"+form_id+" #points").val();
      var ans = $("#"+form_id+" #ans").val();
      
      $("#ident_item #ident_item_id").val(id_id);
      $("#ident_item #action").val('edit');
      $("#ident_item #item_id").val(form_id);
      $("#ident_item #question").text(question);
      $("#ident_item #points").val(points);
      $("#ident_item #ans").val(ans);
      showpopup_form("popup_background",'ident-item-con');
  }
}

//delete an item
function deleteItem(form_id){
  var ans = confirm("Are you sure to delete this item?"+ form_id);
  if(ans){
    ajaxDeleteItem(form_id);
  }
}

//ajax deletion for Item
function ajaxDeleteItem(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
  
  
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();
       alert(respone_text);
    }
  }
  ajax.send(str_inputs);
}
/*
*  course dashboard scripts
*/

function loadInstCourse(ctype){
  window.location = "../../instructor_module/pages/course_dashboard.php?course="+ctype;
}

/**
  lecture material ajax script
*/

function showEditLectForm(bg, form, id, chapter_id){
    $("#feedback").removeClass().html('');
    $("form#addlect #action").val("edit");
    var title = $("tr#"+id+" td").eq(3).html();
    $("form#addlect #id").val(id);
    $("form#addlect #title").val(title);
    $("form#addlect #ch_id").val(chapter_id);
    $("#popup_div div#pd-header #pd-header-title").html('Update Lecture');
    showpopup_form(bg, form);
}

function showAddLectureMaterialForm(lecture_id){
  showpopup_form('popup_background','popup-div-lect-mat');
  $("form#lect_mat #lect_id").val(lecture_id);
}

function dellm(lm_id){
    c = confirm("Are you sure to delete this material?");
    if(c){
	var server = "../../libraries/php/exec_controller.php";
	var inputs = {'action': 'del',
		      'target': 'lect_mat',
		      'lm_id': lm_id};

	$.get(server, inputs, function(rs){
	    rs = new String(rs).trim();
	    if(rs=='ok'){
		$('li#'+lm_id).remove();
	    }
	});
    }
    
}


function uploadLecture(form_id){
 
  var url = "../../libraries/php/exec_controller.php";
  var lect_id = $('#'+form_id+' #lecture').val();
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response_text = null;
  
  
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response_text = new String(ajax.responseText).trim();
       if(response_text=='error'){
         alert('error!');
       }else{
         $('nav > ul#ab'+lect_id).append(response_text);      
       }
     
    }
  }
  ajax.send(str_inputs);
}



/**
login script validation

*/

function validateAccountInput(){
  var uname = $('#uname').val();
  var pword = $('#password').val();
  
  if(uname.length<1 && pword.length<1){
    alert("Please Enter username and Password");
    return false;
  }else if(uname.length<1){
    alert("Please Enter Username");
    return false;
  }else if(pword.length<1){
    alert("Please Enter Password");
    return false;
  }else{
    return true;
  }
}



/*****************************
*
* quiz script 
*
*****************************/
function quiz_diag_action(form_id){
  var action = $('#'+form_id+' #action').val();
  var test_id = $('#'+form_id+' #test_id').val();
  var title = $('#'+form_id+' #title').val();
  var due_date = $('#'+form_id+' #dd').val();
  var test_date = $('#'+form_id+' #da').val();
  var duration = $('#'+form_id+' #duration').val(); 
  var ttype = $('#' + form_id + ' #ttype').val();
  var total_p = $('#' + form_id + '#total_p').val();
 
  if(action=='edit'){//action
    //do cinfiguration
    $('form#addquiz #action').val('edit');
    $('form#addquiz #test_id').val(test_id);
    $('form#addquiz #q_title').val(title);
    $('form#addquiz #dd').val(due_date);
    $('form#addquiz #da').val(test_date);
    $('form#addquiz #duration').val(duration);
    window.location = "../../instructor_module/pages/add_quiz.php?tid="+test_id;
    //showpopup_form('popup_background','popup_div');   
  }else if(action=='show_rs'){
      window.location = "../../instructor_module/pages/stud_results.php?tid="+test_id;
  }else{//manage
    //do configuration
    window.location="../../instructor_module/pages/view_quiz.php?id="+test_id;
  }
}


function manageQuiz(form_id){
  var action = $('#'+form_id+' #action').val();
 
  if(action=='add'){
    addQuiz(form_id);
  }else{
    editQuiz(form_id);
  }
}


function addQuiz(form_id){
  /*
  * frm_src -> source form id where to get the inputs
  * 
  *
  * postconsdition:
  *    calls the ajax script and receive response string
  *    if response is 'ok' then
  *       add quiz element in the quiz page
  *    else display error
  */
  
  var url = "../../libraries/php/exec_controller.php";
  var ajax = ajaxCreate();  
  var str_inputs = getformVal(form_id);
  var response = null;

  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response = new String(ajax.responseText).trim();
       $('#sub-content').append(response);
     }
  }

  ajax.send(str_inputs);  
}

function editQuiz(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var ajax = ajaxCreate();  
  var test_id = $('#'+form_id+' #test_id').val();
  var str_inputs = getformVal(form_id);
  var response = null;

  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response = new String(ajax.responseText).trim();
       if(response=='err'){
         alert('Oops! An Error occur while iupdating quiz info.');
       }else{
         //alert(response);
         $('div.'+test_id).html(response);
         hide_form('popup_background','popup_div');
       }
     }
  }
,
  ajax.send(str_inputs);

}

function removeTest(test_id, title){
    var server = "../../libraries/php/exec_controller.php";
    $.post(server, {'test_id': test_id, 'target':'v_test', 'action':'del'}, function(rs){
	if(rs=='true'){
	    c = confirm("Are you sure to delete '"+title+"'?");
	    if(c){
		dodelTest(test_id);
	    }
	}else{
	    alert('This Test cannot be deleted to avoid loss of student results');
	}
    });
  
  /*
  var c = confirm("If you press ok this quiz will be permanently deleted.\n Are you sure to delete this quiz?");
  alert(frm_src);
  if(c){

  }*/
}

function dodelTest(test_id){
    var server = "../../libraries/php/exec_controller.php";
    $.post(server, {'test_id': test_id, 'target':'test', 'action':'del'}, function(rs){
	rs = new String(rs).trim();
	if(rs=='true'){
	    $("."+test_id).remove();
	}
    });
}

/*
*  quiz item scripts
*/

function showQuizForm(){
  
}


/********************************
*  announcement script 
*
********************************/

//add new announcement
//display add announcement dialog form
function showAddAnnDg(popup_bg, popup_div){
/*  $('#addann #action').val('add');
  $('#addann #icr_id').val($('#addfrm #icr_id').val());
  $('#feedback').text('');*/
  showpopup_form(popup_bg,popup_div);
}

//edit and delete announcement handler

function showUpdateDelAnnDg(popup_bg,popup_div,frmid){
 $("#feedback").html('');
 $("#feedback").removeClass();
 var action = $('#'+frmid+' #action').val();
 var ann_id = $('#'+frmid+' #ann_id').val();
 //var ann_title = $('#'+frmid+' #ann_title').val(); 
 var ann_title = $('div#'+frmid+' h2').text(); 
 var ann_stmt = $('div#'+frmid+' div').eq(1).html();
 
 if(action=='edit'){
    $('#addann #action').val('edit');
    $('#addann #ann_id').val(ann_id);
    $('#addann #ann_title').val(ann_title);
    $('#addann #ann_stmt').val(ann_stmt);
    $('#feedback').text('');
    showpopup_form(popup_bg,popup_div); 
 }else{
    var conf = confirm("Are you sure to delete this announcement?");
    if(conf){
      delAnn(frmid);
    }
 }

}

function clearAnnouncementText(){
  $('#addann #action').val('add');
  $('#feedback').removeClass();
  $('#feedback').html('');
  $('#addann #ann_title').val('');
  $('#addann #ann_stmt').val('');
}

//calling ajax enabled function
function addUpdateAnnouncement(form_id){
  
  var action = $('#'+form_id+' #action').val();
  
  if(action=='add'){
//    addAnnouncement(form_id);
      add_ann(form_id);
  }else{//edit
      u_ann(form_id);
  }
}

function add_ann(form){//add announcement
    var server = "../../libraries/php/exec_controller.php";//server page
    var inputs = {'action': 'add' ,
		  'target': 'announcement',
		  'icr_id': $("#"+form+" #icr_id").val(),
		  'ann_title': $("#"+form+" #ann_title").val(),
		  'ann_stmt': $("#"+form+" #ann_stmt").val()
                 }
    
    
  $.post(server, inputs, function(rs){
      rs = new String(rs).trim();
      if(rs=='con_err'){
	  $("#feedback").removeClass();
	  $("#feedback").addClass("text text-danger");
	  $("#feedback").html("<span class='glyphicon glyphicon-warning-sign'></span><b>Adding Failed</b> due to loss of connection to server!");
      }else if(rs=='dup'){
	  $("#feedback").removeClass();
	  $("#feedback").addClass("text text-warning");
	  $("#feedback").html("<span class='glyphicon glyphicon-warning-sign'></span><b>This</b> Announcement already added");
      }else{
	var json = JSON.parse(rs);

        var new_ann = "<div class='ca_ann_con' id='"+json.ann_id+"'>";
            new_ann+= "<div id='ca_date_con'>";
            new_ann+= "<span id='ca_date_cont'>";
            new_ann+= "<span class='glyphicon glyphicon-calendar'>&nbsp;</span>Date Updated : "+json.date +"</span></div>";
            new_ann+= "<h2>"+json.title+"</h2>";
            new_ann+= "<div id='ca_content'>"+json.stmt+"</div>";
            new_ann+= "<div id='ca-edit-pane'><form id='"+json.ann_id+"' action='javascript:showUpdateDelAnnDg(\"popup_background\", \"popup_div\","+json.ann_id+");' method='post'>";
            new_ann+= "<input type='hidden' id='action' name='action' value='edit'>";
            new_ann+= "<input type='hidden' id='target' name='target' value='announcement'>";
            new_ann+= "<input type='hidden' id='ann_id' name='ann_id' value='"+json.ann_id+"'>";
            new_ann+= "<button class='btn btn-default' onclick='javascript:$(\"#"+json.ann_id+ " #action).val(\"edit\")'><span class='glyphicon glyphicon-edit'></span>Edit</button>&nbsp;";
            new_ann+= "<button class='btn btn-default' onclick='javascript:$(\"#"+json.ann_id+" #action\").val(\"del\")'><span class='glyphicon glyphicon-remove text-danger'></span>Delete</button>";
            new_ann+= "</form>";
            new_ann+= "</div></br></br>";
            
          //check if his is the first announcement, then remove 'no announcement notification'
          if($("#d_stat").val()==0){
	      $("#d_stat").val(1);
	      $("#empty").remove();
	      //show hidden announcement browser
	      $(".ann_browser").show();
	  }
	  
	  $(new_ann).prependTo("#sub-content");
          var nio_annbl = "<option value='#"+json.ann_id+"'>"+json.title+"</option>";
          $(nio_annbl).prependTo("#go_ann");
	  
	  //show message
	  $("#feedback").removeClass();
	  $("#feedback").addClass("text text-success");
	  $("#feedback").html("<span class='glyphicon glyphicon-check'></span></b>New</b> Announcement Added Succesfully");
        }
  });
}

/*
function addAnnouncement(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var ajax = ajaxCreate();
    
  var str_inputs = getformVal(form_id);
  var response = null;
  
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response = new String(ajax.responseText).trim();
       if(response=='err'){
         $('#feedback').addClass("text text-danger");
         $('#feedback').text("Error Adding New Announcement");
       }else{
	 $(response).prependTo('#sub-content');
         $('#feedback').addClass("text text-success");
         $('#feedback').text("New announcement Succesfully Added Today");
       }
     }                             
  }
  ajax.send(str_inputs);
}*/

function u_ann(form){//update ann
    var server = "../../libraries/php/exec_controller.php";//server page
    var inputs = {'action': 'edit' ,
		  'target': 'announcement',
		  'ann_id': $("#"+form+" #ann_id").val(),
		  'icr_id': $("#"+form+" #icr_id").val(),
		  'ann_title': $("#"+form+" #ann_title").val(),
		  'ann_stmt': $("#"+form+" #ann_stmt").val()
                 }
    $.post(server, inputs, function(rs){
	rs = new String(rs).trim();
        $('div#'+inputs['ann_id']).html(rs);      
        $("#feedback").removeClass();
        $("#feedback").addClass("text text-success");
        $('#feedback').html("<span class='glyphicon glyphicon-check'></span><b>Announcement</b> succesfully Updated!");
    });
}

/*
function updateAnnouncement(form_id){
  var url = "../../libraries/php/exec_controller.php";
  var ajax = ajaxCreate();
    
  var ann_id = $('#'+form_id+' #ann_id').val();
  var str_inputs = getformVal(form_id);
  var response = null;
  
  ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
  ajax.onreadystatechange = function(){
     if(ajax.readyState == 4 && ajax.status == 200){
       response = new String(ajax.responseText).trim();
	alert(response);
        $('div.'+ann_id).html(response);      
        $("#feedback").addClass("text text-success");
        $('#feedback').text('Announcement succesfully Updated!');
     }                             
  }
  ajax.send(str_inputs);
}
*/

function delAnn(form){
    var server = "../../libraries/php/exec_controller.php";//server page
    var inputs = {'action': 'del' ,
		  'target': 'announcement',
		  'ann_id': $("#"+form+" #ann_id").val(),
                 };
    $.post(server, inputs, function(rs){
	rs = new String(rs).trim();
	if(rs=='ok'){
	    $('div#'+inputs['ann_id']).remove(); 
	    //remove item in the announcement browser

	    $("select#go_ann option").each(function(i){
		if ($(this).val()==('#'+inputs['ann_id'])){
		    $(this).remove();
		}
	    });

	    if($("select#go_ann option").length==0){
		$("<h3 id='empty'>No Announcement Yet!</h3>").prependTo("#sub-content");
		$("input#d_stat").val(0);
		$("div.ann_browser").hide();
	    }
	}
    });
}

/*
* syllabus scripts here
* this segment are javascript functions
* which is used by syllabus page in instructor module
* some of the functions is using  ajax
* for changing data in the database,
* while other functions are used for 
* UI interactions
*/

function addEditChapter(form_id){  
  var action = $('#'+form_id+' #action').val();
  
  if(action=='add'){
    addChapter(form_id);
  }else{//edit
     //alert(action);
    editChapter(form_id);
  }
}

function addChapter(form_id){
   /*
  * postcondition: add new chapter to a course
  *                then add new row to a syllabus table
  */
  
  var url = "../../libraries/php/exec_controller.php";//server page
  var ajax = ajaxCreate();//initializa and create ajax request
    
  var str_inputs = getformVal(form_id);
  var response = null;
  var ch_count = new Number($('#ch_count').val());
         
  ajax.open("POST", url);
  //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
 
  ajax.onreadystatechange = function(){  
    if(ajax.readyState == 4 && ajax.status == 200){ 
      response = new String(ajax.responseText).trim();
      alert(response);
      
      if(response=='dup'){
        alert('This chapter already exist in this syllabus'); 
      }else if(response=='err'){
        alert('Warning!\n An Error Occur while adding Chapter');
      }else{
        //append the new topic to syllabus table
        $('#syllabus-table').append(response);
        $('#ch_count').val((ch_count+1));
      }
    }                            
  }
  ajax.send(str_inputs);
}

function editChapter(form_id){
  var url = "../../libraries/php/exec_controller.php";//server page
  var ajax = ajaxCreate();//initializa and create ajax request
    
  var str_inputs = getformVal(form_id);
  var response = null;
  var row_id = $("#"+form_id+" #curselrow").val();
  
  ajax.open("POST", url);
  //this is needed enable for $_POST array in php to access form elements input
  ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
 
  ajax.onreadystatechange = function(){  
    if(ajax.readyState == 4 && ajax.status == 200){ 
      response = new String(ajax.responseText).trim();
      if(response=='dup'){
        alert("Unable to Update. The title you enter may cause duplicate entry");
      }else if(response=='err'){
        alert("Technical Error!\n Error occur while updating the chapter");
      }else{
        updateChapterRow(row_id, response);//update chapter text
        addChapterMode();//back to add chapter mode
      }
    }                            
  }
  ajax.send(str_inputs);
}


/*
* course syllabus script
*/

function updateChapterRow(row_id, value){
  //update the content of a specific row of a 
  //chapter table
  $("tr#"+row_id+" > td").eq(1).html(value);
}

function topicEditMode(row, chapter_id){
  var row_count = new Number($('#ch_count').val());
  var title = $("tr#"+row+" > td").eq(5).html();
  //var cur_row = new Number(id);
  
  $('#action').val('edit');//set mode to edit
  $('#opt_lbl').text('Edit Selected Chapter');
  $('#topic-title').val(title);//show the topic title to be modified
  $('#chap_axn').html("<span class='glyphicon glyphicon-edit'></span>&nbsp;Save Update");
  $('#topic-title').focus();//focus to textbox
  $('#ch_id').val(chapter_id);//set value of editable chapter id
  $("#curselrow").val(row);

  //change background color of table row
  for(var i=0;i<row_count;i++){
    if(i!=row){
      $('#'+i).css('background-color', 'white');
    }
  }
  $('#'+row).css('background-color','rgba(135,206,250,0.3)');
}

function addChapterMode(){
  $('#action').val('add');//set mode to edit
  $('#opt_lbl').text('Add New Chapter');
  $('#topic-title').val("");//reset title
  $('#chap_axn').val('Add');
}

function deleteTopic(id, val, r_id){
  //precondition: id -> the id of the topic to deleted both in the database and in the table(UI)
  //              val -> the topic title to be deleted from the table
  //              r_id -> id of a row to be remove from the table
  //postcondition: remove the topic both in the database and in the table(UI)
  var response = confirm('Are you sure to delete \"'+val+'"?');
  
  if(response==true){
    $('ch_id').val(id);
    $('action').val('delete');
    //$(r_id).remove();

    var url = "../../libraries/php/executeAction.php";//server page
    var ajax = ajaxCreate();//initializa and create ajax request
    
    var str_inputs = getformVal('frm_del');
    var response_text = "";
         
    ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
    ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    ajax.onreadystatechange = function(){  
      if(ajax.readyState == 4 && ajax.status == 200){ 
        response_text = ajax.responseText;
      }                            
    }
   ajax.send(str_inputs);
  }
   
}
     

function showAddLectForm(form){
    $("#feedback").removeClass();
    $("#feedback").html('');
    $("form#"+form+" #action").val("add");
    $("#pd-header-title").html('Add new Lecture');
    $("#"+form+" #title").val('');
    showpopup_form('popup_background', 'popup_div');
}

function ajaxLecture(form_id){
  var action = $('#'+form_id+' #action').val();
 
  if(action=='add'){
    addLecture(form_id);
  }
  if(action=='edit'){
    updateLecture(form_id); 
  }

}

function addLecture(form){
    var server = "../../libraries/php/exec_controller.php";//server page
    var inputs = {'action': 'add' ,
		  'target': 'lecture',
		  'id':$('#id').val(),
		  'chapter_id':$('#ch_id').val(),
		  'title':$('#title').val()
                 }
    

    $.post(server, inputs, function(lecture){
	lecture = new String(lecture).trim();
	
	if(lecture=='dup'){
	    $("#feedback").removeClass();
	    $("#feedback").addClass("text text-warning").html('<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<b>'+inputs['title']+'</b> already exist for this course');
	}else{
	    var title = $("#"+form+" #title").val();
	    var message = "<span class='glyphicon glyphicon-check'></span>";
	    var chapter = $('#ch_id').val();
	    message += " '"+title+"' succesfully added!";
	    $("#feedback").removeClass();
	    $("#feedback").addClass("alert alert-success").html(message);
	    $('div#'+chapter+' table').append(lecture);
	    setTimeout(function(){
		$('#close').click();
	    }, 2000);

	}
    });
}

function updateLecture(form){
    var server = "../../libraries/php/exec_controller.php";//server page
    var inputs = {'action':'edit',
		  'target':'lecture',
		  'lecture_id':$('form#'+form+' #id').val(),
		  'chapter_id':$('form#'+form+' #ch_id').val(),
		  'title':$('#title').val()
                 }
    

    $.post(server, inputs, function(lecture){
	lecture = new String(lecture).trim();
	if(lecture=='dup'){
	    $("#feedback").removeClass();
	    $("#feedback").addClass("text text-warning").html('<span class="glyphicon glyphicon-warning-sign"></span>&nbsp;<b>'+inputs['title']+'</b> already exist for this course');
	}

	if(lecture!='dup'){
	    var title = $("#"+form+" #title").val();
	    var message = "<span class='glyphicon glyphicon-check'></span>";
	    var lect_id  = $("form#" + form + " #id").val();
	    var chapter = $('#ch_id').val();
	    message += " '"+title+"' succesfully saved!";
	    $("#feedback").removeClass();
	    $("#feedback").addClass("alert alert-success").html(message);
	    $("tr#"+lect_id+" td").eq(3).html(lecture);
	    setTimeout(function(){
		$('#close').click();
	    }, 1000);
	}
    });
}


function delLect(lecture_id){
    //delete lecture 
    var title = $("tr#"+lecture_id+" td").eq(3).html();
    var r = confirm("Warning: When you delete this lecture All of its corresponding lecture materials will be inaccessible\n\n Are you sure to delete lecture '"+title+"'?");
    var server = "../../libraries/php/exec_controller.php";//server page

    if(r){
	var inputs = {'action':'del',
		      'target':'lecture',
		      'lecture_id':lecture_id};

	$.post(server, inputs, function(response){
	    response = new String(response).trim();
	    if(response=='deleted'){
		$("tr#"+lecture_id).remove();
	    }
	});
    }
}


function addUpdateLecture(form_id){
    
    var url = "../../libraries/php/exec_controller.php";//server page
    var ajax = ajaxCreate();//initializa and create ajax request
    
    var str_inputs = getformVal(form_id);

    var response_text = "";
    
    var chapter = $('#'+form_id+' #ch_id').val();
    var action = $("form#" + form_id + " action").val();

    
    ajax.open("POST", url);
    //this is needed enable for $_POST array in php to access form elements input
    ajax.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=UTF-8");
    ajax.onreadystatechange = function(){  
      if(ajax.readyState == 4 && ajax.status == 200){ 
	  response = new String(ajax.responseText).trim();

	 if(response=='dup'){
	     var title = $("#"+form_id+" #title").val();
	     var message = "<span class='glyphicon glyphicon-warning-sign'></span>";
	     message += " '"+title+"' already exist!";
	     $("#feedback").removeClass();
	     $("#feedback").addClass("text text-warning").html(message);
	 }else{
	     if($action=='add'){
		 var title = $("#"+form_id+" #title").val();
		 var message = "<span class='glyphicon glyphicon-check'></span>";
		 message += " '"+title+"' succesfully saved!";
		 $("#feedback").removeClass();
		 $("#feedback").addClass("text text-success").html(message);
		 $('div#'+chapter+' table').append(response);
	     }
	     if($action=="edit"){
//		 $("tr#" + lect_id).eq(4)
	     }
	     
	 }

      }                            
   }
   ajax.send(str_inputs);
}



