create table if not exists chapter(
  ch_id integer not null auto_increment,
  ic_id int(10) unsigned not null,
  title varchar(100) not null,
  seq_no integer not null,
  primary key(ch_id),
  foreign key(ic_id) references instructorcourserecord(ic_id)
  on delete restrict on update cascade);
  
  create table if not exists lecture(
  lect_id int not null auto_increment,
  ch_id int not null,
  tittle varchar(100) not null,
  seq_no integer not null,
  primary key(lect_id),
  foreign key(ch_id) references chapter(ch_id)
  on delete restrict on update cascade);
  
  create table if not exists lect_mat(
  lectmat_id int not null auto_increment,
  lect_id int not null,
  file_url varchar(100) not null,
  file_type varchar(45) not null,
  primary key(lectmat_id),
  foreign key(lect_id) references lecture(lect_id)
  on delete restrict on update cascade);
