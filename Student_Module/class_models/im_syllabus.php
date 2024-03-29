<?php

require_once '../../libraries/proj_abs_cls/syllabus.php';
require_once '../../libraries/php/sanitizer.php';

class IMSyllabus extends Syllabus{

  /******chapter functions*************/
  public function showEditChapter(){
    $params = array(sanitize($_POST['chapter']), $_POST['ch_id']);
    if($this->hasDupBeforeUpdate($params[1], $params[0])){
      echo 'err';
    }else{
      $this->editChapter($params);
      echo $params[0];
    }
  }
  
  public function addChapter(){
    $params = array($_POST['icr_id'],
                    sanitize($_POST['chapter']),
                    $_POST['ch_count']);

    $this->query = "INSERT INTO chapter
                    (ic_id, title, seq_no)
                    VALUES(?,?,?)";
    return $this->db_connector->insert($this->query, $params);
  }

  public function editChapter($params){

    $this->query = "UPDATE chapter SET
                   title=?
                   WHERE ch_id=?";

    return $this->db_connector->update($this->query, $params);
  }
  
  public function hasDuplicate($title, $icr_id){
    $this->query = "SELECT COUNT(*) FROM chapter
                    WHERE title='$title'
                    AND ic_id=$icr_id";

    return $this->db_connector->doesExist($this->query);
  }

  

  /*******public functions for lectures************/
  //lecture materials

  public function addMaterial(){
    /* this function upload a lecture material
     * and insert its info to the databse
     */

    if($this->uploadMaterial()){//uploading
      $file_info = pathinfo($_FILES['file_url']['name']);
  
      $q_params = array(
                    $_POST['lecture'],
                    $_FILES['file_url']['name'],
		    $file_info['extension']
                  );
    
      $this->query = "INSERT INTO lect_mat(lect_id, file_url,file_type)
                     VALUES(?,?,?)"; 

      $this->db_connector->insert($this->query, $q_params);
      return true;
    }else{
      return false;
    }
  }

  public function getNewploadMaterial(){
    $this->query = "SELECT * FROM lect_mat
                   WHERE lectmat_id=(
                       SELECT MAX(lectmat_id)
                       FROM lect_mat)";
    return $this->db_connector->selectAll($this->query)->fetch();
  }
  
  private function uploadMaterial(){
    require_once '../../libraries/php/file_upload_download.php';
    $base_dir = "../../lecture_media_storage/";
 
    $fud = new FileUploadDownload();

    if($fud->isValidFileType('file_url')){
      $fud->uploadFile($base_dir, 'file_url'); 
      return  true;
    }else{
      return false;
    }
  }

  //lecture materials
  public function getLectureMat($lect_id){
    $this->query = "SELECT * FROM lect_mat
                    WHERE lect_id=$lect_id";
    
    return $this->db_connector->selectAll($this->query)->fetchAll();
  }
 
  public function getNewLecture(){
    $this->query = "SELECT * FROM lecture
                    WHERE lect_id=(
                          SELECT MAX(lect_id)
                          FROM lecture
                          )";
    return $this->db_connector->selectAll($this->query)->fetch();
  }

  
  public function addLecture(){
    $q_params = array($_POST['title'], $_POST['chapter_id']);
    $this->query = "INSERT INTO lecture(tittle, ch_id)
                    VALUES(?,?)
                    ";
    $this->db_connector->insert($this->query, $q_params);
  }

  private function updateLecture(){
    $q_params = array($_POST['title'], $_POST['chapter_id'], $_POST['lecture_id']);
    $this->query = "UPDATE lecture SET 
                    title=?,
                    ch_id=?
                    WHERE lecture_id=?";
    $this->db_connector->update($this->query, $q_params);
  }

  //chapters
  

  public function hasDupBeforeUpdate($id,$title){
    $this->query = "SELECT COUNT(*) FROM chapter
                    WHERE title='$title'
                    AND ch_id<>$id";
    return $this->db_connector->doesExist($this->query);
  }

  public function getNewChapter(){
    $this->query = "SELECT * FROM chapter
                    WHERE ch_id=(SELECT MAX(ch_id)
                    FROM chapter)";
    return $this->db_connector->selectAll($this->query)->fetch();
  }

}
?>              