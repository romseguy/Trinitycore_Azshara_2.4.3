SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dbc_spell`
-- ----------------------------
DROP TABLE IF EXISTS `dbc_spell`;
CREATE TABLE `dbc_spell` (
  `SpellID` int(9) unsigned NOT NULL,
  `CastingTimeIndex` int(9) unsigned DEFAULT NULL,
  `DurationIndex` int(9) unsigned DEFAULT NULL,
  `EffectBasePoints0` int(9) DEFAULT NULL,
  `EffectBasePoints1` int(9) DEFAULT NULL,
  `EffectBasePoints2` int(9) DEFAULT NULL,
  `Attributes` int(11) unsigned DEFAULT NULL,
  `AttributesEx` int(11) unsigned DEFAULT NULL,
  `AttributesEx2` int(11) unsigned DEFAULT NULL,
  `AttributesEx3` int(11) unsigned DEFAULT NULL,
  `AttributesEx4` int(11) unsigned DEFAULT NULL,
  `AttributesEx5` int(11) unsigned DEFAULT NULL,
  `Dispel` int(11) unsigned DEFAULT NULL,
  `Comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SpellID`),
  UNIQUE KEY `SpellID` (`SpellID`),
  KEY `SpellID_2` (`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dbc_spell
-- ----------------------------