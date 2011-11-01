/*
SQLyog - Free MySQL GUI v4.1
Host - 5.1.53-community-log : Database - characters
*********************************************************************
Server version : 5.1.53-community-log
*/


create database if not exists `characters`;

USE `characters`;

/*Table structure for table `arena_team` */

drop table if exists `arena_team`;

CREATE TABLE `arena_team` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `captainguid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `EmblemColor` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderStyle` int(10) unsigned NOT NULL DEFAULT '0',
  `BorderColor` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team` */

/*Table structure for table `arena_team_member` */

drop table if exists `arena_team_member`;

CREATE TABLE `arena_team_member` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `played_week` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_week` int(10) unsigned NOT NULL DEFAULT '0',
  `played_season` int(10) unsigned NOT NULL DEFAULT '0',
  `wons_season` int(10) unsigned NOT NULL DEFAULT '0',
  `personal_rating` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team_member` */

/*Table structure for table `arena_team_stats` */

drop table if exists `arena_team_stats`;

CREATE TABLE `arena_team_stats` (
  `arenateamid` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `games` int(10) unsigned NOT NULL DEFAULT '0',
  `wins` int(10) unsigned NOT NULL DEFAULT '0',
  `played` int(10) unsigned NOT NULL DEFAULT '0',
  `wins2` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `arena_team_stats` */

/*Table structure for table `auctionhouse` */

drop table if exists `auctionhouse`;

CREATE TABLE `auctionhouse` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `auctioneerguid` int(11) unsigned NOT NULL DEFAULT '0',
  `itemguid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `itemowner` int(11) unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int(11) NOT NULL DEFAULT '0',
  `time` bigint(40) NOT NULL DEFAULT '0',
  `buyguid` int(11) unsigned NOT NULL DEFAULT '0',
  `lastbid` int(11) NOT NULL DEFAULT '0',
  `startbid` int(11) NOT NULL DEFAULT '0',
  `deposit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_guid` (`itemguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auctionhouse` */

/*Table structure for table `auctionhousebot` */

drop table if exists `auctionhousebot`;

CREATE TABLE `auctionhousebot` (
  `auctionhouse` int(11) NOT NULL DEFAULT '0' COMMENT 'mapID of the auctionhouse.',
  `name` char(25) DEFAULT NULL COMMENT 'Text name of the auctionhouse.',
  `minitems` int(11) DEFAULT '0' COMMENT 'This is the minimum number of items you want to keep in the auction house. a 0 here will make it the same as the maximum.',
  `maxitems` int(11) DEFAULT '0' COMMENT 'This is the number of items you want to keep in the auction house.',
  `percentgreytradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Grey Trade Goods auction items',
  `percentwhitetradegoods` int(11) DEFAULT '27' COMMENT 'Sets the percentage of the White Trade Goods auction items',
  `percentgreentradegoods` int(11) DEFAULT '12' COMMENT 'Sets the percentage of the Green Trade Goods auction items',
  `percentbluetradegoods` int(11) DEFAULT '10' COMMENT 'Sets the percentage of the Blue Trade Goods auction items',
  `percentpurpletradegoods` int(11) DEFAULT '1' COMMENT 'Sets the percentage of the Purple Trade Goods auction items',
  `percentorangetradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Orange Trade Goods auction items',
  `percentyellowtradegoods` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the Yellow Trade Goods auction items',
  `percentgreyitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Grey auction items',
  `percentwhiteitems` int(11) DEFAULT '10' COMMENT 'Sets the percentage of the non trade White auction items',
  `percentgreenitems` int(11) DEFAULT '30' COMMENT 'Sets the percentage of the non trade Green auction items',
  `percentblueitems` int(11) DEFAULT '8' COMMENT 'Sets the percentage of the non trade Blue auction items',
  `percentpurpleitems` int(11) DEFAULT '2' COMMENT 'Sets the percentage of the non trade Purple auction items',
  `percentorangeitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Orange auction items',
  `percentyellowitems` int(11) DEFAULT '0' COMMENT 'Sets the percentage of the non trade Yellow auction items',
  `minpricegrey` int(11) DEFAULT '100' COMMENT 'Minimum price of Grey items (percentage).',
  `maxpricegrey` int(11) DEFAULT '150' COMMENT 'Maximum price of Grey items (percentage).',
  `minpricewhite` int(11) DEFAULT '150' COMMENT 'Minimum price of White items (percentage).',
  `maxpricewhite` int(11) DEFAULT '250' COMMENT 'Maximum price of White items (percentage).',
  `minpricegreen` int(11) DEFAULT '800' COMMENT 'Minimum price of Green items (percentage).',
  `maxpricegreen` int(11) DEFAULT '1400' COMMENT 'Maximum price of Green items (percentage).',
  `minpriceblue` int(11) DEFAULT '1250' COMMENT 'Minimum price of Blue items (percentage).',
  `maxpriceblue` int(11) DEFAULT '1750' COMMENT 'Maximum price of Blue items (percentage).',
  `minpricepurple` int(11) DEFAULT '2250' COMMENT 'Minimum price of Purple items (percentage).',
  `maxpricepurple` int(11) DEFAULT '4550' COMMENT 'Maximum price of Purple items (percentage).',
  `minpriceorange` int(11) DEFAULT '3250' COMMENT 'Minimum price of Orange items (percentage).',
  `maxpriceorange` int(11) DEFAULT '5550' COMMENT 'Maximum price of Orange items (percentage).',
  `minpriceyellow` int(11) DEFAULT '5250' COMMENT 'Minimum price of Yellow items (percentage).',
  `maxpriceyellow` int(11) DEFAULT '6550' COMMENT 'Maximum price of Yellow items (percentage).',
  `minbidpricegrey` int(11) DEFAULT '70' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricegrey` int(11) DEFAULT '100' COMMENT 'Starting bid price of Grey items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricewhite` int(11) DEFAULT '70' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 70',
  `maxbidpricewhite` int(11) DEFAULT '100' COMMENT 'Starting bid price of White items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricegreen` int(11) DEFAULT '80' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricegreen` int(11) DEFAULT '100' COMMENT 'Starting bid price of Green items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceblue` int(11) DEFAULT '75' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 75',
  `maxbidpriceblue` int(11) DEFAULT '100' COMMENT 'Starting bid price of Blue items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpricepurple` int(11) DEFAULT '80' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpricepurple` int(11) DEFAULT '100' COMMENT 'Starting bid price of Purple items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceorange` int(11) DEFAULT '80' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceorange` int(11) DEFAULT '100' COMMENT 'Starting bid price of Orange items as a percentage of the randomly chosen buyout price. Default: 100',
  `minbidpriceyellow` int(11) DEFAULT '80' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 80',
  `maxbidpriceyellow` int(11) DEFAULT '100' COMMENT 'Starting bid price of Yellow items as a percentage of the randomly chosen buyout price. Default: 100',
  `maxstackgrey` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackwhite` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackgreen` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackblue` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackpurple` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackorange` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `maxstackyellow` int(11) DEFAULT '0' COMMENT 'Stack size limits for item qualities - a value of 0 will disable a maximum stack size for that quality, which will allow the bot to create items in stack as large as the item allows.',
  `buyerpricegrey` int(11) DEFAULT '1' COMMENT 'Multiplier to vendorprice when buying grey items from auctionhouse',
  `buyerpricewhite` int(11) DEFAULT '3' COMMENT 'Multiplier to vendorprice when buying white items from auctionhouse',
  `buyerpricegreen` int(11) DEFAULT '5' COMMENT 'Multiplier to vendorprice when buying green items from auctionhouse',
  `buyerpriceblue` int(11) DEFAULT '12' COMMENT 'Multiplier to vendorprice when buying blue items from auctionhouse',
  `buyerpricepurple` int(11) DEFAULT '15' COMMENT 'Multiplier to vendorprice when buying purple items from auctionhouse',
  `buyerpriceorange` int(11) DEFAULT '20' COMMENT 'Multiplier to vendorprice when buying orange items from auctionhouse',
  `buyerpriceyellow` int(11) DEFAULT '22' COMMENT 'Multiplier to vendorprice when buying yellow items from auctionhouse',
  `buyerbiddinginterval` int(11) DEFAULT '1' COMMENT 'Interval how frequently AHB bids on each AH. Time in minutes',
  `buyerbidsperinterval` int(11) DEFAULT '1' COMMENT 'number of bids to put in per bidding interval',
  PRIMARY KEY (`auctionhouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auctionhousebot` */

insert into `auctionhousebot` values (2,'Alliance',0,0,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,3,5,12,15,20,22,1,1),(6,'Horde',0,0,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,3,5,12,15,20,22,1,1),(7,'Neutral',0,0,0,27,12,10,1,0,0,0,10,30,8,2,0,0,100,150,150,250,800,1400,1250,1750,2250,4550,3250,5550,5250,6550,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,3,5,12,15,20,22,1,1);

/*Table structure for table `bugreport` */

drop table if exists `bugreport`;

CREATE TABLE `bugreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Debug System';

/*Data for the table `bugreport` */

/*Table structure for table `character_action` */

drop table if exists `character_action`;

CREATE TABLE `character_action` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `button` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `misc` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_action` */

insert into `character_action` values (1,72,6603,0,0),(1,73,78,0,0),(1,74,28880,0,0),(1,80,25563,0,0),(1,81,27623,0,0),(1,82,2484,0,0),(1,83,25212,0,0),(1,93,1251,128,0),(1,94,23920,0,0),(1,95,3411,0,0),(2,0,6603,0,0),(2,1,133,0,0),(2,2,168,0,0),(2,3,20116,0,0),(2,4,32375,0,0),(2,5,980,0,0),(2,6,118,0,0),(2,7,34433,0,0),(2,8,2139,0,0),(2,9,1459,0,0),(2,10,10060,0,0),(2,11,27128,0,0),(4,0,6603,0,0),(4,1,5176,0,0),(4,2,5185,0,0),(4,3,20580,0,0),(4,10,41635,0,0),(4,11,33763,0,0),(5,0,6603,0,0),(5,1,21084,0,0),(5,2,635,0,0),(5,3,28734,0,0),(5,4,28730,0,0),(5,10,159,128,0),(5,11,20857,128,0),(6,0,6603,0,0),(6,1,26862,0,0),(6,2,26865,0,0),(6,3,2764,0,0),(6,4,20577,0,0),(6,10,1787,0,0),(6,11,26889,0,0),(7,0,1787,0,0),(7,1,26862,0,0),(7,2,26865,0,0),(7,3,38764,0,0),(7,4,20577,0,0),(7,5,2094,0,0),(7,7,11305,0,0),(7,8,2,64,0),(7,9,26889,0,0),(7,10,25218,0,0),(7,11,5938,0,0),(7,72,1833,0,0),(7,75,11297,0,0),(7,80,2,64,0),(7,83,1787,0,0),(8,0,6603,0,0),(8,1,5176,0,0),(8,2,5185,0,0),(8,3,20549,0,0),(8,10,159,128,0),(8,11,33831,0,0),(9,0,6603,0,0),(9,1,21084,0,0),(9,2,635,0,0),(9,10,159,128,0),(9,11,2070,128,0),(10,0,6603,0,0),(10,1,403,0,0),(10,2,331,0,0),(10,3,28880,0,0),(10,10,159,128,0),(10,11,4540,128,0),(11,0,6603,0,0),(11,1,27209,0,0),(11,2,696,0,0),(11,3,20577,0,0),(11,9,1,64,0),(11,10,691,0,0),(11,11,31687,0,0),(13,0,6603,0,0),(13,1,585,0,0),(13,2,2050,0,0),(13,3,20577,0,0),(13,6,10912,0,0),(13,7,10909,0,0),(13,10,10187,0,0),(13,11,34433,0,0),(14,0,1787,0,0),(14,1,38764,0,0),(14,2,5938,0,0),(14,3,16511,0,0),(14,4,26865,0,0),(14,5,26669,0,0),(14,6,8643,0,0),(14,7,11305,0,0),(14,8,31224,0,0),(14,9,38768,0,0),(14,10,26679,0,0),(14,11,26889,0,0),(14,33,1,64,0),(14,34,3776,128,0),(14,35,20577,0,0),(14,48,2764,0,0),(14,49,6774,0,0),(14,50,26866,0,0),(14,51,26867,0,0),(14,60,7744,0,0),(14,61,37865,128,0),(14,62,2094,0,0),(14,63,14185,0,0),(14,64,1725,0,0),(14,65,36554,0,0),(14,70,1833,0,0),(14,72,1833,0,0),(14,73,11297,0,0),(14,74,26884,0,0),(14,75,16511,0,0),(14,76,26865,0,0),(14,77,26669,0,0),(14,78,8643,0,0),(14,79,11305,0,0),(14,80,31224,0,0),(14,81,38768,0,0),(14,82,14183,0,0),(14,83,2,64,0),(15,0,6603,0,0),(15,1,26862,0,0),(15,2,38764,0,0),(15,3,5938,0,0),(15,5,38768,0,0),(15,7,14278,0,0),(15,8,16511,0,0),(15,10,2094,0,0),(15,25,7744,0,0),(15,27,37865,128,0),(15,29,3776,128,0),(15,32,1,64,0),(15,48,26669,0,0),(15,49,26889,0,0),(15,51,11305,0,0),(15,52,36554,0,0),(15,54,14185,0,0),(15,57,1725,0,0),(15,59,26679,0,0),(15,60,2764,0,0),(15,62,26865,0,0),(15,63,8643,0,0),(15,64,26867,0,0),(15,65,6774,0,0),(15,66,26866,0,0),(15,67,32684,0,0),(15,69,14183,0,0),(15,70,31224,0,0),(15,72,6603,0,0),(15,73,26862,0,0),(15,74,38764,0,0),(15,75,5938,0,0),(15,77,14278,0,0),(15,78,16511,0,0),(15,80,26884,0,0),(15,82,1833,0,0),(15,83,11297,0,0),(16,0,6603,0,0),(16,1,403,0,0),(16,2,331,0,0),(16,3,33697,0,0),(16,10,159,128,0),(16,11,27154,0,0);

/*Table structure for table `character_aura` */

drop table if exists `character_aura`;

CREATE TABLE `character_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `effect_index` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) NOT NULL DEFAULT '1',
  `amount` int(11) NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`spell`,`effect_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_aura` */

insert into `character_aura` values (6,6,7267,0,1,0,3000,848,-1),(8,8,16864,0,1,0,1800000,863947,-1),(16,16,20236,0,1,30,120000,108800,-1),(16,16,23230,0,1,-50,15000,2302,-1),(16,16,33697,0,1,1022,15000,2302,-1),(16,16,33697,1,1,513,15000,2302,-1),(16,16,33697,2,1,513,15000,2302,-1);

/*Table structure for table `character_battleground_data` */

drop table if exists `character_battleground_data`;

CREATE TABLE `character_battleground_data` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `team` int(11) unsigned NOT NULL DEFAULT '0',
  `join_x` float NOT NULL DEFAULT '0',
  `join_y` float NOT NULL DEFAULT '0',
  `join_z` float NOT NULL DEFAULT '0',
  `join_o` float NOT NULL DEFAULT '0',
  `join_map` int(11) NOT NULL DEFAULT '0',
  `taxi_start` int(11) NOT NULL DEFAULT '0',
  `taxi_end` int(11) NOT NULL DEFAULT '0',
  `mount_spell` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_battleground_data` */

/*Table structure for table `character_declinedname` */

drop table if exists `character_declinedname`;

CREATE TABLE `character_declinedname` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `character_declinedname` */

/*Table structure for table `character_gifts` */

drop table if exists `character_gifts`;

CREATE TABLE `character_gifts` (
  `guid` int(20) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(20) unsigned NOT NULL DEFAULT '0',
  `flags` int(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_gifts` */

/*Table structure for table `character_homebind` */

drop table if exists `character_homebind`;

CREATE TABLE `character_homebind` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zone` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_homebind` */

insert into `character_homebind` values (1,530,3526,-3961.64,-13931.2,100.615),(2,0,85,1676.71,1678.31,121.67),(4,1,141,10311.3,832.463,1326.41),(5,530,3431,10349.6,-6357.29,33.4026),(6,0,85,1676.71,1678.31,121.67),(7,0,85,1676.71,1678.31,121.67),(8,1,215,-2917.58,-257.98,52.9968),(9,0,12,-8949.95,-132.493,83.5312),(10,530,3526,-3961.64,-13931.2,100.615),(11,0,85,1676.71,1678.31,121.67),(13,0,85,1676.71,1678.31,121.67),(14,0,85,1676.71,1678.31,121.67),(15,0,85,1676.71,1678.31,121.67),(16,1,14,-618.518,-4251.67,38.718);

/*Table structure for table `character_instance` */

drop table if exists `character_instance`;

CREATE TABLE `character_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_instance` */

/*Table structure for table `character_inventory` */

drop table if exists `character_inventory`;

CREATE TABLE `character_inventory` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int(11) unsigned NOT NULL DEFAULT '0',
  `slot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  `item_template` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  PRIMARY KEY (`item`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_inventory` */

insert into `character_inventory` values (1,0,3,2,23473),(1,0,34,4,23474),(1,0,7,6,23475),(1,0,15,8,23346),(1,0,23,10,6948),(1,0,24,12,4540),(2,0,4,14,6140),(2,0,6,16,1395),(2,0,3,18,6096),(2,0,15,20,35),(2,0,7,22,55),(2,0,25,28,6948),(4,0,15,46,3661),(4,0,4,48,6123),(4,0,6,50,6124),(4,0,23,52,159),(4,0,24,54,4536),(4,0,25,56,6948),(5,0,3,58,24143),(5,0,6,60,24145),(5,0,7,62,24146),(5,0,15,64,23346),(5,0,23,66,20857),(5,0,24,68,159),(5,0,25,70,6948),(5,0,17,71,35039),(5,0,26,72,35040),(5,0,27,73,19019),(6,0,15,75,2092),(6,0,3,77,2105),(6,0,6,79,120),(6,0,7,81,121),(6,0,23,83,4604),(6,0,17,85,25861),(6,0,24,87,6948),(6,0,25,88,5140),(6,0,26,89,5140),(7,0,16,91,2092),(7,0,3,93,2105),(7,0,6,95,120),(7,0,7,97,121),(7,0,17,101,25861),(7,0,24,103,6948),(8,0,15,105,35),(8,0,4,107,6139),(8,0,6,109,6124),(8,0,23,111,159),(8,0,24,113,4536),(8,0,25,115,6948),(7,0,26,117,5140),(9,0,3,119,45),(9,0,7,121,43),(9,0,6,123,44),(9,0,23,125,6948),(9,0,28,127,2361),(9,0,24,129,159),(9,0,25,131,2070),(9,0,26,132,35039),(9,0,17,133,30063),(9,0,27,134,19019),(9,0,15,135,32332),(7,0,23,136,17142),(7,0,15,137,20578),(4,0,26,138,19879),(7,0,27,139,6218),(7,0,28,140,10940),(7,0,29,141,10938),(7,0,8,142,1370),(10,0,3,144,23345),(10,0,6,146,23344),(10,0,7,148,23348),(10,0,23,150,6948),(10,0,15,152,36),(10,0,24,154,4540),(10,0,25,156,159),(1,0,25,157,5178),(1,0,26,158,5176),(1,0,27,159,5177),(1,0,28,160,5175),(11,0,4,162,6129),(11,0,6,164,1396),(11,0,7,166,59),(11,0,15,168,2092),(11,0,23,170,4604),(11,0,24,172,159),(11,0,25,174,6948),(1,0,30,191,28358),(1,0,29,192,1251),(1,0,4,193,33728),(1,0,9,194,33729),(1,0,0,195,33730),(1,0,6,196,33731),(1,0,2,197,33732),(13,0,9,214,35083),(13,0,0,215,35084),(13,0,6,216,35085),(13,0,2,217,35086),(13,0,4,218,35087),(13,0,5,220,30888),(13,0,7,221,30894),(13,0,8,222,32586),(13,0,14,223,32331),(13,0,1,224,34204),(13,0,16,225,34206),(13,0,10,226,29309),(13,0,11,227,32528),(13,0,12,228,35700),(13,0,13,229,28823),(13,0,15,230,34335),(13,0,38,231,33134),(13,0,31,236,33134),(13,0,32,237,33134),(13,0,33,238,33134),(13,0,34,239,33134),(13,0,35,240,33134),(13,0,36,241,33134),(13,0,37,242,33134),(11,0,38,243,6265),(11,0,30,248,6265),(11,0,31,249,6265),(11,0,32,250,6265),(11,0,33,251,6265),(11,0,34,252,6265),(11,0,35,253,6265),(11,0,36,254,6265),(11,0,37,255,6265),(14,0,23,269,6948),(15,0,23,283,6948),(14,0,25,284,5140),(14,0,26,285,5140),(14,0,27,286,5140),(14,0,28,287,5140),(14,0,24,288,5140),(14,0,9,290,35032),(15,0,9,291,35032),(15,0,0,292,35033),(14,0,0,293,35033),(14,0,6,294,35034),(15,0,6,295,35034),(14,0,2,296,35035),(15,0,2,297,35035),(14,0,4,298,35036),(15,0,4,299,35036),(14,0,7,300,35141),(15,0,7,301,35141),(15,0,10,302,35131),(14,0,10,303,35131),(14,0,5,304,35156),(15,0,5,305,35156),(15,0,1,306,35135),(14,0,1,307,35135),(14,0,8,308,35171),(15,0,8,310,35171),(15,0,11,311,34887),(14,0,11,312,34887),(14,0,14,313,33484),(15,0,14,314,33484),(14,0,12,315,37865),(15,0,12,316,37865),(15,0,13,317,34427),(14,0,13,318,34427),(15,0,24,320,33474),(15,0,17,321,34349),(14,0,17,322,34349),(14,0,33,323,29996),(15,0,15,324,32837),(15,0,16,325,32838),(14,0,34,326,19019),(14,0,29,327,22463),(14,0,19,337,21858),(14,0,32,348,3776),(14,0,30,349,3776),(14,0,31,350,3776),(15,0,28,351,3776),(15,0,25,352,3776),(15,0,27,353,3776),(16,0,3,355,154),(16,0,6,357,153),(16,0,23,359,6948),(16,0,15,361,36),(16,0,24,363,117),(16,0,25,365,159),(14,0,15,366,32837),(14,0,16,367,32838),(15,0,32,376,5140),(15,0,26,377,5140),(15,0,29,378,5140),(15,0,30,379,5140),(15,0,31,380,5140);

/*Table structure for table `character_pet` */

drop table if exists `character_pet`;

CREATE TABLE `character_pet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `modelid` int(11) unsigned DEFAULT '0',
  `CreatedBySpell` int(11) unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '1',
  `exp` int(11) unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `loyaltypoints` int(11) NOT NULL DEFAULT '0',
  `loyalty` int(11) unsigned NOT NULL DEFAULT '0',
  `trainpoint` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT 'Pet',
  `renamed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(11) unsigned NOT NULL DEFAULT '1',
  `curmana` int(11) unsigned NOT NULL DEFAULT '0',
  `curhappiness` int(11) unsigned NOT NULL DEFAULT '0',
  `savetime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `abdata` longtext,
  `teachspelldata` longtext,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `character_pet` */

insert into `character_pet` values (2,417,11,850,691,0,70,0,2,0,0,0,'Rhuunam',1,3,3792,3028,0,1319216340,0,0,'1792 2 1792 1 1792 0 33024 19505 33024 0 33024 0 33024 0 1536 2 1536 1 1536 0 ','0 0 0 0 0 0 0 0 ');

/*Table structure for table `character_pet_declinedname` */

drop table if exists `character_pet_declinedname`;

CREATE TABLE `character_pet_declinedname` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `character_pet_declinedname` */

/*Table structure for table `character_queststatus` */

drop table if exists `character_queststatus`;

CREATE TABLE `character_queststatus` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `rewarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `explored` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timer` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mobcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `mobcount4` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount1` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount2` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount3` int(11) unsigned NOT NULL DEFAULT '0',
  `itemcount4` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus` */

insert into `character_queststatus` values (14,8312,0,0,0,1319281138,0,0,0,0,0,0,0,0),(14,11339,0,0,0,1319281138,0,0,0,0,0,0,0,0),(14,11340,0,0,0,1319281138,0,0,0,0,0,0,0,0),(14,11341,0,0,0,1319281138,0,0,0,0,0,0,0,0),(14,11342,0,0,0,1319281138,0,0,0,0,0,0,0,0),(15,8312,0,0,0,1319281529,0,0,0,0,0,0,0,0),(15,11339,0,0,0,1319281529,0,0,0,0,0,0,0,0),(15,11340,0,0,0,1319281529,0,0,0,0,0,0,0,0),(15,11341,0,0,0,1319281529,0,0,0,0,0,0,0,0),(15,11342,0,0,0,1319281529,0,0,0,0,0,0,0,0);

/*Table structure for table `character_queststatus_daily` */

drop table if exists `character_queststatus_daily`;

CREATE TABLE `character_queststatus_daily` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_queststatus_daily` */

/*Table structure for table `character_reputation` */

drop table if exists `character_reputation`;

CREATE TABLE `character_reputation` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` int(11) unsigned NOT NULL DEFAULT '0',
  `standing` int(11) NOT NULL DEFAULT '0',
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_reputation` */

insert into `character_reputation` values (1,21,0,0),(1,46,0,4),(1,47,0,17),(1,54,0,17),(1,59,0,16),(1,67,0,14),(1,68,0,6),(1,69,0,17),(1,70,0,2),(1,72,0,17),(1,76,0,6),(1,81,0,6),(1,83,0,4),(1,86,0,4),(1,87,0,2),(1,92,0,2),(1,93,0,2),(1,169,0,8),(1,270,0,16),(1,289,0,4),(1,349,0,0),(1,369,0,0),(1,469,0,25),(1,470,0,0),(1,471,0,20),(1,509,0,16),(1,510,0,2),(1,529,0,0),(1,530,0,6),(1,549,0,4),(1,550,0,4),(1,551,0,4),(1,569,0,4),(1,570,0,4),(1,571,0,4),(1,574,0,4),(1,576,0,2),(1,577,0,0),(1,589,0,0),(1,609,0,0),(1,729,0,2),(1,730,0,16),(1,749,0,0),(1,809,0,16),(1,889,0,6),(1,890,0,16),(1,891,0,24),(1,892,0,0),(1,909,0,16),(1,910,0,2),(1,911,0,6),(1,922,0,6),(1,930,0,17),(1,932,0,80),(1,933,0,16),(1,934,0,80),(1,935,0,16),(1,936,0,28),(1,941,0,6),(1,942,0,16),(1,946,0,16),(1,947,0,2),(1,967,0,16),(1,970,0,0),(1,978,0,16),(1,980,0,0),(1,989,0,16),(1,990,0,16),(1,1005,0,4),(1,1011,0,16),(1,1012,0,16),(1,1015,0,2),(1,1031,0,16),(1,1038,0,16),(1,1077,0,16),(2,21,0,0),(2,46,0,4),(2,47,0,6),(2,54,0,6),(2,59,0,16),(2,67,0,25),(2,68,0,17),(2,69,0,6),(2,70,0,2),(2,72,0,6),(2,76,0,17),(2,81,0,17),(2,83,0,4),(2,86,0,4),(2,87,0,2),(2,92,0,2),(2,93,0,2),(2,169,0,8),(2,270,0,16),(2,289,0,4),(2,349,0,0),(2,369,0,0),(2,469,0,14),(2,470,0,0),(2,471,0,22),(2,509,0,2),(2,510,0,16),(2,529,0,0),(2,530,0,17),(2,549,0,4),(2,550,0,4),(2,551,0,4),(2,569,0,4),(2,570,0,4),(2,571,0,4),(2,574,0,4),(2,576,0,2),(2,577,0,0),(2,589,0,6),(2,609,0,0),(2,729,0,16),(2,730,0,2),(2,749,0,0),(2,809,0,16),(2,889,0,16),(2,890,0,6),(2,891,0,14),(2,892,0,24),(2,909,0,16),(2,910,0,2),(2,911,0,17),(2,922,0,16),(2,930,0,6),(2,932,0,80),(2,933,0,16),(2,934,0,80),(2,935,0,16),(2,936,0,28),(2,941,0,16),(2,942,0,16),(2,946,0,2),(2,947,0,16),(2,967,0,16),(2,970,0,0),(2,978,0,2),(2,980,0,0),(2,989,0,16),(2,990,0,16),(2,1005,0,4),(2,1011,0,16),(2,1012,0,16),(2,1015,0,2),(2,1031,0,16),(2,1038,0,16),(2,1077,0,16),(4,21,0,0),(4,46,0,4),(4,47,0,17),(4,54,0,17),(4,59,0,16),(4,67,0,14),(4,68,0,6),(4,69,0,17),(4,70,0,2),(4,72,0,17),(4,76,0,6),(4,81,0,6),(4,83,0,4),(4,86,0,4),(4,87,0,2),(4,92,0,2),(4,93,0,2),(4,169,0,8),(4,270,0,16),(4,289,0,4),(4,349,0,0),(4,369,0,0),(4,469,0,25),(4,470,0,0),(4,471,0,20),(4,509,0,16),(4,510,0,2),(4,529,0,0),(4,530,0,6),(4,549,0,4),(4,550,0,4),(4,551,0,4),(4,569,0,4),(4,570,0,4),(4,571,0,4),(4,574,0,4),(4,576,0,2),(4,577,0,0),(4,589,0,0),(4,609,0,0),(4,729,0,2),(4,730,0,16),(4,749,0,0),(4,809,0,16),(4,889,0,6),(4,890,0,16),(4,891,0,24),(4,892,0,14),(4,909,0,16),(4,910,0,2),(4,911,0,6),(4,922,0,6),(4,930,0,17),(4,932,0,80),(4,933,0,16),(4,934,0,80),(4,935,0,16),(4,936,0,28),(4,941,0,6),(4,942,0,16),(4,946,0,16),(4,947,0,2),(4,967,0,16),(4,970,0,0),(4,978,0,16),(4,980,0,0),(4,989,0,16),(4,990,0,16),(4,1005,0,4),(4,1011,0,16),(4,1012,0,16),(4,1015,0,2),(4,1031,0,16),(4,1038,0,16),(4,1077,0,16),(5,21,0,0),(5,46,0,4),(5,47,0,6),(5,54,0,6),(5,59,0,16),(5,67,0,25),(5,68,0,17),(5,69,0,6),(5,70,0,2),(5,72,0,6),(5,76,0,17),(5,81,0,17),(5,83,0,4),(5,86,0,4),(5,87,0,2),(5,92,0,2),(5,93,0,2),(5,169,0,8),(5,270,0,16),(5,289,0,4),(5,349,0,0),(5,369,0,0),(5,469,0,14),(5,470,0,0),(5,471,0,22),(5,509,0,2),(5,510,0,16),(5,529,0,0),(5,530,0,17),(5,549,0,4),(5,550,0,4),(5,551,0,4),(5,569,0,4),(5,570,0,4),(5,571,0,4),(5,574,0,4),(5,576,0,2),(5,577,0,0),(5,589,0,6),(5,609,0,0),(5,729,0,16),(5,730,0,2),(5,749,0,0),(5,809,0,16),(5,889,0,16),(5,890,0,6),(5,891,0,0),(5,892,0,24),(5,909,0,16),(5,910,0,2),(5,911,0,17),(5,922,0,16),(5,930,0,6),(5,932,0,80),(5,933,0,16),(5,934,0,80),(5,935,0,16),(5,936,0,28),(5,941,0,16),(5,942,0,16),(5,946,0,2),(5,947,0,16),(5,967,0,16),(5,970,0,0),(5,978,0,2),(5,980,0,0),(5,989,0,16),(5,990,0,16),(5,1005,0,4),(5,1011,0,16),(5,1012,0,16),(5,1015,0,2),(5,1031,0,16),(5,1038,0,16),(5,1077,0,16),(6,21,0,0),(6,46,0,4),(6,47,0,6),(6,54,0,6),(6,59,0,16),(6,67,0,25),(6,68,0,17),(6,69,0,6),(6,70,0,2),(6,72,0,6),(6,76,0,17),(6,81,0,17),(6,83,0,4),(6,86,0,4),(6,87,0,2),(6,92,0,2),(6,93,0,2),(6,169,0,8),(6,270,0,16),(6,289,0,4),(6,349,0,0),(6,369,0,0),(6,469,0,14),(6,470,0,0),(6,471,0,22),(6,509,0,2),(6,510,0,16),(6,529,0,0),(6,530,0,17),(6,549,0,4),(6,550,0,4),(6,551,0,4),(6,569,0,4),(6,570,0,4),(6,571,0,4),(6,574,0,4),(6,576,0,2),(6,577,0,0),(6,589,0,6),(6,609,0,0),(6,729,0,16),(6,730,0,2),(6,749,0,0),(6,809,0,16),(6,889,0,16),(6,890,0,6),(6,891,0,14),(6,892,0,24),(6,909,0,16),(6,910,0,2),(6,911,0,17),(6,922,0,16),(6,930,0,6),(6,932,0,80),(6,933,0,16),(6,934,0,80),(6,935,0,16),(6,936,0,28),(6,941,0,16),(6,942,0,16),(6,946,0,2),(6,947,0,16),(6,967,0,16),(6,970,0,0),(6,978,0,2),(6,980,0,0),(6,989,0,16),(6,990,0,16),(6,1005,0,4),(6,1011,0,16),(6,1012,0,16),(6,1015,0,2),(6,1031,0,16),(6,1038,0,16),(6,1077,0,16),(7,21,0,0),(7,46,0,4),(7,47,0,6),(7,54,0,6),(7,59,0,16),(7,67,0,25),(7,68,0,17),(7,69,0,6),(7,70,0,2),(7,72,0,6),(7,76,0,17),(7,81,0,17),(7,83,0,4),(7,86,0,4),(7,87,0,2),(7,92,0,2),(7,93,0,2),(7,169,0,8),(7,270,0,16),(7,289,0,4),(7,349,0,0),(7,369,0,0),(7,469,0,14),(7,470,0,0),(7,471,0,22),(7,509,0,2),(7,510,0,16),(7,529,0,0),(7,530,0,17),(7,549,0,4),(7,550,0,4),(7,551,0,4),(7,569,0,4),(7,570,0,4),(7,571,0,4),(7,574,0,4),(7,576,0,2),(7,577,0,0),(7,589,0,6),(7,609,0,0),(7,729,0,16),(7,730,0,2),(7,749,0,0),(7,809,0,16),(7,889,0,16),(7,890,0,6),(7,891,0,14),(7,892,0,24),(7,909,0,16),(7,910,0,2),(7,911,0,17),(7,922,0,16),(7,930,0,6),(7,932,0,80),(7,933,0,16),(7,934,0,80),(7,935,0,16),(7,936,0,28),(7,941,0,16),(7,942,0,16),(7,946,0,2),(7,947,0,16),(7,967,0,16),(7,970,0,0),(7,978,0,2),(7,980,0,0),(7,989,0,16),(7,990,0,16),(7,1005,0,4),(7,1011,0,16),(7,1012,0,16),(7,1015,0,2),(7,1031,0,16),(7,1038,0,16),(7,1077,0,16),(8,21,0,0),(8,46,0,4),(8,47,0,6),(8,54,0,6),(8,59,0,16),(8,67,0,25),(8,68,0,17),(8,69,0,6),(8,70,0,2),(8,72,0,6),(8,76,0,17),(8,81,0,17),(8,83,0,4),(8,86,0,4),(8,87,0,2),(8,92,0,2),(8,93,0,2),(8,169,0,8),(8,270,0,16),(8,289,0,4),(8,349,0,0),(8,369,0,0),(8,469,0,14),(8,470,0,0),(8,471,0,22),(8,509,0,2),(8,510,0,16),(8,529,0,0),(8,530,0,17),(8,549,0,4),(8,550,0,4),(8,551,0,4),(8,569,0,4),(8,570,0,4),(8,571,0,4),(8,574,0,4),(8,576,0,2),(8,577,0,0),(8,589,0,6),(8,609,0,0),(8,729,0,16),(8,730,0,2),(8,749,0,0),(8,809,0,16),(8,889,0,16),(8,890,0,6),(8,891,0,14),(8,892,0,24),(8,909,0,16),(8,910,0,2),(8,911,0,17),(8,922,0,16),(8,930,0,6),(8,932,0,80),(8,933,0,16),(8,934,0,80),(8,935,0,16),(8,936,0,28),(8,941,0,16),(8,942,0,16),(8,946,0,2),(8,947,0,16),(8,967,0,16),(8,970,0,0),(8,978,0,2),(8,980,0,0),(8,989,0,16),(8,990,0,16),(8,1005,0,4),(8,1011,0,16),(8,1012,0,16),(8,1015,0,2),(8,1031,0,16),(8,1038,0,16),(8,1077,0,16),(9,21,0,0),(9,46,0,4),(9,47,0,17),(9,54,0,17),(9,59,0,16),(9,67,0,14),(9,68,0,6),(9,69,0,17),(9,70,0,2),(9,72,0,17),(9,76,0,6),(9,81,0,6),(9,83,0,4),(9,86,0,4),(9,87,0,2),(9,92,0,2),(9,93,0,2),(9,169,0,8),(9,270,0,16),(9,289,0,4),(9,349,0,0),(9,369,0,0),(9,469,0,25),(9,470,0,0),(9,471,0,20),(9,509,0,16),(9,510,0,2),(9,529,0,0),(9,530,0,6),(9,549,0,4),(9,550,0,4),(9,551,0,4),(9,569,0,4),(9,570,0,4),(9,571,0,4),(9,574,0,4),(9,576,0,2),(9,577,0,0),(9,589,0,0),(9,609,0,0),(9,729,0,2),(9,730,0,16),(9,749,0,0),(9,809,0,16),(9,889,0,6),(9,890,0,16),(9,891,0,24),(9,892,0,14),(9,909,0,16),(9,910,0,2),(9,911,0,6),(9,922,0,6),(9,930,0,17),(9,932,0,80),(9,933,0,16),(9,934,0,80),(9,935,0,16),(9,936,0,28),(9,941,0,6),(9,942,0,17),(9,946,0,16),(9,947,0,2),(9,967,0,16),(9,970,0,0),(9,978,0,16),(9,980,0,0),(9,989,0,16),(9,990,0,16),(9,1005,0,4),(9,1011,0,16),(9,1012,0,16),(9,1015,0,2),(9,1031,0,16),(9,1038,0,16),(9,1077,0,16),(10,21,0,0),(10,46,0,4),(10,47,0,17),(10,54,0,17),(10,59,0,16),(10,67,0,14),(10,68,0,6),(10,69,0,17),(10,70,0,2),(10,72,0,17),(10,76,0,6),(10,81,0,6),(10,83,0,4),(10,86,0,4),(10,87,0,2),(10,92,0,2),(10,93,0,2),(10,169,0,8),(10,270,0,16),(10,289,0,4),(10,349,0,0),(10,369,0,0),(10,469,0,25),(10,470,0,0),(10,471,0,20),(10,509,0,16),(10,510,0,2),(10,529,0,0),(10,530,0,6),(10,549,0,4),(10,550,0,4),(10,551,0,4),(10,569,0,4),(10,570,0,4),(10,571,0,4),(10,574,0,4),(10,576,0,2),(10,577,0,0),(10,589,0,0),(10,609,0,0),(10,729,0,2),(10,730,0,16),(10,749,0,0),(10,809,0,16),(10,889,0,6),(10,890,0,16),(10,891,0,24),(10,892,0,0),(10,909,0,16),(10,910,0,2),(10,911,0,6),(10,922,0,6),(10,930,0,17),(10,932,0,80),(10,933,0,16),(10,934,0,80),(10,935,0,16),(10,936,0,28),(10,941,0,6),(10,942,0,16),(10,946,0,16),(10,947,0,2),(10,967,0,16),(10,970,0,0),(10,978,0,16),(10,980,0,0),(10,989,0,16),(10,990,0,16),(10,1005,0,4),(10,1011,0,16),(10,1012,0,16),(10,1015,0,2),(10,1031,0,16),(10,1038,0,16),(10,1077,0,16),(11,21,0,0),(11,46,0,4),(11,47,0,6),(11,54,0,6),(11,59,0,16),(11,67,0,25),(11,68,0,17),(11,69,0,6),(11,70,0,2),(11,72,0,6),(11,76,0,17),(11,81,0,17),(11,83,0,4),(11,86,0,4),(11,87,0,2),(11,92,0,2),(11,93,0,2),(11,169,0,8),(11,270,0,16),(11,289,0,4),(11,349,0,0),(11,369,0,0),(11,469,0,14),(11,470,0,0),(11,471,0,22),(11,509,0,2),(11,510,0,16),(11,529,0,0),(11,530,0,17),(11,549,0,4),(11,550,0,4),(11,551,0,4),(11,569,0,4),(11,570,0,4),(11,571,0,4),(11,574,0,4),(11,576,0,2),(11,577,0,0),(11,589,0,6),(11,609,0,0),(11,729,0,16),(11,730,0,2),(11,749,0,0),(11,809,0,16),(11,889,0,16),(11,890,0,6),(11,891,0,14),(11,892,0,24),(11,909,0,16),(11,910,0,2),(11,911,0,17),(11,922,0,16),(11,930,0,6),(11,932,0,80),(11,933,0,16),(11,934,0,80),(11,935,0,16),(11,936,0,28),(11,941,0,16),(11,942,0,16),(11,946,0,2),(11,947,0,16),(11,967,0,16),(11,970,0,0),(11,978,0,2),(11,980,0,0),(11,989,0,16),(11,990,0,16),(11,1005,0,4),(11,1011,0,16),(11,1012,0,16),(11,1015,0,2),(11,1031,0,16),(11,1038,0,16),(11,1077,0,16),(13,21,0,0),(13,46,0,4),(13,47,0,6),(13,54,0,6),(13,59,0,16),(13,67,0,25),(13,68,0,17),(13,69,0,6),(13,70,0,2),(13,72,0,6),(13,76,0,17),(13,81,0,17),(13,83,0,4),(13,86,0,4),(13,87,0,2),(13,92,0,2),(13,93,0,2),(13,169,0,8),(13,270,0,16),(13,289,0,4),(13,349,0,0),(13,369,0,0),(13,469,0,14),(13,470,0,0),(13,471,0,22),(13,509,0,2),(13,510,0,16),(13,529,0,0),(13,530,0,17),(13,549,0,4),(13,550,0,4),(13,551,0,4),(13,569,0,4),(13,570,0,4),(13,571,0,4),(13,574,0,4),(13,576,0,2),(13,577,0,0),(13,589,0,6),(13,609,0,0),(13,729,0,16),(13,730,0,2),(13,749,0,0),(13,809,0,16),(13,889,0,16),(13,890,0,6),(13,891,0,14),(13,892,0,24),(13,909,0,16),(13,910,0,2),(13,911,0,17),(13,922,0,16),(13,930,0,6),(13,932,0,80),(13,933,0,16),(13,934,0,80),(13,935,0,16),(13,936,0,28),(13,941,0,16),(13,942,0,16),(13,946,0,2),(13,947,0,16),(13,967,0,16),(13,970,0,0),(13,978,0,2),(13,980,0,0),(13,989,0,16),(13,990,0,16),(13,1005,0,4),(13,1011,0,16),(13,1012,0,16),(13,1015,0,2),(13,1031,0,16),(13,1038,0,16),(13,1077,0,16),(14,21,0,0),(14,46,0,4),(14,47,0,6),(14,54,0,6),(14,59,0,16),(14,67,0,25),(14,68,0,17),(14,69,0,6),(14,70,0,2),(14,72,0,6),(14,76,0,17),(14,81,0,17),(14,83,0,4),(14,86,0,4),(14,87,0,2),(14,92,0,2),(14,93,0,2),(14,169,0,8),(14,270,0,16),(14,289,0,4),(14,349,0,0),(14,369,0,0),(14,469,0,14),(14,470,0,0),(14,471,0,22),(14,509,0,2),(14,510,0,16),(14,529,0,0),(14,530,0,17),(14,549,0,4),(14,550,0,4),(14,551,0,4),(14,569,0,4),(14,570,0,4),(14,571,0,4),(14,574,0,4),(14,576,0,2),(14,577,0,0),(14,589,0,6),(14,609,0,0),(14,729,0,16),(14,730,0,2),(14,749,0,0),(14,809,0,16),(14,889,0,16),(14,890,0,6),(14,891,0,14),(14,892,0,24),(14,909,0,16),(14,910,0,2),(14,911,0,17),(14,922,0,16),(14,930,0,6),(14,932,0,80),(14,933,0,16),(14,934,0,80),(14,935,0,16),(14,936,0,28),(14,941,0,16),(14,942,0,16),(14,946,0,2),(14,947,0,16),(14,967,0,16),(14,970,0,0),(14,978,0,2),(14,980,0,0),(14,989,0,16),(14,990,0,16),(14,1005,0,4),(14,1011,0,16),(14,1012,0,16),(14,1015,0,2),(14,1031,0,16),(14,1038,0,16),(14,1077,0,16),(15,21,0,0),(15,46,0,4),(15,47,0,6),(15,54,0,6),(15,59,0,16),(15,67,0,25),(15,68,0,17),(15,69,0,6),(15,70,0,2),(15,72,0,6),(15,76,0,17),(15,81,0,17),(15,83,0,4),(15,86,0,4),(15,87,0,2),(15,92,0,2),(15,93,0,2),(15,169,0,8),(15,270,0,16),(15,289,0,4),(15,349,0,0),(15,369,0,0),(15,469,0,14),(15,470,0,0),(15,471,0,22),(15,509,0,2),(15,510,0,16),(15,529,0,0),(15,530,0,17),(15,549,0,4),(15,550,0,4),(15,551,0,4),(15,569,0,4),(15,570,0,4),(15,571,0,4),(15,574,0,4),(15,576,0,2),(15,577,0,0),(15,589,0,6),(15,609,0,0),(15,729,0,16),(15,730,0,2),(15,749,0,0),(15,809,0,16),(15,889,0,16),(15,890,0,6),(15,891,0,14),(15,892,0,24),(15,909,0,16),(15,910,0,2),(15,911,0,17),(15,922,0,16),(15,930,0,6),(15,932,0,80),(15,933,0,16),(15,934,0,80),(15,935,0,16),(15,936,0,28),(15,941,0,16),(15,942,0,16),(15,946,0,2),(15,947,0,16),(15,967,0,16),(15,970,0,0),(15,978,0,2),(15,980,0,0),(15,989,0,16),(15,990,0,16),(15,1005,0,4),(15,1011,0,16),(15,1012,0,16),(15,1015,0,2),(15,1031,0,16),(15,1038,0,16),(15,1077,0,16),(16,21,0,0),(16,46,0,4),(16,47,0,6),(16,54,0,6),(16,59,0,16),(16,67,0,25),(16,68,0,17),(16,69,0,6),(16,70,0,2),(16,72,0,6),(16,76,0,17),(16,81,0,17),(16,83,0,4),(16,86,0,4),(16,87,0,2),(16,92,0,2),(16,93,0,2),(16,169,0,8),(16,270,0,16),(16,289,0,4),(16,349,0,0),(16,369,0,0),(16,469,0,14),(16,470,0,0),(16,471,0,22),(16,509,0,2),(16,510,0,16),(16,529,0,0),(16,530,0,17),(16,549,0,4),(16,550,0,4),(16,551,0,4),(16,569,0,4),(16,570,0,4),(16,571,0,4),(16,574,0,4),(16,576,0,2),(16,577,0,0),(16,589,0,6),(16,609,0,0),(16,729,0,16),(16,730,0,2),(16,749,0,0),(16,809,0,16),(16,889,0,16),(16,890,0,6),(16,891,0,14),(16,892,0,24),(16,909,0,16),(16,910,0,2),(16,911,0,17),(16,922,0,16),(16,930,0,6),(16,932,0,80),(16,933,0,16),(16,934,0,80),(16,935,0,16),(16,936,0,28),(16,941,0,16),(16,942,0,16),(16,946,0,2),(16,947,0,16),(16,967,0,16),(16,970,0,0),(16,978,0,2),(16,980,0,0),(16,989,0,16),(16,990,0,16),(16,1005,0,4),(16,1011,0,16),(16,1012,0,16),(16,1015,0,2),(16,1031,0,16),(16,1038,0,16),(16,1077,0,16);

/*Table structure for table `character_skills` */

drop table if exists `character_skills`;

CREATE TABLE `character_skills` (
  `guid` int(11) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` mediumint(9) unsigned NOT NULL,
  `value` mediumint(9) unsigned NOT NULL,
  `max` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_skills` */

insert into `character_skills` values (1,26,1,1),(1,43,350,350),(1,54,350,350),(1,55,350,350),(1,95,350,350),(1,98,300,300),(1,129,1,225),(1,162,350,350),(1,293,1,1),(1,413,1,1),(1,414,1,1),(1,415,1,1),(1,433,1,1),(1,759,300,300),(1,760,1,1),(2,6,1,1),(2,8,1,1),(2,95,350,350),(2,109,300,300),(2,136,350,350),(2,162,350,350),(2,228,350,350),(2,415,1,1),(2,673,300,300),(2,760,1,1),(4,95,350,350),(4,98,300,300),(4,113,300,300),(4,136,350,350),(4,162,350,350),(4,173,350,350),(4,414,1,1),(4,415,1,1),(4,573,1,1),(4,574,1,1),(5,43,6,350),(5,55,6,350),(5,95,38,350),(5,109,300,300),(5,137,300,300),(5,162,1,350),(5,413,1,1),(5,414,1,1),(5,415,1,1),(5,433,1,1),(5,594,1,1),(5,756,1,1),(6,38,1,1),(6,95,43,350),(6,109,300,300),(6,118,1,350),(6,162,1,350),(6,173,1,350),(6,176,1,350),(6,253,1,1),(6,414,1,1),(6,415,1,1),(6,633,1,350),(6,673,300,300),(6,760,1,1),(7,38,1,1),(7,95,350,350),(7,109,300,300),(7,118,350,350),(7,162,350,350),(7,173,350,350),(7,176,350,350),(7,253,1,1),(7,333,1,375),(7,414,1,1),(7,415,1,1),(7,633,350,350),(7,673,300,300),(7,760,1,1),(8,54,350,350),(8,95,350,350),(8,109,300,300),(8,115,300,300),(8,136,350,350),(8,162,350,350),(8,414,1,1),(8,415,1,1),(8,573,1,1),(8,574,1,1),(9,54,350,350),(9,95,350,350),(9,98,300,300),(9,160,350,350),(9,162,350,350),(9,413,1,1),(9,414,1,1),(9,415,1,1),(9,433,1,1),(9,594,1,1),(10,54,1,350),(10,95,1,350),(10,98,300,300),(10,136,1,350),(10,162,1,350),(10,374,1,1),(10,375,1,1),(10,414,1,1),(10,415,1,1),(10,433,1,1),(10,759,300,300),(10,760,1,1),(11,95,65,350),(11,109,300,300),(11,162,1,350),(11,173,2,350),(11,228,1,350),(11,354,1,1),(11,415,1,1),(11,593,1,1),(11,673,300,300),(11,760,1,1),(11,762,75,75),(13,54,1,350),(13,56,1,1),(13,95,1,350),(13,109,300,300),(13,162,1,350),(13,228,1,350),(13,415,1,1),(13,673,300,300),(13,760,1,1),(14,38,1,1),(14,43,350,350),(14,45,350,350),(14,46,350,350),(14,54,350,350),(14,95,350,350),(14,109,300,300),(14,118,350,350),(14,162,350,350),(14,173,350,350),(14,176,350,350),(14,226,350,350),(14,253,1,1),(14,333,7,300),(14,414,1,1),(14,415,1,1),(14,473,1,1),(14,633,350,350),(14,673,300,300),(14,760,1,1),(15,38,1,1),(15,43,350,350),(15,45,350,350),(15,46,350,350),(15,54,350,350),(15,95,350,350),(15,109,300,300),(15,118,350,350),(15,162,350,350),(15,173,350,350),(15,176,350,350),(15,253,1,1),(15,414,1,1),(15,415,1,1),(15,473,1,1),(15,633,350,350),(15,673,300,300),(15,760,1,1),(16,54,1,1275),(16,95,1,1275),(16,109,300,300),(16,136,1,1275),(16,162,1,1275),(16,374,1,1),(16,375,1,1),(16,414,1,1),(16,415,1,1),(16,433,1,1);

/*Table structure for table `character_social` */

drop table if exists `character_social`;

CREATE TABLE `character_social` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `guid` (`guid`),
  KEY `friend` (`friend`),
  KEY `guid_flags` (`guid`,`flags`),
  KEY `friend_flags` (`friend`,`flags`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_social` */

/*Table structure for table `character_spell` */

drop table if exists `character_spell`;

CREATE TABLE `character_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_spell` */

insert into `character_spell` values (1,71,1,0),(1,78,1,0),(1,81,1,0),(1,107,1,0),(1,198,1,0),(1,201,1,0),(1,202,1,0),(1,203,1,0),(1,204,1,0),(1,522,1,0),(1,668,1,0),(1,750,1,0),(1,1715,0,0),(1,2382,1,0),(1,2457,1,0),(1,2479,1,0),(1,2484,1,0),(1,3050,1,0),(1,3273,0,0),(1,3274,0,0),(1,3275,1,0),(1,3365,1,0),(1,3411,1,0),(1,5301,1,0),(1,5925,1,0),(1,6233,1,0),(1,6246,1,0),(1,6247,1,0),(1,6477,1,0),(1,6478,1,0),(1,6562,1,0),(1,6603,1,0),(1,7266,1,0),(1,7267,1,0),(1,7355,1,0),(1,7372,0,0),(1,7373,0,0),(1,7376,0,0),(1,7381,0,0),(1,7924,1,0),(1,8177,1,0),(1,8184,1,0),(1,8386,1,0),(1,8737,1,0),(1,9077,1,0),(1,9078,1,0),(1,9116,1,0),(1,9125,1,0),(1,10537,1,0),(1,10538,1,0),(1,19903,1,0),(1,20579,1,0),(1,21156,0,0),(1,21651,1,0),(1,21652,1,0),(1,22027,1,0),(1,22810,1,0),(1,23920,1,0),(1,25212,1,0),(1,25563,1,0),(1,27623,1,0),(1,28875,1,0),(1,28880,1,0),(1,29932,1,0),(1,32215,1,0),(2,10,1,0),(2,81,1,0),(2,118,1,0),(2,133,1,0),(2,168,1,0),(2,203,1,0),(2,204,1,0),(2,227,1,0),(2,522,1,0),(2,527,1,0),(2,543,1,0),(2,669,1,0),(2,980,1,0),(2,988,1,0),(2,1160,0,0),(2,1459,1,0),(2,2120,1,0),(2,2121,1,0),(2,2139,1,0),(2,2382,1,0),(2,2479,1,0),(2,3050,1,0),(2,3365,1,0),(2,5009,1,0),(2,5019,1,0),(2,5227,1,0),(2,6143,1,0),(2,6190,0,0),(2,6233,1,0),(2,6246,1,0),(2,6247,1,0),(2,6477,1,0),(2,6478,1,0),(2,6603,1,0),(2,7266,1,0),(2,7267,1,0),(2,7355,1,0),(2,7744,1,0),(2,8184,1,0),(2,8386,1,0),(2,8422,1,0),(2,8423,1,0),(2,8457,1,0),(2,8458,1,0),(2,8461,1,0),(2,8462,1,0),(2,9078,1,0),(2,9125,1,0),(2,10060,1,0),(2,10177,1,0),(2,10215,1,0),(2,10216,1,0),(2,10223,1,0),(2,10225,1,0),(2,10537,1,0),(2,10538,1,0),(2,11083,1,0),(2,11366,1,0),(2,11554,0,0),(2,11555,0,0),(2,11556,0,0),(2,11958,1,1),(2,12341,1,0),(2,12350,1,0),(2,12360,1,0),(2,12472,1,0),(2,12475,1,0),(2,12488,1,0),(2,12497,1,0),(2,12505,1,0),(2,12519,1,0),(2,12522,1,0),(2,12523,1,0),(2,12524,1,0),(2,12525,1,0),(2,12526,1,0),(2,12571,1,0),(2,12953,1,0),(2,12985,1,0),(2,13043,1,0),(2,15053,1,0),(2,16758,1,0),(2,16766,1,0),(2,17737,1,0),(2,18809,1,0),(2,20116,1,0),(2,20577,1,0),(2,20579,1,0),(2,21651,1,0),(2,21652,1,0),(2,22027,1,0),(2,22810,1,0),(2,25202,0,0),(2,25203,1,0),(2,25563,1,0),(2,26573,1,0),(2,27128,1,0),(2,28332,1,0),(2,28609,1,0),(2,29440,1,0),(2,30449,1,0),(2,31687,1,0),(2,32375,1,0),(2,32592,1,0),(2,32796,1,0),(2,33763,1,0),(2,34433,1,0),(4,81,1,0),(4,203,1,0),(4,204,1,0),(4,227,1,0),(4,522,1,0),(4,668,1,0),(4,671,1,0),(4,974,1,0),(4,1178,0,0),(4,1180,1,0),(4,2382,1,0),(4,2479,1,0),(4,3025,0,0),(4,3050,1,0),(4,3365,1,0),(4,5176,1,0),(4,5185,1,0),(4,5419,0,0),(4,5420,0,0),(4,5421,0,0),(4,6233,1,0),(4,6246,1,0),(4,6247,1,0),(4,6477,1,0),(4,6478,1,0),(4,6603,1,0),(4,7266,1,0),(4,7267,1,0),(4,7355,1,0),(4,8386,1,0),(4,9077,1,0),(4,9078,1,0),(4,9125,1,0),(4,9635,0,0),(4,16818,1,0),(4,16822,1,0),(4,16840,1,0),(4,16847,1,0),(4,16880,1,0),(4,16901,1,0),(4,16913,1,0),(4,16920,1,0),(4,20580,1,0),(4,20582,1,0),(4,20583,1,0),(4,20585,1,0),(4,21009,1,0),(4,21178,0,0),(4,21651,1,0),(4,21652,1,0),(4,22027,1,0),(4,22810,1,0),(4,24858,1,0),(4,24905,0,0),(4,27746,1,0),(4,27764,1,0),(4,32593,1,0),(4,32594,1,0),(4,33591,1,0),(4,33596,1,0),(4,33602,1,0),(4,33604,1,0),(4,33763,1,0),(4,33831,1,0),(4,33948,0,0),(4,33956,1,0),(4,34123,0,0),(4,35364,1,0),(4,40121,0,0),(4,41635,1,0),(5,81,1,0),(5,107,1,0),(5,201,1,0),(5,202,1,0),(5,203,1,0),(5,204,1,0),(5,522,1,0),(5,635,1,0),(5,669,1,0),(5,813,1,0),(5,822,1,0),(5,2382,1,0),(5,2479,1,0),(5,3050,1,0),(5,3365,1,0),(5,6233,1,0),(5,6246,1,0),(5,6247,1,0),(5,6477,1,0),(5,6478,1,0),(5,6603,1,0),(5,7266,1,0),(5,7267,1,0),(5,7355,1,0),(5,8386,1,0),(5,8737,1,0),(5,9077,1,0),(5,9078,1,0),(5,9116,1,0),(5,9125,1,0),(5,21084,1,0),(5,21651,1,0),(5,21652,1,0),(5,22027,1,0),(5,22810,1,0),(5,27762,1,0),(5,28730,1,0),(5,28734,1,0),(5,28877,1,0),(6,53,0,0),(6,81,1,0),(6,203,1,0),(6,204,1,0),(6,408,0,0),(6,522,1,0),(6,669,1,0),(6,674,1,0),(6,703,0,0),(6,921,1,0),(6,1180,1,0),(6,1725,1,0),(6,1752,0,0),(6,1757,0,0),(6,1758,0,0),(6,1759,0,0),(6,1760,0,0),(6,1766,0,0),(6,1767,0,0),(6,1768,0,0),(6,1769,0,0),(6,1776,0,0),(6,1777,0,0),(6,1784,0,0),(6,1785,0,0),(6,1786,0,0),(6,1787,1,0),(6,1804,1,0),(6,1833,1,0),(6,1842,1,0),(6,1856,0,0),(6,1857,0,0),(6,1860,1,0),(6,1943,0,0),(6,1966,0,0),(6,2070,0,0),(6,2094,1,0),(6,2098,0,0),(6,2382,1,0),(6,2479,1,0),(6,2567,1,0),(6,2589,0,0),(6,2590,0,0),(6,2591,0,0),(6,2764,1,0),(6,2836,1,0),(6,2983,0,0),(6,3050,1,0),(6,3127,1,0),(6,3365,1,0),(6,5171,0,0),(6,5227,1,0),(6,5277,0,0),(6,5938,1,0),(6,6233,1,0),(6,6246,1,0),(6,6247,1,0),(6,6477,1,0),(6,6478,1,0),(6,6603,1,0),(6,6760,0,0),(6,6761,0,0),(6,6762,0,0),(6,6768,0,0),(6,6770,0,0),(6,6774,1,0),(6,7266,1,0),(6,7267,1,0),(6,7355,1,0),(6,7744,1,0),(6,8386,1,0),(6,8621,0,0),(6,8623,0,0),(6,8624,0,0),(6,8629,0,0),(6,8631,0,0),(6,8632,0,0),(6,8633,0,0),(6,8637,0,0),(6,8639,0,0),(6,8640,0,0),(6,8643,1,0),(6,8647,0,0),(6,8649,0,0),(6,8650,0,0),(6,8676,0,0),(6,8696,0,0),(6,8721,0,0),(6,8724,0,0),(6,8725,0,0),(6,9077,1,0),(6,9078,1,0),(6,9125,1,0),(6,11197,0,0),(6,11198,0,0),(6,11267,0,0),(6,11268,0,0),(6,11269,0,0),(6,11273,0,0),(6,11274,0,0),(6,11275,0,0),(6,11279,0,0),(6,11280,0,0),(6,11281,0,0),(6,11285,0,0),(6,11286,0,0),(6,11289,0,0),(6,11290,0,0),(6,11293,0,0),(6,11294,0,0),(6,11297,1,0),(6,11299,0,0),(6,11300,0,0),(6,11303,0,0),(6,11305,1,0),(6,13973,1,0),(6,14065,1,0),(6,14075,1,0),(6,14081,1,0),(6,14083,1,0),(6,14173,1,0),(6,14183,1,0),(6,14185,1,0),(6,16092,1,0),(6,16511,1,0),(6,17737,1,0),(6,20577,1,0),(6,20579,1,0),(6,21184,1,0),(6,21651,1,0),(6,21652,1,0),(6,22027,1,0),(6,22810,1,0),(6,25300,0,0),(6,25302,0,0),(6,26669,1,0),(6,26679,1,0),(6,26839,0,0),(6,26861,0,0),(6,26862,1,0),(6,26863,1,0),(6,26865,1,0),(6,26866,1,0),(6,26867,1,0),(6,26884,1,0),(6,26889,1,0),(6,27441,1,0),(6,27448,1,0),(6,30895,1,0),(6,30906,1,0),(6,31016,0,0),(6,31220,1,0),(6,31224,1,0),(6,31230,1,0),(6,32645,0,0),(6,32684,1,0),(6,36554,1,0),(6,38764,1,0),(6,38768,1,0),(7,17,1,0),(7,53,0,0),(7,81,1,0),(7,203,1,0),(7,204,1,0),(7,408,0,0),(7,522,1,0),(7,592,1,0),(7,600,1,0),(7,669,1,0),(7,674,1,0),(7,703,0,0),(7,921,1,0),(7,1180,1,0),(7,1725,1,0),(7,1752,0,0),(7,1757,0,0),(7,1758,0,0),(7,1759,0,0),(7,1760,0,0),(7,1766,0,0),(7,1767,0,0),(7,1768,0,0),(7,1769,0,0),(7,1776,0,0),(7,1777,0,0),(7,1784,0,0),(7,1785,0,0),(7,1786,0,0),(7,1787,1,0),(7,1804,1,0),(7,1833,1,0),(7,1842,1,0),(7,1856,0,0),(7,1857,0,0),(7,1860,1,0),(7,1943,0,0),(7,1966,0,0),(7,2070,0,0),(7,2094,1,0),(7,2098,0,0),(7,2382,1,0),(7,2479,1,0),(7,2567,1,0),(7,2589,0,0),(7,2590,0,0),(7,2591,0,0),(7,2764,1,0),(7,2836,1,0),(7,2983,0,0),(7,3050,1,0),(7,3127,1,0),(7,3365,1,0),(7,3747,1,0),(7,5171,0,0),(7,5227,1,0),(7,5277,0,0),(7,5938,1,0),(7,6065,1,0),(7,6066,1,0),(7,6233,1,0),(7,6246,1,0),(7,6247,1,0),(7,6477,1,0),(7,6478,1,0),(7,6603,1,0),(7,6760,0,0),(7,6761,0,0),(7,6762,0,0),(7,6768,0,0),(7,6770,0,0),(7,6774,1,0),(7,7266,1,0),(7,7267,1,0),(7,7355,1,0),(7,7411,0,0),(7,7412,0,0),(7,7413,0,0),(7,7418,1,0),(7,7421,1,0),(7,7428,1,0),(7,7744,1,0),(7,8386,1,0),(7,8621,0,0),(7,8623,0,0),(7,8624,0,0),(7,8629,0,0),(7,8631,0,0),(7,8632,0,0),(7,8633,0,0),(7,8637,0,0),(7,8639,0,0),(7,8640,0,0),(7,8643,1,0),(7,8647,0,0),(7,8649,0,0),(7,8650,0,0),(7,8676,0,0),(7,8696,0,0),(7,8721,0,0),(7,8724,0,0),(7,8725,0,0),(7,9077,1,0),(7,9078,1,0),(7,9125,1,0),(7,10898,1,0),(7,10899,1,0),(7,10900,1,0),(7,10901,1,0),(7,11197,0,0),(7,11198,0,0),(7,11267,0,0),(7,11268,0,0),(7,11269,0,0),(7,11273,0,0),(7,11274,0,0),(7,11275,0,0),(7,11279,0,0),(7,11280,0,0),(7,11281,0,0),(7,11285,0,0),(7,11286,0,0),(7,11289,0,0),(7,11290,0,0),(7,11293,0,0),(7,11294,0,0),(7,11297,1,0),(7,11299,0,0),(7,11300,0,0),(7,11303,0,0),(7,11305,1,0),(7,13262,1,0),(7,13920,0,0),(7,16092,1,0),(7,17737,1,0),(7,20577,1,0),(7,20579,1,0),(7,21184,1,0),(7,21651,1,0),(7,21652,1,0),(7,22027,1,0),(7,22810,1,0),(7,25217,1,0),(7,25218,1,0),(7,25300,0,0),(7,25302,0,0),(7,26669,1,0),(7,26679,1,0),(7,26839,0,0),(7,26861,0,0),(7,26862,1,0),(7,26863,1,0),(7,26865,1,0),(7,26866,1,0),(7,26867,1,0),(7,26884,1,0),(7,26889,1,0),(7,27441,1,0),(7,27448,1,0),(7,28029,1,0),(7,31016,0,0),(7,31224,1,0),(7,32645,0,0),(7,32684,1,0),(7,38764,1,0),(7,38768,1,0),(8,81,1,0),(8,198,1,0),(8,203,1,0),(8,204,1,0),(8,227,1,0),(8,522,1,0),(8,669,1,0),(8,670,1,0),(8,1178,0,0),(8,2382,1,0),(8,2479,1,0),(8,3025,0,0),(8,3050,1,0),(8,3365,1,0),(8,5176,1,0),(8,5185,1,0),(8,5419,0,0),(8,5420,0,0),(8,5421,0,0),(8,5570,1,0),(8,6233,1,0),(8,6246,1,0),(8,6247,1,0),(8,6477,1,0),(8,6478,1,0),(8,6603,1,0),(8,7266,1,0),(8,7267,1,0),(8,7355,1,0),(8,8386,1,0),(8,9077,1,0),(8,9078,1,0),(8,9125,1,0),(8,9635,0,0),(8,16818,1,0),(8,16820,1,0),(8,16822,1,0),(8,16835,1,0),(8,16840,1,0),(8,16847,1,0),(8,16864,1,0),(8,16880,1,0),(8,16901,1,0),(8,16913,1,0),(8,16920,1,0),(8,17055,1,0),(8,17067,1,0),(8,20549,1,0),(8,20550,1,0),(8,20551,1,0),(8,20552,1,0),(8,21178,0,0),(8,21651,1,0),(8,21652,1,0),(8,22027,1,0),(8,22810,1,0),(8,24858,1,0),(8,24905,0,0),(8,27764,1,0),(8,33602,1,0),(8,33606,1,0),(8,33831,1,0),(8,33948,0,0),(8,34123,0,0),(8,35364,1,0),(8,40121,0,0),(9,81,1,0),(9,107,1,0),(9,198,1,0),(9,199,1,0),(9,203,1,0),(9,204,1,0),(9,522,1,0),(9,635,1,0),(9,668,1,0),(9,2382,1,0),(9,2479,1,0),(9,3050,1,0),(9,3365,1,0),(9,6233,1,0),(9,6246,1,0),(9,6247,1,0),(9,6477,1,0),(9,6478,1,0),(9,6603,1,0),(9,7266,1,0),(9,7267,1,0),(9,7355,1,0),(9,8386,1,0),(9,8737,1,0),(9,9077,1,0),(9,9078,1,0),(9,9116,1,0),(9,9125,1,0),(9,20597,1,0),(9,20598,1,0),(9,20599,1,0),(9,20600,1,0),(9,20864,1,0),(9,21084,1,0),(9,21651,1,0),(9,21652,1,0),(9,22027,1,0),(9,22810,1,0),(9,27762,1,0),(10,81,1,0),(10,107,1,0),(10,198,1,0),(10,203,1,0),(10,204,1,0),(10,227,1,0),(10,331,1,0),(10,403,1,0),(10,522,1,0),(10,668,1,0),(10,2382,1,0),(10,2479,1,0),(10,3050,1,0),(10,3365,1,0),(10,6233,1,0),(10,6246,1,0),(10,6247,1,0),(10,6477,1,0),(10,6478,1,0),(10,6603,1,0),(10,7266,1,0),(10,7267,1,0),(10,7355,1,0),(10,8386,1,0),(10,9077,1,0),(10,9078,1,0),(10,9116,1,0),(10,9125,1,0),(10,20579,1,0),(10,21651,1,0),(10,21652,1,0),(10,22027,1,0),(10,22810,1,0),(10,27763,1,0),(10,28875,1,0),(10,28878,1,0),(10,28880,1,0),(10,29932,1,0),(11,81,1,0),(11,116,1,0),(11,122,1,0),(11,126,1,0),(11,132,1,0),(11,172,1,0),(11,203,1,0),(11,204,1,0),(11,348,1,0),(11,522,1,0),(11,603,1,0),(11,669,1,0),(11,686,1,0),(11,687,1,0),(11,688,1,0),(11,689,1,0),(11,691,1,0),(11,693,1,0),(11,695,1,0),(11,696,1,0),(11,698,1,0),(11,699,1,0),(11,702,1,0),(11,704,1,0),(11,705,1,0),(11,706,1,0),(11,707,1,0),(11,709,1,0),(11,710,1,0),(11,755,1,0),(11,865,1,0),(11,980,1,0),(11,1014,1,0),(11,1086,1,0),(11,1088,1,0),(11,1094,1,0),(11,1098,1,0),(11,1106,1,0),(11,1108,1,0),(11,1120,1,0),(11,1180,1,0),(11,1454,1,0),(11,1455,1,0),(11,1456,1,0),(11,1490,1,0),(11,1714,1,0),(11,1949,1,0),(11,2362,1,0),(11,2382,1,0),(11,2479,1,0),(11,2941,1,0),(11,3050,1,0),(11,3365,1,0),(11,3698,1,0),(11,3699,1,0),(11,3700,1,0),(11,5009,1,0),(11,5019,1,0),(11,5138,1,0),(11,5227,1,0),(11,5484,1,0),(11,5500,1,0),(11,5676,1,0),(11,5697,1,0),(11,5699,1,0),(11,5740,1,0),(11,5782,1,0),(11,5784,1,0),(11,6131,1,0),(11,6201,1,0),(11,6202,1,0),(11,6205,1,0),(11,6213,1,0),(11,6215,1,0),(11,6217,1,0),(11,6219,1,0),(11,6222,1,0),(11,6223,1,0),(11,6226,1,0),(11,6229,1,0),(11,6233,1,0),(11,6246,1,0),(11,6247,1,0),(11,6353,1,0),(11,6366,1,0),(11,6477,1,0),(11,6478,1,0),(11,6562,1,0),(11,6603,1,0),(11,6789,1,0),(11,7266,1,0),(11,7267,1,0),(11,7355,1,0),(11,7641,1,0),(11,7646,1,0),(11,7648,1,0),(11,7651,1,0),(11,7658,1,0),(11,7659,1,0),(11,7744,1,0),(11,8288,1,0),(11,8289,1,0),(11,8386,1,0),(11,9078,1,0),(11,9125,1,0),(11,10230,1,0),(11,11659,1,0),(11,11660,1,0),(11,11661,1,0),(11,11665,1,0),(11,11667,1,0),(11,11668,1,0),(11,11671,1,0),(11,11672,1,0),(11,11675,1,0),(11,11677,1,0),(11,11678,1,0),(11,11683,1,0),(11,11684,1,0),(11,11687,1,0),(11,11688,1,0),(11,11689,1,0),(11,11693,1,0),(11,11694,1,0),(11,11695,1,0),(11,11699,1,0),(11,11700,1,0),(11,11703,1,0),(11,11704,1,0),(11,11707,1,0),(11,11708,1,0),(11,11711,1,0),(11,11712,1,0),(11,11713,1,0),(11,11717,1,0),(11,11719,1,0),(11,11721,1,0),(11,11722,1,0),(11,11725,1,0),(11,11726,1,0),(11,11729,1,0),(11,11730,1,0),(11,11733,1,0),(11,11734,1,0),(11,11735,1,0),(11,11739,1,0),(11,11740,1,0),(11,17727,1,0),(11,17728,1,0),(11,17737,1,0),(11,17919,1,0),(11,17920,1,0),(11,17921,1,0),(11,17922,1,0),(11,17923,1,0),(11,17924,1,0),(11,17925,1,0),(11,17926,1,0),(11,17928,1,0),(11,17951,1,0),(11,17952,1,0),(11,17953,1,0),(11,18647,1,0),(11,18696,1,0),(11,18701,1,0),(11,18707,1,0),(11,18708,1,0),(11,18710,1,0),(11,18731,1,0),(11,18750,1,0),(11,20577,1,0),(11,20579,1,0),(11,20752,1,0),(11,20755,1,0),(11,20756,1,0),(11,20757,1,0),(11,21651,1,0),(11,21652,1,0),(11,22027,1,0),(11,22810,1,0),(11,25307,1,0),(11,25309,1,0),(11,25311,1,0),(11,27209,1,0),(11,27210,1,0),(11,27211,1,0),(11,27212,1,0),(11,27213,1,0),(11,27215,1,0),(11,27216,1,0),(11,27217,1,0),(11,27218,1,0),(11,27219,1,0),(11,27220,1,0),(11,27221,1,0),(11,27222,1,0),(11,27223,1,0),(11,27224,1,0),(11,27226,1,0),(11,27228,1,0),(11,27230,1,0),(11,27238,1,0),(11,27243,1,0),(11,27250,1,0),(11,27259,1,0),(11,27260,1,0),(11,28172,1,0),(11,28176,1,0),(11,28189,1,0),(11,28610,1,0),(11,29722,1,0),(11,29858,1,0),(11,29893,1,0),(11,30459,1,0),(11,30482,1,0),(11,30545,1,0),(11,30908,1,0),(11,30909,1,0),(11,30910,1,0),(11,31687,1,0),(11,32231,1,0),(11,33388,1,0),(11,36563,1,0),(13,10,1,0),(13,81,1,0),(13,198,1,0),(13,203,1,0),(13,204,1,0),(13,522,1,0),(13,585,1,0),(13,605,1,0),(13,669,1,0),(13,2050,1,0),(13,2096,1,0),(13,2382,1,0),(13,2479,1,0),(13,3050,1,0),(13,3365,1,0),(13,5009,1,0),(13,5019,1,0),(13,5227,1,0),(13,6141,1,0),(13,6233,1,0),(13,6246,1,0),(13,6247,1,0),(13,6477,1,0),(13,6478,1,0),(13,6603,1,0),(13,7266,1,0),(13,7267,1,0),(13,7355,1,0),(13,7744,1,0),(13,8386,1,0),(13,8427,1,0),(13,9078,1,0),(13,9125,1,0),(13,10185,1,0),(13,10186,1,0),(13,10187,1,0),(13,10909,1,0),(13,10911,1,0),(13,10912,1,0),(13,17737,1,0),(13,20577,1,0),(13,20579,1,0),(13,21651,1,0),(13,21652,1,0),(13,22027,1,0),(13,22810,1,0),(13,34433,1,0),(14,53,0,0),(14,81,1,0),(14,198,1,0),(14,201,1,0),(14,203,1,0),(14,204,1,0),(14,264,1,0),(14,266,1,0),(14,408,0,0),(14,522,1,0),(14,669,1,0),(14,674,1,0),(14,703,0,0),(14,921,1,0),(14,1180,1,0),(14,1725,1,0),(14,1752,0,0),(14,1757,0,0),(14,1758,0,0),(14,1759,0,0),(14,1760,0,0),(14,1766,0,0),(14,1767,0,0),(14,1768,0,0),(14,1769,0,0),(14,1776,0,0),(14,1777,0,0),(14,1784,0,0),(14,1785,0,0),(14,1786,0,0),(14,1787,1,0),(14,1804,1,0),(14,1833,1,0),(14,1842,1,0),(14,1856,0,0),(14,1857,0,0),(14,1860,1,0),(14,1943,0,0),(14,1966,0,0),(14,2070,0,0),(14,2094,1,0),(14,2098,0,0),(14,2382,1,0),(14,2479,1,0),(14,2567,1,0),(14,2589,0,0),(14,2590,0,0),(14,2591,0,0),(14,2764,1,0),(14,2836,1,0),(14,2983,0,0),(14,3018,1,0),(14,3050,1,0),(14,3127,1,0),(14,3365,1,0),(14,5011,1,0),(14,5171,0,0),(14,5227,1,0),(14,5277,0,0),(14,5938,1,0),(14,6233,1,0),(14,6246,1,0),(14,6247,1,0),(14,6477,1,0),(14,6478,1,0),(14,6603,1,0),(14,6760,0,0),(14,6761,0,0),(14,6762,0,0),(14,6768,0,0),(14,6770,0,0),(14,6774,1,0),(14,7266,1,0),(14,7267,1,0),(14,7355,1,0),(14,7411,0,0),(14,7412,0,0),(14,7413,0,0),(14,7418,1,0),(14,7421,1,0),(14,7428,1,0),(14,7744,1,0),(14,8386,1,0),(14,8621,0,0),(14,8623,0,0),(14,8624,0,0),(14,8629,0,0),(14,8631,0,0),(14,8632,0,0),(14,8633,0,0),(14,8637,0,0),(14,8639,0,0),(14,8640,0,0),(14,8643,1,0),(14,8647,0,0),(14,8649,0,0),(14,8650,0,0),(14,8676,0,0),(14,8696,0,0),(14,8721,0,0),(14,8724,0,0),(14,8725,0,0),(14,9077,1,0),(14,9078,1,0),(14,9125,1,0),(14,11197,0,0),(14,11198,0,0),(14,11267,0,0),(14,11268,0,0),(14,11269,0,0),(14,11273,0,0),(14,11274,0,0),(14,11275,0,0),(14,11279,0,0),(14,11280,0,0),(14,11281,0,0),(14,11285,0,0),(14,11286,0,0),(14,11289,0,0),(14,11290,0,0),(14,11293,0,0),(14,11294,0,0),(14,11297,1,0),(14,11299,0,0),(14,11300,0,0),(14,11303,0,0),(14,11305,1,0),(14,13262,1,0),(14,13920,1,0),(14,13921,1,0),(14,13973,1,0),(14,13980,1,0),(14,14065,1,0),(14,14066,1,0),(14,14083,1,0),(14,14094,1,0),(14,14137,1,0),(14,14142,1,0),(14,14161,1,0),(14,14164,1,0),(14,14173,1,0),(14,14179,1,0),(14,14183,1,0),(14,14185,1,0),(14,15590,1,0),(14,16092,1,0),(14,16511,1,0),(14,16515,1,0),(14,17737,1,0),(14,20235,1,0),(14,20577,1,0),(14,20579,1,0),(14,21184,1,0),(14,21651,1,0),(14,21652,1,0),(14,22027,1,0),(14,22810,1,0),(14,25300,0,0),(14,25302,0,0),(14,26669,1,0),(14,26679,1,0),(14,26839,0,0),(14,26861,0,0),(14,26862,1,0),(14,26863,1,0),(14,26865,1,0),(14,26866,1,0),(14,26867,1,0),(14,26884,1,0),(14,26889,1,0),(14,27441,1,0),(14,27448,1,0),(14,27984,1,0),(14,30895,1,0),(14,30906,1,0),(14,31016,0,0),(14,31220,1,0),(14,31224,1,0),(14,31230,1,0),(14,32645,0,0),(14,32684,1,0),(14,36554,1,0),(14,38764,1,0),(14,38768,1,0),(15,53,0,0),(15,81,1,0),(15,198,1,0),(15,201,1,0),(15,203,1,0),(15,204,1,0),(15,264,1,0),(15,266,1,0),(15,408,0,0),(15,522,1,0),(15,669,1,0),(15,674,1,0),(15,703,0,0),(15,921,1,0),(15,1180,1,0),(15,1725,1,0),(15,1752,0,0),(15,1757,0,0),(15,1758,0,0),(15,1759,0,0),(15,1760,0,0),(15,1766,0,0),(15,1767,0,0),(15,1768,0,0),(15,1769,0,0),(15,1776,0,0),(15,1777,0,0),(15,1784,0,0),(15,1785,0,0),(15,1786,0,0),(15,1787,1,0),(15,1804,1,0),(15,1833,1,0),(15,1842,1,0),(15,1856,0,0),(15,1857,0,0),(15,1860,1,0),(15,1943,0,0),(15,1966,0,0),(15,2070,0,0),(15,2094,1,0),(15,2098,0,0),(15,2382,1,0),(15,2479,1,0),(15,2567,1,0),(15,2589,0,0),(15,2590,0,0),(15,2591,0,0),(15,2764,0,0),(15,2836,1,0),(15,2983,0,0),(15,3018,1,0),(15,3050,1,0),(15,3127,1,0),(15,3365,1,0),(15,5171,0,0),(15,5227,1,0),(15,5277,0,0),(15,5938,1,0),(15,6233,1,0),(15,6246,1,0),(15,6247,1,0),(15,6477,1,0),(15,6478,1,0),(15,6603,1,0),(15,6760,0,0),(15,6761,0,0),(15,6762,0,0),(15,6768,0,0),(15,6770,0,0),(15,6774,1,0),(15,7266,1,0),(15,7267,1,0),(15,7355,1,0),(15,7744,1,0),(15,8386,1,0),(15,8621,0,0),(15,8623,0,0),(15,8624,0,0),(15,8629,0,0),(15,8631,0,0),(15,8632,0,0),(15,8633,0,0),(15,8637,0,0),(15,8639,0,0),(15,8640,0,0),(15,8643,1,0),(15,8647,0,0),(15,8649,0,0),(15,8650,0,0),(15,8676,0,0),(15,8696,0,0),(15,8721,0,0),(15,8724,0,0),(15,8725,0,0),(15,9077,1,0),(15,9078,1,0),(15,9125,1,0),(15,11197,0,0),(15,11198,0,0),(15,11267,0,0),(15,11268,0,0),(15,11269,0,0),(15,11273,0,0),(15,11274,0,0),(15,11275,0,0),(15,11279,0,0),(15,11280,0,0),(15,11281,0,0),(15,11285,0,0),(15,11286,0,0),(15,11289,0,0),(15,11290,0,0),(15,11293,0,0),(15,11294,0,0),(15,11297,1,0),(15,11299,0,0),(15,11300,0,0),(15,11303,0,0),(15,11305,1,0),(15,13792,1,0),(15,13863,1,0),(15,13973,1,0),(15,13980,1,0),(15,14062,1,0),(15,14066,1,0),(15,14071,1,0),(15,14075,1,0),(15,14081,1,0),(15,14083,1,0),(15,14094,1,0),(15,14173,1,0),(15,14183,1,0),(15,14185,1,0),(15,14278,1,0),(15,15590,1,0),(15,16092,1,0),(15,16511,1,0),(15,17737,1,0),(15,20577,1,0),(15,20579,1,0),(15,21184,1,0),(15,21651,1,0),(15,21652,1,0),(15,22027,1,0),(15,22810,1,0),(15,25300,0,0),(15,25302,0,0),(15,26669,1,0),(15,26679,1,0),(15,26839,0,0),(15,26861,0,0),(15,26862,1,0),(15,26863,1,0),(15,26865,1,0),(15,26866,1,0),(15,26867,1,0),(15,26884,1,0),(15,26889,1,0),(15,27441,1,0),(15,27448,1,0),(15,30893,1,0),(15,30906,1,0),(15,31016,0,0),(15,31213,1,0),(15,31220,1,0),(15,31223,1,0),(15,31224,1,0),(15,31230,1,0),(15,32645,0,0),(15,32684,1,0),(15,36554,1,0),(15,38764,1,0),(15,38768,1,0),(16,81,1,0),(16,107,1,0),(16,198,1,0),(16,203,1,0),(16,204,1,0),(16,227,1,0),(16,331,1,0),(16,403,1,0),(16,522,1,0),(16,633,1,0),(16,669,1,0),(16,2382,1,0),(16,2479,1,0),(16,2800,1,0),(16,3050,1,0),(16,3365,1,0),(16,6233,1,0),(16,6246,1,0),(16,6247,1,0),(16,6477,1,0),(16,6478,1,0),(16,6603,1,0),(16,7266,1,0),(16,7267,1,0),(16,7355,1,0),(16,8386,1,0),(16,9077,1,0),(16,9078,1,0),(16,9116,1,0),(16,9125,1,0),(16,10310,1,0),(16,20235,1,0),(16,20573,1,0),(16,20574,1,0),(16,21563,1,0),(16,21651,1,0),(16,21652,1,0),(16,22027,1,0),(16,22810,1,0),(16,27154,1,0),(16,27763,1,0),(16,33697,1,0);

/*Table structure for table `character_spell_cooldown` */

drop table if exists `character_spell_cooldown`;

CREATE TABLE `character_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `character_spell_cooldown` */

insert into `character_spell_cooldown` values (6,36554,0,1319215604),(10,28880,0,1319217208),(16,27154,0,1319404478),(16,33697,0,1319402197);

/*Table structure for table `character_tutorial` */

drop table if exists `character_tutorial`;

CREATE TABLE `character_tutorial` (
  `account` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Account Identifier',
  `realmid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Realm Identifier',
  `tut0` int(11) unsigned NOT NULL DEFAULT '0',
  `tut1` int(11) unsigned NOT NULL DEFAULT '0',
  `tut2` int(11) unsigned NOT NULL DEFAULT '0',
  `tut3` int(11) unsigned NOT NULL DEFAULT '0',
  `tut4` int(11) unsigned NOT NULL DEFAULT '0',
  `tut5` int(11) unsigned NOT NULL DEFAULT '0',
  `tut6` int(11) unsigned NOT NULL DEFAULT '0',
  `tut7` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`,`realmid`),
  KEY `acc_key` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `character_tutorial` */

insert into `character_tutorial` values (1,1,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295),(7,1,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295),(9,1,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,4294967295);

/*Table structure for table `characters` */

drop table if exists `characters`;

CREATE TABLE `characters` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `data` longtext,
  `name` varchar(12) NOT NULL DEFAULT '',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `money` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes` int(10) unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `playerFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dungeon_difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` longtext,
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `totaltime` int(11) unsigned NOT NULL DEFAULT '0',
  `leveltime` int(11) unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int(11) unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extra_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `at_login` int(11) unsigned NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `arenaPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `todayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayHonorPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `totalKills` int(10) unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint(5) unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int(10) unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int(10) unsigned NOT NULL DEFAULT '0',
  `drunk` smallint(5) unsigned NOT NULL DEFAULT '0',
  `health` int(10) unsigned NOT NULL DEFAULT '0',
  `powerMana` int(10) unsigned NOT NULL DEFAULT '0',
  `powerRage` int(10) unsigned NOT NULL DEFAULT '0',
  `powerFocus` int(10) unsigned NOT NULL DEFAULT '0',
  `powerEnergy` int(10) unsigned NOT NULL DEFAULT '0',
  `powerHappiness` int(10) unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int(11) unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` bigint(20) DEFAULT NULL,
  `latency` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `characters` */

insert into `characters` values (1,1,'1 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8654 0 4998087 0 100 0 8654 0 5000000 0 100 0 70 1629 16777483 0 0 0 0 0 0 0 0 0 4104 0 2457 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 31 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1161117696 1157234688 1157234688 1053240066 1069547520 16125 16125 0 1127827749 1127958821 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 345 93 439 34 53 1128726528 0 1134133248 0 0 0 0 0 0 0 7601 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 4444 10241 880 0 0 153 0 0 1102502766 1103027054 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 0 0 67371776 33554435 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33730 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33732 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23473 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33728 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33731 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23475 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33729 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23346 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 195 1073741824 0 0 197 1073741824 2 1073741824 193 1073741824 0 0 196 1073741824 6 1073741824 0 0 194 1073741824 0 0 0 0 0 0 0 0 0 0 8 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 1073741824 12 1073741824 157 1073741824 158 1073741824 159 1073741824 160 1073741824 192 1073741824 191 1073741824 0 0 0 0 0 0 4 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 26 65537 0 95 22937950 0 54 22937950 0 43 22937950 0 55 22937950 0 162 22937950 0 98 19661100 0 413 65537 0 414 65537 0 415 65537 0 433 65537 0 760 65537 0 759 19661100 0 129 14745601 0 293 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 58 2 0 0 1084227584 1081499986 0 0 0 1094972446 0 0 0 1077936128 0 0 0 0 0 16 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1077936128 0 0 2097152 16408 1024 139264 0 0 0 8388608 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 4294967044 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 36 36 0 183 183 0 0 0 0 150 150 150 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Gaine',11,1,0,70,0,0,67371776,33554435,128,-2043.94,6668.01,13.052,530,0,0,4.81522,'0 0 536870912 8 0 0 1048576 0 ',0,1,6592,6592,1318883622,0,0,0,0,1.83746e+033,0,0,0,0,0,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,8654,0,4998087,0,100,0,NULL,NULL,NULL,4),(2,1,'2 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3733 4196 0 0 100 0 3733 4196 1000 0 100 0 70 35 67589 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1161117696 1157234688 1157234688 1065353216 1069547520 58 58 0 1089590301 1092151822 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 32 37 52 149 150 0 0 0 0 0 0 0 0 0 0 79 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 2241 3393 10240 22 0 0 27 0 0 1083927991 1086025143 0 0 0 0 0 0 0 0 0 3170222735 0 3170222735 0 0 0 0 0 0 8 0 0 134349061 33554436 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6096 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6140 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1395 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 55 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 18 1073741824 14 1073741824 0 0 16 1073741824 22 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937950 0 8 65537 0 6 65537 0 162 22937950 0 136 22937950 0 109 19661100 0 228 22937950 0 415 65537 0 673 19661100 0 760 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 0 0 0 1084096512 0 0 0 1084096512 0 0 0 1076971438 1076971438 1076971438 1076971438 1076971438 1076971438 0 0 0 0 2147483648 0 0 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 512 0 0 0 0 0 0 0 0 0 4194304 0 0 0 0 0 8192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1099472611 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Opif',5,8,1,70,0,0,134349061,33554436,8,-2491.09,6826.28,20.9442,530,0,0,4.11745,'1024 0 0 4 0 0 1048576 0 ',0,1,15789,15789,1319217405,0,0,0,0,2.41551e+033,0,0,0,0,1,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,3733,4196,0,0,100,0,NULL,NULL,NULL,3),(4,7,'4 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4254 3890 0 0 100 0 4254 3890 1000 0 100 0 70 4 2820 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1161117696 1157234688 1157234688 1053240066 1069547520 55 55 0 1105775821 1106824397 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 73 75 82 120 133 0 0 0 0 0 0 0 0 0 0 155 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 0 2370 3614 10240 126 0 0 65 0 0 1092915785 1093964361 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 263428 33554432 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6123 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3661 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 48 1073741824 0 0 50 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 46 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 52 1073741824 54 1073741824 56 1073741824 138 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937950 0 162 22937950 0 136 22937950 0 98 19661100 0 113 19661100 0 173 22937950 0 574 65537 0 573 65537 0 414 65537 0 415 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 2 0 0 0 1082612777 0 0 0 1081966854 0 0 0 1079410425 1079410425 1079410425 1079410425 1079410425 1079410425 2 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 131072 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16384 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 30 30 30 30 30 30 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 30 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1098896008 1075419546 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Pedor',4,11,0,70,0,0,263428,33554432,0,1244.73,-4395.92,27.948,1,0,0,0.656575,'100663296 0 0 8 0 0 1048576 0 ',0,1,2793,2440,1318242995,0,0,0,0,2.53721e+033,0,0,0,0,4,0,0,14,0,'',0,0,0,0,0,0,0,0,4294967295,0,4254,3890,0,0,100,0,NULL,NULL,NULL,2),(5,1,'5 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4296 3316 0 0 100 0 4387 3978 1000 0 100 0 70 1610 66058 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1161117696 1157234688 1157234688 1065353216 1069547520 15475 15475 0 1119527146 1119789290 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 123 79 119 87 88 0 0 0 0 0 0 0 0 0 0 162 5 5 5 5 5 5 0 1084227584 1084227584 1084227584 1084227584 1084227584 1084227584 0 0 0 0 0 0 0 2953 3377 10241 436 0 0 69 0 0 1093514971 1094563547 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 118097669 33554442 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 24143 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 24145 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 24146 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23346 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35039 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 58 1073741824 0 0 0 0 60 1073741824 62 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 64 1073741824 0 0 71 1073741824 0 0 0 0 0 0 0 0 0 0 66 1073741824 68 1073741824 70 1073741824 72 1073741824 73 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937638 0 43 22937606 0 55 22937606 0 162 22937601 0 594 65537 0 109 19661100 0 137 19661100 0 756 65537 0 413 65537 0 414 65537 0 415 65537 0 433 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 61 2 0 0 0 0 0 0 0 0 1081341902 0 0 1083017528 1083017528 1083017528 1083017528 1083017528 1083017528 5 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 513 0 0 0 0 0 6144 0 16384 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1089796967 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Westcost',10,2,1,70,0,0,118097669,33554442,0,-3609.27,4653.73,-22.1445,530,0,0,2.2671,'0 0 131072 4 0 0 1048576 0 ',0,1,342,342,1319216778,0,0,0,0,3.40428e+021,0,0,0,0,0,0,0,3519,0,'',0,0,0,0,0,0,0,0,4294967295,0,4296,3316,0,0,100,0,NULL,NULL,NULL,1),(6,1,'6 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3799 0 0 0 100 0 4424 0 1000 0 100 0 70 5 50332677 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7267 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 9 0 0 0 4605510 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1153957888 1157234688 1155596288 1053240066 1069547520 57 57 0 1112121204 1112383348 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 94 179 90 37 63 0 0 0 0 0 0 0 0 0 0 360 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 3704 10240 393 0 1036831952 239 0 0 1107153949 1107749390 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 84214020 33554441 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2105 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 121 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2092 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25861 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 77 1073741824 0 0 0 0 79 1073741824 81 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 75 1073741824 0 0 85 1073741824 0 0 0 0 0 0 0 0 0 0 83 1073741824 87 1073741824 88 1073741824 89 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937643 0 162 22937601 0 109 19661100 0 173 22937601 0 38 65537 0 253 65537 0 176 22937601 0 414 65537 0 415 65537 0 673 19661100 0 760 65537 0 118 22937601 0 633 22937601 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 512 0 0 0 0 0 0 0 0 0 4194304 0 0 0 16408 0 131072 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2144007436 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 4294966736 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Rvr',5,4,0,70,0,2144007436,84214020,33554441,0,-2322.37,6713.66,0.62778,530,0,0,3.25444,'1024 0 0 4 0 0 1048576 0 ',0,1,457,457,1319215587,0,0,0,0,2.41551e+033,0,0,0,0,0,0,0,3518,1317749019,'',0,0,0,0,0,0,0,0,4294967295,0,3799,0,0,0,100,0,NULL,NULL,NULL,3),(7,7,'7 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4080 0 0 0 100 0 4424 0 1000 0 100 0 70 5 50332677 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1155596288 1153957888 1155596288 1053240066 1069547520 57 57 0 1122384516 1126964546 1102225643 1102487787 0 0 0 0 0 0 0 1065353216 0 0 0 0 94 168 90 37 63 0 1094713344 0 0 0 0 0 0 0 0 350 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 3704 10240 382 0 0 228 0 0 1106412457 1107378644 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 0 0 100927493 33554433 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2105 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 121 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1370 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20578 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2092 0 643 0 0 0 0 0 0 0 0 0 0 0 0 0 25861 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 93 1073741824 0 0 0 0 95 1073741824 97 1073741824 142 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 137 1073741824 91 1073741824 101 1073741824 0 0 0 0 0 0 0 0 0 0 136 1073741824 103 1073741824 0 0 117 1073741824 139 1073741824 140 1073741824 141 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 38 65537 0 95 22937950 0 109 19661100 0 118 22937950 0 162 22937950 0 173 22937950 0 176 22937950 0 253 65537 0 333 24576001 0 414 65537 0 415 65537 0 633 22937950 0 673 19661100 0 760 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 61 1 0 0 0 1090120582 1084227584 0 0 1081731974 1081731974 1081731974 0 0 0 0 0 0 0 3 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 512 0 0 0 0 0 0 0 0 0 1073741824 0 0 0 0 0 8192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2144007436 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Drea',5,4,0,70,0,2144007436,100927493,33554433,128,-2000.29,6666.67,13.7115,530,0,0,3.23634,'1024 0 0 4 0 0 1048576 0 ',0,1,8612,8612,1319395597,0,0,0,0,0,0,6.92747e-031,0,0,8,0,0,3518,1317939310,'',0,0,0,0,0,0,0,0,4294967295,0,4080,0,0,0,100,0,NULL,NULL,NULL,0),(8,1,'8 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1261 3815 0 0 100 0 4498 3815 1000 0 100 0 70 6 2822 0 0 0 0 0 0 0 0 0 4104 0 16864 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 31 0 0 0 0 0 0 0 0 0 0 0 0 0 4605510 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4096 1161117696 1157234688 1157234688 1053240066 1069547520 59 59 0 1107404859 1107929147 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 81 65 85 115 135 0 0 0 0 0 0 0 0 0 0 135 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 0 2370 3614 10240 142 0 0 55 0 0 1091417820 1092466396 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33554704 33554438 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6139 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6124 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 107 1073741824 0 0 109 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 105 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 111 1073741824 113 1073741824 115 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937950 0 54 22937950 0 162 22937950 0 136 22937950 0 109 19661100 0 115 19661100 0 574 65537 0 573 65537 0 414 65537 0 415 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 2 0 0 0 1076048691 0 0 0 1080289132 0 0 0 1079148282 1079148282 1079148282 1079148282 1079148282 1079148282 3 0 0 0 2147483648 0 0 0 0 262144 0 0 0 8388608 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 4194304 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1096289172 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Redalol',6,11,0,70,0,0,33554704,33554438,0,-2326.71,6716.14,-0.180686,530,0,0,2.72822,'2097152 0 0 4 0 0 1048576 0 ',0,1,2513,2513,1319216589,0,0,0,0,2.41551e+033,0,1.7091,1.4013e-045,0,0,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,1261,3815,0,0,100,0,NULL,NULL,NULL,3),(9,7,'9 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4847 3918 0 0 100 0 4847 3918 1000 0 100 0 70 1 513 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1179010630 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4098 1164325745 1156731161 1156731161 1065353216 1069547520 49 49 0 1141369359 1144629775 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 177 77 165 83 97 1112276992 0 1110704128 0 0 0 0 0 0 0 156 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2953 3377 10240 544 0 0 67 0 0 1093215378 1094263954 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 134808580 33554436 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 45 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 44 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 43 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32332 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 30063 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 119 1073741824 0 0 0 0 123 1073741824 121 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 135 1073741824 0 0 133 1073741824 0 0 0 0 0 0 0 0 0 0 125 1073741824 129 1073741824 131 1073741824 132 1073741824 134 1073741824 127 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937950 0 54 22937950 0 160 22937950 0 162 22937950 0 594 65537 0 98 19661100 0 413 65537 0 414 65537 0 415 65537 0 433 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 61 2 0 0 1084227584 1081006358 0 5 0 1085178127 1085178127 0 0 1082912670 1082912670 1082912670 1082912670 1082912670 1082912670 7 0 0 0 2684354560 0 0 0 0 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1024 0 0 0 0 536870912 0 0 0 0 0 80 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 38 38 0 0 0 0 0 0 0 50 50 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1090773196 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Alolater',1,2,0,70,0,0,134808580,33554436,0,1275.51,-4403.85,26.3164,1,0,0,2.68418,'2 0 0 8 0 0 1048576 0 ',0,1,2650,2650,1318794248,0,0,0,0,8.65218e-041,0,-4.85658e+037,-8.7151e+029,0,256,0,0,14,1318794542,'',0,0,0,0,0,0,0,0,4294967295,0,4847,3918,0,0,100,0,NULL,NULL,NULL,2),(10,7,'10 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4109 4313 0 0 100 0 4109 4313 1000 0 100 0 70 1629 67339 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1156415488 1157234688 1157234688 1053240066 1069547520 16126 16126 0 1110767792 1111292080 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 103 61 113 109 122 0 0 0 0 0 0 0 0 0 0 124 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 2958 3159 10240 326 0 0 51 0 0 1090818633 1091867209 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16973824 33554435 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23345 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23344 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23348 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 144 1073741824 0 0 0 0 146 1073741824 148 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 152 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 150 1073741824 154 1073741824 156 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937601 0 54 22937601 0 162 22937601 0 136 22937601 0 374 65537 0 375 65537 0 98 19661100 0 414 65537 0 415 65537 0 433 65537 0 760 65537 0 759 19661100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 61 2 0 0 0 0 0 0 0 0 0 0 0 1080299619 1080299619 1080299619 1080299619 1080299619 1080299619 4 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1077936128 0 0 0 0 0 8192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1094587476 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Koil',11,7,1,70,0,0,16973824,33554435,0,-2491.03,6834.37,20.8153,530,0,0,4.27487,'0 0 536870912 8 0 0 1048576 0 ',0,1,567,567,1319217175,0,0,0,0,2.41551e+033,0,0,0,0,0,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,4109,4313,0,0,100,0,NULL,NULL,NULL,59),(11,7,'11 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 499973849 4343 0 0 100 0 500000000 4343 1000 0 100 0 70 5 2309 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1153957888 1157234688 1157234688 1065353216 1069547520 57 57 0 1085425957 1087523109 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 50 56 88 131 129 0 0 0 0 0 0 0 0 0 0 117 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 2615 3490 10240 40 0 0 46 0 0 1089620261 1091118226 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 17171461 33554434 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 6129 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1396 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 59 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2092 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 162 1073741824 0 0 164 1073741824 166 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 168 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 170 1073741824 172 1073741824 174 1073741824 0 0 0 0 0 0 0 0 248 1073741824 249 1073741824 250 1073741824 251 1073741824 252 1073741824 253 1073741824 254 1073741824 255 1073741824 243 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937665 0 162 22937601 0 109 19661100 0 593 65537 0 354 65537 0 173 22937602 0 228 22937601 0 415 65537 0 673 19661100 0 760 65537 0 762 4915275 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 42 2 0 0 0 0 0 0 0 0 0 0 0 1079186869 1079186869 1079186869 1079186869 1079186869 1079186869 1 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 512 0 0 0 0 0 0 0 0 0 4194304 0 0 0 0 0 8192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2143930937 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1096570435 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Lock',5,9,0,70,0,2143930937,17171461,33554434,2,-2328.09,6713.35,-0.196513,530,0,0,1.11423,'1024 0 0 4 0 0 1048576 0 ',0,1,9992,9992,1319216779,0,0,0,0,2.41551e+033,0,1.7091,1.4013e-045,0,0,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,499973849,4343,0,0,100,0,NULL,NULL,NULL,3),(13,1,'13 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 9569 5540 0 0 100 0 10071 10275 1000 0 100 0 70 5 1285 0 0 0 0 0 0 0 0 0 4104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1155596288 1157234688 1157234688 1053240066 1069547520 57 57 0 1099012506 1124873012 0 0 0 0 0 0 0 0 0 1063988078 0 0 0 0 38 43 686 529 156 0 0 1142734848 1136721920 0 0 0 0 0 0 2591 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 2620 3391 10240 28 0 0 33 0 0 1085725550 1087822702 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 384 0 0 50659842 33554443 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35084 0 0 0 3211 0 0 0 0 0 0 0 0 0 0 0 34204 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35086 0 0 3283 3283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35087 0 0 3283 3283 3283 0 0 0 0 0 0 0 0 0 0 30888 0 0 3283 3283 0 0 0 0 0 0 0 0 0 0 0 35085 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 30894 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32586 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35083 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 29309 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32528 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35700 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28823 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32331 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 34335 0 0 3283 0 0 0 0 0 0 0 0 0 0 0 0 34206 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 215 1073741824 224 1073741824 217 1073741824 0 0 218 1073741824 220 1073741824 216 1073741824 221 1073741824 222 1073741824 214 1073741824 226 1073741824 227 1073741824 228 1073741824 229 1073741824 223 1073741824 230 1073741824 225 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 236 1073741824 237 1073741824 238 1073741824 239 1073741824 240 1073741824 241 1073741824 242 1073741824 231 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 95 22937601 0 54 22937601 0 162 22937601 0 56 65537 0 109 19661100 0 228 22937601 0 415 65537 0 673 19661100 0 760 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 61 2 0 0 0 0 0 0 0 0 0 0 0 1092689081 1092689081 1092689081 1092689081 1092689081 1092689081 0 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 512 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8192 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 811 811 811 811 811 811 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1472 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 33 0 0 49 0 0 0 180 180 180 0 0 135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1109462948 1088002458 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Gainez',5,5,0,70,0,0,50659842,33554443,384,-2030.79,6660.99,13.0513,530,0,0,0.265176,'1024 0 0 4 0 0 1048576 0 ',0,1,909,909,1319237285,0,0,0,0,2.41551e+033,0,0,0,0,0,0,0,3518,0,'',0,0,0,0,0,0,0,0,4294967295,0,9569,5540,0,0,100,0,NULL,NULL,NULL,7),(14,1,'14 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11314 0 0 0 110 0 11314 0 1000 0 110 0 70 5 50332677 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1160216980 1151828372 1156533094 1053240066 1069547520 57 57 0 1141522760 1144537416 1124745544 1127760200 0 0 0 0 0 0 0 1065353216 0 0 0 0 94 595 779 37 63 0 1135935488 1143750656 0 0 0 0 0 0 0 4486 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 3704 10240 809 732 1036831952 655 732 0 1135645257 1138201161 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3072 0 0 118032386 33554446 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35033 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35035 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35036 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35156 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35034 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35171 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35032 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35131 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 34887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 37865 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 34427 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33484 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32837 2673 603 0 0 0 0 0 0 0 0 0 0 0 0 0 32838 2673 603 0 0 0 0 0 0 0 0 0 0 0 0 0 34349 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 293 1073741824 307 1073741824 296 1073741824 0 0 298 1073741824 304 1073741824 294 1073741824 300 1073741824 308 1073741824 290 1073741824 303 1073741824 312 1073741824 315 1073741824 318 1073741824 313 1073741824 366 1073741824 367 1073741824 322 1073741824 0 0 337 1073741824 0 0 0 0 0 0 269 1073741824 288 1073741824 284 1073741824 285 1073741824 286 1073741824 287 1073741824 327 1073741824 349 1073741824 350 1073741824 348 1073741824 323 1073741824 326 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 38 65537 0 43 22937950 0 45 22937950 0 46 22937950 0 54 22937950 0 95 22937950 0 109 19661100 0 118 22937950 0 162 22937950 0 173 22937950 0 176 22937950 0 226 22937950 0 253 65537 0 333 19660807 0 414 65537 0 415 65537 0 473 65537 0 633 22937950 0 673 19661100 0 760 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1105807279 1084227584 0 0 1107543293 1107543293 1107543293 0 0 0 0 0 0 0 3 0 0 0 2147483648 0 0 0 0 0 0 0 0 8388608 0 0 0 0 0 0 0 0 8192 24 0 0 512 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2144000036 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 4294966190 851968 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 72 72 0 295 295 0 0 0 0 354 354 354 70 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Redalolz',5,4,0,70,0,2144000036,118032386,33554446,3072,1277.66,-4384.62,28.7051,1,0,0,3.98778,'1024 0 0 4 0 0 1048576 0 ',0,1,5693,5693,1319395465,0,0,0,0,0,0,2.35726e-027,0,0,8,0,0,14,0,'',0,0,0,0,0,0,0,0,4294967295,0,11314,0,0,0,110,0,NULL,NULL,NULL,1),(15,7,'15 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 661 0 0 0 110 0 11314 0 1000 0 110 0 70 5 50332677 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4098 1160216980 1151828372 1156533094 1053240066 1069547520 57 57 0 1141522760 1144537416 1124745544 1127760200 0 0 0 0 0 0 0 1065353216 0 0 0 0 94 595 779 37 63 0 1135935488 1143750656 0 0 0 0 0 0 0 4486 0 0 0 0 10 0 0 0 0 0 0 1092616192 0 0 0 0 0 0 0 0 0 3704 10240 809 732 1036831952 655 732 0 1135645257 1138201161 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1024 0 0 591104 33554434 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35033 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35135 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35035 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35036 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35156 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35034 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35141 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35171 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35032 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35131 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 34887 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 37865 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 34427 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 33484 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32837 2673 603 0 0 0 0 0 0 0 0 0 0 0 0 0 32838 2673 603 0 0 0 0 0 0 0 0 0 0 0 0 0 34349 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 292 1073741824 306 1073741824 297 1073741824 0 0 299 1073741824 305 1073741824 295 1073741824 301 1073741824 310 1073741824 291 1073741824 302 1073741824 311 1073741824 316 1073741824 317 1073741824 314 1073741824 324 1073741824 325 1073741824 321 1073741824 0 0 0 0 0 0 0 0 0 0 283 1073741824 320 1073741824 352 1073741824 377 1073741824 353 1073741824 351 1073741824 378 1073741824 379 1073741824 380 1073741824 376 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 38 65537 0 43 22937950 0 45 22937950 0 46 22937950 0 54 22937950 0 95 22937950 0 109 19661100 0 118 22937950 0 162 22937950 0 173 22937950 0 176 22937950 0 253 65537 0 414 65537 0 415 65537 0 473 65537 0 633 22937950 0 673 19661100 0 760 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 1105807279 1084227584 0 0 1105168890 1105168890 1105168890 0 0 0 0 0 0 0 3 0 0 0 2147483648 0 0 0 128 65536 0 0 1048576 0 0 0 0 0 0 0 0 0 8192 24 0 0 512 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2144004436 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 0 0 4294966190 983040 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 72 72 0 295 295 0 0 0 0 354 354 354 70 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Nico',5,4,0,70,0,2144004436,591104,33554434,1024,1368.97,-4371.53,26.0594,1,0,0,3.26334,'1024 0 0 4 0 0 1048576 0 ',0,1,4507,4507,1319395923,0,0,0,0,3.22871e+033,0,0,0,0,8,0,0,14,0,'',0,0,0,0,0,0,0,0,4294967295,0,661,0,0,0,110,0,NULL,NULL,NULL,0),(16,9,'16 0 25 0 1065353216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3439 900 0 0 100 0 3439 3203 1000 0 100 0 255 2 67330 0 0 0 0 0 0 0 0 0 8 0 33697 20236 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 23230 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7967 0 0 0 0 0 0 0 0 0 9 0 0 0 65535 0 0 0 0 0 0 0 0 0 255 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1156415488 1157234688 1157234688 1053240066 1069547520 52 52 0 1129820979 1129952051 0 0 0 0 0 0 0 0 0 1065353216 0 0 0 0 35 154 46 35 53 0 0 0 0 0 0 0 0 0 0 326 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2958 3159 10240 560 1022 0 144 0 0 1101828681 1102352969 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 0 0 84280068 33554438 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 154 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 153 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 36 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 355 1073741824 0 0 0 0 357 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 361 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 359 1073741824 363 1073741824 365 1073741824 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 779700 54 83558401 0 95 83558401 0 109 19661100 0 136 83558401 0 162 83558401 0 374 65537 0 375 65537 0 414 65537 0 415 65537 0 433 65537 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 244 2 0 0 0 0 0 0 0 0 0 0 0 1075891405 1075891405 1075891405 1075891405 1075891405 1075891405 0 0 0 0 2147483648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 513 513 513 513 513 513 0 0 0 0 0 0 0 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 1065353216 513 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1021951635 0 70 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','Maloween',2,7,1,255,0,0,84280068,33554438,32,1400.55,-4369.32,25.2355,1,0,0,0.177498,'4194304 0 0 4 0 0 1048576 0 ',0,1,2824,2809,1319402089,1,0,0,0,3.22871e+033,0,0,0,0,12,0,0,1637,0,'',0,0,0,0,0,0,0,0,4294967295,0,3439,900,0,0,100,0,NULL,NULL,NULL,0);

/*Table structure for table `corpse` */

drop table if exists `corpse`;

CREATE TABLE `corpse` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `player` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `zone` int(11) unsigned NOT NULL DEFAULT '38' COMMENT 'Zone Identifier',
  `map` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `data` longtext,
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `corpse_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpse_type`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Death System';

/*Data for the table `corpse` */

/*Table structure for table `game_event_condition_save` */

drop table if exists `game_event_condition_save`;

CREATE TABLE `game_event_condition_save` (
  `event_id` mediumint(8) unsigned NOT NULL,
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`event_id`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `game_event_condition_save` */

/*Table structure for table `game_event_save` */

drop table if exists `game_event_save`;

CREATE TABLE `game_event_save` (
  `event_id` mediumint(8) unsigned NOT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `next_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `game_event_save` */

insert into `game_event_save` values (35,2,'0000-00-00 00:00:00');

/*Table structure for table `gm_surveys` */

drop table if exists `gm_surveys`;

CREATE TABLE `gm_surveys` (
  `surveyid` int(10) NOT NULL AUTO_INCREMENT,
  `AppropriateAnswer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Did the GM provide an appropriate answer or solution to your question/problem?',
  `Understandability` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'How easy was it to understand and/or follow the information provided?',
  `GMRating` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Was the GM knowledgeable, respectful and empathetic during your interactions?',
  `ResponseTime` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'How would you rate the response time to address your petition?',
  `OverallGMExperience` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'How would you rate the overall experience with the GM that assisted you with your petition?',
  `comment` longtext,
  PRIMARY KEY (`surveyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `gm_surveys` */

/*Table structure for table `gm_tickets` */

drop table if exists `gm_tickets`;

CREATE TABLE `gm_tickets` (
  `guid` int(10) NOT NULL AUTO_INCREMENT,
  `playerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `createtime` int(10) NOT NULL,
  `map` int(11) NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `timestamp` int(10) NOT NULL DEFAULT '0',
  `closed` int(10) NOT NULL DEFAULT '0',
  `assignedto` int(10) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `escalated` int(11) NOT NULL DEFAULT '0',
  `viewed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

/*Data for the table `gm_tickets` */

/*Table structure for table `group_instance` */

drop table if exists `group_instance`;

CREATE TABLE `group_instance` (
  `leaderGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `instance` int(11) unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaderGuid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `group_instance` */

/*Table structure for table `group_member` */

drop table if exists `group_member`;

CREATE TABLE `group_member` (
  `leaderGuid` int(11) unsigned NOT NULL,
  `memberGuid` int(11) unsigned NOT NULL,
  `assistant` tinyint(1) unsigned NOT NULL,
  `subgroup` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`leaderGuid`,`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

/*Data for the table `group_member` */

/*Table structure for table `groups` */

drop table if exists `groups`;

CREATE TABLE `groups` (
  `leaderGuid` int(11) unsigned NOT NULL,
  `mainTank` int(11) unsigned NOT NULL,
  `mainAssistant` int(11) unsigned NOT NULL,
  `lootMethod` tinyint(4) unsigned NOT NULL,
  `looterGuid` int(11) unsigned NOT NULL,
  `lootThreshold` tinyint(4) unsigned NOT NULL,
  `icon1` int(11) unsigned NOT NULL,
  `icon2` int(11) unsigned NOT NULL,
  `icon3` int(11) unsigned NOT NULL,
  `icon4` int(11) unsigned NOT NULL,
  `icon5` int(11) unsigned NOT NULL,
  `icon6` int(11) unsigned NOT NULL,
  `icon7` int(11) unsigned NOT NULL,
  `icon8` int(11) unsigned NOT NULL,
  `isRaid` tinyint(1) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Groups';

/*Data for the table `groups` */

/*Table structure for table `guild` */

drop table if exists `guild`;

CREATE TABLE `guild` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `leaderguid` int(6) unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` int(5) NOT NULL DEFAULT '0',
  `EmblemColor` int(5) NOT NULL DEFAULT '0',
  `BorderStyle` int(5) NOT NULL DEFAULT '0',
  `BorderColor` int(5) NOT NULL DEFAULT '0',
  `BackgroundColor` int(5) NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `createdate` datetime DEFAULT NULL,
  `BankMoney` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `guild` */

/*Table structure for table `guild_bank_eventlog` */

drop table if exists `guild_bank_eventlog`;

CREATE TABLE `guild_bank_eventlog` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `LogGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `LogEntry` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `PlayerGuid` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TimeStamp` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_eventlog` */

/*Table structure for table `guild_bank_item` */

drop table if exists `guild_bank_item`;

CREATE TABLE `guild_bank_item` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `item_entry` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_item` */

/*Table structure for table `guild_bank_right` */

drop table if exists `guild_bank_right`;

CREATE TABLE `guild_bank_right` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_right` */

/*Table structure for table `guild_bank_tab` */

drop table if exists `guild_bank_tab`;

CREATE TABLE `guild_bank_tab` (
  `guildid` int(11) unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(100) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` text,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `guild_bank_tab` */

/*Table structure for table `guild_eventlog` */

drop table if exists `guild_eventlog`;

CREATE TABLE `guild_eventlog` (
  `guildid` int(11) NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int(11) NOT NULL COMMENT 'Log entry identificator',
  `EventType` tinyint(1) NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int(11) NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int(11) NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint(2) NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint(20) NOT NULL COMMENT 'Event UNIX time'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Guild Eventlog';

/*Data for the table `guild_eventlog` */

/*Table structure for table `guild_member` */

drop table if exists `guild_member`;

CREATE TABLE `guild_member` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `pnote` varchar(255) NOT NULL DEFAULT '',
  `offnote` varchar(255) NOT NULL DEFAULT '',
  `BankResetTimeMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab0` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab1` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab2` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab3` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab4` int(11) unsigned NOT NULL DEFAULT '0',
  `BankResetTimeTab5` int(11) unsigned NOT NULL DEFAULT '0',
  `BankRemSlotsTab5` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`),
  KEY `guid_key` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Guild System';

/*Data for the table `guild_member` */

/*Table structure for table `guild_rank` */

drop table if exists `guild_rank`;

CREATE TABLE `guild_rank` (
  `guildid` int(6) unsigned NOT NULL DEFAULT '0',
  `rid` int(11) unsigned NOT NULL,
  `rname` varchar(255) NOT NULL DEFAULT '',
  `rights` int(3) unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `guild_rank` */

/*Table structure for table `instance` */

drop table if exists `instance`;

CREATE TABLE `instance` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `map` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) NOT NULL DEFAULT '0',
  `difficulty` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `instance` */

/*Table structure for table `instance_reset` */

drop table if exists `instance_reset`;

CREATE TABLE `instance_reset` (
  `mapid` int(11) unsigned NOT NULL DEFAULT '0',
  `resettime` bigint(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `instance_reset` */

insert into `instance_reset` values (249,1319688000),(269,1319428800),(309,1319515200),(409,1319428800),(469,1319428800),(509,1319515200),(531,1319428800),(532,1319428800),(533,1319428800),(534,1319428800),(540,1319428800),(542,1319428800),(543,1319428800),(544,1319428800),(545,1319428800),(546,1319428800),(547,1319428800),(548,1319428800),(550,1319428800),(552,1319428800),(553,1319428800),(554,1319428800),(555,1319428800),(556,1319428800),(557,1319428800),(558,1319428800),(560,1319428800),(564,1319428800),(565,1319428800),(568,1319515200),(580,1319428800),(585,1319428800);

/*Table structure for table `item_instance` */

drop table if exists `item_instance`;

CREATE TABLE `item_instance` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0',
  `owner_guid` int(11) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item System';

/*Data for the table `item_instance` */

insert into `item_instance` values (2,1,'2 1073741824 3 23473 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(4,1,'4 1073741824 3 23474 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(6,1,'6 1073741824 3 23475 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(8,1,'8 1073741824 3 23346 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(10,1,'10 1073741824 3 6948 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(12,1,'12 1073741824 3 4540 1065353216 0 1 0 1 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(14,2,'14 1073741824 3 6140 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(16,2,'16 1073741824 3 1395 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(18,2,'18 1073741824 3 6096 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(20,2,'20 1073741824 3 35 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(22,2,'22 1073741824 3 55 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(28,2,'28 1073741824 3 6948 1065353216 0 2 0 2 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(46,4,'46 1073741824 3 3661 1065353216 0 4 0 4 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(48,4,'48 1073741824 3 6123 1065353216 0 4 0 4 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(50,4,'50 1073741824 3 6124 1065353216 0 4 0 4 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(52,4,'52 1073741824 3 159 1065353216 0 4 0 4 0 0 0 0 0 1 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(54,4,'54 1073741824 3 4536 1065353216 0 4 0 4 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(56,4,'56 1073741824 3 6948 1065353216 0 4 0 4 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(58,5,'58 1073741824 3 24143 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(60,5,'60 1073741824 3 24145 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 17 25 '),(62,5,'62 1073741824 3 24146 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 11 16 '),(64,5,'64 1073741824 3 23346 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19 25 '),(66,5,'66 1073741824 3 20857 1065353216 0 5 0 5 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(68,5,'68 1073741824 3 159 1065353216 0 5 0 5 0 0 0 0 0 2 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(70,5,'70 1073741824 3 6948 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(71,5,'71 1073741824 3 35039 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(72,5,'72 1073741824 3 35040 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(73,5,'73 1073741824 3 19019 1065353216 0 5 0 5 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 82 125 '),(75,6,'75 1073741824 3 2092 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 16 '),(77,6,'77 1073741824 3 2105 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(79,6,'79 1073741824 3 120 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(81,6,'81 1073741824 3 121 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(83,6,'83 1073741824 3 4604 1065353216 0 6 0 6 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(85,6,'85 1073741824 3 25861 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 4194304 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 200 200 '),(87,6,'87 1073741824 3 6948 1065353216 0 6 0 6 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(88,6,'88 1073741824 3 5140 1065353216 0 6 0 6 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(89,6,'89 1073741824 3 5140 1065353216 0 6 0 6 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(91,7,'91 1073741824 3 2092 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 643 21104 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 16 '),(93,7,'93 1073741824 3 2105 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(95,7,'95 1073741824 3 120 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(97,7,'97 1073741824 3 121 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(101,7,'101 1073741824 3 25861 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 4194304 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 199 200 '),(103,7,'103 1073741824 3 6948 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(105,8,'105 1073741824 3 35 1065353216 0 8 0 8 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(107,8,'107 1073741824 3 6139 1065353216 0 8 0 8 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(109,8,'109 1073741824 3 6124 1065353216 0 8 0 8 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 25 25 '),(111,8,'111 1073741824 3 159 1065353216 0 8 0 8 0 0 0 0 0 1 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(113,8,'113 1073741824 3 4536 1065353216 0 8 0 8 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(115,8,'115 1073741824 3 6948 1065353216 0 8 0 8 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(117,7,'117 1073741824 3 5140 1065353216 0 7 0 7 0 0 0 0 0 18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(119,9,'119 1073741824 3 45 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(121,9,'121 1073741824 3 43 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(123,9,'123 1073741824 3 44 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 17 25 '),(125,9,'125 1073741824 3 6948 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(127,9,'127 1073741824 3 2361 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 19 25 '),(129,9,'129 1073741824 3 159 1065353216 0 9 0 9 0 0 0 0 0 2 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(131,9,'131 1073741824 3 2070 1065353216 0 9 0 9 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(132,9,'132 1073741824 3 35039 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(133,9,'133 1073741824 3 30063 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(134,9,'134 1073741824 3 19019 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 94 125 '),(135,9,'135 1073741824 3 32332 1065353216 0 9 0 9 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 78 120 '),(136,7,'136 1073741824 3 17142 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 95 95 '),(137,7,'137 1073741824 3 20578 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 524289 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 75 75 '),(138,4,'138 1073741824 3 19879 1065353216 0 4 0 4 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 120 '),(139,7,'139 1073741824 3 6218 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(140,7,'140 1073741824 3 10940 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(141,7,'141 1073741824 3 10938 1065353216 0 7 0 7 0 0 0 0 0 1 0 4294967295 0 0 0 0 1024 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(142,7,'142 1073741824 3 1370 1065353216 0 7 0 7 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 16 '),(144,10,'144 1073741824 3 23345 1065353216 0 10 0 10 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(146,10,'146 1073741824 3 23344 1065353216 0 10 0 10 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 21 25 '),(148,10,'148 1073741824 3 23348 1065353216 0 10 0 10 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(150,10,'150 1073741824 3 6948 1065353216 0 10 0 10 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(152,10,'152 1073741824 3 36 1065353216 0 10 0 10 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 20 '),(154,10,'154 1073741824 3 4540 1065353216 0 10 0 10 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(156,10,'156 1073741824 3 159 1065353216 0 10 0 10 0 0 0 0 0 2 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(157,1,'157 1073741824 3 5178 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(158,1,'158 1073741824 3 5176 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(159,1,'159 1073741824 3 5177 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(160,1,'160 1073741824 3 5175 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(162,11,'162 1073741824 3 6129 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(164,11,'164 1073741824 3 1396 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 24 25 '),(166,11,'166 1073741824 3 59 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(168,11,'168 1073741824 3 2092 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 16 '),(170,11,'170 1073741824 3 4604 1065353216 0 11 0 11 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(172,11,'172 1073741824 3 159 1065353216 0 11 0 11 0 0 0 0 0 2 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(174,11,'174 1073741824 3 6948 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(191,1,'191 1073741824 3 28358 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 120 '),(192,1,'192 1073741824 3 1251 1065353216 0 1 0 1 0 0 0 0 0 20 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(193,1,'193 1073741824 3 33728 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 165 165 '),(194,1,'194 1073741824 3 33729 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 55 55 '),(195,1,'195 1073741824 3 33730 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 100 100 '),(196,1,'196 1073741824 3 33731 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 120 '),(197,1,'197 1073741824 3 33732 1065353216 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 100 100 '),(214,13,'214 1073741824 3 35083 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(215,13,'215 1073741824 3 35084 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 3211 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 60 '),(216,13,'216 1073741824 3 35085 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 75 75 '),(217,13,'217 1073741824 3 35086 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 3283 0 0 3283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 60 '),(218,13,'218 1073741824 3 35087 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 3283 0 0 3283 0 0 3283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 100 100 '),(220,13,'220 1073741824 3 30888 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 3283 0 0 3283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(221,13,'221 1073741824 3 30894 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 50 50 '),(222,13,'222 1073741824 3 32586 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 35 35 '),(223,13,'223 1073741824 3 32331 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(224,13,'224 1073741824 3 34204 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(225,13,'225 1073741824 3 34206 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(226,13,'226 1073741824 3 29309 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(227,13,'227 1073741824 3 32528 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(228,13,'228 1073741824 3 35700 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(229,13,'229 1073741824 3 28823 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(230,13,'230 1073741824 3 34335 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 3283 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 105 105 '),(231,13,'231 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(236,13,'236 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(237,13,'237 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(238,13,'238 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(239,13,'239 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(240,13,'240 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(241,13,'241 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(242,13,'242 1073741824 3 33134 1065353216 0 13 0 13 0 0 0 0 0 1 0 0 0 0 0 0 524288 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(243,11,'243 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(248,11,'248 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(249,11,'249 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(250,11,'250 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(251,11,'251 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(252,11,'252 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(253,11,'253 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(254,11,'254 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(255,11,'255 1073741824 3 6265 1065353216 0 11 0 11 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(269,14,'269 1073741824 3 6948 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(283,15,'283 1073741824 3 6948 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(284,14,'284 1073741824 3 5140 1065353216 0 14 0 14 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(285,14,'285 1073741824 3 5140 1065353216 0 14 0 14 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(286,14,'286 1073741824 3 5140 1065353216 0 14 0 14 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(287,14,'287 1073741824 3 5140 1065353216 0 14 0 14 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(288,14,'288 1073741824 3 5140 1065353216 0 14 0 14 0 0 0 0 0 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(290,14,'290 1073741824 3 35032 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(291,15,'291 1073741824 3 35032 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(292,15,'292 1073741824 3 35033 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 70 '),(293,14,'293 1073741824 3 35033 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 70 '),(294,14,'294 1073741824 3 35034 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 90 90 '),(295,15,'295 1073741824 3 35034 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 90 90 '),(296,14,'296 1073741824 3 35035 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 70 '),(297,15,'297 1073741824 3 35035 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 70 70 '),(298,14,'298 1073741824 3 35036 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 119 120 '),(299,15,'299 1073741824 3 35036 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 120 120 '),(300,14,'300 1073741824 3 35141 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 60 '),(301,15,'301 1073741824 3 35141 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 60 60 '),(302,15,'302 1073741824 3 35131 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(303,14,'303 1073741824 3 35131 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(304,14,'304 1073741824 3 35156 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(305,15,'305 1073741824 3 35156 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(306,15,'306 1073741824 3 35135 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(307,14,'307 1073741824 3 35135 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(308,14,'308 1073741824 3 35171 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(310,15,'310 1073741824 3 35171 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 40 40 '),(311,15,'311 1073741824 3 34887 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(312,14,'312 1073741824 3 34887 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(313,14,'313 1073741824 3 33484 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(314,15,'314 1073741824 3 33484 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(315,14,'315 1073741824 3 37865 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(316,15,'316 1073741824 3 37865 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 32769 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(317,15,'317 1073741824 3 34427 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(318,14,'318 1073741824 3 34427 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(320,15,'320 1073741824 3 33474 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 90 90 '),(321,15,'321 1073741824 3 34349 1065353216 0 15 0 15 0 0 0 0 0 1 0 4294967295 0 0 0 0 4194305 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 279 285 '),(322,14,'322 1073741824 3 34349 1065353216 0 14 0 14 0 0 0 0 0 1 0 4294967295 0 0 0 0 4194305 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 274 285 '),(323,14,'323 1073741824 3 29996 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 342418 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 105 105 '),(324,15,'324 1073741824 3 32837 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 1618070 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 125 125 '),(325,15,'325 1073741824 3 32838 1065353216 0 15 0 15 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 1621565 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 125 125 '),(326,14,'326 1073741824 3 19019 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 346771 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 125 125 '),(327,14,'327 1073741824 3 22463 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1088 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(337,14,'337 1073741824 7 21858 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 28 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(348,14,'348 1073741824 3 3776 1065353216 0 14 0 14 0 0 0 0 0 20 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(349,14,'349 1073741824 3 3776 1065353216 0 14 0 14 0 0 0 0 0 16 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(350,14,'350 1073741824 3 3776 1065353216 0 14 0 14 0 0 0 0 0 20 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(351,15,'351 1073741824 3 3776 1065353216 0 15 0 15 0 0 0 0 0 20 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(352,15,'352 1073741824 3 3776 1065353216 0 15 0 15 0 0 0 0 0 18 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(353,15,'353 1073741824 3 3776 1065353216 0 15 0 15 0 0 0 0 0 20 0 4294967295 0 0 0 0 2097216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(355,16,'355 1073741824 3 154 1065353216 0 16 0 16 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(357,16,'357 1073741824 3 153 1065353216 0 16 0 16 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 30 30 '),(359,16,'359 1073741824 3 6948 1065353216 0 16 0 16 0 0 0 0 0 1 0 0 0 0 0 0 65 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(361,16,'361 1073741824 3 36 1065353216 0 16 0 16 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 20 20 '),(363,16,'363 1073741824 3 117 1065353216 0 16 0 16 0 0 0 0 0 4 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(365,16,'365 1073741824 3 159 1065353216 0 16 0 16 0 0 0 0 0 2 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(366,14,'366 1073741824 3 32837 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 1349374 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 125 125 '),(367,14,'367 1073741824 3 32838 1065353216 0 14 0 14 0 0 0 0 0 1 0 0 0 0 0 0 1 2673 0 0 603 1345333 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 125 125 '),(376,15,'376 1073741824 3 5140 1065353216 0 15 0 15 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(377,15,'377 1073741824 3 5140 1065353216 0 15 0 15 0 0 0 0 0 15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(378,15,'378 1073741824 3 5140 1065353216 0 15 0 15 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(379,15,'379 1073741824 3 5140 1065353216 0 15 0 15 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 '),(380,15,'380 1073741824 3 5140 1065353216 0 15 0 15 0 0 0 0 0 20 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ');

/*Table structure for table `item_text` */

drop table if exists `item_text`;

CREATE TABLE `item_text` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

/*Data for the table `item_text` */

/*Table structure for table `mail` */

drop table if exists `mail`;

CREATE TABLE `mail` (
  `id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint(3) NOT NULL DEFAULT '41',
  `mailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `itemTextId` int(11) unsigned NOT NULL DEFAULT '0',
  `has_items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint(40) NOT NULL DEFAULT '0',
  `deliver_time` bigint(40) NOT NULL DEFAULT '0',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `cod` int(11) unsigned NOT NULL DEFAULT '0',
  `checked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Mail System';

/*Data for the table `mail` */

/*Table structure for table `mail_external` */

drop table if exists `mail_external`;

CREATE TABLE `mail_external` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `receiver` bigint(20) unsigned NOT NULL,
  `subject` varchar(200) DEFAULT 'Support Message',
  `message` varchar(500) DEFAULT 'Support Message',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item` bigint(20) unsigned NOT NULL DEFAULT '0',
  `item_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mail_external` */

/*Table structure for table `mail_items` */

drop table if exists `mail_items`;

CREATE TABLE `mail_items` (
  `mail_id` int(11) NOT NULL DEFAULT '0',
  `item_guid` int(11) NOT NULL DEFAULT '0',
  `item_template` int(11) NOT NULL DEFAULT '0',
  `receiver` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`mail_id`,`item_guid`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mail_items` */

/*Table structure for table `pet_aura` */

drop table if exists `pet_aura`;

CREATE TABLE `pet_aura` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `caster_guid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0',
  `effect_index` int(11) unsigned NOT NULL DEFAULT '0',
  `stackcount` int(11) NOT NULL DEFAULT '1',
  `amount` int(11) NOT NULL DEFAULT '0',
  `maxduration` int(11) NOT NULL DEFAULT '0',
  `remaintime` int(11) NOT NULL DEFAULT '0',
  `remaincharges` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`spell`,`effect_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `pet_aura` */

/*Table structure for table `pet_spell` */

drop table if exists `pet_spell`;

CREATE TABLE `pet_spell` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';

/*Data for the table `pet_spell` */

insert into `pet_spell` values (2,19505,33024);

/*Table structure for table `pet_spell_cooldown` */

drop table if exists `pet_spell_cooldown`;

CREATE TABLE `pet_spell_cooldown` (
  `guid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pet_spell_cooldown` */

/*Table structure for table `petition` */

drop table if exists `petition`;

CREATE TABLE `petition` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(10) unsigned DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `petition` */

/*Table structure for table `petition_sign` */

drop table if exists `petition_sign`;

CREATE TABLE `petition_sign` (
  `ownerguid` int(10) unsigned NOT NULL,
  `petitionguid` int(11) unsigned NOT NULL DEFAULT '0',
  `playerguid` int(11) unsigned NOT NULL DEFAULT '0',
  `player_account` int(11) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guild System';

/*Data for the table `petition_sign` */

/*Table structure for table `saved_variables` */

drop table if exists `saved_variables`;

CREATE TABLE `saved_variables` (
  `NextArenaPointDistributionTime` bigint(40) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Variable Saves';

/*Data for the table `saved_variables` */
