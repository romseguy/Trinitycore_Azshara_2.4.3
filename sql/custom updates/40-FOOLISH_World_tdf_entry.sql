-- ----------------------------
-- Table structure for tdf_entry
-- ----------------------------
CREATE TABLE `tdf_entry` (
  `Id` mediumint(8) NOT NULL,
  `Name` text NOT NULL,
  `Description` longtext NOT NULL,
  `TitleReward` mediumint(8) NOT NULL default 0,
  `TabardReward` mediumint(8) NOT NULL default 0,
  `ItemReward` mediumint(8) NOT NULL default 0,
  `ItemRewardCount` int(11) NOT NULL default 0,
  `MoneyReward` int(11) NOT NULL default 0,
  `MoneyRewardCount` int(11) NOT NULL default 0,
  `HonorReward` int(11) NOT NULL default 0,
  `ArenaReward` int(11) NOT NULL default 0,
  `NData0` text,
  `Data0` int(11) NOT NULL default 0,
  `NData1` text,
  `Data1` int(11) NOT NULL default 0,
  `NData2` text,
  `Data2` int(11) NOT NULL default 0,
  `NData3` text,
  `Data3` int(11) NOT NULL default 0,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `tdf_entry` VALUES ('1', 'Série de 10 en Zone FFA!', 'Tuer 10 personnes sans mourir en Zone FFA', '0', '0', '43228', '10', '0', '0', '1000', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('2', 'Série de 25 en Zone FFA!', 'Tuer 25 personnes sans mourir en Zone FFA', '0', '0', '43228', '25', '0', '0', '2500', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('3', 'Série de 50 en Zone FFA!', 'Tuer 50 personnes sans mourir en Zone FFA', '145', '0', '43228', '50', '0', '0', '5000', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('4', 'Tues moi si tu peux!', 'Rester 30 minutes dans la zone FFA sans mourir', '0', '0', '43228', '10', '0', '0', '1000', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('5', 'Le Mastodonte est en vous!', 'Avoir le Mastodonte pendant 15 minutes', '0', '0', '43228', '10', '0', '0', '1000', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('6', 'Tueur de la zone FFA!', 'Tuer 500 personnes en zone FFA', '0', '0', '43228', '50', '0', '0', '5000', '0', '500 personnes tués en zone FFA', '500', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('7', 'Serial Killer de la zone FFA!', 'Tuer 1000 personnes en zone FFA', '0', '0', '43228', '100', '0', '0', '10000', '0', '1000 personnes tués en zone FFA', '1000', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('8', 'Faucheur de mort de la zone FFA!', 'Tuer 2000 personnes en zone FFA', '158', '0', '43228', '200', '0', '0', '20000', '0', '2000 personnes tués en zone FFA', '2000', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('9', 'Maitre de la zone FFA', 'Avoir accompli tout les tours de force de la zone FFA', '85', '0', '0', '0', '0', '0', '0', '0', '|cFF60FF00[Série de 50 en zone FFA!]|cFFFFFC00', '1', '|cFF60FF00[Le survivant!]|cFFFFFC00', '1', '|cFF60FF00[Serial Killer de la zone FFA!]|cFFFFFC00', '1', '', '0');
INSERT INTO `tdf_entry` VALUES ('10', 'Le survivant', 'Avoir accompli les tours de force |cFF60FF00[Tues moi si tu peux!] |cFFFFFC00et |cFF60FF00[Le mastodonte est en vous!]', '142', '0', '0', '0', '0', '0', '0', '0', '|cFF60FF00[Tues moi si tu peux!]|cFFFFFC00', '1', '|cFF60FF00[Le mastodonte est en vous!]|cFFFFFC00', '1', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('11', 'Les drapeaux sont à nous!', 'Obtenir les 3 drapeaux en même temps dans la zone 3v3', '0', '0', '0', '0', '0', '0', '1000', '0', '', '0', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('12', 'Vétéran de la zone 3c3', 'Avoir participé à la zone 3c3 durant 5 heures', '172', '0', '0', '0', '0', '0', '5000', '0', '5 heures en zone 3c3 (18000000 millisecondes)', '18000000', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('13', 'Porteguerre 10', 'Asséner 10 coups fatals avec le drapeau en zone 3v3', '0', '0', '0', '0', '0', '0', '1000', '0', '10 coups fatals assénés  en zone 3v3', '10', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('14', 'Porteguerre 25', 'Asséner 25 coups fatals avec le drapeau en zone 3v3', '0', '0', '0', '0', '0', '0', '2500', '0', '25 coups fatals assénés  en zone 3v3', '25', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('15', 'Porteguerre 50', 'Asséner 50 coups fatals avec le drapeau en zone 3v3', '94', '0', '0', '0', '0', '0', '5000', '0', '50 coups fatals assénés en zone 3v3', '50', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('16', 'The flag killer', 'Tuer 20 porteurs de drapeau en zone 3c3', '0', '0', '0', '0', '0', '0', '2000', '0', '20 porteurs de drapeau tués  en zone 3v3', '20', '', '0', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('17', 'Assassin de la zone 3v3', 'Tuer 1000 personnes en zone 3v3 et avoir accompli le tour de force |cFF60FF00[The flag killer]', '95', '0', '0', '0', '0', '0', '10000', '0', '1000 personnes tués en zone 3v3', '1000', '|cFF60FF00[The flag killer]|cFFFFFC00', '1', '', '0', '', '0');
INSERT INTO `tdf_entry` VALUES ('18', 'Maitre de la zone 3v3', 'Avoir accompli tout les tours de force de la zone 3v3', '80', '0', '0', '0', '0', '0', '0', '0', '|cFF60FF00[Les drapeaux sont à nous!]|cFFFFFC00', '1', '|cFF60FF00[Porteguerre 50]|cFFFFFC00', '1', '|cFF60FF00[Vétéran de la zone 3v3]|cFFFFFC00', '1', '|cFF60FF00[Assassin de la zone 3v3]|cFFFFFC00', '1');
