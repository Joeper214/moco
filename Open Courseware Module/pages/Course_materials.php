<?php
   $title = "Introduction to Algorithms";
   $course_mat=array(
		     array("title"=>"Week 1",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/PDF.bmp"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/Audio.bmp"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/Video.bmp"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/Rar.bmp"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           ),
                      array("title"=>"Week 2",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/word.bmp"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/PPT.bmp"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/word.bmp"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/word.bmp"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           ),
                      array("title"=>"Week 3",
			   "lect"=>array(array("title"=>"Lecture 1",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/Video.bmp"
							          ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/Video.bmp"
                                                                  )
                                                            )
					       ),
                                        array("title"=>"Lecture 2",
                                               "mat"=>array(array("url"=>"url",
                                                                  "ftype"=>"../../images/Video.bmp"
							         ),
                                                            array("url"=>"url",
                                                                  "ftype"=>"../../images/Video.bmp"
                                                                 )
                                                           )
					      )
                                        
                                        )
                           )
               );
 

   //header
   include "../templates/header.php"; 
   //banner
   include "../templates/moco_banner.php";
   //title
  
   //side banner
   //content
   include "../components/course_mat_content.php";
   //footer
?>
      <div id='popup_background'></div>
     </center>
   </body>
</html>
