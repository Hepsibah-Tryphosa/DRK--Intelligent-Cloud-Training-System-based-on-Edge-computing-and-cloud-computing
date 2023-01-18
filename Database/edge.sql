/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - blockchain
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `blockchain`;

USE `blockchain`;

/*Table structure for table `datafiles` */

DROP TABLE IF EXISTS `datafiles`;

CREATE TABLE `datafiles` (
  `dataid` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `attributename` varchar(50) NOT NULL,
  `cloudname` varchar(50) NOT NULL,
  `mackey` varchar(50) NOT NULL,
  `cipherdata` longblob NOT NULL,
  `cdate` date NOT NULL,
  `forwardstatus` varchar(50) default 'waiting',
  PRIMARY KEY  (`dataid`),
  UNIQUE KEY `mackey` (`mackey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `datafiles` */

insert into `datafiles` values 
(1,'Meghana','meghana.datapoint@gmail.com','data','data','edge','L5rjv5e8myVXccfj4difrE3rPA48gK3XBYGIILnRN','sEdelMU0TucL0OjjEYUGcyu3MLB1g4hdb0QF1Kwt/UQzzWumuj07wf1xMuhQNH/XhLrbKhgZV94RB6y0+ulT3kmW3Kb9/V4bOJjifrWi+H5NySF0o5qXh7xqXvp5mZ15XoSIsPQkke1FWtRib0KIvyfCGZxzKHK7bLMmuf1pX01MhZ4228idkQ7qd+hxHvAtSI2fl8COK9XiACh0AvbG2EjeB+buiYwztoz1NKVFAbPhttt57uerwkA3ZY2Qqd1EBOZ9pON5umuwURSXoYXbolZuPkz64kcooo/J8eEqDPm4aQrPu3INk/B8ebP9KnoW6zyMPtkAQYqtwV3NlyHlsYUF+d3jTXJHrQDJBZ7meYbTTCZLVA3fiHEGuq2mQ9PT0AJt8DzXMrCkNKFvG+cQSg4e97K6ygZNd+HsDEfr4rkIssapeG/coIgtpC73RLEIEdsx61wtObHTZhlCLPO007nfpo94q6byixlJjuZc9oL4ZbtVLYcXU0srDjlkgk25en72nM1RxPkzfUCOe2AlXQTmfaTjebprxhmG3rbcJU91ewPQ0q+zbOgB0KJRFSTnuGkKz7tyDZO/bFfceEBD7x2zEXGZbhTW6WnIogn0u5EQPgQ7MYUTgQpOGhI9xp3UPrlK0OTTK2XJzsWp7mlq4FNtIscK0aWGrcXXh3rz8dOBeuPuhUZW9s+RvNvJ713xuoKFhp1CVTcN6J0l0H+EC70+xUxz595qo4YyfpwpgFwF1flBstJwgyGD83R2b6kkCUKbOBlO3b/8CL/1L2/hFeSk8acYf6xwBOZ9pON5umtxuLbiPBr8z6/owA+YCvgnVW6gZAeJAVI5FKhC7kAfQ36rF5D5spAPpIrnNCNce15MiH+9zXxGpK+6vysAZ3/TzvCMjZdAJYJtUP09d6dX2T0XZacidG4qJxupFIJxhMr3UUdkH8M3AxsWM7LuaumRKnSCxK7sxuGbTSLVFse3Uwe7ur0ZklQ0nqQWBVUBfa52g2IhpNGtpzKeoCoIUqgfc6F/ssvnpB+8Ef+b6YFVvDQ+NstSf8G+lErUBaIUmODNeRwoR6dtPaSK5zQjXHteTIh/vc18RqRY7EeP6N5nTZQpT83A76YCshutvnu8bpyvwuchKd7htpjV0uW084EU1utpikNUIzkDdcYs3BEmADuITiHuH9RpUY6frbcjGnaOYWDHuWYfauWgYTBzDa8Jbck7rAC1D3nFbjohA6OI3GSymiRmmQIIdOs5i2IPyD58YLpEHBY28Q==','2021-02-05','forwarded'),
(2,'Meghana','meghana.datapoint@gmail.com','test','test','edge','vOrTgTh9vb5jgGoi3rvzBzXn3eCORWSCJP1bdb44j','Z28huDI3HDE8J1vyfpQ6mmYPn0acbrt5tMaKp3qEuSZ1EixXCIcUGL/HMxhch/jgbjr2H2TlOgymkP4CV+6iDGNbWO8YaHHdV+6rzj1xy4s=','2021-02-05','waiting');

/*Table structure for table `filerequest` */

DROP TABLE IF EXISTS `filerequest`;

CREATE TABLE `filerequest` (
  `id` int(11) NOT NULL auto_increment,
  `fileid` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `cloudname` varchar(80) NOT NULL,
  `filename` varchar(80) NOT NULL,
  `rdate` date NOT NULL,
  `status` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `filerequest` */

insert into `filerequest` values 
(1,'1','Meghana','edge','data','2021-02-05','Permitted'),
(2,'1','Meghana','edge','data','2021-02-05','waiting');

/*Table structure for table `ownerregister` */

DROP TABLE IF EXISTS `ownerregister`;

CREATE TABLE `ownerregister` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phoneno` varchar(45) NOT NULL,
  `one_key` varchar(45) default NULL,
  PRIMARY KEY  (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ownerregister` */

insert into `ownerregister` values 
('Meghana','Meghana','123','meghana.datapoint@gmail.com','9874563214','4015');

/*Table structure for table `userregister` */

DROP TABLE IF EXISTS `userregister`;

CREATE TABLE `userregister` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `phoneno` varchar(45) NOT NULL,
  `one_key` varchar(45) default NULL,
  PRIMARY KEY  (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userregister` */

insert into `userregister` values 
('Nandana','Nandana','123','meghana.datapoint@gmail.com','9874563214','6804');
