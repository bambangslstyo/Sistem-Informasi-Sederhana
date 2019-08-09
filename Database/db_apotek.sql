/*
Navicat MySQL Data Transfer

Source Server         : Bambang
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : db_apotek

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2016-07-05 06:44:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbdetailjual
-- ----------------------------
DROP TABLE IF EXISTS `tbdetailjual`;
CREATE TABLE `tbdetailjual` (
  `noTrans` varchar(12) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `nmObat` varchar(20) NOT NULL,
  KEY `noTrans` (`noTrans`),
  KEY `nmObat` (`nmObat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbdetailjual
-- ----------------------------
INSERT INTO `tbdetailjual` VALUES ('TR0307-01', '1', '13000', 'insto');
INSERT INTO `tbdetailjual` VALUES ('TR0307-02', '1', '8000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-03', '1', '7000', 'paracetamol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-04', '2', '26000', 'insto');
INSERT INTO `tbdetailjual` VALUES ('TR0307-05', '1', '8000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-06', '2', '16000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-07', '1', '8000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-08', '1', '7000', 'paracetamol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-09', '1', '13000', 'insto');
INSERT INTO `tbdetailjual` VALUES ('TR0307-10', '1', '8000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-011', '1', '8000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-012', '1', '13000', 'insto');
INSERT INTO `tbdetailjual` VALUES ('TR0307-012', '5', '40000', 'panadol');
INSERT INTO `tbdetailjual` VALUES ('TR0307-013', '2', '10000', 'paramex');
INSERT INTO `tbdetailjual` VALUES ('TR0307-014', '13', '169000', 'insto');

-- ----------------------------
-- Table structure for tbobat
-- ----------------------------
DROP TABLE IF EXISTS `tbobat`;
CREATE TABLE `tbobat` (
  `idObat` int(11) NOT NULL auto_increment,
  `nmObat` varchar(20) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `nmSup` varchar(25) NOT NULL,
  `hrgBeli` double NOT NULL,
  `hrgJual` double NOT NULL,
  `stok` double NOT NULL,
  PRIMARY KEY  (`idObat`),
  KEY `nmSup` (`nmSup`),
  KEY `nmObat` (`nmObat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbobat
-- ----------------------------
INSERT INTO `tbobat` VALUES ('1', 'insto', 'Cairan', 'wirautama', '10500', '13000', '50');
INSERT INTO `tbobat` VALUES ('2', 'paracetamol', 'Tablet', 'mbredets', '5500', '7000', '16');
INSERT INTO `tbobat` VALUES ('3', 'panadol', 'Tablet', 'endeng', '6500', '8000', '30');
INSERT INTO `tbobat` VALUES ('4', 'paramex', 'Tablet', 'kimia farma', '3500', '5000', '50');
INSERT INTO `tbobat` VALUES ('5', 'parmaton', 'Tablet', 'wirautama', '5500', '7000', '50');

-- ----------------------------
-- Table structure for tbpenjualan
-- ----------------------------
DROP TABLE IF EXISTS `tbpenjualan`;
CREATE TABLE `tbpenjualan` (
  `noTrans` varchar(12) NOT NULL,
  `tglTrans` date NOT NULL,
  `total` double NOT NULL,
  `nmSup` varchar(25) NOT NULL,
  PRIMARY KEY  (`noTrans`),
  KEY `nmSup` (`nmSup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbpenjualan
-- ----------------------------
INSERT INTO `tbpenjualan` VALUES ('TR0307-01', '2016-07-03', '13000', 'wirautama');
INSERT INTO `tbpenjualan` VALUES ('TR0307-02', '2016-07-03', '8000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-03', '2016-07-03', '7000', 'mbredets');
INSERT INTO `tbpenjualan` VALUES ('TR0307-04', '2016-07-03', '26000', 'wirautama');
INSERT INTO `tbpenjualan` VALUES ('TR0307-05', '2016-07-03', '8000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-06', '2016-07-03', '16000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-07', '2016-07-03', '8000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-08', '2016-07-03', '7000', 'mbredets');
INSERT INTO `tbpenjualan` VALUES ('TR0307-09', '2016-07-03', '13000', 'wirautama');
INSERT INTO `tbpenjualan` VALUES ('TR0307-10', '2016-07-03', '8000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-011', '2016-07-03', '8000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-012', '2016-07-03', '53000', 'endeng');
INSERT INTO `tbpenjualan` VALUES ('TR0307-013', '2016-07-03', '10000', 'kimia farma');
INSERT INTO `tbpenjualan` VALUES ('TR0307-014', '2016-07-03', '169000', 'wirautama');

-- ----------------------------
-- Table structure for tbsementara
-- ----------------------------
DROP TABLE IF EXISTS `tbsementara`;
CREATE TABLE `tbsementara` (
  `nmObat` varchar(20) NOT NULL,
  `harga` double NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY  (`nmObat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbsementara
-- ----------------------------

-- ----------------------------
-- Table structure for tbsupplier
-- ----------------------------
DROP TABLE IF EXISTS `tbsupplier`;
CREATE TABLE `tbsupplier` (
  `idSup` int(5) NOT NULL auto_increment,
  `nmSup` varchar(25) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  PRIMARY KEY  (`idSup`),
  KEY `nmSup` (`nmSup`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbsupplier
-- ----------------------------
INSERT INTO `tbsupplier` VALUES ('6', 'wirautama', '082332457777', 'polewali');
INSERT INTO `tbsupplier` VALUES ('4', 'mbredets', '082327833333', 'makassar');
INSERT INTO `tbsupplier` VALUES ('8', 'kimia farma', '021-123556', 'jakarta');
