CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (2,1975,'2017-12-13','Card Payment','P'),(3,3035,'2017-12-13','Card Payment','P'),(4,2421.35,'2017-12-13','Card Payment','P'),(5,2455,'2017-12-13','Card Payment','P'),(6,2525,'2017-12-13','Card Payment','P'),(7,1653,'2017-12-13','Card Payment','P'),(8,1500,'2017-12-12','Card Payment','P'),(9,1500,'2017-12-06','Card Payment','P'),(10,500,'2017-12-13','Cash Payment','P');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger onDelete
after delete on bill
for each row
begin
insert into completedBill values(Old.CustomerID,Old.totalAmount,'Completed');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `cancelledreservation`
--

LOCK TABLES `cancelledreservation` WRITE;
/*!40000 ALTER TABLE `cancelledreservation` DISABLE KEYS */;
INSERT INTO `cancelledreservation` VALUES (1,'1'),(5,'1'),(10,'8'),(15,'11');
/*!40000 ALTER TABLE `cancelledreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `completedbill`
--

LOCK TABLES `completedbill` WRITE;
/*!40000 ALTER TABLE `completedbill` DISABLE KEYS */;
INSERT INTO `completedbill` VALUES (1,3882,'Completed');
/*!40000 ALTER TABLE `completedbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (0,NULL,'',NULL,NULL,NULL,NULL),(1,'Aashrith','Chilkepalli','Chennai','India','aashrith95@gmail.com',9196496534),(2,'Anand','Ganesh','Bangalore','India','anandganesh@gmail.com',23232232323232),(3,'Dinesh','Maria','Vizag','India','dinesh@gmail.com',23232323),(4,'balu','ganesh','rajamundry','India','baluganesh@gmail.com',12323232),(5,'sumanth','Tippa','kodai','Qatar','SumanthTippa@gmail.com',2323223),(6,'karan','mailk','delhi','dubai','karan@gmail.com',91127121),(7,'varun','verma','bangalore','India','varun@gmail.com',121212),(8,'sumanth krishna','singh','varanasi','Dubai','sumanth@gmail.com',23232322),(9,'Bob','prasad','pune','South Korea','bob@gmail.com',12121212),(10,'Tom','reddy','Delhi','North Korea','tom@gmail.com',1212323),(11,'Pramod','Nagare','Delhi','Taiwan','pramod@gmail.com',12121212);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_allotted_room`
--

LOCK TABLES `customer_allotted_room` WRITE;
/*!40000 ALTER TABLE `customer_allotted_room` DISABLE KEYS */;
INSERT INTO `customer_allotted_room` VALUES (1,101,'2017-12-12','2017-12-13',1200),(2,103,'2017-12-12','2017-12-13',1200),(3,106,'2017-12-12','2017-12-13',1200),(4,108,'2017-12-12','2017-12-13',1200),(5,110,'2017-12-12','2017-12-13',1200),(6,203,'2017-12-12','2017-12-13',1500),(7,205,'2017-12-12','2017-12-13',1500),(9,206,'2017-12-05','2017-12-06',1500),(10,201,'2017-12-12','2017-12-13',500);
/*!40000 ALTER TABLE `customer_allotted_room` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_customer_allotted
after insert on customer_allotted_room
for each row begin
set @amount:= NEW.TotalPrice;
if @amount > 1000
then 
Update room 
set status = 'N'
where NEW.Room_RoomID = RoomID;
insert into bill values(NEW.Customer_CustomerID,NEW.TotalPrice,NEW.Checkout_Date,'Card Payment');
elseif @amount < 1000
then 
Update room 
set status = 'N'
where NEW.Room_RoomID = RoomID;
insert into bill values(NEW.Customer_CustomerID,NEW.TotalPrice,NEW.Checkout_Date,'Cash Payment');
end if;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `customer_gets_roomservice`
--

LOCK TABLES `customer_gets_roomservice` WRITE;
/*!40000 ALTER TABLE `customer_gets_roomservice` DISABLE KEYS */;
INSERT INTO `customer_gets_roomservice` VALUES (1,3,5,'2017-12-12',76.5,'08:00:00'),(4,3,5,'2017-12-12',76.35,'08:00:00'),(8,3,5,'2017-12-12',76.5,'08:00:00');
/*!40000 ALTER TABLE `customer_gets_roomservice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger customer_gets_RS
after insert on customer_gets_roomservice
for each row
 begin
update bill 
set bill.totalamount = bill.totalamount + NEW.RoomServiceCost
 where bill.customerID = (NEW.Customer_CustomerID);
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `customer_has_emergency`
--

LOCK TABLES `customer_has_emergency` WRITE;
/*!40000 ALTER TABLE `customer_has_emergency` DISABLE KEYS */;
INSERT INTO `customer_has_emergency` VALUES (1,1,'2017-08-08',500),(2,2,'2017-08-18',2500),(3,3,'2017-08-28',1500),(4,2,'2017-08-08',2500);
/*!40000 ALTER TABLE `customer_has_emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_orders_food`
--

LOCK TABLES `customer_orders_food` WRITE;
/*!40000 ALTER TABLE `customer_orders_food` DISABLE KEYS */;
INSERT INTO `customer_orders_food` VALUES (1,1,1,'2017-12-12','20:00:00',4),(2,2,2,'2017-12-12','21:00:00',4),(3,3,1,'2017-12-12','22:00:00',3),(4,4,4,'2017-12-12','20:00:00',3),(5,3,5,'2017-12-12','23:00:00',4),(6,6,6,'2017-12-12','20:00:00',4);
/*!40000 ALTER TABLE `customer_orders_food` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Customer_orders_food
after insert on customer_orders_food
for each row begin
set @ID := NEW.Food_ProductID;
set @price := (select productPrice from food where productID = @ID);
update bill 
set bill.totalamount = bill.totalamount + NEW.Quantity*@price
 where bill.customerID = (NEW.Customer_CustomerID);
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `customer_uses_facility`
--

LOCK TABLES `customer_uses_facility` WRITE;
/*!40000 ALTER TABLE `customer_uses_facility` DISABLE KEYS */;
INSERT INTO `customer_uses_facility` VALUES (1,4,'2017-12-12','17:35:35'),(1,5,'2017-12-12','00:20:17'),(5,3,'2017-12-12','19:35:35'),(6,2,'2017-12-11','15:35:35'),(7,5,'2017-12-11','13:35:35'),(7,7,'2017-12-11','13:35:35');
/*!40000 ALTER TABLE `customer_uses_facility` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger customer_uses_Facilityy
after insert on customer_uses_facility
for each row
 begin
 set @ID := NEW.facility_facilityID;
 set @price := (select rate from facility where FacilityID = @ID);
update bill 
set bill.totalamount = bill.totalamount + @price
 where bill.customerID = (NEW.Customer_CustomerID);
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `customer_visit_restaurant`
--

LOCK TABLES `customer_visit_restaurant` WRITE;
/*!40000 ALTER TABLE `customer_visit_restaurant` DISABLE KEYS */;
INSERT INTO `customer_visit_restaurant` VALUES (1,4,'2017-12-12',700,'5','15:00:00'),(3,2,'2017-12-12',530,'25','15:00:00'),(4,5,'2017-12-12',540,'52','15:00:00'),(5,3,'2017-12-12',550,'15','15:00:00');
/*!40000 ALTER TABLE `customer_visit_restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_visit_customer
after insert on customer_visit_restaurant
for each row begin
update bill 
set bill.totalamount = bill.totalamount + NEW.OrderPrice
 where bill.customerID = NEW.Customer_CustomerID;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,50,24,'Swimming'),(2,60,20,'WIFI'),(3,70,22,'Deluxe Swimming'),(4,80,23,'Spa'),(5,76,20,'Private Lawn'),(6,56,17,'Conference Room'),(7,77,18,'Conference Room 2'),(8,45,15,'Conference Room 3'),(9,77,12,'Driver'),(10,66,24,'Unlimited WIFI');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,150,'Appetizer','Samosa Chat'),(2,175,'Appetizer','MIXED Chat'),(3,125,'Appetizer','Bhel Chat'),(4,180,'Appetizer','Dahi Chat'),(5,200,'Appetizer','Cutlet Chat'),(6,225,'Appetizer','Sev Chat'),(7,245,'Appetizer','Pav Chat'),(8,245,'Main Course','Biriyani'),(9,145,'Main Course','Chicken Biriyani'),(10,175,'Main Course','MuttonBiriyani'),(11,545,'Main Course','prawn Biriyani'),(12,645,'Main Course','Biriyani'),(13,85,'Main Course','Naan'),(14,245,'Main Course','Chapathi'),(15,115,'Main Course','Noodles'),(16,115,'Main Course','Egg Noodles'),(17,105,'Main Course','Kurma'),(18,95,'Main Course','Fried Rice'),(19,225,'Main Course','Egg FriedRice'),(20,235,'Main Course','Manchuriya');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hasemergency`
--

LOCK TABLES `hasemergency` WRITE;
/*!40000 ALTER TABLE `hasemergency` DISABLE KEYS */;
/*!40000 ALTER TABLE `hasemergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hoteldepartment`
--

LOCK TABLES `hoteldepartment` WRITE;
/*!40000 ALTER TABLE `hoteldepartment` DISABLE KEYS */;
INSERT INTO `hoteldepartment` VALUES (1,'Cleaning'),(2,'Manager'),(3,'Reception'),(4,'Laundry'),(5,'Restaurant Manager'),(6,'Waiter'),(7,'Pool Buy'),(8,'Waiter'),(9,'Receptionist'),(10,'Washer');
/*!40000 ALTER TABLE `hoteldepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hotelemployee`
--

LOCK TABLES `hotelemployee` WRITE;
/*!40000 ALTER TABLE `hotelemployee` DISABLE KEYS */;
INSERT INTO `hotelemployee` VALUES (1,'Sameer123','Sameer','goel','sameer@gmail.com',1),(1,'pramod','asas','asa','asa',4),(2,'Varun123','varun','varma','varunvarma@gmail.com',2),(3,'Sathish','Sathish','prasad','sathish@gmail.com',1),(4,'Aravind','Mandapaka','Aravind','maravind@gmail.com',4),(5,'Rahul123','Rahul','Kamath','rahul@gmail.com',5),(6,'magesh123','magesh','sharma','magesh@gmail.com',6),(7,'deepan123','deepan','varma','deepan@gmail.com',7),(8,'sugan123','sugan','burma','sugan@gmail.com',8),(9,'pramod124','pramod','nagare','pramod@gmail.com',9),(10,'hrithik145','hrithik','roshan','hrithik@gmail.com',4),(11,'salman156','salman','salmankhan','salman@gmail.com',8);
/*!40000 ALTER TABLE `hotelemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `laundry`
--

LOCK TABLES `laundry` WRITE;
/*!40000 ALTER TABLE `laundry` DISABLE KEYS */;
INSERT INTO `laundry` VALUES (1,'4th Floor','2017-12-12',75,4,1),(2,'4th Floor','2017-12-12',75,4,2),(3,'3th Floor','2017-12-12',55,4,3),(4,'4th Floor','2017-12-12',65,4,4),(5,'5th Floor','2017-12-12',55,4,5),(6,'4th Floor','2017-12-12',65,4,6),(7,'1st Floor','2017-12-12',75,4,1),(9,'Chennai','2017-12-11',500,8,1);
/*!40000 ALTER TABLE `laundry` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_laundry_insertt
after insert on laundry
for each row begin
update bill 
set bill.totalamount = bill.totalamount + NEW.laundryCost
 where bill.customerID = NEW.customerID;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `medicalemergency`
--

LOCK TABLES `medicalemergency` WRITE;
/*!40000 ALTER TABLE `medicalemergency` DISABLE KEYS */;
INSERT INTO `medicalemergency` VALUES (1,'Fever',100),(2,'Heart Pain',101),(3,'Chest Pain',102),(4,'Breathing Issues',103),(5,'Stomach Pain ',104),(6,'Vision Issues',105),(7,'Ear issues',106),(8,'ASthma',107),(9,'Heart Attack',108),(10,'Cold',109);
/*!40000 ALTER TABLE `medicalemergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (15,11,104,'2017-07-07','2018-09-09');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_reserved
after insert on reservation
for each row begin 
set @roomID = new.Room_id;
set @status = (select status from room r inner join reservation rr on r.RoomID = @roomID);
if @status = 'N'
then 
signal sqlstate '02000' set message_text = 'Sorry room aldready occupied!!';
else
update room
set room.Status = 'N'
where room.RoomID = NEW.Room_ID;
end if;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger on_unreservedd
after delete on reservation
for each row begin 
insert into cancelledreservation values(OLD.ReservationID,OLD.CustomerID);
update room
set room.Status = 'Y'
where room.RoomID = OLD.Room_ID;
 END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Paradise','OMR',4.5,'08:15:00','21:15:00',2),(2,'Shanus','T Nagar',3,'08:15:00','22:00:00',3),(3,'Bombay','Velachery',4,'08:15:00','22:00:00',2),(4,'Sangeetha','Adyar',5,'08:15:00','22:00:00',4),(5,'Chutney','Avadi',3,'08:00:00','22:00:00',5),(6,'Absolute Barbecue','T Nagar',4,'09:00:00','23:00:00',6),(7,'RainTree','Velachery',3,'10:00:00','23:00:00',7),(8,'Hot Chips','Nungambakkam',2,'10:00:00','23:00:00',8),(9,'Aapa Kadai','Kelambakkam',4,'10:00:00','23:00:00',5),(10,'Barbecue Nation','Vadapalani',5,'10:00:00','23:00:00',7);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `restauranttype`
--

LOCK TABLES `restauranttype` WRITE;
/*!40000 ALTER TABLE `restauranttype` DISABLE KEYS */;
INSERT INTO `restauranttype` VALUES (1,'Continental'),(2,'Italian'),(3,'Asian'),(4,'Chinese'),(5,'Thai'),(6,'Greek'),(7,'Seafood'),(8,'German'),(9,'Barbecue'),(10,'Cafetaria');
/*!40000 ALTER TABLE `restauranttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'Single Bedroom',1200,'Ocean View','N'),(102,'Single Bedroom',1200,'Ocean View','N'),(103,'Single Bedroom',1200,'Ocean View','N'),(104,'Single Bedroom',1200,'Ocean View','N'),(105,'Single Bedroom',1200,'Ocean View','N'),(106,'Single Bedroom',1200,'Ocean View','N'),(107,'Single Bedroom',1200,'Ocean View','N'),(108,'Single Bedroom',1200,'Ocean View','N'),(109,'Single Bedroom',1200,'Ocean View','N'),(110,'Single Bedroom',1200,'Ocean View','N'),(111,'Single Bedroom',1200,'Ocean View','Y'),(112,'Single Bedroom',1200,'Ocean View','N'),(201,'Double Bedroom',1500,'Sun View','N'),(202,'Double Bedroom',1500,'Ocean View','N'),(203,'Double Bedroom',1500,'City View','N'),(204,'Double Bedroom',1500,'Ocean View','N'),(205,'Double Bedroom',1500,'Lake View','N'),(206,'Double Bedroom',1500,'Lake View','N'),(207,'Double Bedroom ',1850,'Suite','N');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roomservice`
--

LOCK TABLES `roomservice` WRITE;
/*!40000 ALTER TABLE `roomservice` DISABLE KEYS */;
INSERT INTO `roomservice` VALUES (1,'BedSheet Cleaning','08:00:00','23:00:00'),(2,'Bathroom Cleaning','08:00:00','23:00:00'),(3,'Dusting','08:00:00','23:00:00'),(4,'Private Masseuse','08:00:00','23:00:00'),(5,'Carpet Cleaning','10:00:00','22:00:00');
/*!40000 ALTER TABLE `roomservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_available_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_rooms`(IN room_type VARCHAR(50))
BEGIN
(
select * from Room where room.RoomType = room_type
and room.Status = 'Y'

);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_booked_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_booked_rooms`(IN room_type VARCHAR(50))
BEGIN
(
select * from Room where room.RoomType = room_type
and room.Status = 'N'

);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customers`(IN today_date date)
BEGIN
SELECT x.Customer_CustomerID,x.Room_RoomID,c.customer_firstName
 FROM customer_allotted_room x INNER JOIN Customer c 
 on x.customer_customerID = C.CustomerID
 WHERE
 x.checkout_date >= today_date AND x.checkin_date <= today_date ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_roomService_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_roomService_revenue`(IN today_date date)
BEGIN
(
 
select sum(RoomServiceCost) from customer_gets_roomservice
where customer_gets_roomservice.RoomServiceDate = today_date

);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moneyFromFacility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moneyFromFacility`(IN today_date date)
begin
 select sum(rate) as totalMoneyFromFacility from facility f
 inner join customer_uses_facility c
 on c.Facility_FacilityID = f.FacilityID
 where c.UseDate = today_date;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RoomServiceDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RoomServiceDetails`(IN today_date date)
begin
 select C.customer_FirstName,C.customer_lastName,E.EmployeeFirstName as 'Employee Handled',CR.RoomServiceDate,CR.RoomServiceDate,RS.RoomServiceDetails
 from customer_gets_roomservice CR 
 inner join Customer C 
 on C.CustomerID = CR.Customer_CustomerID
 inner join hotelemployee E 
 on CR.EmployeeID = E.EmployeeID
 inner join roomservice RS
 on CR.RoomService_RoomServiceID = RS.RoomServiceID
 where CR.RoomServiceDate = today_date;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `totalLaundryFromSingleDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `totalLaundryFromSingleDate`(IN date_given Date)
BEGIN
(
select sum(LaundryCost) from laundry
where laundryDate = date_given
 );
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14  3:29:09
