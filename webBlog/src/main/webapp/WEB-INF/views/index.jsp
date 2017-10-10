<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pgs" uri="http://www.commons.page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="psg" uri="http://www.commons.page" %>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<pgs:extends name="title">博客</pgs:extends>
<pgs:extends name="javascript">
	<script type="text/javascript" src="${ctx}/static/lib/js/jquery.marquee.min.js"></script>
	<script src="${ctx}/static/lib/js/classie.js"></script>
	<script src="${ctx}/static/lib/js/uisearch.js"></script>
	<script type="text/javascript">
		$(function () {
		  	$("#slider").responsiveSlides({
				auto: true,
				nav: true,
				speed: 500,
				namespace: "callbacks",
				pager: true,
		  	});
		});
	</script>
	<script type="text/javascript" src="${ctx}/static/lib/js/move-top.js"></script>
	<script type="text/javascript" src="${ctx}/static/lib/js/easing.js"></script>
	<!--/script-->
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
			});
		});
	</script>
</pgs:extends>
<psg:extends name="body">
    <!-- header-section-starts-here -->
	<div class="header">
		<div class="header-top">
			<div class="wrap">
				<div class="top-menu">
					<ul>
						<li><a href="index.html">首页</a></li>
						<li><a href="about.html">关于我们</a></li>
						<li><a href="privacy-policy.html">联系我们</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="num">
					<p> Call us : 032 2352 782</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="logo text-center">
				<a href="index.html"><img src="${ctx}/static/lib/images/logo.jpg" alt="" /></a>
			</div>
			<div class="navigation">
				<nav class="navbar navbar-default" role="navigation">
		   <div class="wrap">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
			</div>
			<!--/.navbar-header-->
		
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					 <li class="active"><a href="index.html">首页</a></li>
						<li><a href="sports.html">运动</a></li>
				    <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">娱乐<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="entertainment.html">电影</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">另类</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">文章</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">名人</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">更多</a></li>
						</ul>
					  </li>
					<li><a href="shortcodes.html">健康</a></li>
					<li><a href="fashion.html">时尚</a></li>
					  <li class="dropdown">
						<a href="business.html" class="dropdown-toggle" data-toggle="dropdown">商业<b class="caret"></b></a>
						<ul class="dropdown-menu multi-column columns-2">
							<div class="row">
								<div class="col-sm-6">
									<ul class="multi-column-dropdown">
										<li><a href="business.html">活动</a></li>
										<li class="divider"></li>
										<li><a href="business.html">法令</a></li>
									    <li class="divider"></li>
										<li><a href="business.html">市场</a></li>
										<li class="divider"></li>
										<li><a href="business.html">回顾</a></li>
										<li class="divider"></li>
										<li><a href="shortcodes.html">法典</a></li>
									</ul>
								</div>
								<div class="col-sm-6">
									<ul class="multi-column-dropdown">
									   <li><a href="business.html">features</a></li>	
										<li class="divider"></li>
										<li><a href="entertainment.html">Movies</a></li>
									    <li class="divider"></li>
										<li><a href="sports.html">sports</a></li>
										<li class="divider"></li>
										<li><a href="business.html">Reviews</a></li>
										<li class="divider"></li>
										<li><a href="business.html">Stock</a></li>
									</ul>
								</div>
							</div>
						</ul>
					</li>
					<li><a href="technology.html">科技</a></li>
					<div class="clearfix"></div>
				</ul>
				<div class="search">
					<!-- start search-->
				    <div class="search-box">
					    <div id="sb-search" class="sb-search">
							<form>
								<input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"> </span>
							</form>
						</div>
				    </div>
					<!-- search-scripts -->
					<script>
						new UISearch( document.getElementById( 'sb-search' ) );
					</script>
					<!-- //search-scripts -->
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--/.navbar-collapse-->
	 		<!--/.navbar-->
			</div>
		</nav>
		</div>
	</div>
	<!-- header-section-ends-here -->
	<div class="wrap">
		<div class="move-text">
			<div class="breaking_news">
				<h2>突发新闻</h2>
			</div>
			<div class="marquee">
				<div class="marquee1"><a class="breaking" href="single.html">>>The standard chunk of Lorem Ipsum used since the 1500s is reproduced..</a></div>
				<div class="marquee2"><a class="breaking" href="single.html">>>At vero eos et accusamus et iusto qui blanditiis praesentium voluptatum deleniti atque..</a></div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
			<script>
			  $('.marquee').marquee({ pauseOnHover: true });
			  //@ sourceURL=pen.js
			</script>
		</div>
	</div>
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
	<!-- content-section-starts-here -->
	<div class="main-body">
		<div class="wrap">
			<div class="col-md-8 content-left">
				<div class="slider">
					<div class="callbacks_wrap">
						<ul class="rslides" id="slider">
							<li>
								<img src="${ctx}/static/lib/images/3.jpg" alt="">
								<div class="caption">
									<a href="single.html">Lorem Ipsum is simply dummy text of the printing and typesetting industry</a>
								</div>
							</li>
							<li>
								<img src="${ctx}/static/lib/images/2.jpg" alt="">
								<div class="caption">
									<a href="single.html">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</a>
								</div>
							</li>
							<li>
								<img src="${ctx}/static/lib/images/1.jpg" alt="">
								<div class="caption">
									<a href="single.html">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="articles">
					<header>
						<h3 class="title-head">世界各地</h3>
					</header>
					<div class="article">
						<div class="article-left">
							<a href="single.html"><img src="${ctx}/static/lib/images/article1.jpg"></a>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>On Feb 25, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>104 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>52</a></p>
								<a class="title" href="single.html"> The section of the mass media industry that focuses on presenting</a>
							</div>
							<div class="article-text">
								<p>The standard chunk of Lorem Ipsum used since the 1500s. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" exact original.....</p>
								<a href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="article">
						<div class="article-left">
							<iframe width="100%" src="http://www.cssmoban.com/" frameborder="0" allowfullscreen></iframe>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>On Apr 11, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>2 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>54 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>18</a></p>
								<a class="title" href="single.html">Contrary to popular belief, Lorem Ipsum is not simply random</a>
							</div>
							<div class="article-text">
								<p>It is a long established fact that a reader will be distracted by the readable.....</p>
								<a href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="article">
						<div class="article-left">
							<a href="single.html"><img src="${ctx}/static/lib/images/article3.jpg"></a>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>On Jun 21, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>181 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>89</a></p>
								<a class="title" href="single.html">There are many variations that focuses on presenting</a>
							</div>
							<div class="article-text">
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.....</p>
								<a href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="article">
						<div class="article-left">
							<a href="single.html"><img src="${ctx}/static/lib/images/article4.jpg"></a>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>On Jan 17, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>1 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>144 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>74</a></p>
								<a class="title" href="single.html">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a>
							</div>
							<div class="article-text">
								<p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born.....</p>
								<a href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="article">
						<div class="article-left">
							<iframe width="100%" src="http://www.cssmoban.com/" frameborder="0" allowfullscreen></iframe>
						</div>
						<div class="article-right">
							<div class="article-title">
								<p>On Mar 14, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>250 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>68</a></p>
								<a class="title" href="single.html">On the other hand, we denounce with righteous indignation</a>
							</div>
							<div class="article-text">
								<p>It is a long established fact that a reader will be distracted by the readable.....</p>
								<a href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="life-style">
					<header>
						<h3 class="title-head">生活方式</h3>
					</header>
					<div class="life-style-grids">
						<div class="life-style-left-grid">
							<a href="single.html"><img src="${ctx}/static/lib/images/l1.jpg" alt="" /></a>
							<a class="title" href="single.html">It is a long established fact that a reader will be distracted.</a>
						</div>
						<div class="life-style-right-grid">
							<a href="single.html"><img src="${ctx}/static/lib/images/l2.jpg" alt="" /></a>
							<a class="title" href="single.html">There are many variations of passages of Lorem Ipsum available.</a>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="life-style-grids">
						<div class="life-style-left-grid">
							<a href="single.html"><img src="${ctx}/static/lib/images/l3.jpg" alt="" /></a>
							<a class="title" href="single.html">Contrary to popular belief, Lorem Ipsum is not simply random text.</a>
						</div>
						<div class="life-style-right-grid">
							<a href="single.html"><img src="${ctx}/static/lib/images/l4.jpg" alt="" /></a>
							<a class="title" href="single.html">Sed ut perspiciatis unde omnis iste natus error sit voluptatem.</a>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
					<div class="sports-top">
							<div class="s-grid-left">
								<div class="cricket">
									<header>
										<h3 class="title-head">商业</h3>
									</header>
									<div class="c-sports-main">
											<div class="c-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus1.jpg" alt="" /></a>
											</div>
											<div class="c-text">
												<h6>Lorem Ipsum</h6>
												<a class="power" href="single.html">It is a long established fact that a reader</a>
												<p class="date">On Feb 25, 2015</p>
												<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus2.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Mar 21, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus3.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Jan 25, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus4.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Jul 19, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
									</div>
								</div>
							<div class="s-grid-right">
								<div class="cricket">
									<header>
										<h3 class="title-popular">科技</h3>
									</header>
									<div class="c-sports-main">
											<div class="c-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/tec1.jpg" alt="" /></a>
											</div>
											<div class="c-text">
												<h6>Lorem Ipsum</h6>
												<a class="power" href="single.html">It is a long established fact that a reader</a>
												<p class="date">On Apr 22, 2015</p>
												<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/tec2.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Jan 19, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/tec3.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Jun 25, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
										<div class="s-grid-small">
											<div class="sc-image">
												<a href="single.html"><img src="${ctx}/static/lib/images/tec4.jpg" alt="" /></a>
											</div>
										<div class="sc-text">
											<h6>Lorem Ipsum</h6>
											<a class="power" href="single.html">It is a long established fact that a reader</a>
											<p class="date">On Jul 19, 2015</p>
											<a class="reu" href="single.html"><img src="${ctx}/static/lib/images/more.png" alt="" /></a>
												<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
				</div>
			<div class="col-md-4 side-bar">
			<div class="first_half">
				<div class="newsletter">
					<h1 class="side-title-head">时事通讯</h1>
					<p class="sign">注册接收我们的免费通讯！</p>
					<form>
						<input type="text" class="text" value="Email Address" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email Address';}">
						<input type="submit" value="提交">
					</form>
				</div>
				<div class="list_vertical">
		         	 	<section class="accordation_menu">
						  <div>
						    <input id="label-1" name="lida" type="radio" checked/>
						   <label for="label-1" id="item1"><i class="ferme"> </i>热门职位<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
						    <div class="content" id="a1">
						    	<div class="scrollbar" id="style-2">
								 <div class="force-overflow">
									<div class="popular-post-grids">
										<div class="popular-post-grid">
											<div class="post-img">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus2.jpg" alt="" /></a>
											</div>
											<div class="post-text">
												<a class="pp-title" href="single.html"> 大众传媒业</a>
												<p>On Feb 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>3 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="popular-post-grid">
											<div class="post-img">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus1.jpg" alt="" /></a>
											</div>
											<div class="post-text">
												<a class="pp-title" href="single.html"> Lorem Ipsum is simply dummy text printing</a>
												<p>On Apr 14 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>2 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="popular-post-grid">
											<div class="post-img">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus3.jpg" alt="" /></a>
											</div>
											<div class="post-text">
												<a class="pp-title" href="single.html">There are many variations of Lorem</a>
												<p>On Jun 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
											</div>
											<div class="clearfix"></div>
										</div>
										<div class="popular-post-grid">
											<div class="post-img">
												<a href="single.html"><img src="${ctx}/static/lib/images/bus4.jpg" alt="" /></a>
											</div>
											<div class="post-text">
												<a class="pp-title" href="single.html">Sed ut perspiciatis unde omnis iste natus</a>
												<p>On Jan 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>1 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									</div>
                                </div>
                              </div>
						  </div>
						  <div>
						    <input id="label-2" name="lida" type="radio"/>
						    <label for="label-2" id="item2"><i class="icon-leaf" id="i2"></i>最近的帖子<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
						    <div class="content" id="a2">
						       <div class="scrollbar" id="style-2">
								   <div class="force-overflow">
									<div class="popular-post-grids">
											<div class="popular-post-grid">
												<div class="post-img">
													<a href="single.html"><img src="${ctx}/static/lib/images/tec2.jpg" alt="" /></a>
												</div>
												<div class="post-text">
													<a class="pp-title" href="single.html"> The section of the mass media industry</a>
													<p>On Feb 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>3 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="popular-post-grid">
												<div class="post-img">
													<a href="single.html"><img src="${ctx}/static/lib/images/tec1.jpg" alt="" /></a>
												</div>
												<div class="post-text">
													<a class="pp-title" href="single.html"> Lorem Ipsum is simply dummy text printing</a>
													<p>On Apr 14 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>2 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="popular-post-grid">
												<div class="post-img">
													<a href="single.html"><img src="${ctx}/static/lib/images/tec3.jpg" alt="" /></a>
												</div>
												<div class="post-text">
													<a class="pp-title" href="single.html">There are many variations of Lorem</a>
													<p>On Jun 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="popular-post-grid">
												<div class="post-img">
													<a href="single.html"><img src="${ctx}/static/lib/images/tec4.jpg" alt="" /></a>
												</div>
												<div class="post-text">
													<a class="pp-title" href="single.html">Sed ut perspiciatis unde omnis iste natus</a>
													<p>On Jan 25 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>1 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
									</div>
								</div>
						    </div>
						  </div>
						  <div>
						    <input id="label-3" name="lida" type="radio"/>
						    <label for="label-3" id="item3"><i class="icon-trophy" id="i3"></i>评论<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
						    <div class="content" id="a3">
						       <div class="scrollbar" id="style-2">
							    <div class="force-overflow">
								 <div class="response">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 21, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MARCH 26, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>MAY 25, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>FEB 13, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>JAN 28, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>APR 18, 2015</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#">
									<img class="media-object" src="${ctx}/static/lib/images/icon1.png" alt="" />
								</a>
								<h5><a href="#">Username</a></h5>
							</div>
							<div class="media-body response-text-right">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
									sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
								<ul>
									<li>DEC 25, 2014</li>
									<li><a href="single.html">Reply</a></li>
								</ul>		
							</div>
							<div class="clearfix"> </div>
						</div>
					</div>
					</div>

                                </div>
						    </div>
						  </div>
						</section>
					 </div>
					 <div class="side-bar-articles">
						<div class="side-bar-article">
							<a href="single.html"><img src="${ctx}/static/lib/images/sai.jpg" alt="" /></a>
							<div class="side-bar-article-title">
								<a href="single.html">Contrary to popular belief, Lorem Ipsum is not simply random text</a>
							</div>
						</div>
						<div class="side-bar-article">
							<a href="single.html"><img src="${ctx}/static/lib/images/sai2.jpg" alt="" /></a>
							<div class="side-bar-article-title">
								<a href="single.html">There are many variations of passages of Lorem</a>
							</div>
						</div>
						<div class="side-bar-article">
							<a href="single.html"><img src="${ctx}/static/lib/images/sai3.jpg" alt="" /></a>
							<div class="side-bar-article-title">
								<a href="single.html">Sed ut perspiciatis unde omnis iste natus error sit voluptatem</a>
							</div>
						</div>
					 </div>
					 </div>
					 <div class="secound_half">
					 <div class="tags">
						<header>
							<h3 class="title-head">热门标签</h3>
						</header>
						<p>
						<a class="tag1" href="single.html">At vero eos</a>
						<a class="tag2" href="single.html">doloremque</a>
						<a class="tag3" href="single.html">On the other</a>
						<a class="tag4" href="single.html">pain was</a>
						<a class="tag5" href="single.html">rationally encounter</a>
						<a class="tag6" href="single.html">praesentium voluptatum</a>
						<a class="tag7" href="single.html">est, omnis</a>
						<a class="tag8" href="single.html">who are so beguiled</a>
						<a class="tag9" href="single.html">when nothing</a>
						<a class="tag10" href="single.html">owing to the</a>
						<a class="tag11" href="single.html">pains to avoid</a>
						<a class="tag12" href="single.html">tempora incidunt</a>
						<a class="tag13" href="single.html">pursues or desires</a>
						<a class="tag14" href="single.html">Bonorum et</a>
						<a class="tag15" href="single.html">written by Cicero</a>
						<a class="tag16" href="single.html">Ipsum passage</a>
						<a class="tag17" href="single.html">exercitationem ullam</a>
						<a class="tag18" href="single.html">mistaken idea</a>
						<a class="tag19" href="single.html">ducimus qui</a>
						<a class="tag20" href="single.html">holds in these</a>
						</p>
					 </div>					 
					 <div class="popular-news">
						<header>
							<h3 class="title-popular">热门新闻</h3>
						</header>
						<div class="popular-grids">
							<div class="popular-grid">
								<a href="single.html"><img src="${ctx}/static/lib/images/popular-4.jpg" alt="" /></a>
								<a class="title" href="single.html">It is a long established fact that a reader will be distracted</a>
								<p>On Aug 31, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>250 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>68</a></p>
							</div>
							<div class="popular-grid">
								<a href="single.html"><img src="${ctx}/static/lib/images/popular-1.jpg" alt="" /></a>
								<a class="title" href="single.html">It is a long established fact that a reader will be distracted</a>
								<p>On Mar 14, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>250 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>68</a></p>
							</div>
							<div class="popular-grid">
								<iframe width="100%" src="http://www.cssmoban.com/" frameborder="0" allowfullscreen></iframe>
								<a class="title" href="single.html">Aishwarya Rai Bachchan's Latest SHOCKING News For Ex Salman Khan</a>
								<p>On Mar 14, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>250 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>68</a></p>
							</div>
							<div class="popular-grid">
								<a href="single.html"><img src="${ctx}/static/lib/images/popular-3.jpg" alt="" /></a>
								<a class="title" href="single.html">It is a long established fact that a reader will be distracted</a>
								<p>On Mar 14, 2015 <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>0 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>250 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-thumbs-up"></span>68</a></p>
							</div>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- content-section-ends-here -->
	<!-- footer-section-starts-here -->
	<div class="footer">
		<div class="footer-top">
			<div class="wrap">
				<div class="col-md-3 col-xs-6 col-sm-4 footer-grid">
					<h4 class="footer-head">关于我们</h4>
					<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
					<p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here.</p>
				</div>
				<div class="col-md-2 col-xs-6 col-sm-2 footer-grid">
					<h4 class="footer-head">类别</h4>
					<ul class="cat">
						<li><a href="business.html">Business</a></li>
						<li><a href="technology.html">Technology</a></li>
						<li><a href="entertainment.html">Entertainment</a></li>
						<li><a href="sports.html">Sports</a></li>
						<li><a href="shortcodes.html">Health</a></li>
						<li><a href="fashion.html">Fashion</a></li>
					</ul>
				</div>
				<div class="col-md-4 col-xs-6 col-sm-6 footer-grid">
					<h4 class="footer-head">赞助商</h4>
					<ul class="flickr">
						<li><a href="#"><img src="${ctx}/static/lib/images/bus4.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/bus2.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/bus3.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/tec4.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/tec2.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/tec3.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/bus2.jpg"></a></li>
						<li><a href="#"><img src="${ctx}/static/lib/images/bus3.jpg"></a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="col-md-3 col-xs-12 footer-grid">
					<h4 class="footer-head">联系我们</h4>
					<span class="hq">Our headquaters</span>
					<address>
						<ul class="location">
							<li><span class="glyphicon glyphicon-map-marker"></span></li>
							<li>CENTER FOR FINANCIAL ASSISTANCE TO DEPOSED NIGERIAN ROYALTY</li>
							<div class="clearfix"></div>
						</ul>	
						<ul class="location">
							<li><span class="glyphicon glyphicon-earphone"></span></li>
							<li>+0 561 111 235</li>
							<div class="clearfix"></div>
						</ul>	
						<ul class="location">
							<li><span class="glyphicon glyphicon-envelope"></span></li>
							<li><a href="mailto:info@example.com">mail@example.com</a></li>
							<div class="clearfix"></div>
						</ul>						
					</address>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="wrap">
				<div class="copyrights col-md-6">
					<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="${ctx }">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
				</div>
				<div class="footer-social-icons col-md-6">
					<ul>
						<li><a class="facebook" href="#"></a></li>
						<li><a class="twitter" href="#"></a></li>
						<li><a class="flickr" href="#"></a></li>
						<li><a class="googleplus" href="#"></a></li>
						<li><a class="dribbble" href="#"></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- footer-section-ends-here -->
	<script type="text/javascript">
		$(document).ready(function() {
		$().UItoTop({ easingType: 'easeOutQuart' });
	});
	</script>
	<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</psg:extends>
<jsp:include page="/parent_page/parent.jsp"/>
