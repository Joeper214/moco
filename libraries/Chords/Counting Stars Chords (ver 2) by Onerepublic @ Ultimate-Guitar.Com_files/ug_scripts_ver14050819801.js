jQuery.autocomplete=function(k,ab,r){var s=this,e=$(k).attr("autocomplete","off"),l=document.createElement("div"),f=$(l);f.hide().addClass("ac_results").css("position","absolute");$("body").append(l);k.autocompleter=s;var g=null,D="",h=-1,j={},B=true,w=null;j.data={};e.keydown(function(a){w=a.keyCode;switch(a.keyCode){case 38:a.preventDefault();E(-1);break;case 40:a.preventDefault();E(1);break;case 9:case 13:v();break;default:h=-1;g&&clearTimeout(g);g=setTimeout(function(){x()},1);break}}).focus(function(){B=true}).blur(function(){B=false;y()});p();function x(){if(e.parents("form").find(":input[name=search_type]").val()!="title"){return true}if(w==46||w>8&&w<32){return f.hide()}var a=e.val().toLowerCase();if(a!=D){D=a;a.length?C(a):f.hide()}return true}function E(a){var b=$("li",l).not(".in_artist_title");if(b){h+=a;if(h<0){h=0}else{if(h>=b.size()){h=b.size()-1}}b.removeClass("ac_over");$(b[h]).addClass("ac_over")}}function v(){var a=$("li.ac_over",l)[0];if(a){F(a);return true}else{return false}}function F(a){if(a){a=$(a).text();D=k.lastSelected=a;f.html("");e.val(a);p()}}function G(){var a={width:$(".searchinp").outerWidth()-2,top:$(".searchinp").offset().top+$(".searchinp").outerHeight(),left:$(".searchinp").offset().left};if($(".searchsel").length){a.left-=1;a.width+=1;a.top-=1}if(!$(".searchinp").length){a.left=e.offset().left;a.width=e.outerWidth();a.top=e.offset().top+e.outerHeight()}f.css(a).show()}function y(){g&&clearTimeout(g);g=setTimeout(p,200)}function p(){g&&clearTimeout(g);f.is(":visible")&&f.hide()}function I(a,b){if(b){l.innerHTML="";if(!B||b.length==0){return p()}$.browser.msie&&f.append(document.createElement("iframe"));l.appendChild(J(a,b));G()}else{p()}return false}function J(b,c){var m=document.createElement("ul"),n,d=true;if(ab&&c[0].substr(-1,1)=="@"){n=document.createElement("li");n.innerHTML="In "+r+":";$(n).addClass("in_artist_title");m.appendChild(n)}for(var o=0;o<c.length;o++){n=document.createElement("li");if(c[o].substr(-1,1)=="@"){var a=b.split(" ");n.selectValue=c[o].substr(0,c[o].length-1);for(var q=n.selectValue.split(" "),z=0;z<a.length;z++){for(var t=0;t<q.length;t++){if(q[t].toLowerCase().indexOf(a[z].toLowerCase())===0){q[t]="<span>"+q[t].slice(0,a[z].length)+"</span>"+q[t].slice(a[z].length)}}}n.innerHTML=q.join(" ")}else{if(ab&&d){d=false;$(n).addClass("not_art")}n.selectValue=n.innerHTML=c[o]}m.appendChild(n);$(n).hover(function(){$("li",m).removeClass("ac_over");$(this).addClass("ac_over");h=$("li",m).indexOf($(this).get(0))},function(){$(this).removeClass("ac_over")}).click(function(A){A.preventDefault();A.stopPropagation();F(this);e.parents("form").submit()})}return m}var u=false;function C(a){var b=K(a);if(b){I(a,b)}else{H=document.getElementsByTagName("body")[0];u&&H.removeChild(u);u=document.createElement("script");u.src=ab?"http://www.ultimate-guitar.com/search/suggest.php?q="+encodeURI(a)+"&artist="+ab:"http://www.ultimate-guitar.com/search/sug/"+a.slice(0,1)+"/"+encodeURI(a)+".js";H.appendChild(u)}}function K(c){if(j.data[c]){return j.data[c]}for(var d=false,a=c;a.length>1&&!j.data[a];){a=a.slice(0,-1);if(j.data[a]){d=j.data[a].length<10}}if(d){d=j.data[a];a=[];for(var b=0;b<d.length;b++){if(d[b].charAt(d[b].length-1)=="@"){if(L(c,d[b])){a[a.length]=d[b]}}else{if(d[b].toLowerCase().indexOf(c)==0){a[a.length]=d[b]}}}return a}return null}function L(b,c){b=b.split(" ");c=" "+c;for(var a=0;a<b.length;a++){if(c.indexOf(" "+b[a])<0){return false}}return true}this.receiveData=function(a,b){I(a,b);j.data[a]=b}};jQuery.fn.autocomplete=function(d,c){this.each(function(){window.auto=new jQuery.autocomplete(this,d,c)});return this};jQuery.fn.indexOf=function(d){for(var c=0;c<this.length;c++){if(this[c]==d){return c}}return -1};function getValue(){var b=$("#sb input:text:visible");var c="";var a="title";if(b.length==2){c=b.eq(0).val();if(b.eq(0).val()&&b.eq(1).val()){c+=" "}c+=b.eq(1).val()}else{c=b.val();if($("#sb select:visible[name=search_type]").length){a=$("#sb select:visible[name=search_type]").val()}}return{text:c,cb:a}}function setValue(b){var a=$("#sb input:text:visible");if(a.length==2){if(b.cb=="title"){a.eq(0).val("");a.eq(1).val(b.text)}else{a.eq(1).val("");a.eq(0).val(b.text)}}else{a.val(b.text)}}function SwitchSearch(){var c=getValue();var e=document.getElementById("search_bar_advanced");var d=document.getElementById("search_bar_simple");var b=e.style.display=="";e.style.display=b?"none":"";d.style.display=b?"":"none";document.getElementById("expand_search_link").className=b?"expa expand_icon":"expa colapse_icon";document.getElementById("expand_search_link").innerHTML=b?"<b></b>Expand":"<b></b>Collapse";$(".search-main").toggleClass("search_b_adv");setValue(c);var a="ug_search_exp";if(!b){$.cookie(a,"1")}else{document.cookie=a+"=; expires=Thu, 01 Jan 1970 00:00:01 GMT;"}return false}function SwitchAdvancedForm(){var a=getValue();$(".adv_one_field").toggleClass("dn");$(".adv_two_fields").toggleClass("dn");$(".adv_one_field input").attr("disabled",false);$(".adv_one_field.dn input").attr("disabled",true);$(".adv_two_fields input").attr("disabled",false);$(".adv_two_fields.dn input").attr("disabled",true);setValue(a);return false}function getURLParameter(a){return decodeURIComponent((location.search.match(RegExp("[?|&]"+a+"=(.+?)(&|$)"))||[,null])[1])}$(document).ready(function(){var c=".ultimate-guitar.com";var e=1;$(document).bind("click",function(f){if(e){$(".selwin").hide()}e=1});$(".searchsel").click(function(){$(".selwin").toggle();e=0});$(".selwin a").bind("click",function(f){$(".selcurr").html('<b class="f-right"></b>'+$(this).text());$("#w").val($(this).attr("value"));f.preventDefault()});$(".search_input").autocomplete(artist_id===undefined?false:artist_id,name_art===undefined?false:name_art);if($("#a_layer").length==0){$("body").append(auth_html)}function d(h){h=h.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");var j="[\\?&]"+h+"=([^&#]*)";var g=new RegExp(j);var f=g.exec(window.location.href);if(f!==null){return f[1]}else{return false}}var a=d("login_via_soc_networks");if(a){$("#a_layer form").removeClass("a_classic")}$(".head-hist-btn").mouseenter(function(){$.ajax({url:"http://www."+main_server_name+"/xtra/click_contest.php?without_redirect=1&ug_from=epupp&url=tabs_history_"+($("#history-tooltip").is(":visible")?"show":"hide"),})});(function(f){f.placeHeld=function(j,g){var h=this;h.$el=f(j);h.el=j;h.$el.data("placeHeld",h);h.placeholderText=h.$el.attr("placeholder");h.init=function(){h.options=f.extend({},f.placeHeld.defaultOptions,g);h.$el.bind("blur",h.holdPlace).bind("focus",h.releasePlace).trigger("blur");h.$el.parents("form").bind("submit",h.clearPlace)};h.holdPlace=function(){var k=h.$el.val();if(!k){h.$el.val(h.placeholderText).addClass(h.options.className)}};h.releasePlace=function(){var k=h.$el.val();if(k==h.placeholderText){h.$el.val("").removeClass(h.options.className)}};h.clearPlace=function(){var k=h.$el.val();if(k==h.placeholderText&&h.$el.hasClass(h.options.className)){h.$el.val("")}};h.init()};f.placeHeld.defaultOptions={className:"placeheld"};f.fn.placeHeld=function(g){if(!!("placeholder" in f("<input>")[0])){return}return this.each(function(){(new f.placeHeld(this,g))})}})(jQuery);$("input[placeholder]").placeHeld({className:"a_ph"});$("input").live("touchend",function(){$(this).mouseout()});if(navigator.userAgent.toLowerCase().indexOf("android")>-1){$("#a_layer").addClass("a_android")}tabs_history=getTabsHistory();for(var b=0;b<tabs_history.length;b++){renderTabHistoryItem(tabs_history[b])}$(".js-contrib-msg").live("click",function(){var f=$(this).parent().parent();f.animate({opacity:0.05,},400,function(){$.get("/contribution/award/read",{id:f.attr("data-id")});f.remove();if($(".js-contrib-msg").length==0){$(".js-message-wrapper").remove()}});return false})});function getTabsHistory(){var a=$.cookie("tabs_history",new Array());try{if((a!=null)&&(a.length>2)){a=JSON.parse(a)}if(a==null){a=new Array()}}catch(b){a=new Array();$.cookie("tabs_history",JSON.stringify(a),{expires:365,path:"/",domain:"."+ug_serv})}return a}function renderTabHistoryItem(a){if($("#history-tooltip .no-tabs").length>0){$("#history-tooltip .no-tabs").remove()}$("#history-tooltip .history-items").append('<div class="nowrap">'+a.artist+' - <a href="http://tabs.'+main_server_name+a.url+'">'+a.name+(a.v==1?"":(" (ver "+a.v+")"))+"</a></div>")}jQuery.cookie=function(d,e,b){if(arguments.length>1&&(e===null||typeof e!=="object")){b=jQuery.extend({},b);if(e===null){b.expires=-1}if(typeof b.expires==="number"){var g=b.expires,c=b.expires=new Date();c.setDate(c.getDate()+g)}return(document.cookie=[encodeURIComponent(d),"=",b.raw?String(e):encodeURIComponent(String(e)),b.expires?"; expires="+b.expires.toUTCString():"",b.path?"; path="+b.path:"",b.domain?"; domain="+b.domain:"",b.secure?"; secure":""].join(""))}b=e||{};var a,f=b.raw?function(h){return h}:decodeURIComponent;return(a=new RegExp("(?:^|; )"+encodeURIComponent(d)+"=([^;]*)").exec(document.cookie))?f(a[1]):null};var user_id=$.cookie("bbuserid")==null?0:$.cookie("bbuserid");var user_name=$.cookie("bbusername");var hexcase=0;var b64pad="";var chrsz=8;function hex_md5(a){return binl2hex(core_md5(str2binl(a),a.length*chrsz))}function b64_md5(a){return binl2b64(core_md5(str2binl(a),a.length*chrsz))}function str_md5(a){return binl2str(core_md5(str2binl(a),a.length*chrsz))}function hex_hmac_md5(a,b){return binl2hex(core_hmac_md5(a,b))}function b64_hmac_md5(a,b){return binl2b64(core_hmac_md5(a,b))}function str_hmac_md5(a,b){return binl2str(core_hmac_md5(a,b))}function core_md5(p,k){p[k>>5]|=128<<((k)%32);p[(((k+64)>>>9)<<4)+14]=k;var o=1732584193;var n=-271733879;var m=-1732584194;var l=271733878;for(var g=0;g<p.length;g+=16){var j=o;var h=n;var f=m;var e=l;o=md5_ff(o,n,m,l,p[g+0],7,-680876936);l=md5_ff(l,o,n,m,p[g+1],12,-389564586);m=md5_ff(m,l,o,n,p[g+2],17,606105819);n=md5_ff(n,m,l,o,p[g+3],22,-1044525330);o=md5_ff(o,n,m,l,p[g+4],7,-176418897);l=md5_ff(l,o,n,m,p[g+5],12,1200080426);m=md5_ff(m,l,o,n,p[g+6],17,-1473231341);n=md5_ff(n,m,l,o,p[g+7],22,-45705983);o=md5_ff(o,n,m,l,p[g+8],7,1770035416);l=md5_ff(l,o,n,m,p[g+9],12,-1958414417);m=md5_ff(m,l,o,n,p[g+10],17,-42063);n=md5_ff(n,m,l,o,p[g+11],22,-1990404162);o=md5_ff(o,n,m,l,p[g+12],7,1804603682);l=md5_ff(l,o,n,m,p[g+13],12,-40341101);m=md5_ff(m,l,o,n,p[g+14],17,-1502002290);n=md5_ff(n,m,l,o,p[g+15],22,1236535329);o=md5_gg(o,n,m,l,p[g+1],5,-165796510);l=md5_gg(l,o,n,m,p[g+6],9,-1069501632);m=md5_gg(m,l,o,n,p[g+11],14,643717713);n=md5_gg(n,m,l,o,p[g+0],20,-373897302);o=md5_gg(o,n,m,l,p[g+5],5,-701558691);l=md5_gg(l,o,n,m,p[g+10],9,38016083);m=md5_gg(m,l,o,n,p[g+15],14,-660478335);n=md5_gg(n,m,l,o,p[g+4],20,-405537848);o=md5_gg(o,n,m,l,p[g+9],5,568446438);l=md5_gg(l,o,n,m,p[g+14],9,-1019803690);m=md5_gg(m,l,o,n,p[g+3],14,-187363961);n=md5_gg(n,m,l,o,p[g+8],20,1163531501);o=md5_gg(o,n,m,l,p[g+13],5,-1444681467);l=md5_gg(l,o,n,m,p[g+2],9,-51403784);m=md5_gg(m,l,o,n,p[g+7],14,1735328473);n=md5_gg(n,m,l,o,p[g+12],20,-1926607734);o=md5_hh(o,n,m,l,p[g+5],4,-378558);l=md5_hh(l,o,n,m,p[g+8],11,-2022574463);m=md5_hh(m,l,o,n,p[g+11],16,1839030562);n=md5_hh(n,m,l,o,p[g+14],23,-35309556);o=md5_hh(o,n,m,l,p[g+1],4,-1530992060);l=md5_hh(l,o,n,m,p[g+4],11,1272893353);m=md5_hh(m,l,o,n,p[g+7],16,-155497632);n=md5_hh(n,m,l,o,p[g+10],23,-1094730640);o=md5_hh(o,n,m,l,p[g+13],4,681279174);l=md5_hh(l,o,n,m,p[g+0],11,-358537222);m=md5_hh(m,l,o,n,p[g+3],16,-722521979);n=md5_hh(n,m,l,o,p[g+6],23,76029189);o=md5_hh(o,n,m,l,p[g+9],4,-640364487);l=md5_hh(l,o,n,m,p[g+12],11,-421815835);m=md5_hh(m,l,o,n,p[g+15],16,530742520);n=md5_hh(n,m,l,o,p[g+2],23,-995338651);o=md5_ii(o,n,m,l,p[g+0],6,-198630844);l=md5_ii(l,o,n,m,p[g+7],10,1126891415);m=md5_ii(m,l,o,n,p[g+14],15,-1416354905);n=md5_ii(n,m,l,o,p[g+5],21,-57434055);o=md5_ii(o,n,m,l,p[g+12],6,1700485571);l=md5_ii(l,o,n,m,p[g+3],10,-1894986606);m=md5_ii(m,l,o,n,p[g+10],15,-1051523);n=md5_ii(n,m,l,o,p[g+1],21,-2054922799);o=md5_ii(o,n,m,l,p[g+8],6,1873313359);l=md5_ii(l,o,n,m,p[g+15],10,-30611744);m=md5_ii(m,l,o,n,p[g+6],15,-1560198380);n=md5_ii(n,m,l,o,p[g+13],21,1309151649);o=md5_ii(o,n,m,l,p[g+4],6,-145523070);l=md5_ii(l,o,n,m,p[g+11],10,-1120210379);m=md5_ii(m,l,o,n,p[g+2],15,718787259);n=md5_ii(n,m,l,o,p[g+9],21,-343485551);o=safe_add(o,j);n=safe_add(n,h);m=safe_add(m,f);l=safe_add(l,e)}return Array(o,n,m,l)}function md5_cmn(h,e,d,c,g,f){return safe_add(bit_rol(safe_add(safe_add(e,h),safe_add(c,f)),g),d)}function md5_ff(g,f,l,k,e,j,h){return md5_cmn((f&l)|((~f)&k),g,f,e,j,h)}function md5_gg(g,f,l,k,e,j,h){return md5_cmn((f&k)|(l&(~k)),g,f,e,j,h)}function md5_hh(g,f,l,k,e,j,h){return md5_cmn(f^l^k,g,f,e,j,h)}function md5_ii(g,f,l,k,e,j,h){return md5_cmn(l^(f|(~k)),g,f,e,j,h)}function core_hmac_md5(c,f){var e=str2binl(c);if(e.length>16){e=core_md5(e,c.length*chrsz)}var a=Array(16),d=Array(16);for(var b=0;b<16;b++){a[b]=e[b]^909522486;d[b]=e[b]^1549556828}var g=core_md5(a.concat(str2binl(f)),512+f.length*chrsz);return core_md5(d.concat(g),512+128)}function safe_add(a,d){var c=(a&65535)+(d&65535);var b=(a>>16)+(d>>16)+(c>>16);return(b<<16)|(c&65535)}function bit_rol(a,b){return(a<<b)|(a>>>(32-b))}function str2binl(d){var c=new Array();var a=(1<<chrsz)-1;for(var b=0;b<d.length*chrsz;b+=chrsz){c[b>>5]|=(d.charCodeAt(b/chrsz)&a)<<(b%32)}return c}function binl2str(c){var d="";var a=(1<<chrsz)-1;for(var b=0;b<c.length*32;b+=chrsz){d+=String.fromCharCode((c[b>>5]>>>(b%32))&a)}return d}function binl2hex(c){var b=hexcase?"0123456789ABCDEF":"0123456789abcdef";var d="";for(var a=0;a<c.length*4;a++){d+=b.charAt((c[a>>2]>>((a%4)*8+4))&15)+b.charAt((c[a>>2]>>((a%4)*8))&15)}return d}function binl2b64(d){var c="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";var f="";for(var b=0;b<d.length*4;b+=3){var e=(((d[b>>2]>>8*(b%4))&255)<<16)|(((d[b+1>>2]>>8*((b+1)%4))&255)<<8)|((d[b+2>>2]>>8*((b+2)%4))&255);for(var a=0;a<4;a++){if(b*8+a*6>d.length*32){f+=b64pad}else{f+=c.charAt((e>>6*(3-a))&63)}}}return f}function str_to_ent(e){var a="";var d;for(d=0;d<e.length;d++){var f=e.charCodeAt(d);var b="";if(f>255){while(f>=1){b="0123456789".charAt(f%10)+b;f=f/10}if(b==""){b="0"}b="#"+b;b="&"+b;b=b+";";a+=b}else{a+=e.charAt(d)}}return a}function trim(a){while(a.substring(0,1)==" "){a=a.substring(1,a.length)}while(a.substring(a.length-1,a.length)==" "){a=a.substring(0,a.length-1)}return a}function md5hash(b,a,d){if(navigator.userAgent.indexOf("Mozilla/")==0&&parseInt(navigator.appVersion)>=4){var c=hex_md5(str_to_ent(trim(b.value)));a.value=c;if(d){c=hex_md5(trim(b.value));d.value=c}b.value=""}return true}(function(ae,C){function M(){}function L(a){O=[a]}function W(a){ad.insertBefore(a,ad.firstChild)}function X(b,a,c){return b&&b.apply(a.context||a,c)}function Y(a){return/\?/.test(a)?"&":"?"}var V="async",N="charset",R="",S="error",P="_jqjsp",I="on",U=I+"click",T=I+S,D=I+"load",aa=I+"readystatechange",E="removeChild",ac="<script/>",J="success",F="timeout",G=ae.browser,ad=ae("head")[0]||document.documentElement,K={},Z=0,O,ab={callback:P,url:location.href};function Q(d){d=ae.extend({},ab,d);var f=d.complete,b=d.dataFilter,k=d.callbackParameter,e=d.callback,q=d.cache,n=d.pageCache,o=d.charset,c=d.url,l=d.data,g=d.timeout,h,m=0,p=M;d.abort=function(){!m++&&p()};if(X(d.beforeSend,d,[d])===false||m){return d}c=c||R;l=l?((typeof l)=="string"?l:ae.param(l,d.traditional)):R;c+=l?(Y(c)+l):R;k&&(c+=Y(c)+encodeURIComponent(k)+"=?");!q&&!n&&(c+=Y(c)+"_"+(new Date()).getTime()+"=");c=c.replace(/=\?(&|$)/,"="+e+"$1");function j(r){!m++&&C(function(){p();n&&(K[c]={s:[r]});b&&(r=b.apply(d,[r]));X(d.success,d,[r,J]);X(f,d,[d,J])},0)}function a(r){!m++&&C(function(){p();n&&r!=F&&(K[c]=r);X(d.error,d,[d,r]);X(f,d,[d,r])},0)}n&&(h=K[c])?(h.s?j(h.s[0]):a(h)):C(function(t,u,s){if(!m){s=g>0&&C(function(){a(F)},g);p=function(){s&&clearTimeout(s);t[aa]=t[U]=t[D]=t[T]=null;ad[E](t);u&&ad[E](u)};window[e]=L;t=ae(ac)[0];t.id=P+Z++;if(o){t[N]=o}function r(v){(t[U]||M)();v=O;O=undefined;v?j(v[0]):a(S)}if(G.msie){t.event=U;t.htmlFor=t.id;t[aa]=function(){/loaded|complete/.test(t.readyState)&&r()}}else{t[T]=t[D]=r;G.opera?((u=ae(ac)[0]).text="jQuery('#"+t.id+"')[0]."+T+"()"):t[V]=V}t.src=c;W(t);u&&W(u)}},0);return d}Q.setup=function(a){ae.extend(ab,a)};ae.jsonp=Q})(jQuery,setTimeout);var auth_msg={verify_user_not_exist:"Incorrect username",verify_sign_in:"Incorrect password",verify_user_exist:" has already been taken",verify_email:"Invalid email address",verify_username:"Username is too short",verify_not_allowed_symbols:"Username contains invalid characters. Please use letters (A-Z) or digits (0-9) only.",verify_empty:" not entered",verify_capcha:"Re-enter text from image",verify_reset_pass:"Please check your email for further instructions",something_happens:"Network error",activ_mail_sended:"Activation email has been sent once more",reset_pass:"Your password has been reset.<br>Check your email for futher instructions"};var msg_class_prefix="m";var auth_imagehash="";var auth_callback_function="";var auth_callback_params=new Array();var auth_callback_need_activ=true;function switch_auth_blocks(c,a){$("#a_layer .a_block").hide();for(var b=0;b<c.length;b++){$("#a_layer ."+c[b]).show()}if(a!==true){remove_all_auth_messages()}}function remove_all_auth_messages(){$("#a_layer .a_msg").removeClass("success").hide();$("#a_layer .a_msg ul li").remove();$("#a_layer input").removeClass("wrong")}function show_auth_message(b,a,c,d){$(".a_msg").show();if(b=="success"){$(".a_msg").addClass("success")}else{if($(".a_msg").hasClass("success")){$(".a_msg").removeClass("success");$(".a_msg ul li").remove()}$("#a_layer input[name="+d+"]").addClass("wrong")}if($(".a_msg li."+msg_class_prefix+d).length>0){$(".a_msg li."+msg_class_prefix+d).text(c)}else{$(".a_msg ul."+a).append("<li class="+msg_class_prefix+d+">"+c+"</li>")}}function remove_auth_msg(a){$(".a_msg ul li."+msg_class_prefix+a).remove();$("#a_layer input[name="+a+"]").removeClass("wrong");if($(".a_msg ul li").length==0){$(".a_msg").hide()}}function get_random_string(e){var d="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";var c="";for(var b=0;b<e;b++){var a=Math.floor(Math.random()*d.length);c+=d.substring(a,a+1)}return c}function auth_on_sign_in(){auth_fill_user_info();close_auth_layer();if(typeof window[auth_callback_function]=="function"){window[auth_callback_function].apply(auth_callback_function,auth_callback_params)}}function redirect_after_login(a){window.location=a}function auth_fill_user_info(){$("#login_user_guest").hide();$("#login_user_auth").removeClass("dn");header_fill_user_info($.cookie("bbuserid"),$.cookie("bbusername"))}function check_exist_user_by_param(b,a,c){$.jsonp({callbackParameter:"callback",url:"http://www."+main_server_name+"/auth/check",data:({action_type:"register",name:b,value:a}),timeout:100000,success:function(d){if(d.result=="error"){show_auth_message("error",c,b.charAt(0).toUpperCase()+b.slice(1)+auth_msg.verify_user_exist,b);return true}else{remove_auth_msg(b);return false}}})}function send_auth_email_to_user(d,a,c,b){if((!$("#a_layer .a_msg").is(":visible"))||($("#a_layer .a_msg").hasClass("success"))){$.jsonp({url:c,callbackParameter:"callback",data:{email:a,s:"","do":d,url:"",response_format:"jsonp"},timeout:40000,success:function(e){if(e.result=="error"){show_auth_message("error","r",auth_msg.verify_email,"email");if(d=="emailpassword"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister ForgotPassword False"])}else{if(d=="emailcode"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Activation","Activation Resend False"])}}}else{show_auth_message("success","r",b,"email");if(d=="emailpassword"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister ForgotPassword Success"])}else{if(d=="emailcode"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Activation","Activation Resend Success"])}}}},error:function(){show_auth_message("error","r",auth_msg.something_happens,"email")}})}}function show_auth_layer_on_registration(){switch_auth_blocks(new Array("register"));if($("#a_layer .a_block.register img").attr("src").length==0){auth_imagehash=get_random_string(32);$("#a_layer .a_block.register img").attr("src","http://www."+main_server_name+"/forum/image.php?type=regcheck&imagehash="+auth_imagehash)}show_auth_layer(auth_callback_function);_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Show"])}function show_auth_layer_for_blocked_users(){show_auth_layer("");switch_auth_blocks(new Array("a_blocked"));_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Banned","Banned Show"])}function show_auth_layer_for_non_activ_users(){if($("#a_layer .a_block.activ input[name=email]").val()==""){$.jsonp({url:"http://www."+main_server_name+"/auth/get_email",callbackParameter:"callback",timeout:40000,success:function(a){$("#a_layer .a_block.activ input[name=email]").val(a.email)}})}show_auth_layer("");$("#a_layer .a_block.activ").addClass("again");switch_auth_blocks(new Array("activ_none","activ"));_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Activation","Activation Show"])}function show_auth_layer_create_username(b,d,c,a,e){$("#a_layer").show();switch_auth_blocks(new Array("username_exist","create_username"));$(".a_block.create_username").attr("data",a);$(".a_block.username_exist font").html(e);if(b!=""){$(".a_block.create_username .log_ico").show().prepend('<img src="'+b+'" />')}if(c==1){show_auth_message("error","r",d,"username")}else{_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister ChangeUsername","ChangeUsername Show"])}}function show_auth_layer(a){auth_callback_function=a;$("#a_layer").show();_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister Show"])}function show_forgot_password(){switch_auth_blocks(new Array("sign_in","forgot"));_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister ForgotPassword Show"])}function close_auth_layer(){$("#a_layer").hide();switch_auth_blocks(new Array("sign_in","sign_up"))}function prepare_auth_layer(){auth_callback_params=new Array;auth_callback_need_activ=true}function get_avatar_url(a){full_user_id=a;while(full_user_id.length<3){full_user_id="0"+full_user_id}return"http://"+js_img_domain+"/users/"+full_user_id[full_user_id.length-1]+"/"+full_user_id[full_user_id.length-2]+"/"+full_user_id[full_user_id.length-3]+"/"+a+".gif?d=d"}function header_fill_user_info(b,d){var a=document.getElementById("logout_header");a.href=a.href+"&u="+b;var e=document.getElementById("username_header");e.href="http://profile."+main_server_name+"/"+encodeURIComponent(d)+"/";e.innerHTML='<b class="f-left"></b>'+d;document.getElementById("login_user_auth").className="";document.getElementById("login_user_guest").className="dn";var c=document.getElementById("header_login_ava");c.innerHTML='<img src="'+get_avatar_url(b)+'" />'}$(function(){$("#a_layer .sign_in span").live("click",function(){show_forgot_password()});$("#a_layer .sign_up .create").live("click",function(){show_auth_layer_on_registration();_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister CreateAccount"])});$("#a_layer  .a_block.register .a_capcha").live("click",function(){$("#a_layer .a_block.register img").attr("src",$("#a_layer .a_block.register img").attr("src")+"&"+Math.round(Math.random()*1000));_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Refresh"])});$("#a_layer .shw_pswd").live("click",function(){if($(this).text()=="display password"){$(this).text("hide password");$("#a_layer .a_block.register input[name=pass]").get(0).type="text";_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp DisplayPassword On"])}else{$(this).text("display password");$("#a_layer .a_block.register input[name=pass]").get(0).type="password";_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp DisplayPassword Off"])}});$("#a_layer .a_block.register .back").live("click",function(){switch_auth_blocks(new Array("sign_in","sign_up"))});$("#a_layer .a_close").live("click",function(){close_auth_layer();if($("#a_layer .sign_in").is(":visible")){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister Close"])}else{if($("#a_layer .register").is(":visible")){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Close"])}else{if($("#a_layer .activ").is(":visible")){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Activation","Activation Close"])}else{if($("#a_layer .a_blocked").is(":visible")){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister Banned","Banned Close"])}}}}});$("a.auth_sign_up").live("click",function(){if(!user_id){show_auth_layer_on_registration();return false}});$("a.auth_sign_in").live("click",function(){if(!user_id){prepare_auth_layer();callback_name="";if($(this).hasClass("auth_continue")){callback_name="redirect_after_login";auth_callback_params.push($(this).attr("href"))}show_auth_layer(callback_name);return false}});$("#a_layer .a_block.activ .create").live("click",function(){send_auth_email_to_user("emailcode",$("#a_layer .a_block.activ input[name=email]").val(),"http://www."+main_server_name+"/forum/register.php",auth_msg.activ_mail_sended)});$("#a_layer .a_block.forgot .create").live("click",function(){send_auth_email_to_user("emailpassword",$("#a_layer .a_block.forgot input[name=email]").val(),"http://www."+main_server_name+"/forum/login.php",auth_msg.reset_pass)});$("#a_layer .sign_in input").live("focus",function(){if($("#a_layer .a_block.forgot").is(":visible")){switch_auth_blocks(new Array("sign_in","sign_up"))}});$("#a_layer .a_block.forgot input").live("focus",function(){if($("#a_layer .a_block.sign").is(":visible")){show_forgot_password()}});$("#check").live("change",function(){if($(this).is(":checked")){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Subscribe On"])}else{_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Subscribe Off"])}});$("#a_layer .a_block.create_username .create").live("click",function(){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister ChangeUsername","SignIn Click"]);auth_input_validate($("#a_layer .a_block.create_username input[name=username]"));if(($("#a_layer .a_msg").css("display")=="none")||($("#a_layer .a_msg").hasClass("success"))){var a=$("#a_layer .a_block.create_username input[name=username]").val();var b="http://"+main_server_name+"/"+$("#a_layer .a_block.create_username").attr("data")+"?service&again=1&custom_username="+a;social_auth_for_change_username=window.open(b,"ug_auth_popup","width=350px,height=350px,left=500px,top=500px,resizable=yes,scrollbars=no,toolbar=no,menubar=no,location=no,directories=no,status=yes");social_auth_for_change_username.focus()}})});function auth_input_validate(g,b){if(b||(g.parents(".a_block").is(":visible"))){var f=g.attr("name");switch(f){case"username":var d="l";if($("#a_layer .a_block.create_username").is(":visible")){d="r"}if(g.val().length==0){show_auth_message("error",d,f.charAt(0).toUpperCase()+f.slice(1)+auth_msg.verify_empty,f)}else{if((g.val().length<=3)&&($("#a_layer .a_block.sign_in").css("display")=="none")){show_auth_message("error",d,auth_msg.verify_username,f)}else{if($("#a_layer .a_block.register").is(":visible")||$("#a_layer .a_block.create_username").is(":visible")){var c=/^[a-zA-Z0-9_-]+$/;if(!c.test(g.val())){show_auth_message("error",d,auth_msg.verify_not_allowed_symbols,f)}else{check_exist_user_by_param(f,g.val(),d)}}else{remove_auth_msg(f)}}}break;case"capcha":if(g.val().length==0){show_auth_message("error","r","Text from image"+auth_msg.verify_empty,f)}else{if(g.val().length!=6){show_auth_message("error","r",auth_msg.verify_capcha,f)}else{remove_auth_msg(f)}}break;case"email":var e=/^[a-z][a-z0-9_\.\-]*@[a-z0-9\.\-]+\.[a-z]{2,4}$/i;var a=g.val();if(g.val().length==0){show_auth_message("error",g.parents(".a_block.register").is(":visible")?"l":"r",f.charAt(0).toUpperCase()+f.slice(1)+auth_msg.verify_empty,f)}else{if(!e.test(a)){show_auth_message("error",g.parents(".a_block.register").is(":visible")?"l":"r",auth_msg.verify_email,f)}else{if($("#a_layer .a_block.register").is(":visible")){check_exist_user_by_param(f,g.val(),"l")}else{remove_auth_msg(f)}}}break;case"pass":if(g.val().length==0){show_auth_message("error","l","Password"+auth_msg.verify_empty,f)}else{remove_auth_msg(f)}break}}}$(function(){$("#a_layer input[name=username]").live("focusout",function(){auth_input_validate($(this),false)});$("#a_layer input[name=capcha]").live("focusout",function(){auth_input_validate($(this),false)});$("#a_layer input[name=email]").live("focusout",function(){auth_input_validate($(this),false)});$("#a_layer input[name=pass]").live("focusout",function(){auth_input_validate($(this),false)});$("#a_layer form").live("submit",function(){if($("#a_layer .a_block.sign_in").css("display")!="none"){switch_auth_blocks(new Array("sign_in","sign_up"),true)}$("#a_layer .a_block:visible input").each(function(){auth_input_validate($(this))});if(($("#a_layer .a_msg").css("display")=="none")||($("#a_layer .a_msg").hasClass("success"))){remove_all_auth_messages();if($("#a_layer .a_block.sign_in").css("display")!="none"){var d="http://www."+main_server_name+"/forum/login.php";var a=hex_md5($("#a_layer .a_block.sign_in input[name=pass]").val());var e=$("#a_layer .a_block.sign_in input[name=username]").val();var c={"do":"login",union_reg:"true",response_format:"jsonp",forceredirect:0,cookieuser:1,vb_login_md5password:a,vb_login_md5password_utf:a,vb_login_username:e}}else{if($("#a_layer .a_block.register").css("display")!="none"){var d="http://www."+main_server_name+"/forum/register.php";var b=$("#a_layer .a_block.register input[name=pass]").val();var a=hex_md5(b);var c={plus:"true",union_reg:"true",s:"","do":"addmember",url:"",agree:"1",is_forum:"2",password_md5:a,passwordconfirm_md5:a,username:$("#a_layer .a_block.register input[name=username]").val(),password:b,passwordconfirm:b,email:$("#a_layer .a_block.register input[name=email]").val(),old:"1",imagehash:auth_imagehash,imagestamp:$("#a_layer .a_block.register input[name=capcha]").val()}}}$.jsonp({url:d,callbackParameter:"callback",data:c,timeout:40000,success:function(f){if($("#a_layer .a_block.sign_in").css("display")!="none"){if(f.result=="error"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister SignIn False"]);show_auth_layer(auth_callback_function);error_message=f.error;if(error_message.match(/^You have entered an invalid username or password/)){show_auth_message("error","l",auth_msg.verify_sign_in,"pass")}else{if(f.error=="user_not_found"){show_auth_message("error","l",auth_msg.verify_user_not_exist,"username")}else{show_auth_message("error","l",error_message,"all")}}}else{switch(f.user_status){case"not_activated":show_auth_layer_for_non_activ_users();break;case"blocked":show_auth_layer_for_blocked_users();break;default:_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignIn","LoginRegister SignIn"]);auth_on_sign_in();break}}}else{if($("#a_layer .a_block.register").css("display")!="none"){if(f.result=="error"){_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Join False"]);for(i in f.info){switch(i){case"10":case"20":case"60":case"90":case"100":case"150":case"160":show_auth_message("error","l","Username"+auth_msg.verify_user_exist,"username");break;case"30":case"40":case"50":show_auth_message("error","l",auth_msg.verify_email,"email");break;case"140":show_auth_message("error","r",auth_msg.verify_capcha,"capcha");break;case"300":case"310":close_auth_layer();break}}}else{$("#a_layer .a_block.activ input[name=email]").val(f.info.email).removeClass(".a_ph");_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SignUp","SignUp Join"]);if(!auth_callback_need_activ){auth_on_sign_in()}else{switch_auth_blocks(new Array("register_success","activ"));auth_fill_user_info()}}}}},error:function(){show_auth_message("error","l",auth_msg.something_happens,"username")}})}else{$("#a_layer").show()}return false})});var auth_html='\n<div id="a_layer" style="display: none;">\n<div class="shtorki"></div>\n    <form action="" method="post" class="a_window">\n        <div class="a_close">&times;</div>\n        <div class="a_block sign_in">\n            <div class="a_line"></div>\n            <h2>Sign in</h2>\n            <input type="text" name="username" maxlength="15" placeholder="Username" >\n            <input type="password" name="pass" maxlength="25" placeholder="Password">\n            <span>Forgot password?</span>\n            <input type="submit" value="Sign in" class="sign">\n            <div class="soc_login">\n                <a href="http://www.ultimate-guitar.com/auth/login/facebook" class="fb auth_s"><i><b></b></i>Sign in with Facebook</a>\n                <a href="http://www.ultimate-guitar.com/auth/login/google" class="gplus auth_g auth_s"><i><b></b></i>Sign in with Google</a>\n                <p class="cb">Don\'t worry, we won\'t post anything without asking.</p>\n                <div></div>\n                <span>or</span>\n            </div>\n        </div>\n        <div class="a_block sign_up">\n            <h2>Join Ultimate Guitar</h2>\n            <p>You\'re just two steps away from<br>getting access to all the awesome<br>features of Ultimate-Guitar.com</p>\n            <input type="button" value="Join Ultimate Guitar" class="create">\n        </div>\n        <div class="a_block forgot" style="display: none;">\n            <h2>Forgot password?</h2>\n            <p>Enter the email address you used<br> when joining and we\'ll send you<br> the instructions to reset your password.</p>\n            <input type="text" name="email" maxlength="50"  placeholder="Email">\n            <input type="button" value="Send reset instruction" class="create">\n        </div>\n        <div class="a_block register"  style="display: none;">\n            <div class="back">&larr;&nbsp;<span>back</span></div>\n            <div class="a_line"></div>\n            <h2>Sign up</h2>\n            <input type="text" name="username" maxlength="15" placeholder="Username">\n            <input type="text" name="email"  maxlength="50"  placeholder="Email">\n            <input type="checkbox" name="check" id="check"><label for="check" class="a_check">Subscribe to UG Weekly Newsletter</label>\n            <input type="password" name="pass" maxlength="25"  placeholder="Password">\n            <span class="shw_pswd">display password</span>\n        </div>\n        <div class="a_block register"  style="display: none;">\n            <span class="a_capcha">Refresh image</span>\n            <img alt="Registration Image" id="regimage" src="">\n            <input type="text" name="capcha" maxlength="15" placeholder="Enter text from the picture">\n            <input type="submit" value="Join Ultimate Guitar" class="create">\n            <p>By clicking Join you agree<br>to the <a href="http://www.ultimate-guitar.com/about/tos.htm" target="_blank">Terms Of Service</a></p>\n        </div>\n        <div class="a_block register_success"  style="display: none;">\n            <span></span>\n            <div><h2>Thank You!</h2><br>Registration<br> almost completed</div>\n            <p>A confirmation email has been sent.<br>Please check your inbox now and <br>follow the instructions provided in <br>the email.</p>\n        </div>\n        <div class="a_block activ_none" style="display: none;">\n            <span></span>\n            <div><h2>Clank!</h2><br>Your account has<br> not been activated.</div>\n        </div>\n        <div class="a_block activ"  style="display: none;">\n            <div class="a_line"></div>\n            <h2>Account activation</h2>\n            <p>If you haven\'t received activation <br>email, please use form below.</p>\n            <b style="display: none">Enter your email below,<br> to receive account activation instruction.</b>\n            <input type="text" name="email" maxlength="50" placeholder="Email">\n            <input type="button" value="Resend activation email" class="create">\n        </div>\n        <div class="a_block username_exist" style="display: none;">\n            <span></span>\n            <div><h2>Oops!</h2><br><font></font> username<br>is already in use.</div>\n        </div>\n        <div class="a_block create_username" style="display: none;" data="">\n            <div class="a_line"></div>\n            <div class="ov-h cont_ico_t"><div class="log_ico f-left" style="display: none;"><span></span></div><p>Please enter a different username to complete sign in proccess.</p></div>\n            <div>\n                <input type="text" name="username" maxlength="50" placeholder="New username">\n                <input type="button" value="Sign in" class="create">\n            </div>\n        </div>\n        <div class="a_blocked" style="display: none;">\n            <span class="angry"></span>\n            <div><h2>Clank!</h2><br>Your account<br>is blocked!</div>\n        </div>\n        <div class="a_msg" style="display: none;">\n            <ul class="l">\n            </ul>\n            <ul class="r">\n            </ul>\n        </div>\n    </form>\n</div>';document.domain=main_server_name;var social_auth_popup_width=450;var social_auth_popup_height=380;var social_auth_popup;$(function(){$("a.auth_s").live("click",function(){var b="Facebook";if($(this).attr("class")=="auth_g"){b="Google"}var f="PopUp ";if($(this).parent().attr("class")=="s_up"){f="Header "}_gaq.push(["_trackEvent","LoginRegister PopUp","LoginRegister SocialNetworks",f+b+" Button Click"]);if(social_auth_popup!==undefined){social_auth_popup.close()}var d,c=d=this.href;c+=c.indexOf("?")>=0?"&":"?";if(c.indexOf("redirect_uri=")===-1){c+="redirect_uri="+encodeURIComponent(d)+"&"}c+="return_url="+document.URL+"&";c+="js";var e=(window.screen.width-social_auth_popup_width)/2,a=(window.screen.height-social_auth_popup_height)/2;social_auth_popup=window.open(c,"ug_auth_popup","width="+social_auth_popup_width+",height="+social_auth_popup_height+",left="+e+",top="+a+",resizable=yes,scrollbars=no,toolbar=no,menubar=no,location=no,directories=no,status=yes");social_auth_popup.focus();return false})});