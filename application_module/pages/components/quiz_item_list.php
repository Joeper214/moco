
<script type="text/javascript">
   //$(function() {
       // run the currently selected effect
	function runEffect(c_item, next_item) {
          var item_pref = $('#item_prefix').val();
	  var c_i = document.getElementById((item_pref+c_item));
          var n_i = document.getElementById((item_pref+next_item));
         // get effect type from
	 var selectedEffect = $("#effect").val();
         // most effect types need no options passed by default
         var options = {};
         // some effects have required parameters
         if ( selectedEffect === "scale" ) {
           options = { percent: 0 };
         } else if ( selectedEffect === "transfer" ) {
           options = { to: "#button", className: "ui-effects-transfer" };
         } else if ( selectedEffect === "size" ) {
           options = { to: { width: 200, height: 60 } };
         }
         // run the effect
         jQuery(c_i).hide();
         jQuery(n_i).effect( selectedEffect, options, 500, callback );
   };
   // callback function to bring a hidden box back
   function callback() {
     setTimeout(function() {
	 //$( "#q2" ).removeAttr( "style" ).fadeIn();
        }, 1000 );
   };
   // set effect from select menu value
   $( "#next" ).click(function() {
       var c_item = new Number($('#c_item').val());
       var next_item = c_item+1;
       var max_num = new Number($('#max').val()); 

       if(c_item < max_num){
         runEffect(c_item, next_item);
         $('#c_item').attr("value", next_item.toString());         
       }
      return false;
   });

   $("#prev").click(function(){
      var c_item = new Number($('#c_item').val());
      var prev_item = c_item-1;
      var min = 1;
      if(c_item>min){
         runEffect(c_item, prev_item);
         $('#c_item').attr("value", prev_item.toString());    
      }
   });
//});

</script>


<!--- content --->
  <div id="about_cont_con">
     <!--- header --->
     <div id="about_hdr">
	<span id="about_hdr_title">
	   Quiz 1 - One Time Pad Encryption
	</span>
     </div>
    <div id='sub-content'>
      <div>
        <ul class='itemnav'>
          <li>
            <a href="javascript:runEffect('4','1')">1</a>
          </li>
          <li>
            <a href='#'>2</a>
          </li>
          <li>
            <a href='#'>3</a>
          </li>
          <li>
            <a href='#'>4</a>
          </li>
        </ul>
      </div>
      <div>
        <a id='prev' href='#'>Prev</a>
        <a id='next'>Next</a>
      </div>
      <div style='position: relative; top: 30px;'>
        <input type='hidden' id='effect' value='slide'>
        <input type='hidden' id='max' value='4'>
        <input type='hidden' id='c_item' value='1'>
        <input type='hidden' id ='item_prefix' value='q'>
        <div id='q1' style='position: absolute;
                            left: 40px; 
                            width: 90%;height: 250px;
                            border:1px solid;display:block;'>
            sample 1
        </div>
        <div id='q2' 
             style='position: absolute;
                    left: 40px; 
                    width: 90%;height: 250px;
                    border:1px solid;display:none;'>
           sample 2
        </div>
        <div id='q3' style='position: absolute; 
                            left: 40px;
                            width: 90%;height: 250px;
                            border:1px solid;display:none;'>
           sample 3
        </div>
        <div id='q4' style='position: absolute;
                            left: 40px; 
                            width: 90%;height: 250px;
                            border:1px solid;display:none;'>
           sample 4
        </div>
      </div>
     
    </div>