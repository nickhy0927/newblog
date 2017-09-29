-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5138
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 blog 的数据库结构
DROP DATABASE IF EXISTS `blog`;
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog`;

-- 导出  表 blog.t_c_article 结构
DROP TABLE IF EXISTS `t_c_article`;
CREATE TABLE IF NOT EXISTS `t_c_article` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `approval_status` int(11) DEFAULT NULL,
  `content` longtext,
  `title` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `shows` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6brnhms2h99uppc1xaxkc31wi` (`category_id`),
  KEY `FK_oi095swawmh241css0lsdx7f3` (`user_id`),
  CONSTRAINT `FK_6brnhms2h99uppc1xaxkc31wi` FOREIGN KEY (`category_id`) REFERENCES `t_c_category` (`id`),
  CONSTRAINT `FK_oi095swawmh241css0lsdx7f3` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_c_article 的数据：~13 rows (大约)
DELETE FROM `t_c_article`;
/*!40000 ALTER TABLE `t_c_article` DISABLE KEYS */;
INSERT INTO `t_c_article` (`id`, `create_time`, `disabled`, `update_time`, `approval_status`, `content`, `title`, `category_id`, `user_id`, `shows`) VALUES
	('297fe7f9-9281-4611-ab11-d7f2d3933a21', '2017-08-17 11:05:01', b'0', '2017-08-17 14:49:51', 1, '2017年5月12日,全球爆发电脑勒索病毒WannaCry,波及150多个国家7.5万台电脑被感染,有99个国家遭受了攻击,其中包括英国、美国、中国、俄罗斯、西班牙和意大利等。\r\n<img src="http://www.cctime.com/upLoadFile/2017/8/17/201781710847734.jpeg" style="border: 0px; padding: 0px; margin: 5px 0px; max-width: 600px; vertical-align: middle;" _src="http://www.cctime.com/upLoadFile/2017/8/17/201781710847734.jpeg">\r\n勒索病毒,是一种新型电脑病毒,主要以邮件和恶链木马的形式进行传播。主要通过邮件附件、钓鱼邮件群发下载网址链接、用户在恶意站点下载病毒文件以及网页挂马后进行传播。感染病毒后文件会被加密,需要支付高额赎金才可能解密恢复文件。5月12日起已有100多个国家和地区超过10万台电脑遭感染,国内2.8万家机构被勒索病毒攻陷,苏浙粤为重灾区。\r\n<img src="http://www.cctime.com/upLoadFile/2017/8/17/201781710847580.jpeg" style="border: 0px; padding: 0px; margin: 5px 0px; max-width: 600px; vertical-align: middle;" _src="http://www.cctime.com/upLoadFile/2017/8/17/201781710847580.jpeg">\r\n最近勒索病毒又盯上了火爆手游——王者荣耀,这种病毒冒充时下热门手游《王者荣耀》辅助工具的手机勒索病毒,该勒索病毒被安装进手机后,会对手机中照片、下载、云盘等目录下的个人文件进行加密,并索要赎金。据手机安全专家透露,该勒索病毒伪装成当下最热门的手游《王者荣耀》辅助外挂来诱惑用户下载和安装,并通过PC端和手机端的社交平台、游戏群等渠道进行传播扩散。\r\n<img src="http://www.cctime.com/upLoadFile/2017/8/17/201781710848621.jpeg" style="border: 0px; padding: 0px; margin: 5px 0px; max-width: 600px; vertical-align: middle;" _src="http://www.cctime.com/upLoadFile/2017/8/17/201781710848621.jpeg">\r\n该病毒性质恶劣、危害极大,一旦感染将给用户带来无法估量的损失。这种病毒利用系统内部的加密处理,而且是一种不可逆的加密,必须拿到解密的秘钥才有几率破解。一般的电脑用户面对这种病毒毫无招数,只能束手就擒,眼睁睁看着电脑变成一块呆板的木头,宝贵的资料也全部丢失。那么在平常使用电脑时,怎样才能真正有效并且安全的保护电脑呢?\r\n一般用户会安装杀毒软件,在平时操作中还得小心翼翼;高级用户会付费购买一些特别的软件保护电脑;而牛逼闪闪的用户,会自己开发一个软件保护自己的电脑,自己设计和制作的程序,放心!\r\n勒索病毒非常疯狂,我们觉得,牛逼闪闪一定是属于极其少数人的,所幸,我们在互联网机构及高手之中多番排查,找到了许多顽强的、坚韧不拔的对抗勒索病毒的专业户,可是他们更多还是通过借助第三方的力量以及付费软件的方式去对抗,这些都不是一劳永逸之举,会有很多后遗症,因为没有找到“对付病毒的根本方法”,只是“暂时杀毒”,不能将病毒“断根”,其中华育国际的学生却给了我们一份不一样的回答。\r\n“勒索病毒,与其去逐次杀灭,与其依靠第三方的力量,还不如读懂他,然后去挖掘解决勒索病毒的方式,开发对付一个杀毒的软件或应用。”基于这种思维,华育针对此次勒索病毒,作为教学案例在课堂上展开,与同学们一起研究破解办法,经过不懈的努力和反复探索,华育师生终于探索出防御体系,成功破解勒索病毒核心机密...\r\n<img src="http://www.cctime.com/upLoadFile/2017/8/17/201781710848360.jpeg" style="border: 0px; padding: 0px; margin: 5px 0px; max-width: 600px; vertical-align: middle;" _src="http://www.cctime.com/upLoadFile/2017/8/17/201781710848360.jpeg">\r\n华育国际作为IT培训行业的龙头大哥,不仅不会被勒索病毒影响,更能找到和预备一些预防措施,对于整个IT行业来说真是可喜可贺。IT行业的未来就在这一群极具活力创意的莘莘学子身上了,让我们一起期待由他们主导的IT行业!\r\n\r\n', '华育学子：不被勒索病毒入侵的实力人生', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'0'),
	('48d13d21-78e1-428d-8566-b49db75e8819', '2017-08-17 11:05:43', b'0', '2017-08-17 14:49:44', 2, '    据外媒报道，T-Mobile 刚刚正式按下了 600MHz LTE 频谱的启用开关，承诺用它来大力填补全美乡郊的网络连通性。2 个月前才刚拿到频谱许可的 T-Mobile，显然不希望浪费任何时间。其表示，在通常情况下，此等规模的推出将耗费 2 年多的时间。初期，该运营商率先在怀俄明州夏延地区启用了 600MHz LTE 。不过想要畅享该频谱，还需兼容设备的支持，比如三星和 LG 即将在今年 4 季度推出的新品。\r\n\r\n', 'T-Mobile上线600MHz LTE频段：需兼容设备与电视广播机构配合', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('56873b96-56e8-4ce0-bf8f-a2302866aea0', '2017-08-16 15:04:11', b'0', '2017-08-17 14:52:46', 1, '1111\r\n', '1', '5cc2c53b-a225-4568-b589-63168bffc102', NULL, b'0'),
	('6f0915c9-b32d-41ad-8056-d9ebc056c1b3', '2017-08-16 15:05:36', b'0', '2017-08-16 15:05:36', 0, '当年党中央离开西柏坡时，毛泽东同志说是“进京赶考”。60多年过去了，我们取得了巨大进步，中国人民站起来了，富起来了，但我们面临的挑战和问题依然严峻复杂，应该说，党面临的“赶考”远未结束。　　——习近平\r\n\r\n　　央视网消息：中国共产党始终处于“赶考”的历史进程中……\r\n\r\n　　2013年7月，革命圣地西柏坡。习近平总书记谆谆告诫全党，“党面临的‘赶考’远未结束”。\r\n<img src="http://p1.img.cctvpic.com/photoworkspace/contentimg/2017/08/16/2017081600082576559.jpg" alt="　　7月1日，庆祝中国共产党成立95周年大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平在大会上发表重要讲话。新华社记者 刘卫兵 摄" isflag="1" width="500" _src="http://p1.img.cctvpic.com/photoworkspace/contentimg/2017/08/16/2017081600082576559.jpg">\r\n　　2016年7月1日，庆祝中国共产党成立95周年大会在北京人民大会堂隆重举行。中共中央总书记、国家主席、中央军委主席习近平在大会上发表重要讲话。新华社记者 刘卫兵 摄\r\n\r\n　　2016年7月，在庆祝中国共产党成立95周年大会上，习近平再次提醒：“全党同志一定要不忘初心、继续前进。”\r\n\r\n　　在这场“赶考”中，中国共产党把全面从严治党纳入“四个全面”战略布局，以自我革命的勇气，破藩篱、去顽疾、立规矩、建制度、正风气，开辟了管党治党新境界，取得了全面从严治党新成就，赢得了党心民心！\r\n\r\n　　思想建党 重拾党员坚定信念\r\n\r\n　　不忘初心，方得始终。\r\n\r\n　　为了百姓温饱，夙兴夜寐，鞠躬尽瘁。为了群众小康，东奔西走，殚精竭虑。心中没有自我，始终装着“人民”。这是习近平总书记用行动回答的“初心”。\r\n\r\n　　2012年，刚刚就任总书记两天，习近平在十八届中共中央政治局第一次集体学习时严肃指出：“现实生活中，一些党员、干部出现这样那样的问题，说到底是信仰迷茫、精神迷失。”\r\n\r\n　　他从党的建设面临的挑战出发，阐明了党要管党、从严治党的现实紧迫性，开始在思想上给共产党员“补钙”。\r\n\r\n　　——八项规定影响深远。\r\n\r\n　　2012年12月4日晚上七点，《新闻联播》的片头曲如约响起。当时很多人也许并没有意识到，这天晚上，《新闻联播》的一条新闻将给未来的中国带来巨大影响——中共中央政治局召开会议，审议中央政治局关于改进工作作风、密切联系群众的八项规定，从中央政治局带头做起，深入推进党风廉政建设和反腐败斗争。\r\n\r\n　　十八届中央领导集体在工作开局之初便从作风建设破题，由中央政治局带头，从一件件小事抓起，驰而不息，以上率下，狠抓中央八项规定精神落实，坚决纠正“四风”。这是十八大以来全面从严治党的重要突破口。\r\n\r\n　　——群众路线落地生根。\r\n\r\n　　“群众路线是我们党的生命线和根本工作路线。”习近平多次强调密切联系群众的重要性。走群众路线，也是他的一贯作风。\r\n\r\n　　在北京平价包子铺，吃一顿21元的便餐；在甘肃兰州，为养老餐厅里七旬老人端饭；在海南，高兴地戴上黎族群众递上的斗笠；在湖南湘西，询问一位老人的年龄后说“你是大姐”……\r\n\r\n　　1200余字的2017年新年贺词中，习近平10次提到“人民”、5次提到“群众”，用了187个字的段落来谈“脱贫”。“身入”基层更是“心到”基层。\r\n\r\n　　风清则气正，气正则心齐，心齐则事成。群众路线教育活动使党在群众中的威信和形象进一步提升，党心民心进一步凝聚，形成了推动国家发展的强大正能量。\r\n\r\n　　——三严三实贵在常态。\r\n\r\n　　习近平总书记关于“严以修身、严以用权、严以律己，又谋事要实、创业要实、做人要实”的重要论述，是党员干部安身立命的根本。\r\n\r\n　　“不得罪成百上千的腐败分子，就要得罪13亿人民。”中国共产党作为执政党，面对暴露出的问题，刀刃向内，自我刮骨疗毒，坚持有腐必反、有贪必肃，无禁区、全覆盖、零容忍，坚决遏制腐败蔓延势头。\r\n\r\n　　中央严肃查处周永康、薄熙来、郭伯雄、徐才厚、令计划、苏荣等严重违纪案件。坚决查处腐败官员，彰显了党中央尊崇党章、严肃党纪、推进全面从严治党、坚决惩治腐败的鲜明态度和坚定决心。\r\n\r\n　　——两学一做固本培元。\r\n\r\n　　党要管党、从严治党，靠什么管？凭什么治？习近平掷地有声：“就要靠严明纪律。”治理一个国家、一个社会，关键是要立规矩、讲规矩、守规矩。党章是全党必须遵循的总章程，也是总规矩。\r\n\r\n　　“两学一做”是固本培元的良方。党内教育活动层层递进，从“关键少数”向广大党员拓展，从集中性教育向经常性教育延伸。\r\n\r\n　　党的十八大以来，随着党内教育不断深化，全面从严治党也不断向纵深发展、向基层推进。党员干部的“亚健康”治好了，头脑中的“紧箍咒”自觉勒紧。领导见得勤了，办事不卡壳了，政策能落地了，能和群众掏心窝子的党员、干部多了。\r\n\r\n　　制度治党 实字托底善作善成\r\n\r\n　　善学善思，善作善成。\r\n\r\n　　十八大以来，《中国共产党廉洁自律准则》《中国共产党纪律处分条例》《中国共产党问责条例》相继颁布施行，传递出全面从严治党“一扣接着一扣拧、一锤接着一锤敲”的强烈信号。\r\n\r\n　　——党内法规制度体系不断完善。\r\n\r\n　　习近平说：“我们的规定不要搞得花花绿绿的，措辞很漂亮，但内容空洞。”\r\n\r\n　　2015年10月印发的《中国共产党纪律处分条例》，被不少党建专家称为“改革开放以来最全、最严党纪”。条例修订删除了70余条与刑法、治安管理处罚法等法律法规重复的内容；将原有的10类违纪行为修订为6类；将十八大以来严明政治纪律和政治规矩等从严治党的实践成果制度化、常态化。\r\n\r\n　　1部党章、1部准则、9部条例、6部规则、21部规定、9部办法、8部细则……截至2016年底，中央出台或修订的党内法规达50多部，超过现行150多部中央党内法规的1/3。全面从严治党由“重点治标”走向了“重点治本”，管党治党由“宽松软”走向“严实硬”。\r\n\r\n　　此外，出台第一部正式公开的党内“立法法”和备案程序，编制党内法规制定工作第一个五年规划，首次开展党内法规清理……若干个党史上的第一次，让党内法规体系不断完善。\r\n\r\n　　——制度改革新政频出。\r\n\r\n　　党的建设制度改革打出的“组合拳”虎虎生威。\r\n\r\n　　从完善市县乡党委书记抓党建述职评议考核机制，到加强国有企业、社会组织、民办学校的党建；从实施县以下机关公务员职务与职级并行制度，到深化公务员分类改革；从健全事业单位领导人员管理制度体系、完善人事管理制度，到建立集聚人才体制机制……\r\n\r\n　　“唯票、唯分、唯GDP、唯年龄”等选人用人问题正在破解，基层党组织得到有效整顿。罗阳、黄大年、廖俊波等一个个优秀共产党员的名字被全国人民所熟悉……\r\n\r\n　　实在，才能实效；务实，才能立党；实干，才能兴邦。改革上下联动，制度不仅落了地，而且扎得深，制度执行得到有效保障。\r\n\r\n　　“利器”治党 实现党内监督全覆盖\r\n\r\n　　悬明镜以正衣冠。\r\n\r\n　　2017年6月21日，随着第十二轮巡视对中国农业大学等15所中管高校党委巡视反馈情况的集中公布，十八届中央最后一轮巡视圆满收官。至此，党史上首次实现了一届任期内中央巡视的全覆盖。\r\n\r\n　　在十八届中纪委六次全会上，习近平指出，巡视是党内监督的战略性制度安排，必须有权威性，成为国之利器、党之利器。\r\n\r\n　　——中央巡视工作连续“加码”。\r\n\r\n　　截至2016年底，习近平总书记15次听取巡视工作情况汇报，点问题、列清单，旗帜鲜明、态度坚决。中央巡视工作领导小组召开77次会议落实党中央部署，研究分析巡视情况。\r\n\r\n　　几组数据，简单有力——十八大以来，全国纪检监察机关共立案100多万件，给予党纪政纪处分超过100万人。通过巡视发现了万庆良、谭力、武长顺、陈铁新、隋凤富、梁滨、朱明国等一批中管干部问题线索。\r\n\r\n　　——巡视工作方式方法不断创新\r\n\r\n　　从常规巡视到专项巡视，从杀“回马枪”到“机动式”巡视，巡视威慑力频频升级，巡视工作放出一个又一个“大招”。\r\n\r\n　　回顾前几轮中央巡视，专项巡视已经越来越多地代替了常规巡视，成为常态。这种打法“灵准狠”、节奏“短平快”的方式，不拘泥于复杂的工作流程限制，往往能够出其不意，攻其不备，真正实现了“利剑高悬、震慑常在”。\r\n\r\n　　……\r\n\r\n　　治国必先治党，治党务必从严。\r\n\r\n　　这是栉风沐雨的奋斗中，中国共产党引领国家从危亡走向强盛的时代启示。\r\n\r\n　　这是伟大复兴的征途中，中国共产党带领人民继续前进的铮铮誓言。\r\n\r\n　　这是永不停歇的赶考路上，中国共产党用初心书写的崭新答卷。\r\n\r\n　　“赶考”未有穷期，全面从严治党永远在路上。\r\n\r\n', ' “赶考”五年成绩非凡 “全面从严治党永远在路上”', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('6fab0f98-d048-46a4-871f-617ea24b87eb', '2017-08-17 10:45:59', b'0', '2017-08-17 10:45:59', 0, '新浪科技讯 8月17日上午消息，海淀法院官网发布案件快报，因认为今日头条擅自刊登“中国篮镜头”文章，“中国篮镜头”所属网站北京搜狐互联网信息服务有限公司以著作权侵权为由，将今日头条的所有人和经营者北京字节跳动科技有限公司诉至法院。目前，海淀法院受理了此案。\r\n原告诉称，其系搜狐网站的所有人和经营者，“中国篮镜头”系搜狐体育下的自媒体公众号，原告对该自媒体公众号下的所有文章、图片等均享有合法著作权。被告北京字节跳动科技有限公司经营的“今日头条”网站未经原告允许，刊登原告“中国篮镜头”所推出《麦克克鲁姆35分哈达迪26+15北控主场险胜四川》、《胡金秋砍22+17领5人得分上双广厦主场轻取福建》等多篇文章，且这些文章及图片均明确注明了“搜狐体育独家稿件严禁转载”。\r\n原告认为，被告全文刊登原告的原创作品，该行为对原告的著作权造成侵权，且数量众多、侵权行为频繁，给原告造成重大影响；且被告未经允许直接向用户提供原告享有著作权的文章，吸引用户进行点击从而获取巨大经济利益，提高被告的知名度，给原告造成了较大经济损失。故诉至法院，请求判被告立即停止侵犯原告著作权的行为；在其近日头条APP首页显著位置，就其侵权行为向原告公开赔礼道歉、消除影响；赔偿原告经济损失以及合理费用共计35元。\r\n目前，本案正在进一步审理中。\r\n\r\n', '搜狐诉今日头条侵权：擅刊中国篮镜头文章，索赔35元', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('9ba7a095-79f7-4b21-9b86-04a66d732f8f', '2017-08-17 10:54:24', b'0', '2017-08-17 10:54:24', 0, '随着新品iPhone<a href="http://product.pcpop.com/Mobile/00000_1.html" target="_blank" class="xuxian" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://product.pcpop.com/Mobile/00000_1.html">手机的即将发布，<a href="http://product.pcpop.com/Mobile/00137_1.html" target="_blank" class="xuxian" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://product.pcpop.com/Mobile/00137_1.html">苹果这家智能<a href="http://product.it168.com/list/b/0302_1.shtml" target="_blank" class="xuxian" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://product.it168.com/list/b/0302_1.shtml">手机历史上最伟大的公司再次被推到了聚光灯之下，但是这一次的主角并不是新的硬件产品，而是其现任CEO蒂姆·库克（Tim Cook），理由就是他最近收到了一笔奖金，而奖金的金额达到了6亿元人民币。\r\n<a href="http://www.pcpop.com/imgview/00425757616849063.html" target="_blank" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://www.pcpop.com/imgview/00425757616849063.html"><img alt="" src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757616849063.jpg" style="border: 1px solid rgb(0, 0, 0); vertical-align: top; margin: 0px;" _src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757616849063.jpg">\r\n　　这笔巨额奖金之所以能够发放还会要得益于未面试的新品iPhone<a href="http://product.pcpop.com/Mobile/00000_1.html" target="_blank" class="xuxian" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://product.pcpop.com/Mobile/00000_1.html">手机，据悉当苹果三年内的股东回报达到了一定标准的时候，CEO蒂姆·库克就可以获得相对应的奖励。这一次的奖励金额为8960万美元（约合人民币6亿元）。\r\n<a href="http://www.pcpop.com/imgview/00425757799545939.html" target="_blank" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://www.pcpop.com/imgview/00425757799545939.html"><img alt="" src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757799545939.jpg" style="border: 1px solid rgb(0, 0, 0); vertical-align: top; margin: 0px;" _src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757799545939.jpg">\r\n　　最大的功臣就是即将在9月份发布的新品iPhone 8、iPhone 7s以及iPhone 7s Plus手机，因为目前市场上对于这三款新设备的传闻不断，使得外界对于苹果的期望也随之水涨船高，推动苹果公司股票的暴涨。据悉今年公司股价上涨了39.5％，推动了公司市值逼近1万亿美元大关。\r\n<a href="http://www.pcpop.com/imgview/00425757816939810.html" target="_blank" style="color: rgb(51, 51, 51); text-decoration-line: none;" _href="http://www.pcpop.com/imgview/00425757816939810.html"><img alt="" src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757816939810.jpg" style="border: 1px solid rgb(0, 0, 0); vertical-align: top; margin: 0px;" _src="http://img5.pcpop.com/ArticleImages/730x547/4/4257/00425757816939810.jpg">\r\n　　尽管新iPhone在一个月之后才会发布，到那个时候才能知道现在的预测究竟是否正确。但是库克的这笔高达6亿元的奖励下周就会到手，钱先拿到手才是正经事，手机好不好还是要靠市场决定的。\r\n\r\n', '新手机还没发布 库克就得到了一笔高达6亿元的奖金', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('9ff0e3c0-5dc8-4369-84fb-98d6c3ea2825', '2017-08-17 11:03:35', b'0', '2017-08-17 14:50:40', 1, '<img alt="" align="" src="http://cimage.tianjimedia.com/uploadImages/2017/08/20170817100629230001.png" width="553" height="301" style="border: none; margin: 0px; padding: 0px; outline: none; vertical-align: middle; max-width: 695px;" _src="http://cimage.tianjimedia.com/uploadImages/2017/08/20170817100629230001.png">\r\n　　8月16日晚间，<a class="keyword_link" id="k530842772" href="http://com.chinabyte.com/xunlei/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://com.chinabyte.com/xunlei/">迅雷发布了2017年第二季度财报，财报显示，第二季度迅雷总营收达到4,150万美元，环比增长4.9%，相比去年同期上涨8.9%，这已经是迅雷连续六个季度取得总营收的同比上涨。迅雷股价在周三美股收盘时报收4.14美元，上涨2.48%。\r\n　　从具体收入来看，在第二季度中，包括<a class="keyword_link" id="k530768962" href="http://cloud.chinabyte.com/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://cloud.chinabyte.com/">云计算在内的其他<a class="keyword_link" id="k530770682" href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166524;dc_trk_aid=310538621;dc_trk_cid=74205219" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166524;dc_trk_aid=310538621;dc_trk_cid=74205219">互联网增值服务收入达到1,570万美元，同比增长33.8%，相比上一季度上涨4.7%。其中云计算收入同比翻了一番，涨幅达到107.8%，环比上涨11.7%。迅雷移动广告收入本季同比上涨41.6%。受移动广告收入大幅提升的影响，迅雷在线广告收入整体也增长明显，收入达到520万美元，同比和环比均大幅上涨了38.2%。作为迅雷总营收中占比最大的部分，会员收入本季度达到2,060万美元，会员人数为409万人。\r\n　　同样利好的消息还有，8月上旬迅雷旗下的网心科技取得<a class="keyword_link" id="k530768203" href="http://www.chinabyte.com/keyword/%E5%B7%A5%E4%BF%A1%E9%83%A8/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://www.chinabyte.com/keyword/%E5%B7%A5%E4%BF%A1%E9%83%A8/">工信部发放的CDN牌照。作为迅雷云计算最重要的组成部分，星域CDN成为首个获得工信部CDN牌照的创新型专业CDN。\r\n　　此外，网心科技正式推出新一代智能硬件OneCloud玩客<a class="keyword_link" id="k530831768" href="http://cloud.chinabyte.com/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://cloud.chinabyte.com/">云，同期打造“玩客奖励计划”活动。网心科技表示，共享经济云计算的下一步是“构建一个任何人、普通人都能够参与的自由计算，将共享经济云计算服务向普通用户开放。”随着新产品的推出，迅雷将吸引更多个人参与到共享经济云计算中。\r\n　　此前几天，迅雷已经开始展现增长势头：从8月11日开始，迅雷股价开始抬升，8月15日大涨15.36%领涨中概股，几天内股价最高触及4.31美元。\r\n　　迅雷CEO陈磊表示：“很高兴公司在第二季度取得稳步进展，特别是在云计算和移动广告方面。此外，我们收到了中国工业和<a class="keyword_link" id="k530768899" href="http://info.chinabyte.com/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://info.chinabyte.com/">信息化部发放的包含CDN服务的电信增值服务牌照，这是迅雷技术可用性和得到政府认可的证明。我们会继续努力，将云计算技术作为发展业务的基础性战略。”\r\n\r\n', '迅雷Q2营收同比增长8.9% 盘后股价涨2.48%', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('a6e8703e-d1d2-458b-8e53-3d831ddffc04', '2017-08-09 13:00:52', b'0', '2017-08-09 13:00:52', 0, '1234', '1234', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'0'),
	('c094da8c-6eea-42f1-b310-ef14fe9885f3', '2017-08-17 11:02:59', b'0', '2017-08-17 14:54:03', 1, '近日，欧洲影音协会 EISA（European Imaging and Sound Association）发布了欧洲最权威的影音类年度评选结果，该评选由来自欧洲23个国家的近50个从事摄影、摄像、音响和家庭影院领域的专业媒体组成。其中，华为P10获得"2017-2018年度EISA最佳拍照智能手机大奖"，HUAWEI WATCH 2则获得"2017-2018年度EISA最佳可穿戴设备大奖"。\r\n<img alt="华为P10斩获EISA国际大奖 HUAWEI WATCH 2同上榜0" title="华为P10斩获EISA国际大奖 HUAWEI WATCH 2同上榜0" src="http://upload.news.cecb2b.com/2017/0817/1502935889984.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 0px; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935889984.png">\r\n作为华为的最新旗舰产品，自华为P10发布以来就得到了来自媒体和业界的广泛赞誉，欧洲影音协会对华为P10外观设计、拍摄能力也给出了很高的评价。这也是自2013年华为P6开始，华为P系列连续第五年获EISA奖项。此次，华为P10以卓越的摄影功能、精美的外观和超高的性价比赢得了欧洲主流消费者的认可。\r\n较上一代相比，华为P10进行了全方位的改进和优化。外观设计引用了金属钻雕工艺和大胆的新配色，采用更快、更安全的麒麟960芯片，并搭载了全新徕卡<a href="http://www.cecb2b.com/nic/%E9%95%9C%E5%A4%B4.html" target="_blank" style="margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(11, 59, 140);" _href="http://www.cecb2b.com/nic/%E9%95%9C%E5%A4%B4.html">镜头。华为P10配置了2000万像素黑白+1200万像素彩色的双摄像头组合，搭载800万像素徕卡前置摄像头，拥有F1.9光圈，能够根据画面人物数量，自动切换单人自拍模式或广角群拍模式，单人自拍更清晰自然，多人拍摄有更广的取景角度，能够呈现徕卡风格的艺术人像拍摄效果。欧洲影音协会认为"如果你想拥有更加专业的摄像体验，华为P10 Plus更值得推荐。"\r\n<img alt="华为P10斩获EISA国际大奖 HUAWEI WATCH 2同上榜1" title="华为P10斩获EISA国际大奖 HUAWEI WATCH 2同上榜1" src="http://upload.news.cecb2b.com/2017/0817/1502935889456.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 0px; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935889456.png">\r\n凭借华为在研发实力、产品工艺、创新设计方面的沉淀积累，以及对消费者关于外观设计、手机摄影的需求洞察，华为P10由精致迈向极致。针对HUAWEI WATCH 2欧洲影音协会评价称，"不论你是要找一款造型经典的腕表，还是一个实用的运动伙伴，HUAWEI WATCH 2都是你的不二之选。"可见，这两项大奖充分表明了业界对华为在质量、设计和性能等方面持续投入的认可，也显示出华为在推出设计时尚、性能强大、备受嘉奖的产品方面不断取得佳绩。\r\n华为消费者业务CMO张晓云表示，华为聚焦有意义的创新，致力于打造令全球消费者喜爱的产品。我们非常荣幸HUAWEI P10和HUAWEI WATCH 2能够获得权威组织EISA颁发的奖项，从智能手机到可穿戴设备领域，我们将继续推动技术和设计的进步，为消费者创造更好的智能联接体验。\r\n\r\n', '华为P10斩获EISA国际大奖 HUAWEI WATCH 2同上榜', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('c403863d-d0bd-4641-b6a0-1d1716753926', '2017-08-17 11:04:25', b'0', '2017-08-17 14:50:31', 1, '       ——从美国汇款回大洋彼岸的中国，要多久呢？\r\n<img alt="【1】" align="" src="http://vip.rw2015.com/Uploads/201708/15/20170815103022630001.jpg" width="405" height="280" style="border: none; margin: 0px; padding: 0px; outline: none; vertical-align: middle; max-width: 695px;" _src="http://vip.rw2015.com/Uploads/201708/15/20170815103022630001.jpg">\r\n　　@小兔子圆圆(密西西比州)：一般从银行汇款，快则三天，慢则七天。到国内银行之后貌似还要在汇到各个分行，反正一来二去要一周左右家里人才能收到汇款。\r\n　　@Kim 夏轩(芝加哥)：电汇需要一个星期左右，票汇慢的话要等一个月。就算用西联，或者MoneyGram也要至少一个工作日左右才能到账，很想找到更加快一点的渠道。\r\n　　@FigMent(新泽西州)：很多线下门店都说是1-2天到账，但其实这个只是指工作日，周末和节假日都不算在内的。所以要是碰上个什么节的，很有可能就悲剧了。\r\n<img alt="【2】" align="" src="http://vip.rw2015.com/Uploads/201708/15/20170815103022288002.jpg" width="451" height="268" style="border: none; margin: 0px; padding: 0px; outline: none; vertical-align: middle; max-width: 695px;" _src="http://vip.rw2015.com/Uploads/201708/15/20170815103022288002.jpg">\r\n　　关于国际汇款的周期，根据每种汇款方式的流程和代理点的不同，到帐时间也不尽相同，但最快也要隔天才能收到。对于在国内已经用惯了<a class="keyword_link" id="k530832395" href="http://www.chinabyte.com/keyword/%E6%94%AF%E4%BB%98%E5%AE%9D/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://www.chinabyte.com/keyword/%E6%94%AF%E4%BB%98%E5%AE%9D/">支付宝和微信等线上<a class="keyword_link" id="k530838582" href="http://www.chinabyte.com/keyword/%E7%A7%BB%E5%8A%A8%E6%94%AF%E4%BB%98/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://www.chinabyte.com/keyword/%E7%A7%BB%E5%8A%A8%E6%94%AF%E4%BB%98/">移动支付方式的华人们来说，这些较为传统的线下方式实在是有些过于不便了。\r\n　　“如果能够有像支付宝、微信一样便捷的汇款方式就好了!”这个念头，相信很多华人都有过，但是却有这样一个人，真正将这个念头变成了现实。Ken(郑开兴)自己也是一位美籍华人，非常了解海外华人的所想和所需，对于国际汇款产品他也有着特殊的情怀——做一款专门服务全球华人的国际汇款产品，必须有别于一般冷冰冰的金融产品，它应当成为<a class="keyword_link" id="k531798843" href="http://www.chinabyte.com/keyword/%E4%B8%80%E6%9D%A1/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://www.chinabyte.com/keyword/%E4%B8%80%E6%9D%A1/">一条解乡愁暖亲情的纽带。于是，Ken放弃了美国运通副总裁的职位，来到开心汇从0到1搭建起整个海外国际汇款的产品框架。短短数月的时间，他便带领着十几号人的小团队快速上线了全球首款专为海外华人研发，能够通过微信操作，随时随地汇款回国内的线上汇款产品“开心汇USA”。\r\n<img alt="【3】" align="" src="http://vip.rw2015.com/Uploads/201708/15/20170815103023070003.jpg" width="550" height="323" style="border: none; margin: 0px; padding: 0px; outline: none; vertical-align: middle; max-width: 695px;" _src="http://vip.rw2015.com/Uploads/201708/15/20170815103023070003.jpg">\r\n　　之所以说“随时随地”，是因为用户在使用开心汇汇款时，不必受到时间、节假日的限制，也不必受到空间、地点的限制，只需在微信上搜索公众号【开心汇USA】即可进行汇款。而收款方也不必去线下银行办理收款业务，钱款8小时内即可到账，大多数情况几分钟即可到账。但ken对此仍不满意，他希望在不久的将来，开心汇要确保每一笔订单都能分秒必达，让关心没有时差。与国内支付宝转账、微信红包的体验效果相差无几。\r\n　　谈及产品研发，Ken认为“目前国际汇款产品的技术开发本身并不难，但是由于资金链容易断裂，每个国家对资金跨境转移的监管也有所要求不同，无法通过一个产品体系来解决所有国家的海外华人汇款需求。”而聊到开心汇这个产品体系时，Ken也表示出了满满的自信和期待“现阶段我们<a class="keyword_link" id="k531798779" href="http://www.chinabyte.com/keyword/%E8%87%B4%E5%8A%9B/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://www.chinabyte.com/keyword/%E8%87%B4%E5%8A%9B/">致力于建立起产品的信任度，以优质的服务和周边的附加值服务来满足海外华人用户的方方面面。”的确，开心汇的超低费率和超长服务时间，如今已为海外华人汇款中国提供了新的解决<a class="keyword_link" id="k530831497" href="http://solution.chinabyte.com/new/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://solution.chinabyte.com/new/">方案。\r\n　　当然，Ken也深知，线上汇款产品首要解决的就是<a class="keyword_link" id="k530831286" href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166523;dc_trk_aid=310538354;dc_trk_cid=74205219" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166523;dc_trk_aid=310538354;dc_trk_cid=74205219">安全问题。因此，为了保障用户的<a class="keyword_link" id="k530769388" href="http://sec.chinabyte.com/" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://sec.chinabyte.com/">信息安全，开心汇申请并通过了国际最严格的PCI-DSS认证，重点保护持卡人的<a class="keyword_link" id="k530831785" href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166523;dc_trk_aid=310538354;dc_trk_cid=74205219" target="_blank" style="background: none; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(211, 0, 16); border-left-color: initial; border-image: initial; outline: none; margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(0, 0, 0);" _href="http://ad.doubleclick.net/ddm/trackclk/N7442.5006CHINABYTE/B10313247.138166523;dc_trk_aid=310538354;dc_trk_cid=74205219">数据安全。此外，开心汇与美国First Global Data &amp; First Global Money达成合作，并取得了美、中多方牌照，支持230家国内银行进行收款，有如此强大的渠道背书，相信开心汇USA将会成为越来越多美国华人的汇款新选择!\r\n\r\n', '颠覆跨境汇款方式——开心汇,微信操作,安全便捷', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1'),
	('c7a313ea-28c1-4077-b6bf-bf2511b8947f', '2017-08-15 09:45:39', b'0', '2017-08-15 09:45:51', 0, '２０１７年６月，瑞士日内瓦。\r\n　　联合国人权理事会第３５次会议上，中国代表庄严登上发言席，代表全球１４０多个国家，就共同努力消除贫困发表联合声明。\r\n　　这是全球与贫困斗争的历史上，中国人刻下的一座里程碑。\r\n　　联合国开发计划署前署长海伦·克拉克说：“中国最贫困人口的脱贫规模举世瞩目，速度之快绝无仅有！”\r\n　　久困于穷，冀以小康。\r\n　　这是中华民族千年追求的梦想；\r\n　　这是中国共产党人初心不改、前赴后继的百年拼搏；\r\n　　这是党带领人民用短短３０多年让７亿多人脱贫，并将在未来３年让４０００多万群众走出绝对贫困的伟大决战。\r\n　　“我们要立下愚公移山志，咬定目标、苦干实干，坚决打赢脱贫攻坚战，确保到２０２０年所有贫困地区和贫困人口一道迈入全面小康社会。”\r\n　　未来１０００余日，决战进入倒计时。以习近平同志为核心的党中央正在带领全国各族人民，以非凡的意志和智慧，镌刻出中国反贫困斗争伟大决战的时代画卷。\r\n<img id="{00EFC052-14D1-4A5F-A49F-11FCAACC16B4}" title="" alt="（新华全媒头条·图文互动）（1）中国反贫困斗争的伟大决战" src="http://news.xinhuanet.com/2017-08/13/1121475837_15026253145521n.jpg" align="center" sourcedescription="网上抓取的文件" sourcename="本地文件" style="border: 0px; vertical-align: middle; margin: 10px 0px; max-width: 100%; height: auto !important;" _src="http://news.xinhuanet.com/2017-08/13/1121475837_15026253145521n.jpg"> \r\n　　位于吕梁山区的山西省岢岚县黑峪村“第一书记”葛爱萍（左三）在和村干部商议电商团购活动的具体安排（2017年3月1日摄）。28岁的葛爱萍两年前从县委宣传部来到黑峪村，成为这个小山村的脱贫带头人。为了赢得反贫困斗争的胜利，中国共产党执政体系上的各层“链条”全面转动，19.5万名“第一书记”驻村，不拔穷根绝不撤退。新华社记者 曹阳 摄\r\n　　这是中国共产党的使命，只要还有一家一户乃至一个人没有解决基本生活问题，就不能安之若素\r\n　　山西吕梁，中国最贫瘠的土地之一。这里山大沟深，十年九旱，１３个县（区、市）中还有１０个尚未脱贫。\r\n　　上世纪３０年代，中国共产党晋绥抗日根据地在此创立。\r\n　　穿越时空８０载，几位当年参加对敌斗争的老战士清晰见证，从反侵略、大生产、闹土改，到如今的脱贫攻坚，党带领人民谋幸福的脚步从未停歇。\r\n　　２０１７年６月２１日，习近平总书记风尘仆仆来到他们中间。此时，中国反贫困斗争决战鏖战正酣，脱贫攻坚进入重点解决深度贫困问题的阶段。\r\n　　吕梁之行，习近平总书记完成了一个心愿——走遍全国１４个集中连片特困地区。\r\n　　在这里，他发出坚强有力的动员令——\r\n　　“攻克深度贫困堡垒，是打赢脱贫攻坚战必须完成的任务，全党同志务必共同努力。”\r\n　　在中华民族近代史上，贫困如影随形：多灾多难、饿殍遍地的记录不胜枚举。尤其是西方列强的欺辱、难以计数的赔款，让中国戴上更为沉重的苦难枷锁。\r\n　　１９２１年，中国共产党成立。与追求民族独立、人民解放相伴，摆脱贫困落后，成为一代代中国共产党人铭记于心的使命、扛在肩头的责任。\r\n　　从土地革命、新中国成立到改革开放，中国共产党不仅历史性铲除了导致中国积贫积弱的制度根源，更不断创新思想和方略，带领中华民族向着千年小康梦想奋勇进发。\r\n　　不忘初心，风雨兼程。近百年的历史坐标下，中国反贫困斗争使人民生活天翻地覆。\r\n　　２０１２年，党的十八大召开，历史的接力棒传递到以习近平同志为核心的党中央手中。此时，中国反贫困斗争进入新的阶段。\r\n　　国际经验表明，当一国贫困人口数占总人口的１０％以下时，减贫就进入“最艰难阶段”。２０１２年，中国这一比例为１０．２％。\r\n　　非常之阶段，需要非常之谋划、非常之举措。４年多来，习近平总书记花精力最多的是扶贫工作，去得最多的是贫困地区，牵挂最多的是贫困群众，在脱贫攻坚中，他亲自挂帅、亲自出征、亲自督战。\r\n　　４年多来，以习近平同志为核心的党中央把脱贫攻坚摆到治国理政突出位置，提出精准扶贫方略，带领全国各族人民向着最后的贫困堡垒发起总攻。\r\n　　最嘹亮的号角吹响，最艰难的冲锋开始。\r\n　　江西井冈山，茅坪乡神山村，村干部制作好脱贫攻坚作战图，牢牢钉在墙上。\r\n　　贵州乌蒙山，迤那镇五星村，扶贫工作队完成一笔一画绘制的扶贫作战图，小心揣进怀中。\r\n　　相隔千里，两份作战图上，描绘的是不同的山川与村庄，勾画的却是一个个同样醒目的红色标注：那里代表贫困。\r\n　　一张巨大的决战图，已迅速在中国大地铺开——\r\n　　１４个集中连片特困地区、１２．８万个贫困村，这是跨越中国中西部广阔版图的主战场；\r\n　　“五级书记抓扶贫”，层层立下军令状、责任书，这是指挥高度统一的大会战；\r\n　　１９．５万名第一书记驻村，７７．５万名干部帮扶，这是不拔穷根绝不撤退的突击队；\r\n　　……\r\n　　中国共产党执政体系上的各层“链条”全面转动。\r\n　　每年脱贫约１０００万人，意味着每月脱贫要达到近１００万人，每分钟脱贫约２０人，这是一场进入读秒时间的决战。\r\n　　贫有百样，困有千种。\r\n　　只有真正了解有着广阔疆域、苦难历史的中国，才能真正读懂中国反贫困斗争的艰巨。\r\n　　一些贫困村、贫困户连找到都很困难——\r\n　　贵州武陵山区腹地，一口刀村，村民田桂花家。\r\n　　远远望去，仿佛挂在尖刀的刀背上。\r\n　　举目皆是山，遍地都是石。即使是巴掌大的石缝间，也被栽下一棵玉米苗。家门口的１．５亩水田，是田桂花所在高毛组唯一一块水田，３４户村民轮流耕种。\r\n　　石头缝里求生存。村民们世代辛劳，世代贫苦。\r\n　　一些贫困千年未解甚至被认为无解——\r\n　　甘肃定西，千沟万壑，旱渴荒凉。\r\n　　“陇中苦瘠甲天下”，１００多年前，清朝陕甘总督左宗棠的那声叹息至今仍回荡在历史的长空。４０多年前，联合国专家来此考察，给出的仍是绝望的评价：“这里不具备人类生存条件”。\r\n　　相比于自然条件，另一种贫困则集中于最难改变的思想观念领域——\r\n　　云南滇西边陲山区，苦聪人寨子。\r\n　　上世纪５０年代，解放军从原始森林中找到这个拉祜族支系时，苦聪人一下子从刀耕火种、衣不遮体的原始社会直接进入社会主义社会。千年一瞬的巨变下，苦聪人转变观念仍在路上。\r\n　　直到２０１４年，这里没人好好读过书，绝大多数不会说汉语，全村６岁至１４岁的２６个儿童全部失学。\r\n　　“让娃读书吧！”帮扶干部黄素媛挨家挨户动员。\r\n　　“娃还要砍草喂猪哩。”村民们难为所动。\r\n　　黄素媛给村民们送来一台台３４英寸彩电，条件是收了电视的家长得让孩子去上学。\r\n　　终于，村里开始有了第一批学生，老师从教他们洗脸、洗脚开始。孩子们一点点开始汲取知识，家长们也越来越主动送孩子上学……\r\n　　从历史中走来的决战，唯有以创造历史的坚毅才能攻坚，唯有以继承历史的奉献乃至牺牲才能打赢。\r\n　　柴生芳，甘肃定西临洮县原县长。２０１４年８月１５日，在连续工作超过１７个小时后，４５岁的他和衣睡在办公室里，再也没有醒来。身上的被子只盖了一角，一旁的萝卜只咬了一口。\r\n　　这个戴着眼镜、本可一路顺风进高校、当教授的海归博士，怀揣一颗赤子之心，最终选择用生命为“苦瘠天下”的家乡亲人奔出一条脱贫之路。\r\n　　在临洮的３年里，柴生芳转如陀螺：\r\n　　３２３个行政村他走遍２８１个，写下２９本工作日记；\r\n　　偏远贫困的苟家山村，到县城来回需颠簸数小时，他去过１１次；\r\n　　临洮县贫困人口，从他来时的１１万人，减少为不到５万人。\r\n　　柴生芳走了。苟家山村村民从几十公里外赶来，与万人一同上街，为他送上最后一程。“县长来我家１１次，连一口水也没喝过……”一位村民痛哭流涕。\r\n　　李和林，四川南充市大林镇李家坝村原村支书。查出胃癌晚期后，依然与死神竞速般高强度工作，家里除了一台２１英寸的老式彩电，一贫如洗，英年５２；\r\n<img id="{BFBFCB46-B723-47A0-9E5F-816085DA483C}" title="" alt="（新华全媒头条·图文互动）（2）中国反贫困斗争的伟大决战" src="http://news.xinhuanet.com/2017-08/13/1121475837_15026255188561n.jpg" align="center" sourcedescription="网上抓取的文件" sourcename="本地文件" style="border: 0px; vertical-align: middle; margin: 10px 0px; max-width: 100%; height: auto !important;" _src="http://news.xinhuanet.com/2017-08/13/1121475837_15026255188561n.jpg"> \r\n　　贵州黔西南布依族苗族自治州晴隆县县委书记姜仕坤（中）生前在马场乡战马村了解群众农业生产情况（资料照片）。姜仕坤立下“只要县里还有一个人没有脱贫，我就不能休息”的誓言，但常年高负荷工作，却最终让这个硬汉倒下，年仅46岁。 2013至2016年间，120多名共产党员牺牲在反贫困斗争的决战场上，用生命与付出铺就百姓致富路。新华社发\r\n　　姜仕坤，贵州晴隆县原县委书记。从放牛娃成长起来，立下“只要县里还有一个人没有脱贫，我就不能休息”的誓言，但常年高负荷工作，却最终让这个硬汉倒下，年仅４６；\r\n　　蒋富安，四川美姑县四峨吉村原第一书记，劳累猝死，告别２６岁的青春。送别时，村民泪流满面：“你不是说好今后有了娃，也要送到村里幼儿园么？”\r\n　　……\r\n　　２０１３至２０１６年间，１２０多名共产党员牺牲在反贫困斗争的决战场上，用生命与付出铺就百姓致富路。\r\n　　乌江滚滚，在武陵山中逶迤蜿蜒。峡谷间，一艘艘小船正浮于江面，逆流而上。在村支书的带领下，一口刀村的村民们带着被条、猪油、斗篷……彻底搬离这座困住他们的大山；\r\n　　六盘山下，定西在这场艰苦的鏖战中，“县不漏乡，乡不漏村，村不漏户，户不漏人”，走出了一条造血式扶贫新路；\r\n　　吕梁山深处，一座座新村迎来易地扶贫搬迁的新主人，告别深山沟的乡亲们带着希望开始建设他们的新生活。\r\n\r\n', '中国反贫困斗争的伟大决战', 'aef56fff-67c3-4a15-966a-67bdb909ecb0', NULL, b'1'),
	('e9fe352c-16c2-4ef7-a5ae-7bd0e94f191b', '2017-08-15 09:42:16', b'0', '2017-08-17 14:53:42', 1, '', '爆炸事件', 'aef56fff-67c3-4a15-966a-67bdb909ecb0', NULL, b'1'),
	('f540cb3f-cda9-4ad9-ae1c-8ba96eeed9ba', '2017-08-17 11:09:56', b'0', '2017-08-17 14:46:41', 1, '诺基亚8在今天凌晨正式亮相，它是HMD首款旗舰，采用了5.3英寸2K显示屏，搭载了骁龙835处理器，拥有4GB内存+64GB存储。\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀0" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀0" src="http://upload.news.cecb2b.com/2017/0817/1502935457948.jpg" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457948.jpg">\r\n此外，诺基亚8还准备了一款6+128的皇帝版。那这款手机的性能表现如何呢？外媒GSMArena带来了详细测试。\r\n1、安兔兔跑分\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀1" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀1" src="http://upload.news.cecb2b.com/2017/0817/1502935457316.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457316.png">\r\n如图所示，诺基亚8得分175872分，介于小米6和三星S8+（Exynos 8895版）之间，第一名是一加8，跑分高达18万。\r\n2、Basemark OS Ⅱ跑分\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀2" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀2" src="http://upload.news.cecb2b.com/2017/0817/1502935457790.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457790.png">\r\nBasemark OS Ⅱ是一个可以实现iOS、Android和WP多个系统的跨平台跑分测试工具。\r\n它的测试内容包括处理器、图形芯片的压力测试、内存性能度量、浏览器基准测试以及电池测试、甚至包括了相机启动和拍照速度等附加硬件的性能。\r\n如图所示，在Basemark OS Ⅱ中，诺基亚8得分为4215，介于一加5和索尼Xperia XZ Premium之间，得分第一的则是小米6。\r\n3、GeekBench 4跑分\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀3" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀3" src="http://upload.news.cecb2b.com/2017/0817/1502935457178.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457178.png">\r\n↑↑↑多核成绩\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀4" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀4" src="http://upload.news.cecb2b.com/2017/0817/1502935457708.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457708.png">\r\n↑↑↑单核成绩\r\n在这项测试中，各家的成绩相差不大。多核表现上，诺基亚8得分6568，比一加5略逊一点点，第一名是三星S8+（Exynos 8895版）。\r\n单核成绩依然是三星S8+（Exynos 8895版）第一，诺基亚排名第4，仅次于小米6.\r\n4、Basemark X跑分\r\n<img alt="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀5" title="诺基亚8跑分出炉：骁龙835性能强悍/散热优秀5" src="http://upload.news.cecb2b.com/2017/0817/1502935457782.png" style="margin: 0px; padding: 0px; vertical-align: top; border: 1px solid black; max-width: 500px;" _src="http://upload.news.cecb2b.com/2017/0817/1502935457782.png">\r\nBasemark X是一款测试游戏性能的工具，主要考验的是其GPU性能。\r\n如图所示，诺基亚 8的CPU性能在排行榜中处于中下游水平，与HTC U11比较接近。不过除了三星S8+（Exynos 8895版）之外，其余的旗舰都没有超过4万。\r\n综合来看，诺基亚8的表现符合预期。此外，GSMArena还提到，诺基亚8的散热表现很优秀，跑分测试完后手机也只是温热状态。\r\n据悉，这款旗舰将在9月正式开卖，届时国行版也会到来。参考欧洲地区599欧元（约合人民币4700元）的售价，国行版预计在5000元左右。\r\n\r\n', '诺基亚8跑分出炉：骁龙835性能强悍/散热优秀', '72c6d56d-f243-4acc-a817-d49a48a55525', NULL, b'1');
/*!40000 ALTER TABLE `t_c_article` ENABLE KEYS */;

-- 导出  表 blog.t_c_category 结构
DROP TABLE IF EXISTS `t_c_category`;
CREATE TABLE IF NOT EXISTS `t_c_category` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `shows` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2vw5k4etdr9soiikscbs1y4qj` (`pid`),
  CONSTRAINT `FK_2vw5k4etdr9soiikscbs1y4qj` FOREIGN KEY (`pid`) REFERENCES `t_c_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_c_category 的数据：~14 rows (大约)
DELETE FROM `t_c_category`;
/*!40000 ALTER TABLE `t_c_category` DISABLE KEYS */;
INSERT INTO `t_c_category` (`id`, `create_time`, `disabled`, `update_time`, `name`, `pid`, `shows`) VALUES
	('065cfc38-fc9d-4df7-a18f-1182d89f1957', '2017-09-28 15:09:55', b'0', '2017-09-28 15:09:55', '游戏', '8e320c89-6ca3-4141-a34c-627a54e7c24d', b'1'),
	('0ce2c231-e637-4e3c-8a12-a9617c7dd3b2', '2017-08-16 10:32:54', b'1', '2017-09-28 15:15:26', '王五', 'b44db30b-605f-4d6d-acd2-be7fc2970c55', b'0'),
	('1', '2017-08-08 13:59:56', b'0', NULL, '根节点', NULL, b'0'),
	('396d23cc-ba93-47c6-813f-39d87c189649', '2017-09-28 15:10:43', b'0', '2017-09-28 15:10:43', '财经', '1', b'1'),
	('47dc64f6-98e5-464c-9801-4e9c0331ea50', '2017-09-28 15:09:20', b'0', '2017-09-28 15:09:20', '教育', '8e320c89-6ca3-4141-a34c-627a54e7c24d', b'1'),
	('5cc2c53b-a225-4568-b589-63168bffc102', '2017-08-16 10:28:34', b'0', '2017-09-28 15:16:37', '科技', '8e320c89-6ca3-4141-a34c-627a54e7c24d', b'1'),
	('67bb54c1-302a-48ad-83d1-ac4c2220c16c', '2017-09-28 15:09:08', b'0', '2017-09-28 15:09:08', '汽车', '8e320c89-6ca3-4141-a34c-627a54e7c24d', b'1'),
	('72c6d56d-f243-4acc-a817-d49a48a55525', '2017-08-08 14:06:45', b'0', '2017-08-08 14:06:45', '新闻分类', '1', b'1'),
	('8e320c89-6ca3-4141-a34c-627a54e7c24d', '2017-09-28 15:08:48', b'0', '2017-09-28 15:08:48', '更多', '1', b'1'),
	('aef56fff-67c3-4a15-966a-67bdb909ecb0', '2017-08-15 09:36:02', b'0', '2017-08-15 09:36:02', '最新博客', '1', b'1'),
	('b44db30b-605f-4d6d-acd2-be7fc2970c55', '2017-08-16 10:26:09', b'0', '2017-09-28 15:15:50', '娱乐', '1', b'1'),
	('c48ffc08-aa2d-410f-975a-a75662071fe4', '2017-08-08 14:06:17', b'0', '2017-08-08 14:06:17', 'HTML', '1', b'1'),
	('d7f42b10-f716-4ffe-8445-707e919538ef', '2017-09-28 15:09:38', b'0', '2017-09-28 15:09:38', '读书', '8e320c89-6ca3-4141-a34c-627a54e7c24d', b'1'),
	('f8bd2013-4a56-4c31-ab7e-a185a68928af', '2017-09-28 15:10:30', b'0', '2017-09-28 15:10:30', '体育', '1', b'1');
/*!40000 ALTER TABLE `t_c_category` ENABLE KEYS */;

-- 导出  表 blog.t_c_comment 结构
DROP TABLE IF EXISTS `t_c_comment`;
CREATE TABLE IF NOT EXISTS `t_c_comment` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `article_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2uq3p9uybx0nrb1ixqebw89s8` (`article_id`),
  KEY `FK_cuyy9xsb30rmwp0kg2yx5usl6` (`user_id`),
  CONSTRAINT `FK_2uq3p9uybx0nrb1ixqebw89s8` FOREIGN KEY (`article_id`) REFERENCES `t_c_article` (`id`),
  CONSTRAINT `FK_cuyy9xsb30rmwp0kg2yx5usl6` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_c_comment 的数据：~0 rows (大约)
DELETE FROM `t_c_comment`;
/*!40000 ALTER TABLE `t_c_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_c_comment` ENABLE KEYS */;

-- 导出  表 blog.t_c_praise 结构
DROP TABLE IF EXISTS `t_c_praise`;
CREATE TABLE IF NOT EXISTS `t_c_praise` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `article_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pys64havdcq0wjq2y1btqx3ix` (`article_id`),
  KEY `FK_iv87ppxvgv8l1xpw7qq56cg7q` (`user_id`),
  CONSTRAINT `FK_iv87ppxvgv8l1xpw7qq56cg7q` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `FK_pys64havdcq0wjq2y1btqx3ix` FOREIGN KEY (`article_id`) REFERENCES `t_c_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_c_praise 的数据：~0 rows (大约)
DELETE FROM `t_c_praise`;
/*!40000 ALTER TABLE `t_c_praise` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_c_praise` ENABLE KEYS */;

-- 导出  表 blog.t_p_member 结构
DROP TABLE IF EXISTS `t_p_member`;
CREATE TABLE IF NOT EXISTS `t_p_member` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `alisa` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` char(1) NOT NULL,
  `pic_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_si869x77bixpf1on5mmi18li2` (`pic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_member 的数据：0 rows
DELETE FROM `t_p_member`;
/*!40000 ALTER TABLE `t_p_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_member` ENABLE KEYS */;

-- 导出  表 blog.t_p_member_article 结构
DROP TABLE IF EXISTS `t_p_member_article`;
CREATE TABLE IF NOT EXISTS `t_p_member_article` (
  `user_id` varchar(255) NOT NULL,
  `article_id` varchar(255) NOT NULL,
  KEY `FK_gjuewxe7xxsp47613dlls4vpt` (`article_id`),
  KEY `FK_bw74qujs52r5b6etoifynbgdl` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_member_article 的数据：0 rows
DELETE FROM `t_p_member_article`;
/*!40000 ALTER TABLE `t_p_member_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_member_article` ENABLE KEYS */;

-- 导出  表 blog.t_p_member_attach 结构
DROP TABLE IF EXISTS `t_p_member_attach`;
CREATE TABLE IF NOT EXISTS `t_p_member_attach` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_member_attach 的数据：0 rows
DELETE FROM `t_p_member_attach`;
/*!40000 ALTER TABLE `t_p_member_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_member_attach` ENABLE KEYS */;

-- 导出  表 blog.t_p_member_file 结构
DROP TABLE IF EXISTS `t_p_member_file`;
CREATE TABLE IF NOT EXISTS `t_p_member_file` (
  `user_id` varchar(255) NOT NULL,
  `attach_id` varchar(255) NOT NULL,
  KEY `FK_5cfv0341co1o7574mbowy5b8i` (`attach_id`),
  KEY `FK_m3p52yur98d3dn67pctqv6yci` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_member_file 的数据：0 rows
DELETE FROM `t_p_member_file`;
/*!40000 ALTER TABLE `t_p_member_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_member_file` ENABLE KEYS */;

-- 导出  表 blog.t_p_member_pic 结构
DROP TABLE IF EXISTS `t_p_member_pic`;
CREATE TABLE IF NOT EXISTS `t_p_member_pic` (
  `user_id` varchar(255) NOT NULL,
  `attach_id` varchar(255) NOT NULL,
  KEY `FK_roa70v6cqx3l80n3n785r6oty` (`attach_id`),
  KEY `FK_52enkjrmtjh05rgglqmg777tw` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_p_member_pic 的数据：0 rows
DELETE FROM `t_p_member_pic`;
/*!40000 ALTER TABLE `t_p_member_pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_p_member_pic` ENABLE KEYS */;

-- 导出  表 blog.t_s_adv 结构
DROP TABLE IF EXISTS `t_s_adv`;
CREATE TABLE IF NOT EXISTS `t_s_adv` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `attach_id` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5f2n7w8joyppdxewxj8shmvan` (`attach_id`),
  KEY `FK_8vf1dwylgfrww1l0o2pdbikf2` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_adv 的数据：0 rows
DELETE FROM `t_s_adv`;
/*!40000 ALTER TABLE `t_s_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_adv` ENABLE KEYS */;

-- 导出  表 blog.t_s_icon 结构
DROP TABLE IF EXISTS `t_s_icon`;
CREATE TABLE IF NOT EXISTS `t_s_icon` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_icon 的数据：~5 rows (大约)
DELETE FROM `t_s_icon`;
/*!40000 ALTER TABLE `t_s_icon` DISABLE KEYS */;
INSERT INTO `t_s_icon` (`id`, `create_time`, `disabled`, `update_time`, `class_name`, `name`) VALUES
	('0fbdfb98-fdbc-423a-88a0-45c2b12d575a', '2017-08-01 17:10:06', b'0', '2017-08-01 17:10:06', '<i class="fa fa-address-card" aria-hidden="true"></i>', '平台管理'),
	('812d54d8-c99d-4a9b-a659-12f37894f6f3', '2017-08-01 17:58:20', b'0', '2017-08-01 18:00:01', '<i class="fa fa-commenting" aria-hidden="true"></i>', '评论管理'),
	('8d9397d0-89f3-473b-9317-4880aeb06047', '2017-08-01 17:48:45', b'0', '2017-08-01 17:56:12', '<i class="fa fa-file-image-o" aria-hidden="true"></i>', '图片管理'),
	('e6b58065-a6ca-41d1-906c-5f19917256a9', '2017-08-01 17:39:49', b'0', '2017-08-01 17:39:49', '<i class="fa fa-caret-right" aria-hidden="true"></i>', '列表图标'),
	('ef3ada9e-f90d-4437-a27f-509287ac1157', '2017-08-01 17:38:12', b'0', '2017-08-01 17:38:12', '<i class="fa fa-bars" aria-hidden="true"></i>', '系统管理');
/*!40000 ALTER TABLE `t_s_icon` ENABLE KEYS */;

-- 导出  表 blog.t_s_module 结构
DROP TABLE IF EXISTS `t_s_module`;
CREATE TABLE IF NOT EXISTS `t_s_module` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `descs` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `shows` varchar(255) DEFAULT NULL,
  `icon_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_k7ug1elvma66xbax2kh3nsqqm` (`pid`),
  KEY `FK_tlvag5oykuyhu8wfg2m7g1g43` (`icon_id`),
  CONSTRAINT `FK_k7ug1elvma66xbax2kh3nsqqm` FOREIGN KEY (`pid`) REFERENCES `t_s_module` (`id`),
  CONSTRAINT `FK_tlvag5oykuyhu8wfg2m7g1g43` FOREIGN KEY (`icon_id`) REFERENCES `t_s_icon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_module 的数据：~27 rows (大约)
DELETE FROM `t_s_module`;
/*!40000 ALTER TABLE `t_s_module` DISABLE KEYS */;
INSERT INTO `t_s_module` (`id`, `create_time`, `disabled`, `update_time`, `name`, `url`, `pid`, `descs`, `alias`, `shows`, `icon_id`) VALUES
	('007a27e3-d5cd-436e-a2da-ce58e8a09db8', '2017-07-28 16:13:39', b'0', '2017-08-01 17:32:29', '平台管理', '#', '1', '管理所有的平台信息', 'platform-manager', NULL, '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('1', '2017-07-28 14:46:08', b'0', NULL, '根节点', '#', NULL, '根节点', NULL, '0', NULL),
	('1cd17747-5bd3-4cba-a4ef-4315dce77af8', '2017-08-01 15:42:02', b'0', '2017-09-27 16:01:41', '系统权限', '/system/user/role/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '用户所对应的角色', 'system-userRole-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('22c9ee7b-2f6b-48ed-9acc-ffec2df2c614', '2017-07-31 10:02:06', b'0', '2017-07-31 10:02:06', '修改菜单', '/system/module/edit', '56688a3d-fda3-41b1-90db-2af1957e249c', '修改菜单', 'system-module-edit', '0', NULL),
	('302bbf0c-d0da-4496-af90-33fbaa222321', '2017-09-29 12:02:05', b'0', '2017-09-29 12:03:07', '广告管理', '/system/advertisement/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '轮播图', 'system-advertisement-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('36f5380d-9c48-4891-a089-e83748fd15b9', '2017-08-09 12:55:48', b'0', '2017-08-09 12:55:48', '文章管理', '/content/article/list', '56173b0a-2493-4ebc-8ba8-3ebc833ec2b8', '管理博客中的文章', 'article-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('3ad9a2d5-367f-4c86-a3ed-380ad94e7911', '2017-08-17 11:18:44', b'0', '2017-08-17 11:18:44', '文章审核', '/content/article/approvalList', '56173b0a-2493-4ebc-8ba8-3ebc833ec2b8', '文章审核通过显示在前台页面上', 'article-approvalList', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('4210dc83-2d04-40db-95cc-f0d3f7b8c0bc', '2017-07-31 10:04:51', b'0', '2017-07-31 10:04:51', '添加角色', '/system/role/add', 'be6debfe-a075-416f-ad9d-d53785c86520', '添加角色', 'system-role-add', '0', NULL),
	('495c99b8-62b7-4d30-ac5e-7716adf64c0c', '2017-07-28 16:20:55', b'0', '2017-09-27 15:04:28', '系统用户', '/system/user/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '管理所有的用户信息', 'system-user-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('52d2382f-1d07-4e46-92fd-972c2b069eb5', '2017-09-29 12:07:19', b'0', '2017-09-29 12:07:29', '删除广告', '/system/advertisement/delete', '302bbf0c-d0da-4496-af90-33fbaa222321', '删除广告', 'system-advertisement-delete', '0', '8d9397d0-89f3-473b-9317-4880aeb06047'),
	('56173b0a-2493-4ebc-8ba8-3ebc833ec2b8', '2017-08-08 13:51:56', b'0', '2017-08-08 13:52:55', '内容管理', '#', '1', '文章栏目分类', 'content-manager', '1', '812d54d8-c99d-4a9b-a659-12f37894f6f3'),
	('56688a3d-fda3-41b1-90db-2af1957e249c', '2017-07-28 16:14:39', b'0', '2017-09-27 15:59:31', '系统菜单', '/system/module/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '管理所有的菜单信息', 'system-module-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('5c5d86ca-1aca-4e3c-8d04-d648d6a508cb', '2017-07-31 10:11:18', b'0', '2017-07-31 10:11:18', '修改用户', '/system/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'system-user-edit', '0', NULL),
	('60f738ac-16c5-4507-bb33-a4455740b760', '2017-08-01 17:02:31', b'0', '2017-09-27 16:00:18', '系统图标', '/system/icon/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '菜单旁边的图标', 'system-icon-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('610c0493-aeca-47d3-83b8-38c285656ae5', '2017-08-01 16:42:50', b'0', '2017-08-01 17:38:22', '系统管理', '#', '1', '系统的配置设置', 'system-manager', NULL, 'ef3ada9e-f90d-4437-a27f-509287ac1157'),
	('7684d388-473f-4f86-95b1-a9f44e3273d7', '2017-07-31 10:10:29', b'0', '2017-09-27 15:55:41', '删除用户', '/system/user/delete', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '删除用户信息', 'system-user-delete', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('7d7f598f-eeab-437f-ba28-976b63f26941', '2017-07-31 10:04:04', b'0', '2017-09-27 15:56:17', '删除角色', '/system/role/delete', 'be6debfe-a075-416f-ad9d-d53785c86520', '删除角色', 'system-role-delete', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('a149857a-8e2d-472c-9c79-122ba5d7c32f', '2017-07-31 10:03:19', b'0', '2017-09-27 15:56:07', '修改角色', '/system/role/edit', 'be6debfe-a075-416f-ad9d-d53785c86520', '修改角色', 'system-role-edit', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('a2b7dd7d-aa2a-4228-9733-b78859639e24', '2017-09-29 12:06:26', b'0', '2017-09-29 12:06:26', '添加轮播图', '/system/advertisement/add', '302bbf0c-d0da-4496-af90-33fbaa222321', '新增多张图片', 'system-advertisement-add', '0', '8d9397d0-89f3-473b-9317-4880aeb06047'),
	('aa1c6430-10c7-4904-914e-330dd684faf6', '2017-07-31 09:58:39', b'0', '2017-09-27 15:56:37', '添加菜单', '/system/module/add', '56688a3d-fda3-41b1-90db-2af1957e249c', '添加菜单的功能', 'system-module-add', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('ac2116d2-006e-4523-9b45-d8ea0af63e9b', '2017-08-08 13:53:34', b'0', '2017-08-08 13:53:34', '分类管理', '/content/category/list', '56173b0a-2493-4ebc-8ba8-3ebc833ec2b8', '文章栏目分类', 'category-list', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('ad34d6e8-4ac5-4841-8cca-ea7ccc675ab1', '2017-08-01 15:46:39', b'0', '2017-09-27 15:55:11', '修改用户', '/system/user/edit', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '修改用户信息', 'system-user-edit', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('be6debfe-a075-416f-ad9d-d53785c86520', '2017-07-28 16:16:19', b'0', '2017-09-27 16:00:48', '系统角色', '/system/role/list', '610c0493-aeca-47d3-83b8-38c285656ae5', '管理所有的角色信息', 'system-role-manager', '1', 'e6b58065-a6ca-41d1-906c-5f19917256a9'),
	('c83cc0d6-e8a5-4b73-a214-1a6727fa086e', '2017-07-31 10:00:29', b'0', '2017-09-27 15:57:55', '删除菜单', '/system/module/delete', '56688a3d-fda3-41b1-90db-2af1957e249c', '删除菜单', 'system-module-delete', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('e35bb92d-53b9-469c-8f7b-bff1d8e8c493', '2017-08-01 18:00:49', b'0', '2017-08-01 18:00:49', '评论管理', '#', '1', '评论管理', 'comments-manager', '1', '812d54d8-c99d-4a9b-a659-12f37894f6f3'),
	('e7f32c96-1d5f-474f-95df-84116a71a20a', '2017-07-31 10:09:48', b'0', '2017-09-27 15:55:54', '添加用户', '/system/user/add', '495c99b8-62b7-4d30-ac5e-7716adf64c0c', '添加用户信息', 'system-user-add', '0', '0fbdfb98-fdbc-423a-88a0-45c2b12d575a'),
	('eb3eacee-0c37-456f-8bf2-2b376ef37aa0', '2017-09-29 12:08:31', b'0', '2017-09-29 12:08:31', '修改广告', '/system/advertisement/edit', '302bbf0c-d0da-4496-af90-33fbaa222321', '修改广告', 'system-advertisement-edit', '0', '8d9397d0-89f3-473b-9317-4880aeb06047');
/*!40000 ALTER TABLE `t_s_module` ENABLE KEYS */;

-- 导出  表 blog.t_s_picture 结构
DROP TABLE IF EXISTS `t_s_picture`;
CREATE TABLE IF NOT EXISTS `t_s_picture` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_picture 的数据：11 rows
DELETE FROM `t_s_picture`;
/*!40000 ALTER TABLE `t_s_picture` DISABLE KEYS */;
INSERT INTO `t_s_picture` (`id`, `create_time`, `disabled`, `update_time`, `file_size`, `file_type`, `name`, `path`, `suffix`) VALUES
	('e8ebc1c1-0745-49a0-a0e2-6d21c4ccb63d', '2017-09-29 14:13:03', b'0', '2017-09-29 14:13:03', '9.50K', 'application/octet-stream', '十一后计划安排', '/upload/attachment/7d51c1dbffca44658bffa43bf6ca9bcb.xlsx', 'xlsx'),
	('762aab58-97aa-4fff-b28c-432563f8d9d0', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '31.26M', 'application/octet-stream', 'navicat_premium_x64', '/upload/attachment/9256ab3b35ce47849b9eb81085b35d0f.zip', 'zip'),
	('ffb647d4-8576-4933-ae8c-26a106068293', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '84.68K', 'application/octet-stream', 'jquery-3.1.1.min', '/upload/attachment/d682ba27f88d4f5aa6786abd9fdc7cd0.js', 'js'),
	('09d90b05-c0d1-4cb7-bfd6-a946c7b76dbd', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '45.63K', 'application/octet-stream', 'commons-codec-1.3', '/upload/attachment/86a43ed1bd2d4dcdaa6d1e6faf9375ef.jar', 'jar'),
	('b3569959-75a8-4fe8-90a3-3f92a34141af', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '1010.23K', 'application/octet-stream', 'jquery-easyui-1.5.1', '/upload/attachment/50633ed7997748de8e1b3929797e67e1.zip', 'zip'),
	('dacd43ca-7ec2-4866-ae66-5c131c95cf36', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '47.21M', 'application/octet-stream', 'Spring实战（第4版）', '/upload/attachment/d36f88ff373d4e389ec709f4e4d059c4.pdf', 'pdf'),
	('75552b60-37c4-4033-9f6b-1bfc130e7c63', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '533.50K', 'application/octet-stream', 'timg', '/upload/attachment/ef527826390f4654aaa62068f91ebf04.png', 'png'),
	('b87aa0c0-fea2-4b02-b68f-045d099438da', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '673.45K', 'application/octet-stream', '30146808_6', '/upload/attachment/d34a25ffe0f747c19b95d3abeac59b76.jpg', 'jpg'),
	('254c06ff-e9a1-4f8c-baf5-b37da4279208', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '35.72K', 'application/octet-stream', 'timg', '/upload/attachment/d8e2a17d63d84a1dbd078bcc58c05780.jpg', 'jpg'),
	('ad141f97-89f0-46e5-9aad-b420d554920b', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '411.31K', 'application/octet-stream', '30146808_12', '/upload/attachment/80eded5bfad94995b0df0e87223e1129.jpg', 'jpg'),
	('ca5b6db1-02bd-4317-a93e-8952c7b78ff7', '2017-09-29 14:08:19', b'0', '2017-09-29 14:08:19', '701.65K', 'application/octet-stream', '184630ufi3e7mi665i57o0', '/upload/attachment/800681bfd7ae4a768bb03d981ff3ae3f.jpg', 'jpg');
/*!40000 ALTER TABLE `t_s_picture` ENABLE KEYS */;

-- 导出  表 blog.t_s_premission 结构
DROP TABLE IF EXISTS `t_s_premission`;
CREATE TABLE IF NOT EXISTS `t_s_premission` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_premission 的数据：~0 rows (大约)
DELETE FROM `t_s_premission`;
/*!40000 ALTER TABLE `t_s_premission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_premission` ENABLE KEYS */;

-- 导出  表 blog.t_s_role 结构
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE IF NOT EXISTS `t_s_role` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qwbn7vxfab3kgb863yn7drotw` (`pid`),
  CONSTRAINT `FK_qwbn7vxfab3kgb863yn7drotw` FOREIGN KEY (`pid`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_role 的数据：~7 rows (大约)
DELETE FROM `t_s_role`;
/*!40000 ALTER TABLE `t_s_role` DISABLE KEYS */;
INSERT INTO `t_s_role` (`id`, `create_time`, `disabled`, `update_time`, `role_desc`, `role_name`, `pid`) VALUES
	('031adfe8-ff19-46df-aa1c-2fc0b6149189', '2017-07-31 16:37:07', b'1', '2017-08-04 14:53:01', '222', '222', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1'),
	('1', '2017-07-31 16:06:06', b'0', NULL, '根节点', '根节点', NULL),
	('1b6f84eb-5d4c-49d0-8393-14b511b56ef1', '2017-07-31 16:36:56', b'0', '2017-08-05 11:25:32', '1111', '111', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('7bf92529-2298-4374-b8ab-45b360cc5554', '2017-08-04 14:44:16', b'1', '2017-08-04 14:51:10', '333', '333', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '2017-07-31 16:12:47', b'0', '2017-09-29 12:02:30', '管理员角色', '管理员', '1'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '2017-07-31 16:36:33', b'0', '2017-08-08 12:34:08', '测试角色0001', '测试部门', '1'),
	('efd2bf21-d928-4aec-a486-7aacbaf51c29', '2017-07-31 16:37:19', b'1', '2017-08-04 14:52:57', '333', '333', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
/*!40000 ALTER TABLE `t_s_role` ENABLE KEYS */;

-- 导出  表 blog.t_s_role_module 结构
DROP TABLE IF EXISTS `t_s_role_module`;
CREATE TABLE IF NOT EXISTS `t_s_role_module` (
  `role_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  KEY `FK_9pncp8k4tf1wr6p1ojb1jynxs` (`module_id`),
  KEY `FK_nyeeltyagdtxtuqpdt9pdka3a` (`role_id`),
  CONSTRAINT `FK_9pncp8k4tf1wr6p1ojb1jynxs` FOREIGN KEY (`module_id`) REFERENCES `t_s_module` (`id`),
  CONSTRAINT `FK_nyeeltyagdtxtuqpdt9pdka3a` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_role_module 的数据：~29 rows (大约)
DELETE FROM `t_s_role_module`;
/*!40000 ALTER TABLE `t_s_role_module` DISABLE KEYS */;
INSERT INTO `t_s_role_module` (`role_id`, `module_id`) VALUES
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '007a27e3-d5cd-436e-a2da-ce58e8a09db8'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '22c9ee7b-2f6b-48ed-9acc-ffec2df2c614'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', '56688a3d-fda3-41b1-90db-2af1957e249c'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', 'aa1c6430-10c7-4904-914e-330dd684faf6'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', 'c83cc0d6-e8a5-4b73-a214-1a6727fa086e'),
	('db8fa132-1e5d-48d2-bd42-9c6d7291c639', 'e35bb92d-53b9-469c-8f7b-bff1d8e8c493'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '007a27e3-d5cd-436e-a2da-ce58e8a09db8'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '1cd17747-5bd3-4cba-a4ef-4315dce77af8'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '22c9ee7b-2f6b-48ed-9acc-ffec2df2c614'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '302bbf0c-d0da-4496-af90-33fbaa222321'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '36f5380d-9c48-4891-a089-e83748fd15b9'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '3ad9a2d5-367f-4c86-a3ed-380ad94e7911'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '4210dc83-2d04-40db-95cc-f0d3f7b8c0bc'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '495c99b8-62b7-4d30-ac5e-7716adf64c0c'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '56173b0a-2493-4ebc-8ba8-3ebc833ec2b8'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '56688a3d-fda3-41b1-90db-2af1957e249c'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '5c5d86ca-1aca-4e3c-8d04-d648d6a508cb'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '60f738ac-16c5-4507-bb33-a4455740b760'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '610c0493-aeca-47d3-83b8-38c285656ae5'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '7684d388-473f-4f86-95b1-a9f44e3273d7'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', '7d7f598f-eeab-437f-ba28-976b63f26941'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'a149857a-8e2d-472c-9c79-122ba5d7c32f'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'aa1c6430-10c7-4904-914e-330dd684faf6'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'ac2116d2-006e-4523-9b45-d8ea0af63e9b'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'ad34d6e8-4ac5-4841-8cca-ea7ccc675ab1'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'be6debfe-a075-416f-ad9d-d53785c86520'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'c83cc0d6-e8a5-4b73-a214-1a6727fa086e'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'e35bb92d-53b9-469c-8f7b-bff1d8e8c493'),
	('c15cc5a0-4e67-493a-864f-21a007d6b2ad', 'e7f32c96-1d5f-474f-95df-84116a71a20a');
/*!40000 ALTER TABLE `t_s_role_module` ENABLE KEYS */;

-- 导出  表 blog.t_s_user 结构
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE IF NOT EXISTS `t_s_user` (
  `id` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `disabled` bit(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_user 的数据：~3 rows (大约)
DELETE FROM `t_s_user`;
/*!40000 ALTER TABLE `t_s_user` DISABLE KEYS */;
INSERT INTO `t_s_user` (`id`, `create_time`, `disabled`, `update_time`, `card_type`, `id_card`, `last_login_time`, `locked`, `login_name`, `password`, `phone_number`, `real_name`) VALUES
	('60e95e04-9ce7-48aa-b360-943cab0eaf68', '2017-08-08 12:43:26', b'0', '2017-08-08 12:43:39', '1', '123456789123456789', NULL, b'0', 'wangwu', 'e10adc3949ba59abbe56e057f20f883e', '13299999999', '王五'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '2017-07-27 16:49:03', b'0', '2017-08-08 12:33:54', '1', '123456789123456789', NULL, b'0', 'lisi10010', 'e10adc3949ba59abbe56e057f20f883e', '13299999998', '李四'),
	('cb19a72c-1496-492b-9440-51241cdc3485', '2017-07-27 16:40:09', b'0', '2017-08-08 12:33:47', '1', '123456789123456789', NULL, b'0', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '13299999999', '张三');
/*!40000 ALTER TABLE `t_s_user` ENABLE KEYS */;

-- 导出  表 blog.t_s_user_role 结构
DROP TABLE IF EXISTS `t_s_user_role`;
CREATE TABLE IF NOT EXISTS `t_s_user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  KEY `FK_mk0l42w3v5e0xkrfxpa97w3bv` (`role_id`),
  KEY `FK_8np60bshs5317b62gbrbqsyt4` (`user_id`),
  CONSTRAINT `FK_8np60bshs5317b62gbrbqsyt4` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `FK_mk0l42w3v5e0xkrfxpa97w3bv` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  blog.t_s_user_role 的数据：~6 rows (大约)
DELETE FROM `t_s_user_role`;
/*!40000 ALTER TABLE `t_s_user_role` DISABLE KEYS */;
INSERT INTO `t_s_user_role` (`user_id`, `role_id`) VALUES
	('cb19a72c-1496-492b-9440-51241cdc3485', 'c15cc5a0-4e67-493a-864f-21a007d6b2ad'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('bc7809fe-b085-4ea1-bbe7-584e73a8bd5e', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1'),
	('60e95e04-9ce7-48aa-b360-943cab0eaf68', 'c15cc5a0-4e67-493a-864f-21a007d6b2ad'),
	('60e95e04-9ce7-48aa-b360-943cab0eaf68', 'db8fa132-1e5d-48d2-bd42-9c6d7291c639'),
	('60e95e04-9ce7-48aa-b360-943cab0eaf68', '1b6f84eb-5d4c-49d0-8393-14b511b56ef1');
/*!40000 ALTER TABLE `t_s_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
