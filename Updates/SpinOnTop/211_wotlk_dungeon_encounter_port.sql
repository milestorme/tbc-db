-- AQ and Kara gossips
UPDATE creature_template SET NpcFlags=3 WHERE entry=15502;

UPDATE gossip_menu SET condition_id=718 WHERE entry=6644 AND text_id=8702;
UPDATE gossip_menu SET condition_id=1106 WHERE entry=7139 AND text_id=10741;
UPDATE gossip_menu_option SET condition_id=717,npc_option_npcflag=1 WHERE menu_id=6644 AND id=0;
UPDATE gossip_menu_option SET condition_id=718,npc_option_npcflag=1 WHERE menu_id=6644 AND id=1;

DELETE FROM gossip_menu_option WHERE menu_id = 7139 AND id=0;
INSERT INTO gossip_menu_option(menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
('7139', '0', '0', 'Please teleport me aran''s room.', '1', '1', '0', '0', '713901', '0', '0', '', '1106');

DELETE FROM conditions WHERE condition_entry IN(717,718,1106);
INSERT INTO conditions VALUES
('717', '31', '715', '0'),
('718', '31', '716', '0'),
('1106','31', '658', '0');

DELETE FROM dbscripts_on_gossip WHERE id IN(66441,66442,713901);
INSERT INTO dbscripts_on_gossip(id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(713901,0,15,39567,0,0,0,2,0,0,0,0,0,0,0,0,'Teleport - Shade of Aran'),
('66441', '0', '15', '29182', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', 'teleport - lair of the Twin Emperors'),
('66442', '0', '15', '29188', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', 'teleport - final chamber');

DELETE FROM dbscripts_on_spell WHERE id IN(29182,29188,39566);
INSERT INTO dbscripts_on_spell(id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
('29182', '0', '15', '29181', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'teleport - lair of the Twin Emperors'),
('29188', '0', '15', '29190', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'teleport - final chamber'),
('39566', '0', '15', '39567', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'teleport - Karazhan - Aran room');


DROP TABLE IF EXISTS `instance_encounters`;
CREATE TABLE `instance_encounters` (
  `entry` int(10) unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `creditEntry` int(10) unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `instance_encounters` VALUES (161,0,644,0),(162,0,643,0),(163,0,1763,0),(164,0,646,0),(165,0,645,0),(166,0,647,0),(167,0,639,6),(201,0,18371,0),(202,0,18373,149),(203,0,18341,0),(204,0,18343,0),
(205,0,18344,148),(206,0,18472,0),(207,0,18473,150),(208,0,18731,0),(209,0,18667,0),(210,0,18732,0),(211,0,18708,151),(219,0,4887,0),(220,0,4831,0),(221,0,6243,0),(222,0,12902,0),(224,0,4830,0),(225,0,4832,0),
(226,0,4829,10),(227,0,9018,30),(228,0,9025,0),(229,0,9319,0),(230,0,10096,0),(231,0,9024,0),(232,0,9017,0),(233,0,9041,0),(234,0,9056,0),(235,0,9016,0),(236,0,9033,0),(237,0,8983,0),(238,0,9537,0),(239,0,9502,0),
(240,0,9543,0),(241,0,9499,0),(242,0,9156,0),(243,0,9035,0),(244,0,9938,0),(245,0,9019,276),(246,0,18371,0),(247,0,18373,178),(248,0,18341,0),(249,0,18343,0),(250,0,22930,0),(251,0,18344,179),(252,0,18472,0),
(253,0,23035,0),(254,0,18473,180),(255,0,18731,0),(256,0,18667,0),(257,0,18732,0),(258,0,18708,181),(267,0,9196,0),(268,0,9236,0),(269,0,9237,0),(270,0,10596,0),(271,0,10584,0),(272,0,9736,0),(273,0,10268,0),
(274,0,10220,0),(275,0,9568,32),(276,0,9816,0),(277,0,10264,0),(278,0,10429,0),(279,0,10430,0),(280,0,10363,44),(281,0,18096,170),(282,0,18096,183),(283,0,17862,0),(284,0,17862,0),(285,0,17848,0),(286,0,17848,0),
(287,0,17879,0),(288,0,17879,0),(289,0,17880,0),(290,0,17880,0),(291,0,17881,171),(292,0,17881,182),(296,1,58630,209),(300,1,58630,210),(301,0,17941,0),(302,0,17991,0),(303,0,17942,140),(304,0,17941,0),(305,0,17991,0),
(306,0,17942,184),(314,0,17797,0),(315,0,17797,0),(316,0,17796,0),(317,0,17796,0),(318,0,17798,147),(319,0,17798,185),(320,0,17770,0),(321,0,17770,0),(322,0,18105,0),(323,0,18105,0),(329,0,17826,0),(330,0,17826,0),
(331,0,17882,146),(332,0,17882,186),(334,1,68572,0),(336,1,68572,0),(338,1,68574,0),(339,1,68574,0),(340,1,68663,245),(341,1,68663,249),(343,0,11490,0),(344,0,13280,0),(345,0,14327,0),(346,0,11492,34),(347,0,11488,0),
(348,0,11487,0),(349,0,11496,0),(350,0,11489,0),(361,0,11486,36),(362,0,14326,0),(363,0,14322,0),(364,0,14321,0),(365,0,14323,0),(366,0,14325,0),(367,0,14324,0),(368,0,11501,38),(375,1,61863,214),(376,1,61863,215),
(378,0,7079,0),(379,0,7361,0),(380,0,6235,0),(381,0,6229,0),(382,0,7800,14),(392,0,17306,0),(393,0,17306,0),(394,0,17308,0),(395,0,17308,0),(396,0,17537,136),(397,0,17537,188),(401,0,17381,0),(402,0,17381,0),
(403,0,17380,0),(404,0,17380,0),(405,0,17377,137),(406,0,17377,187),(407,0,16807,0),(408,0,16807,0),(409,0,20923,0),(410,0,16809,0),(411,0,16809,0),(412,0,16808,138),(413,0,16808,189),(414,0,24723,0),(415,0,24723,0),
(416,0,24744,0),(417,0,24744,0),(418,0,24560,0),(419,0,24560,0),(420,0,24664,198),(421,0,24664,201),(422,0,13282,0),(423,0,12258,26),(424,0,12236,272),(425,0,12225,0),(426,0,12203,0),(427,0,13601,0),(428,0,13596,0),
(429,0,12201,273),(430,0,11517,0),(431,0,11520,4),(432,0,11518,0),(433,0,11519,0),(434,0,7355,0),(435,0,7357,0),(436,0,8567,0),(437,0,7358,20),(438,0,6168,0),(439,0,4424,0),(440,0,4428,0),(441,0,4420,0),(443,0,4421,16),
(444,0,3983,0),(445,0,4543,18),(446,0,3974,0),(447,0,6487,165),(448,0,3975,163),(449,0,4542,0),(450,0,3977,164),(451,0,10506,0),(452,0,10503,0),(453,0,11622,0),(454,0,10433,0),(455,0,10432,0),(456,0,10508,0),
(457,0,10505,0),(458,0,11261,0),(459,0,10901,0),(460,0,10507,0),(461,0,10504,0),(462,0,10502,0),(463,0,1853,2),(465,0,3886,0),(466,0,3887,0),(467,0,4278,0),(468,0,4279,0),(469,0,4274,0),(470,0,3927,0),(471,0,4275,8),
(472,0,10516,0),(473,0,10558,0),(474,0,10808,0),(475,0,10997,0),(476,0,11032,0),(477,0,10811,0),(478,0,10813,40),(479,0,10436,0),(480,0,10437,0),(481,0,10438,0),(482,0,10435,0),(483,0,10439,0),(484,0,10440,274),
(485,0,8580,0),(486,0,5721,0),(487,0,5720,0),(488,0,5710,0),(490,0,5719,0),(491,0,5722,0),(492,0,8443,0),(493,0,5709,28),(494,0,20870,0),(495,0,20870,0),(496,0,20885,0),(497,0,20885,0),(498,0,20886,0),(499,0,20886,0),
(500,0,20912,174),(501,0,20912,190),(502,0,17976,0),(504,0,17976,0),(505,0,17975,0),(506,0,17975,0),(507,0,17978,0),(508,0,17978,0),(509,0,17980,0),(510,0,17980,0),(511,0,17977,173),(512,0,17977,191),(513,0,19219,0),
(514,0,19219,0),(515,0,19221,0),(516,0,19221,0),(517,0,19220,172),(518,0,19220,192),(536,0,1696,0),(537,0,1666,0),(538,0,1717,0),(539,0,1716,0),(540,0,1663,12),(547,0,6910,0),(548,0,6906,0),(549,0,7228,0),
(551,0,7206,0),(552,0,7291,0),(553,0,4854,0),(554,0,2748,22),(567,1,59046,0),(568,1,59046,0),(585,0,3671,0),(586,0,3669,0),(587,0,3653,0),(588,0,3670,0),(589,0,3674,0),(590,0,3673,0),(591,0,5775,0),(592,0,3654,1),
(593,0,7795,0),(594,0,7273,0),(595,0,8127,0),(596,0,7272,0),(597,0,7271,0),(598,0,7796,0),(599,0,7275,0),(600,0,7267,24),(601,0,22887,0),(602,0,22898,0),(603,0,22841,0),(604,0,22871,0),(605,0,22948,0),(606,0,23420,0),
(607,0,22947,0),(608,0,23426,0),(609,0,22917,196),(610,0,12435,0),(611,0,13020,0),(612,0,12017,0),(613,0,11983,0),(614,0,14601,0),(615,0,11981,0),(616,0,14020,0),(617,0,11583,50),(618,0,17767,0),(619,0,17808,0),
(620,0,17888,0),(621,0,17842,0),(622,0,17968,195),(623,0,21216,0),(624,0,21217,0),(625,0,21215,0),(626,0,21214,0),(627,0,21213,0),(628,0,21212,194),(637,1,68184,0),(638,1,68184,0),(639,1,68184,0),(640,1,68184,0),
(649,0,18831,0),(650,0,19044,177),(651,0,17257,176),(652,0,15550,0),(653,0,15687,0),(654,0,16457,0),(655,0,16812,0),(656,0,15691,0),(657,0,15688,0),(658,0,16524,0),(659,0,15689,0),(660,0,22520,0),(661,0,15690,175),
(662,0,17225,0),(663,0,12118,0),(664,0,11982,0),(665,0,12259,0),(666,0,12057,0),(667,0,12264,0),(668,0,12056,0),(669,0,12098,0),(670,0,11988,0),(671,0,12018,0),(672,0,11502,48),(673,0,15956,0),(674,0,15956,0),
(677,0,15953,0),(678,0,15953,0),(679,0,15952,0),(680,0,15952,0),(681,0,15954,0),(682,0,15954,0),(683,0,15936,0),(684,0,15936,0),(685,0,16011,0),(686,0,16011,0),(687,0,16061,0),(689,0,16061,0),(690,0,16060,0),
(691,0,16060,0),(692,1,59450,0),(693,1,59450,0),(694,0,16028,0),(695,0,16028,0),(696,0,15931,0),(697,0,15931,0),(698,0,15932,0),(699,0,15932,0),(700,0,15928,0),(701,0,15928,0),(702,0,15989,0),(703,0,15989,0),
(704,0,15990,159),(706,0,15990,227),(707,0,10184,46),(708,0,10184,257),(709,0,15263,0),(710,0,15544,0),(711,0,15516,0),(712,0,15510,0),(713,0,15299,0),(714,0,15509,0),(715,0,15275,0),(716,0,15517,0),(717,0,15727,161),
(718,0,15348,0),(719,0,15341,0),(720,0,15340,0),(721,0,15370,0),(722,0,15369,0),(723,0,15339,160),(724,0,24892,0),(725,0,24882,0),(726,0,25038,0),(727,0,25165,0),(728,0,25840,0),(729,0,25315,199),(730,0,19514,0),
(731,0,19516,0),(732,0,18805,0),(733,0,19622,193),(748,1,65195,0),(751,1,64899,0),(752,1,64985,0),(753,1,65074,0),(762,1,65195,0),(765,1,64899,0),(766,1,64985,0),(767,1,65074,0),(778,0,23574,0),(779,0,23576,0),
(780,0,23578,0),(781,0,23577,0),(782,0,24239,0),(783,0,23863,197),(784,0,14507,0),(785,0,14517,0),(786,0,14510,0),(787,0,11382,0),(788,0,15083,0),(789,0,14509,0),(790,0,15114,0),(791,0,14515,0),(792,0,11380,0),
(793,0,14834,42),(843,1,72830,255),(844,1,72830,256),(847,1,72959,0),(854,1,72706,0),(859,1,72959,0),(866,1,72706,0),(883,0,4422,0);


