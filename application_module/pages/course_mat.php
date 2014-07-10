<?php
   $title = "Introduction to Algorithms";
   $course_mat=array(
		     array("title"=>"Week 1",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           ),
                      array("title"=>"Week 2",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           ),
                      array("title"=>"Week 3",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"pdf"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"word"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           )
               );
 

   //header
   include "../template/header.php"; 
   //banner
   include "../template/moco_banner.php";
   //title
   include "../template/c_title.php";
   //side banner
  
   //content
   include "components/course_mat_content.php";
   //footer
?>
      <div id='popup_background'></div>
     </center>
   </body>
</html>
