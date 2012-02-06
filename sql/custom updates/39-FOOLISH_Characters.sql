-- ----------------------------
-- Table structure for character_tdf
-- ----------------------------
CREATE TABLE `character_tdf` (
  `guid` mediumint(8) NOT NULL,
  `id` mediumint(8) NOT NULL,
  `time` bigint(20) NOT NULL,
  PRIMARY KEY  (`guid`,`id`)
) ENGINE=MyISAM;

-- ----------------------------
-- Table structure for character_tdf_progress
-- ----------------------------
CREATE TABLE `character_tdf_progress` (
  `guid` mediumint(8) NOT NULL,
  `id` mediumint(8) NOT NULL,
  `data0` int(11) default NULL,
  `data1` int(11) default NULL,
  `data2` int(11) default NULL,
  `data3` int(11) default NULL,
  PRIMARY KEY  (`guid`,`id`)
) ENGINE=MyISAM;

