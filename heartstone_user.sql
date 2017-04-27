-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- 主机: localhost:3306
-- 生成日期: 2016-11-03 07:46:21
-- 服务器版本: 5.6.33
-- PHP 版本: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `hpugqpbu_wordpress`
--

-- --------------------------------------------------------

--
-- 表的结构 `heartstone_user`
--

CREATE TABLE IF NOT EXISTS `heartstone_user` (
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `expack` int(10) unsigned NOT NULL DEFAULT '0',
  `gold` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash` double unsigned NOT NULL DEFAULT '0',
  `cards` longtext,
  `sets` longtext,
  PRIMARY KEY (`name`),
  UNIQUE KEY `email` (`email`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `heartstone_user`
--

INSERT INTO `heartstone_user` (`name`, `password`, `nickname`, `email`, `expack`, `gold`, `id`, `cash`, `cards`, `sets`) VALUES
('admin', 'admin', 'admin', '834437543@qq.com', 3, 9600, 1, 0, 'id1/id2/id3/id4/id5/id6/id7/id8/id9/id10/id11/id12/id13/id14/id15/id16/id17/id18/id19/id20/id21/id22/id23/id24/id25/id26/id27/id28/id29/id30/id31/id32/id33/id34/id35/id36/id37/id38/id39/id40/id41/id42/id43/id44/id45/id46/id47/id48/id49/id50/id51/id52/id53/id54/id55/id56/id57/id58/id59/id60/id61/id62/id63/id64/id65/id66/id67/id68/id69/id70/id71/id72/id73/id74/id75/id76/id77/id78/id79/id80/id81/id82/id83/id84/id85/id86/id87/id88/id89/id90/id91/id92/id93/id94/id95/id96/id97/id98/id99/id100/id101/id102/id103/id104/id105/id106/id107/id108/id109/id110/id111/id112/id113/id114/id115/id116/id117/id118/id119/id120/id121/id122/id123/id124/id125/id126/id127/id128/id129/id130/id131/id132/id133/id134/id135/id136/id137/id138/id139/id140/id141/id142/id143/id144/id145/id146/id147/id148/id149/id150/id151/id152/id153/id154/id155/id156/id157/id158/id159/id160/id161/id162/id163/id164/id165/id166/id167/id168/id169/id170/id171/id172/id173/id174/id175/id176/id177/id178/id179/id180/id181/id182/id183/id184/id185/id186/id187/id188/id189/id190/id191/id192/id193/id194/id195/id196/id197/id198/id199/id200/id201/id202/id203/id204/id205/id206/id207/id208/id209/id210/id211/id212/id213/id214/id215/id216/id217/id218/id219/id220/id221/id222/id223/id224/id225/id226/id227/id228/id229/id230/id231/id232/id233/id234/id235/id236/id237/id238/id239/id240/id241/id242/id243/id244/id245/id246/id247/id248/id249/id250/id251/id252/id253/id254/id255/id256/id257/id258/id259/id260/id261/id262/id263/id264/id265/id266/id267/id268/id269/id270/id271/id272/id273/id274/id275/id276/id277/id278/id279/id280/id281/id282/id283/id284/id285/id286/id287/id288/id289/id290/id291/id292/id293/id294/id295/id296/id297/id298/id299/id300/id301/id302/id303/id304/id305/id306/id307/id308/id309/id310/id311/id312/id313/id314/id315/id316/id317/id318/id319/id320/id321/id322/id323/id324/id325/id326/id327/id328/id329/id330/id331/id332/id333/id334/id335/id336/id337/id338/id339/id340/id341/id342/id343/id344/id345/id346/id347/id348/id349/id350/id351/id352/id353/id354/id355/id356/id357/id358/id359/id360/id361/id362/id363/id364/id365/id366/id367/id368/id369/id370/id371/id372/id373/id374/id375/id376/id377/id378/id379/id380/id381/id382/id383/id384/id385/id386/id387/id388/id389/id390/id391/id392/id393/id394/id395/id396/id397/id398/id399/id400/id401/id402/id403/id404/id405/id406/id407/id408/id409/id410/id411/id412/id413/id414/id415/id416/id417/id418/id419/id420/id421/id422/id423/id424/id425/id426/id427/id428/id429/id430/id431/id432/id433/id434/id435/id436/id437/id438/id439/id440/id441/id442/id443/id444/id445/id446/id447/id448/id449/id450/id451/id452/id453/id454/id455/id456/id457/id458/id459/id460/id461/id462/id463/id464/id465/id466/id467/id468/id469/id470/id471/id472/id473/id474/id475/id476/id477/id478/id479/id480/id481/id482/id483/id484/id485/id486/id487/id488/id489/id490/id491/id492/id493/id494/id495/id496/id497/id498/id499/id500/id501/id502/id503/id504/id505/id506/id507/id508/id509/id510/id511/id512/id513/id514/id515/id516/id517/id1/id2/id3/id4/id5/id6/id7/id8/id9/id10/id11/id12/id13/id14/id15/id16/id17/id18/id19/id20/id21/id22/id23/id24/id25/id26/id27/id28/id29/id30/id31/id32/id33/id34/id35/id36/id37/id38/id39/id40/id41/id42/id43/id44/id45/id46/id47/id48/id49/id50/id51/id52/id53/id54/id55/id56/id57/id58/id59/id60/id61/id62/id63/id64/id65/id66/id67/id68/id69/id70/id71/id72/id73/id74/id75/id76/id77/id78/id79/id80/id81/id82/id83/id84/id85/id86/id87/id88/id89/id90/id91/id92/id93/id94/id95/id96/id97/id98/id99/id100/id101/id102/id103/id104/id105/id106/id107/id108/id109/id110/id111/id112/id113/id114/id115/id116/id117/id118/id119/id120/id121/id122/id123/id124/id125/id126/id127/id128/id129/id130/id131/id132/id133/id134/id135/id136/id137/id138/id139/id140/id141/id142/id143/id144/id145/id146/id147/id148/id149/id150/id151/id152/id153/id154/id155/id156/id157/id158/id159/id160/id161/id162/id163/id164/id165/id166/id167/id168/id169/id170/id171/id172/id173/id174/id175/id176/id177/id178/id179/id180/id181/id182/id183/id184/id185/id186/id187/id188/id189/id190/id191/id192/id193/id194/id195/id196/id197/id198/id199/id200/id201/id202/id203/id204/id205/id206/id207/id208/id209/id210/id211/id212/id213/id214/id215/id216/id217/id218/id219/id220/id221/id222/id223/id224/id225/id226/id227/id228/id229/id230/id231/id232/id233/id234/id235/id236/id237/id238/id239/id240/id241/id242/id243/id244/id245/id246/id247/id248/id249/id250/id251/id252/id253/id254/id255/id256/id257/id258/id259/id260/id261/id262/id263/id264/id265/id266/id267/id268/id269/id270/id271/id272/id273/id274/id275/id276/id277/id278/id279/id280/id281/id282/id283/id284/id285/id286/id287/id288/id289/id290/id291/id292/id293/id294/id295/id296/id297/id298/id299/id300/id301/id302/id303/id304/id305/id306/id307/id308/id309/id310/id311/id312/id313/id314/id315/id316/id317/id318/id319/id320/id321/id322/id323/id324/id325/id326/id327/id328/id329/id330/id331/id332/id333/id334/id335/id336/id337/id338/id339/id340/id341/id342/id343/id344/id345/id346/id347/id348/id349/id350/id351/id352/id353/id354/id355/id356/id357/id358/id359/id360/id361/id362/id363/id364/id365/id366/id367/id368/id369/id370/id371/id372/id373/id374/id375/id376/id377/id378/id379/id380/id381/id382/id383/id384/id385/id386/id387/id388/id389/id390/id391/id392/id393/id394/id395/id396/id397/id398/id399/id400/id401/id402/id403/id404/id405/id406/id407/id408/id409/id410/id411/id412/id413/id414/id415/id416/id417/id418/id419/id420/id421/id422/id423/id424/id425/id426/id427/id428/id429/id430/id431/id432/id433/id434/id435/id436/id437/id438/id439/id440/id441/id442/id443/id444/id445/id446/id447/id448/id449/id450/id451/id452/id453/id454/id455/id456/id457/id458/id459/id460/id461/id462/id463/id464/id465/id466/id467/id468/id469/id470/id471/id472/id473/id474/id475/id476/id477/id478/id479/id480/id481/id482/id483/id484/id485/id486/id487/id488/id489/id490/id491/id492/id493/id494/id495/id496/id497/id498/id499/id500/id501/id502/id503/id504/id505/id506/id507/id508/id509/id510/id511/id512/id513/id514/id515/id516/id517/id453/id132/id247/id241/id384/id73/id176/id347/id388/id182', '1&shaman&kshama&id34*1/id36*1/id39*1/id32*1/id33*1/id37*1/id35*1@2&new card set&kpriest&id9*1/id6*1/id125*1/id3*1/id193*1/id4*1@3&new card set&krogue&id53*1/id57*1@4&new card set&kwarrior&id77*1@5&new card set&kpaladin&id68*1@6&new card set&kdruid&id15*1@7&new card set&kwarlock&id50*1/id277*1@8&new card set&kmage&id24*2/id27*2/id267*2/id1*2/id23*2/id22*2/id20*2/id21*2/id86*2/id87*2/id26*2/id19*2/id29*2/id25*2/id2*2'),
('user1', '123456', 'user1', 'user1@qq.com', 0, 0, 2, 0, '', ''),
('user2', '123456', 'user2', 'user2@qq.com', 0, 0, 3, 0, '', ''),
('user3', '123456', 'user3', 'user3@qq.com', 0, 0, 4, 0, '', ''),
('user4', '123456', 'user4', 'user4@qq.com', 0, 0, 5, 0, '', ''),
('user5', '123456', 'user5', 'user5@qq.com', 0, 0, 6, 0, '', ''),
('user6', '123456', 'user6', 'user@qq.com', 0, 0, 7, 0, '', ''),
('user7', '123456', 'user7', 'user7@qq.com', 0, 0, 11, 0, NULL, NULL),
('user8', '123456', 'user8', 'user8@qq.com', 0, 0, 9, 0, NULL, NULL),
('user9', '123456', 'user9', 'user9@qq.com', 0, 0, 10, 0, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
