-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2018-05-31 16:46:21
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `penaut`
--

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) NOT NULL,
  `provice` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `town` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `uid` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`id`, `address`, `provice`, `city`, `town`, `tel`, `uid`) VALUES
(3, '新县镇9号', '安徽', '安庆', '迎江区', '13523453456', 1),
(4, '体育馆', '山西', '太原', '小店区', '13623623454', 1);

-- --------------------------------------------------------

--
-- 表的结构 `buycar`
--

CREATE TABLE IF NOT EXISTS `buycar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(100) NOT NULL,
  `price` varchar(1000) NOT NULL,
  `count` int(255) NOT NULL,
  `total` varchar(3000) NOT NULL,
  `goods` varchar(100) NOT NULL,
  `img` varchar(2000) NOT NULL,
  `uid` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `buycar`
--

INSERT INTO `buycar` (`id`, `pid`, `price`, `count`, `total`, `goods`, `img`, `uid`) VALUES
(1, 1, '￥210', 3, '', '任华平', '', 0),
(15, 8, '21.88', 5, '', '大杏仁坚果', '/api/img/15272156244124.jpg', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fenlei`
--

CREATE TABLE IF NOT EXISTS `fenlei` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fenlei`
--

INSERT INTO `fenlei` (`id`, `name`) VALUES
(1, '轻松好事'),
(2, '酥脆坚果'),
(3, '旅游专供'),
(4, '果脯好牌');

-- --------------------------------------------------------

--
-- 表的结构 `list`
--

CREATE TABLE IF NOT EXISTS `list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `list`
--

INSERT INTO `list` (`id`, `pid`, `status`) VALUES
(1, 1, 2),
(2, 1, 0),
(3, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `listtwo`
--

CREATE TABLE IF NOT EXISTS `listtwo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `count` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `listtwo`
--

INSERT INTO `listtwo` (`id`, `dingdanid`, `goodsid`, `count`) VALUES
(1, 1, 2, 99),
(2, 2, 7, 6),
(3, 3, 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `name`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `fid` int(100) NOT NULL,
  `rid` varchar(100) NOT NULL DEFAULT '[]',
  `price` varchar(1000) NOT NULL,
  `count` varchar(1000) NOT NULL,
  `contfree` varchar(1) NOT NULL,
  `des` varchar(3000) NOT NULL,
  `img` varchar(3000) NOT NULL DEFAULT '[]',
  `time` varchar(100) NOT NULL,
  `sell` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `fid`, `rid`, `price`, `count`, `contfree`, `des`, `img`, `time`, `sell`) VALUES
(1, '奶香腰果', 1, '[2]', '23.99', '22', '1', '纸皮巴旦木500g新疆大杏仁坚果薄壳杏仁扁桃仁手剥巴旦木NP包邮', '[{"name":"4_09.png","url":"/api/img/15272135632234_09.png"},{"name":"goods2.png","url":"/api/img/1527213563223goods2.png"},{"name":"xiangxi_2.png","url":"/api/img/1527213563223xiangxi_2.png"},{"name":"dt1_02.png","url":"/api/img/1527759065170dt1_02.png"},{"name":"dt1_04.png","url":"/api/img/1527759065171dt1_04.png"},{"name":"dt1_06.png","url":"/api/img/1527759065171dt1_06.png"},{"name":"444.png","url":"/api/img/1527759065171444.png"}]', '2018-05-07', 687),
(2, '丸子坚果', 2, '[3]', '26.99', '50', '0', '纸皮巴旦木500g新疆大杏仁坚果薄壳杏仁扁桃仁手剥巴旦木NP包邮', '[{"name":"555_11.png","url":"/api/img/1527213442585555_11.png"},{"name":"goods3.png","url":"/api/img/1527213442585goods3.png"},{"name":"xiangxi_3.png","url":"/api/img/1527479491408xiangxi_3.png"},{"name":"dt2_02.png","url":"/api/img/1527760893520dt2_02.png"},{"name":"dt2_04.png","url":"/api/img/1527760893520dt2_04.png"},{"name":"dt2_06.png","url":"/api/img/1527760893520dt2_06.png"},{"name":"2.png","url":"/api/img/15277608935202.png"}]', '2018-05-14', 0),
(3, '巴旦木仁坚果', 3, '[2]', '45.99', '65', '1', '美国大杏仁原味无壳巴旦木仁坚果仁扁桃仁500g盐焗巴达木袋装包邮', '[{"name":"1_07.png","url":"/api/img/15272137815181_07.png"},{"name":"4.jpg","url":"/api/img/15272162019064.jpg"},{"name":"xiangxi_1.png","url":"/api/img/1527479542060xiangxi_1.png"},{"name":"444.png","url":"/api/img/1527762622578444.png"},{"name":"data12_02.png","url":"/api/img/1527762622578data12_02.png"},{"name":"data12_04.png","url":"/api/img/1527762622578data12_04.png"},{"name":"data12_06.png","url":"/api/img/1527762622578data12_06.png"}]', '2018-05-21', 0),
(4, '奶油巴旦木', 2, '[2]', '21.66', '50', '0', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"4_09.png","url":"/api/img/15272138242554_09.png"},{"name":"10.jpg","url":"/api/img/152721382425510.jpg"},{"name":"xiangxi_3.png","url":"/api/img/1527478682733xiangxi_3.png"},{"name":"data12_02.png","url":"/api/img/1527765273910data12_02.png"},{"name":"data12_04.png","url":"/api/img/1527765273911data12_04.png"},{"name":"dt3_02.png","url":"/api/img/1527765273911dt3_02.png"},{"name":"adf1.jpg","url":"/api/img/1527765273911adf1.jpg"}]', '2018-05-28', 777),
(5, '无盐无糖坚果', 4, '[2]', '42.88', '45', '1', '美国大杏仁原味熟无盐无糖零食坚果盐焗味巴旦木仁扁桃仁500g包邮', '[{"name":"goods2.png","url":"/api/img/1527215315780goods2.png"},{"name":"x_11.png","url":"/api/img/1527215315780x_11.png"},{"name":"555_11.png","url":"/api/img/1527216443265555_11.png"}]', '2018-05-07', 0),
(6, '新疆扁桃仁坚果', 2, '[3,2]', '28.99', '60', '1', '盐焗巴旦木仁小袋独立包装美国大杏仁新疆扁桃仁坚果零食260g包邮', '[{"name":"4.jpg","url":"/api/img/15272155418084.jpg"},{"name":"555_11.png","url":"/api/img/1527215541809555_11.png"},{"name":"xiangxi_1.png","url":"/api/img/1527215541809xiangxi_1.png"},{"name":"3asd_04.png","url":"/api/img/15277770281533asd_04.png"},{"name":"323_02.png","url":"/api/img/1527777028154323_02.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527777028154asqw.webp.jpg"},{"name":"dt1_06.png","url":"/api/img/1527777028154dt1_06.png"}]', '2018-05-14', 0),
(7, '零食炒货坚果', 1, '[1,2]', '19.99', '45', '0', '果夫子新疆特产薄壳巴旦木半斤装手剥干果零食炒货坚果250克', '[{"name":"1_03.png","url":"/api/img/15272155956941_03.png"},{"name":"1_17.png","url":"/api/img/15272155956951_17.png"},{"name":"5_03.png","url":"/api/img/15272155956955_03.png"},{"name":"2.png","url":"/api/img/15277656629942.png"},{"name":"3dfg_02.png","url":"/api/img/15277656629953dfg_02.png"},{"name":"1233_04.png","url":"/api/img/15277656629951233_04.png"},{"name":"data12_04.png","url":"/api/img/1527765662995data12_04.png"}]', '2018-05-21', 0),
(8, '大杏仁坚果', 2, '[1,2,3]', '21.88', '32', '1', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"4.jpg","url":"/api/img/15272156244124.jpg"},{"name":"4_09.png","url":"/api/img/15272156244124_09.png"},{"name":"ren2.png","url":"/api/img/1527215624412ren2.png"},{"name":"2.png","url":"/api/img/15277661794462.png"},{"name":"dt3_02.png","url":"/api/img/1527766179446dt3_02.png"},{"name":"dt3_04.png","url":"/api/img/1527766179446dt3_04.png"},{"name":"dt3_06.png","url":"/api/img/1527766179446dt3_06.png"}]', '2018-05-28', 0),
(9, '扁桃仁干果坚果', 2, '[1,3]', '23.22', '67', '0', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"555_11.png","url":"/api/img/1527215657122555_11.png"},{"name":"l1.png","url":"/api/img/1527215657122l1.png"},{"name":"m1.png","url":"/api/img/1527215657122m1.png"},{"name":"3dfg_02.png","url":"/api/img/15277661427143dfg_02.png"},{"name":"asddf_02.png","url":"/api/img/1527766142714asddf_02.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527766142714asqw.webp.jpg"},{"name":"data12_04.png","url":"/api/img/1527766142714data12_04.png"}]', '2018-05-07', 0),
(10, '新疆特产杏仁坚果', 2, '[1]', '30.66', '27', '1', '沙漠玉珠_纸皮巴旦木436克新疆特产大杏仁坚果零食袋装批发包邮', '[{"name":"555_11.png","url":"/api/img/1527215961147555_11.png"},{"name":"goods3.png","url":"/api/img/1527215961147goods3.png"},{"name":"1_15.png","url":"/api/img/15274799811171_15.png"},{"name":"3dfg_02.png","url":"/api/img/15277660956913dfg_02.png"},{"name":"323_02.png","url":"/api/img/1527766095691323_02.png"},{"name":"444.png","url":"/api/img/1527766095692444.png"},{"name":"asddf_02.png","url":"/api/img/1527766095692asddf_02.png"}]', '2018-05-14', 0),
(11, '壳奶杏仁坚果', 2, '[1,2]', '14.77', '53', '0', '新货巴西奶油夏威夷果500g罐装坚果零食烘焙原料', '[{"name":"4_07.png","url":"/api/img/15272164964264_07.png"},{"name":"555_11.png","url":"/api/img/1527216496428555_11.png"},{"name":"goods3.png","url":"/api/img/1527216496428goods3.png"},{"name":"444.png","url":"/api/img/1527777065345444.png"},{"name":"6563_02.png","url":"/api/img/15277770653456563_02.png"},{"name":"dt1_02.png","url":"/api/img/1527777065345dt1_02.png"},{"name":"dt1_04.png","url":"/api/img/1527777065345dt1_04.png"}]', '2018-05-21', 0),
(12, '扁桃仁干果', 4, '[1,2]', '23.45', '48', '1', '18年杏仁肉无壳巴旦木仁连罐总重500g扁桃仁干果坚果零食包邮盐焗', '[{"name":"4_09.png","url":"/api/img/15272165204654_09.png"},{"name":"5_03.png","url":"/api/img/15272165204655_03.png"},{"name":"goods3.png","url":"/api/img/1527216520465goods3.png"},{"name":"323_02.png","url":"/api/img/1527764642133323_02.png"},{"name":"234234_03.png","url":"/api/img/1527764642134234234_03.png"},{"name":"sd3_02.png","url":"/api/img/1527764642134sd3_02.png"},{"name":"2.png","url":"/api/img/15277647475562.png"}]', '2018-05-28', 0),
(13, '无壳巴旦木仁', 2, '[2,3]', '54.33', '35', '0', '新货美国大杏仁肉盐焗味无壳巴旦木仁500g罐装坚果零食烘焙原料', '[{"name":"1_17.png","url":"/api/img/15272165594031_17.png"},{"name":"xiangxi_3.png","url":"/api/img/1527216559403xiangxi_3.png"},{"name":"1_15.png","url":"/api/img/15272165594031_15.png"},{"name":"3asdasda_02.png","url":"/api/img/15277770928983asdasda_02.png"},{"name":"3saadds_02.png","url":"/api/img/15277770928983saadds_02.png"},{"name":"123sdf3_01_02.png","url":"/api/img/1527777092898123sdf3_01_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527777092898adfsfg.jpg"}]', '2018-05-07', 0),
(14, '新货零食坚果果仁', 1, '[2]', '12.33', '36', '1', '新货零食坚果果仁 巴旦木仁 扁桃仁 无壳大杏仁500g特价包邮杏仁', '[{"name":"1_15.png","url":"/api/img/15272165854281_15.png"},{"name":"7.jpg","url":"/api/img/15272165854297.jpg"},{"name":"l1.png","url":"/api/img/1527216585429l1.png"},{"name":"3asd_02.png","url":"/api/img/15277662022853asd_02.png"},{"name":"3dfg_02.png","url":"/api/img/15277662022853dfg_02.png"},{"name":"323_02.png","url":"/api/img/1527766202285323_02.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527766202285asqw.webp.jpg"}]', '2018-05-14', 0),
(15, '老街口-巴旦木仁', 3, '[3]', '45.66', '46', '1', '老街口-巴旦木仁250g 零食新疆特产坚果炒货干果无壳扁桃杏仁批发', '[{"name":"1_07.png","url":"/api/img/15272166197711_07.png"},{"name":"7.jpg","url":"/api/img/15272166197717.jpg"},{"name":"4.jpg","url":"/api/img/15272166197714.jpg"}]', '2018-05-21', 0),
(16, '越南碳烤腰果', 2, '[2,3]', '21.45', '26', '0', '新货越南碳烤腰果 特价炭烧 奶香 盐焗零食500g包邮', '[{"name":"4_09.png","url":"/api/img/15272166393694_09.png"},{"name":"5_03.png","url":"/api/img/15272166393695_03.png"},{"name":"10.jpg","url":"/api/img/152721663936910.jpg"},{"name":"asqw.webp.jpg","url":"/api/img/1527777126888asqw.webp.jpg"},{"name":"dt2_04.png","url":"/api/img/1527777126888dt2_04.png"},{"name":"dt3_02.png","url":"/api/img/1527777126888dt3_02.png"},{"name":"dt3_06.png","url":"/api/img/1527777126888dt3_06.png"}]', '2018-05-28', 0),
(17, '奶油夏威夷果', 2, '[2,3]', '41.45', '45', '0', '新货巴西奶油夏威夷果500g罐装坚果零食烘焙原料', '[{"name":"goods1.png","url":"/api/img/1527217998913goods1.png"},{"name":"timg (2).jpg","url":"/api/img/1527217998913timg (2).jpg"},{"name":"timg (21).jpg","url":"/api/img/1527217998913timg (21).jpg"},{"name":"3asd_04.png","url":"/api/img/15277771473643asd_04.png"},{"name":"3dfg_02.png","url":"/api/img/15277771473643dfg_02.png"},{"name":"3saadds_02.png","url":"/api/img/15277771473643saadds_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527777147364adfsfg.jpg"}]', '2018-05-07', 0),
(18, '每日松子坚果', 3, '[2,1]', '45.55', '21', '0', '美国松子肉500g罐装坚果零食烘焙原料', '[{"name":"goods4.png","url":"/api/img/1527218140079goods4.png"},{"name":"ren2.png","url":"/api/img/1527218140079ren2.png"},{"name":"timg (8).jpg","url":"/api/img/1527218140079timg (8).jpg"},{"name":"444.png","url":"/api/img/1527777200483444.png"},{"name":"data12_04.png","url":"/api/img/1527777200483data12_04.png"},{"name":"dt1_06.png","url":"/api/img/1527777200483dt1_06.png"},{"name":"dt2_02.png","url":"/api/img/1527777200483dt2_02.png"}]', '2018-05-14', 0),
(19, '英国碧根果', 1, '[2,3]', '56.99', '31', '0', '新货英国碧根果肉盐焗味无壳500g罐装坚果零食烘焙原料', '[{"name":"timg (8).jpg","url":"/api/img/1527218293824timg (8).jpg"},{"name":"timg (11).jpg","url":"/api/img/1527218293824timg (11).jpg"},{"name":"xiangxi_2.png","url":"/api/img/1527218293824xiangxi_2.png"},{"name":"3asd_02.png","url":"/api/img/15277769136083asd_02.png"},{"name":"3asd_04.png","url":"/api/img/15277769136103asd_04.png"},{"name":"3asdasda_02.png","url":"/api/img/15277769136103asdasda_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527776913611adfsfg.jpg"}]', '2018-05-21', 0),
(20, '美国大瓜子', 3, '[3]', '23.66', '12', '1', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"4_09.png","url":"/api/img/15272183464164_09.png"},{"name":"5_03.png","url":"/api/img/15272183464165_03.png"},{"name":"7.jpg","url":"/api/img/15272183464167.jpg"},{"name":"2.png","url":"/api/img/15277772141802.png"},{"name":"3asd_04.png","url":"/api/img/15277772141803asd_04.png"},{"name":"3asdasda_02.png","url":"/api/img/15277772141803asdasda_02.png"},{"name":"323_02.png","url":"/api/img/1527777214180323_02.png"}]', '2018-05-28', 0),
(21, '新疆干枣片', 3, '[3]', '43.66', '52', '0', '新货美国大杏仁肉盐焗味无壳巴旦木仁500g罐装坚果零食烘焙原料', '[{"name":"2018-05-25_110532.png","url":"/api/img/15272183903722018-05-25_110532.png"},{"name":"2018-05-25_110720.png","url":"/api/img/15272183903722018-05-25_110720.png"},{"name":"m1.png","url":"/api/img/1527486974861m1.png"},{"name":"3asdasda_02.png","url":"/api/img/15277772311203asdasda_02.png"},{"name":"3dfg_02.png","url":"/api/img/15277772311213dfg_02.png"},{"name":"3saadds_02.png","url":"/api/img/15277772311223saadds_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527777231122adfsfg.jpg"}]', '2018-05-07', 0),
(22, '零食坚果大礼包', 1, '[3]', '50.33', '36', '0', '18年杏仁肉无壳巴旦木仁连罐总重500g扁桃仁干果坚果零食包邮盐焗', '[{"name":"timg (7).jpg","url":"/api/img/1527218475768timg (7).jpg"},{"name":"timg.jpg","url":"/api/img/1527218475768timg.jpg"},{"name":"s1.png","url":"/api/img/1527489995919s1.png"},{"name":"3saadds_02.png","url":"/api/img/15277769432403saadds_02.png"},{"name":"123sdf3_01_02.png","url":"/api/img/1527776943240123sdf3_01_02.png"},{"name":"4563_02.png","url":"/api/img/15277769432404563_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527776943240adfsfg.jpg"}]', '2018-05-21', 0),
(23, '多味大花生', 1, '[2]', '35.66', '34', '1', '新货美国大杏仁肉盐焗味无壳巴旦木仁500g罐装坚果零食烘焙原料', '[{"name":"2018-05-25_110634.png","url":"/api/img/15272185237782018-05-25_110634.png"},{"name":"2018-05-25_110700.png","url":"/api/img/15272185237782018-05-25_110700.png"},{"name":"foot.jpg","url":"/api/img/1527218523778foot.jpg"},{"name":"2.png","url":"/api/img/15277769871722.png"},{"name":"3saadds_02.png","url":"/api/img/15277769871723saadds_02.png"},{"name":"4563_02.png","url":"/api/img/15277769871724563_02.png"},{"name":"6563_02.png","url":"/api/img/15277769871726563_02.png"},{"name":"asddf_02.png","url":"/api/img/1527776987172asddf_02.png"}]', '2018-05-14', 0),
(24, '孕妇坚果礼盒', 2, '[1]', '50.12', '52', '0', '纸皮巴旦木500g新疆大杏仁坚果薄壳杏仁扁桃仁手剥巴旦木NP包邮', '[{"name":"5_03.png","url":"/api/img/15272185685605_03.png"},{"name":"2018-05-25_110700.png","url":"/api/img/15272185685602018-05-25_110700.png"},{"name":"ren1.png","url":"/api/img/1527218568560ren1.png"},{"name":"3asd_02.png","url":"/api/img/15277771751663asd_02.png"},{"name":"3asdasda_02.png","url":"/api/img/15277771751663asdasda_02.png"},{"name":"3dfg_02.png","url":"/api/img/15277771751663dfg_02.png"},{"name":"asddf_02.png","url":"/api/img/1527777175166asddf_02.png"}]', '2018-05-28', 0),
(25, '坚果干果组合', 3, '[3]', '46.23', '14', '1', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"1_15.png","url":"/api/img/15272186908091_15.png"},{"name":"4_03.png","url":"/api/img/15272186908104_03.png"},{"name":"s2.png","url":"/api/img/1527490961333s2.png"},{"name":"3asd_02.png","url":"/api/img/15277772594333asd_02.png"},{"name":"323_02.png","url":"/api/img/1527777259433323_02.png"},{"name":"4563_02.png","url":"/api/img/15277772594334563_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527777259434adfsfg.jpg"}]', '2018-05-28', 0),
(26, '吸睛大礼包', 4, '[1,3]', '199', '40', '0', '吸睛大礼包，好吃又实惠', '[{"name":"ren2.png","url":"/api/img/1527475040981ren2.png"},{"name":"ren3.png","url":"/api/img/1527475040983ren3.png"},{"name":"ren4.png","url":"/api/img/1527475040984ren4.png"},{"name":"323_02.png","url":"/api/img/1527764790492323_02.png"},{"name":"444.png","url":"/api/img/1527764790492444.png"},{"name":"dt1_06.png","url":"/api/img/1527764790492dt1_06.png"},{"name":"dt3_02.png","url":"/api/img/1527764790492dt3_02.png"}]', '2018-05-29', 0),
(27, '桶装大礼包', 4, '[1]', '199', '21', '0', '桶装，方便又美观', '[{"name":"l2.png","url":"/api/img/1527475968031l2.png"},{"name":"m1.png","url":"/api/img/1527475968031m1.png"},{"name":"ren2.png","url":"/api/img/1527475968032ren2.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527766300496asqw.webp.jpg"},{"name":"dt1_04.png","url":"/api/img/1527766300496dt1_04.png"},{"name":"dt1_06.png","url":"/api/img/1527766300497dt1_06.png"},{"name":"dt3_04.png","url":"/api/img/1527766300497dt3_04.png"}]', '2018-05-30', 0),
(28, '盒装大礼包', 1, '[2]', '188', '12', '0', '盒装大礼包，经济又实惠', '[{"name":"4_03.png","url":"/api/img/15274760522854_03.png"},{"name":"4_07.png","url":"/api/img/15274760522854_07.png"},{"name":"ren3.png","url":"/api/img/1527476052285ren3.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527766067720asqw.webp.jpg"},{"name":"dt1_06.png","url":"/api/img/1527766067721dt1_06.png"},{"name":"dt2_06.png","url":"/api/img/1527766067721dt2_06.png"},{"name":"dt3_02.png","url":"/api/img/1527766067721dt3_02.png"}]', '2018-05-30', 0),
(29, '袋装大礼包', 3, '[2]', '177', '31', '0', '袋装大礼包，美味又实惠', '[{"name":"555_11.png","url":"/api/img/1527476196498555_11.png"},{"name":"m1.png","url":"/api/img/1527476196498m1.png"},{"name":"ren4.png","url":"/api/img/1527476196498ren4.png"},{"name":"4563_02.png","url":"/api/img/15277772745184563_02.png"},{"name":"6563_02.png","url":"/api/img/15277772745186563_02.png"},{"name":"asddf_02.png","url":"/api/img/1527777274518asddf_02.png"},{"name":"asqw.webp.jpg","url":"/api/img/1527777274518asqw.webp.jpg"}]', '2018-05-30', 0),
(30, '零食大大大礼包', 3, '[1]', '66.66', '12', '0', '手剥薄壳奶油巴旦木500g大杏仁坚果 干果 炒货扁桃仁零食包邮', '[{"name":"xinpin.png","url":"/api/img/1527478399410xinpin.png"},{"name":"xiangxi_2.png","url":"/api/img/1527478399410xiangxi_2.png"},{"name":"xiangxi_3.png","url":"/api/img/1527478399410xiangxi_3.png"},{"name":"3saadds_02.png","url":"/api/img/15277772979603saadds_02.png"},{"name":"adfsfg.jpg","url":"/api/img/1527777297960adfsfg.jpg"},{"name":"data12_02.png","url":"/api/img/1527777297961data12_02.png"},{"name":"dt1_06.png","url":"/api/img/1527777297961dt1_06.png"}]', '2018-05-29', 0);

-- --------------------------------------------------------

--
-- 表的结构 `recom`
--

CREATE TABLE IF NOT EXISTS `recom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `recom`
--

INSERT INTO `recom` (`id`, `name`) VALUES
(1, '每周上新'),
(2, '折扣专区'),
(3, '热门推销');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `account` varchar(100) NOT NULL,
  `img` varchar(1000) NOT NULL DEFAULT '[]',
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `account`, `img`, `phone`) VALUES
(1, 'aa', '12', 'admin', '[{"name":"s1.png","url":"/api/img/1527574725478s1.png"}]', '13623662629'),
(2, '李三', '123', 'lisi', '[]', '13623662621');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
