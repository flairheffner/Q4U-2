/*
SQLyog Community Edition- MySQL GUI v5.22a
Host - 5.5.5-10.1.31-MariaDB : Database - appointmentdb
*********************************************************************
Server version : 5.5.5-10.1.31-MariaDB
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `appointmentdb`;

USE `appointmentdb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `booking_id` int(4) NOT NULL AUTO_INCREMENT,
  `health_issue` varchar(20) NOT NULL,
  `preferred_time` varchar(20) NOT NULL,
  `doc_speciality` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `patient_id` varchar(13) NOT NULL,
  `doc_id` varchar(13) NOT NULL,
  `appointment_status` varchar(50) NOT NULL,
  PRIMARY KEY (`booking_id`,`patient_id`,`doc_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  KEY `FK_appointment_patient` (`patient_id`),
  KEY `FK_appointment_doctor` (`doc_id`),
  KEY `FK_appointment_Speciality` (`doc_speciality`),
  KEY `FK_appointment_timeSlot` (`preferred_time`),
  CONSTRAINT `FK_appointment_doctor` FOREIGN KEY (`doc_id`) REFERENCES `tbldoctor` (`doc_id`),
  CONSTRAINT `FK_appointment_patient` FOREIGN KEY (`patient_id`) REFERENCES `tblpatient` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `appointment` */

insert  into `appointment`(`booking_id`,`health_issue`,`preferred_time`,`doc_speciality`,`date`,`patient_id`,`doc_id`,`appointment_status`) values (1,'Physical Check-up','09:00AM','Physical Check-up','2021-06-01 00:00:00','7801203131089','8510305231088','Submitted'),(2,'Physical Check-up','11:00AM','Physical Check-up','2021-06-03 00:00:00','7801203131089','8510305231088','Submitted'),(3,'Physical Check-up','11:00AM','Physical Check-up','2021-06-02 00:00:00','7801203131089','8510305231088','Submitted');

/*Table structure for table `tbldoctor` */

DROP TABLE IF EXISTS `tbldoctor`;

CREATE TABLE `tbldoctor` (
  `doc_id` varchar(13) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `FK_tbldoctor_timeslot` (`contact`),
  KEY `FK_tbldoctor_specialisation` (`speciality`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbldoctor` */

insert  into `tbldoctor`(`doc_id`,`fname`,`lname`,`gender`,`contact`,`email`,`speciality`) values ('8510305231088','Smith','Bedalf','Male','0856987456','Doctor@gmail.com','Physical Check-up');

/*Table structure for table `tblpatient` */

DROP TABLE IF EXISTS `tblpatient`;

CREATE TABLE `tblpatient` (
  `patient_id` varchar(13) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` varchar(4) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Area` varchar(100) NOT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblpatient` */

insert  into `tblpatient`(`patient_id`,`fname`,`lname`,`gender`,`age`,`contact`,`email`,`Area`) values ('7801203131089','Veliswa','Zwambe','Female','43','0856987456','Patient@gmail.com','Ackerville'),('8510305231088','Xolelwa','Xozi','Male','36','0846987457','xolani@gmail.com','Tasbet');

/*Table structure for table `tblspecialisation` */

DROP TABLE IF EXISTS `tblspecialisation`;

CREATE TABLE `tblspecialisation` (
  `specialisation` varchar(100) NOT NULL,
  PRIMARY KEY (`specialisation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblspecialisation` */

/*Table structure for table `tbltimeslot` */

DROP TABLE IF EXISTS `tbltimeslot`;

CREATE TABLE `tbltimeslot` (
  `time_id` int(4) NOT NULL AUTO_INCREMENT,
  `range` varchar(20) NOT NULL,
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbltimeslot` */

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tbluser` */

insert  into `tbluser`(`user_id`,`username`,`password`,`type`) values (1,'test@gmail.com','Test4586*','Patient'),(2,'xolani@gmail.com','Xola123*','Patient'),(3,'Doctor@gmail.com','Doctor123*','Doctor'),(4,'Patient@gmail.com','Patient123*','Patient');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
