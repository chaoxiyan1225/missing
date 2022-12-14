
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="">
<head>
    <meta charset="UTF-8"/>
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
    <meta content="福禄园,包头市官方公墓园,公墓价格，陵园墓型,陵园图片,陵园风水,陵园" name="keywords" />
    <meta content="包头市大青山陵园是一座集安葬、祭祀、人文、景观、教育、为一体的大型园林式生态陵园" name="description" />
    <meta content="telephone=no, email=no" name="format-detection" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1" name="viewport" />
    <meta content="66c08037a980c793a02f295e8e66037c_1535333012" name="shenma-site-verification" />
    <title>福禄园</title>
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
    <script src="../yikong/js/shipei.js" ></script>
    <link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
    <link rel="stylesheet" href="../yikong/css/swiper.css"  />
    <link rel="stylesheet" href="../yikong/css/index.css"  />
    <link rel="stylesheet" href="../yikong/css/reset.css"  />
    <!--begin::页面样式 -->
    <link rel="stylesheet" type="text/css" href="../yikong/css/hongbao.css" />
    <!--end::页面样式 -->
    <script src="../yikong/js/jquery-3.0.0.min.js" ></script>
    <script src="../yikong/js/swiper-3.4.2.jquery.min.js"></script>
    <script>
        var time_range_now = function (beginTime, endTime) {
            var nowdate = Math.round(new Date()/1000);
            if(nowdate<endTime && nowdate >= beginTime){
                $("html").css({
                    '-webkit-filter':'grayscale(100%)',
                    '-moz-filter':'grayscale(100%)',
                    '-ms-filter':'grayscale(100%)',
                    '-o-filter':'grayscale(100%)'
                });
            }
        };
        // time_range_now(1536595200,1536681599);
        time_range_now(1544630400,1544716799);
    </script>
</head>
<body>
    <div align="center" class="details">
        <!--<div th:include="mobile/common/topNav :: tapNavHtml(${garden.name})"></div>-->
        <div class="fanhui wenben dw_w">
    <!-- 导航 -->
    <div class="nav">
        <div class="left">
            <a href="./index"><img alt="" class="fanhui" src="../yikong/img/sy-fanhui.png"  /></a>
            <div>
                <img alt="" src="../yikong/img/s-dw.png"  />
                <span class="dw">包头市</span>
                <img alt="" class="icon" src="../yikong/img/s-sjdw.png"  />
            </div>
        </div>
        <div class="right">
            <img alt="" src="../yikong/img/s-dh.png" />
        </div>
        <div class="center sy_sousu">
            <img alt="" src="../yikong/img/s-ss.png"  />
        </div>
        <div class="center wenben">福禄园</div>
    </div>

    <!--搜索结构-->
    <div class="sousu">
        <div class="shur">
            <form action="http://m.yiko.org/garden/search" method="get">
                <img alt=""  src="../yikong/img/icon_nav_search.png"  />
                <input name="keywords" placeholder="搜索陵园" type="text" value="福禄园" />
            </form>
            <span>取消</span>
        </div>
        <div class="remen">
            <h2>
                <img alt="热门搜索" src="../yikong/img/icon_nav_rmss.png"  />热门搜索
            </h2>
            <ul>
                <li onclick="">福禄园</li>

            </ul>
        </div>
    </div>


    <!-- 定位城市模块 -->
    <div class="dingw">
        <div class="hide"></div>
        <div class="dingwBox">
            <h3>
                <span></span>
                 &nbsp;&nbsp;选择城市&nbsp;&nbsp;
                <span></span>
            </h3>
            <div class="dangq">
                <img alt="" src="../yikong/img/icon_location.png"  />

                <span class="dw">当前定位城市：包头市</span>
            </div>
            <div class="dangq">
                <h2 class="tujianH2">
                    <span></span>开通城市
                </h2>
                <div>
                    <span>
                        <a href="#" >北京</a>
                    </span>
             
                </div>
            </div>
            <img alt="" class="sy_csjy" src="../yikong/img/sy_csjy.png"  />
        </div>

    </div>


    <script>
        $(function () {
            // 点击右侧面包屑功能
            var nav = 1;
            $('.nav .right').click(function(){
                if(nav ==1){
                    $('.mbx').fadeIn();
                    $('body').css({overflow: 'hidden'});
                    nav = 0;
                }else{
                    $('.mbx').fadeOut();
                    $('body').css({overflow: 'initial'});
                    nav = 1;
                }
            });


            $('.mbx').click(function(){
                $(this).fadeOut();
                $('body').css({overflow: 'initial'});
            });

            $('.nav .left span').click(function(){
                $('.dingw').slideDown();
                $('body').css({overflow: 'hidden'});
            });
            $('http://m.yiko.org/garden/detail/.dingw .hide').click(function(){
                $('.dingw').slideUp();
                $('body').css({overflow: 'initial'});
            });


            $('.nav .center').click(function(){
                $('.sousu').fadeIn();
                $('body').css({overflow: 'hidden'});
            });
            $('.sousu .shur span').click(function(){
                $('.sousu').fadeOut();
                $('body').css({overflow: 'initial'});
            });

            $('.fanhui .nav .left img.fanhui').click(function(){
                history.back(-1);
            });
        });

        function search(keywords) {
            console.log(keywords);
            var url = "/garden/search?keywords="+keywords;
            location = url;
        }

    </script>
</div>
        <h2 class="titleH2">
            <a href="./index" tppabs="http://m.yiko.org/index">首页</a>
            <img alt="" src="../yikong/img/icon_jiantou.png"  />
            <span>福禄园</span>
        </h2>
        <!-- banner -->
        <div class="banner details">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div style="background:url(../yikong/img/fuluyuan_content1.jpg) center ;background-size:cover;"></div>
                    </div>
                    <div class="swiper-slide">
                        <div style="background:url(../yikong/img/fuluyuan_content2.jpg) center ;background-size:cover;"></div>
                    </div>
                </div>
                <div class="swiper-pagination shuzi"></div>
            </div>
        </div>

        <!--红包-->
        <div class="hongbao_ban">
            <img alt="" src="../yikong/img/hongbao_1.png" />
            <h2>
                购墓送现金红包<font color="red" ><strong>1999元</strong></font><br /><span>具体优惠请咨询选墓顾问</span></h2>
            <div class="lingqu">
                <a href="tel:13722128886">立即领取</a><br />
                <span>数量有限先到先得</span>
            </div>
        </div>

        <div class="myxx">
            <h2>
                <span class="name">福禄园</span>
                <span class="jiaGe">
                    <span>￥</span>0.7<span class="hong">万</span><span>起</span>
                </span>
                
            </h2>
            <div class="db">
                <img alt="" src="../yikong/img/icon_binyiguan_location.png"  />
                <span>包头市大青山</span>
            </div>
            <div class="db">
                <img alt="" src="../yikong/img/icon_chjshj.png"  />
                <span>2009年创建</span>
            </div>
            <ul>
                <li>大师选穴</li>
                <li>风水宝地</li>
                <li>免费树葬</li>
                <li>免费专车</li>
                <li>3500亩</li>
                <li>种类齐全</li>
            </ul>

<!-- 
            <div class="dengJ">
                <div class="text">
                    <span>
                        低端
                        <em></em>
                    </span>
                    <span>
                        中端
                        <em></em>
                    </span>
                    <span>
                        高端
                        <em></em>
                    </span>
                </div>
                <div class="dengJ02">
                    <span>
                       
                        <span class="jg">0.0万</span>
                    </span>
                    <span>
                      
                        <span class="jg">3.88万</span>
                    </span>
                    <span>
                        
                        <span class="jg">5.88万</span>
                    </span>
                    <span>
                       
                        <span class="jg">12万以上</span>
                    </span>
                </div>
            </div>
            
             -->

            <div class="biaoqian">
                <div>
                    <img alt="" src="../yikong/img/icon_peitong.png"  />
                    全程陪同指导
                </div>
                <div>
                    <img alt="" src="../yikong/img/icon_zhuanche.png"  />
                    免费专车接送
                </div>
                <div>
                    <img alt="" src="../yikong/img/icon_zhekou.png"  />
                    购墓即享优惠
                </div>
                <div>
                    <img alt="" src="../yikong/img/icon_lipin.png"  />
                   免费大师选墓穴
                </div>
            </div>
        </div>


        <div class="bq">
            <button class="ljyy">
                <a href="tel:13722128886">立即预约</a>
            </button>
        </div>

        <img alt="" src="../yikong/img/lyxq_banner.jpg"  style="width: 100%;display: block;" />

  <!--
        <div class="shipin">
            <h2>
                <span class="left"></span>
                陵园视频
                <span class="right"></span>
            </h2>
            <iframe src="../../../yuntv.letv.com/bcloud.html-uu=d5d0c0265a&vu=a9280deb4d&pu=6de022daae&auto_play=0&gpcflag=1&width=&height=320" tppabs="http://yuntv.letv.com/bcloud.html?uu=d5d0c0265a&vu=a9280deb4d&pu=6de022daae&auto_play=0&gpcflag=1&width=&height=320"></iframe>
        </div>
		-->
        <div class="bg5"></div>

        <div class="nav_but">
            <span class="active">
                <span>陵园碑型</span>
            </span>
            <span >
                <span>陵园详情</span>
            </span>
            <span>
                <span>阴阳先生</span>
            </span>
            <span>
                <span>交通信息</span>
            </span>
        </div>



        <div class="tablea" id="tablea">
            <div class="cemteryBox">
                <div class="tuijian muXing">
                    <ul class="binzang-list bzyp">
                                            <li class="beixing" onclick="javascript:peiImg(&#39;5384&#39;);">
                            <a>
                                <div>
                                    <img alt="树葬" src="../yikong/img/gyht-0.jpg"  />
                                </div>
                                <p>
                                    <span>公益花坛葬</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥0万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5384&#39;);">
                            <a>
                                <div>
                                    <img alt="树葬" src="../yikong/img/gysx-0.jpg"  />
                                </div>
                                <p>
                                    <span>公益树穴葬</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥0万
                                </span>
                                
                            </a>
                        </li>
                        <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/bfy7000-fq.jpg"  />
                                </div>
                                <p>
                                    <span>百福苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥0.7万
                                </span>
                                
                            </a>
                        </li>
						  <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/bfy12800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>百福苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥1.28万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/fay65000-fq.jpg"  />
                                </div>
                                <p>
                                    <span>福安苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥6.5万
                                </span>
                                
                            </a>
                        </li>
						
					    <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/fay90000-fq.jpg"  />
                                </div>
                                <p>
                                    <span>福安苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥9.0万
                                </span>
                                
                            </a>
                        </li>
						 <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/fay99999-fq.jpg"  />
                                </div>
                                <p>
                                    <span>福安苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥9.9万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/thy16800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>天和苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥1.68万
                                </span>
                                
                            </a>
                        </li>
					     <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/thy26800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>天和苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥2.68万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/wqy26800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>万青苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥2.68万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/wqy28800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>万青苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥2.88万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/wqy30800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>万青苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥3.08万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <div>
                                    <img alt="夫妻穴" src="../yikong/img/wfy46800-fq.jpg"  />
                                </div>
                                <p>
                                    <span>万福苑夫妻穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥4.68万
                                </span>
                                
                            </a>
                        </li>
						
						
						
                        <li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy120000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥12.0万
                                </span>
                                
                            </a>
                        </li>
						
                        <li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy158000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥15.8万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy188000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥18.8万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy198000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥19.8万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy228000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥22.8万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/wfy108000-jz.jpg"  />
                                </div>
                                <p>
                                    <span>万福苑家族穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥10.8万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy50000-ld.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑两代穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥5.0万
                                </span>
                                
                            </a>
                        </li>
						<li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <div>
                                    <img alt="家族穴" src="../yikong/img/fsy52800-ld.jpg"  />
                                </div>
                                <p>
                                    <span>福寿苑两代穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥5.28万
                                </span>
                                
                            </a>
                        </li>
                        <li class="beixing" onclick="javascript:peiImg(&#39;5385&#39;);">
                            <a>
                                <div>
                                    <img alt="定制穴" src="../yikong/img/sx-jgmy.jpg" />
                                </div>
                                <p>
                                    <span>树穴</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    <span class="qsj">参考价:</span>
                                    ￥面议
                                </span>
                                
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
              <div class="cemteryBox wenx">
                <img alt="" src="../yikong/img/icon_zhankai.png"  />
                <p class="text">包头市大青山陵园是包头市墓园与殡仪馆配套之陵园。是国家和自治区以及包头市殡葬协会会员单位。是受理骨灰盒安葬业务合法的大型公墓。大青山陵园占地千余亩，位于包头市区正北方，地貌呈座椅型，东西北三方倚靠大青山，面对黄河。
园内草木葱茏，小河流淌，赵长城横贯园区，宛如玉带萦绕。青龙山高耸，白虎山驯顺，加之笔架山福佑，金顶山护助。真是难得的自然造化、龙脉积聚、福瑞祥和之风水宝地。大青山陵园建设本着高起点、高标准的原则，力争打造内蒙古**的园林式公墓。园区拥有完善的智能化网络管理系统，及一支高素质的员工队伍。并装备了全时全区域覆盖的远红外线监控装置。同时为方便市民，在市区有专车免费接送购墓客户直达园区。
包头市大青山陵园是一座集安葬、祭祀、人文、景观、教育、为一体的大型园林式生态陵园，陵园突破了单一墓葬模式，融传统墓葬与现代的植树葬、草坪葬、艺术葬于一园。同时为满足不同群体的需求，开设了诸如园丁园、功德园、西口园等。大青山陵园必将成为包头市集追思、悼祖、旅游观光与一体的人文历史景观纪念园。</p>
            </div>
            <div class="cemteryBox">
                <!--th:attr="style='background:url('shipinditu.png') center ;background-size:cover;'"-->
              <div class="tuijian muXing">
                    <ul class="binzang-list bzyp">
                        <li class="beixing" onclick="javascript:peiImg(&#39;5382&#39;);">
                            <a>
                                <p>
                                    <span>袁天罡</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                                    
                                                                                                 黄道吉日 风水好穴
                                </span>
                                
                            </a>
                        </li>
                        <li class="beixing" onclick="javascript:peiImg(&#39;5383&#39;);">
                            <a>
                                <p>
                                    <span>李淳风</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                           
                                                                                                    家族墓穴旺子孙
                                </span>
                                
                            </a>
                        </li>
                        <li class="beixing" onclick="javascript:peiImg(&#39;5384&#39;);">
                            <a>
                                <p>
                                    <span>刘伯温</span>
                                    <!--朝阳区-->
                                </p>
                                <span>
                             
                                                                                                天象吉日福泽后人
                                </span>
                                
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="cemteryBox">
                <div class="cemerety_maps" id="maps">
                    <div class="jtxx">
                        <ul>
                            <li>
                               
                                <div>
                                   <span>距离市区：</span>5公里
                                </div>
                            </li>
                            <li>
                                
                                <div>
                                    <span>免费接送班车：</span>需早上08:30后，需电话提前预约致电tel:13722128886
                                </div>
                            </li>
                            <li>
                               
                                <div>
                                    <span>公交路线：</span><br/>
                                    (1)从大自然旅行社站乘63路到二相公村口下车<br/>
                                    (2)从东站公交站乘7路到大庙公交站下车
                                </div>
                            </li>
                            <li>
                           
                                <div>
                                    <span>自驾路线：</span><br/>
                                    <span>行车路线1：</span>高德或者百度地图导航搜索福禄园公墓即可下车<br/>
                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <div class="bg5"></div>
        <!--相关文章推荐-->
        <div class="xgwztj">
            <div>
    <!--相关文章推荐-->

        <img alt="" class="left" src="../yikong/img/title_left.png" />
        <img alt="" class="right" src="../yikong/img/title_right.png" />
     
</div>
        </div>


        <div class="peiImg" id="peiImg">
            <span class="xx"></span>
            <div id="bb"></div>

        </div>


        <script id="peiImgTmp" type="text/x-jquery-tmpl">
            <div class="box">
                <h3>
                    ${goods.goodsName}
                </h3>
                <div class="swiper-container2">
                    <div class="swiper-wrapper">
                        {{each(i,data) imgList}}
                            <div class="swiper-slide">
                                <div style='background:url(${preImgUrl+data.imgUrl}) center ;background-size:cover;'></div>
                            </div>
                        {{/each}}
                    </div>
                </div>
                <!--<ul class="tag">-->
                    <!--<li>-->
                        <!--单穴-->
                    <!--</li>-->
                    <!--<li>-->
                        <!--花岗岩-->
                    <!--</li>-->
                    <!--<li>-->
                        <!--坐北朝南-->
                    <!--</li>-->
                <!--</ul>-->
                <div class="jiag">
                    {{if goods.goodsPrice==0}}
                    参考价: 时价
                    {{/if}}
                    {{if goods.goodsPrice!=0}}
                    参考价：<span>￥${goods.goodsPrice/10000}万</span>
                    {{/if}}
                </div>
                <!--<div class="but">-->
                    <!--<button><a href="https://hm.baidu.com/hm.js?03411212eb00a84da4103e92b3041216">立即咨询</a></button>-->
                    <!--<button>-->
                        <!--<a href="">预约热线</a>-->
                    <!--</button>-->
                <!--</div>-->
            </div>
        </script>

    </div>
    <!--底部公司介绍-->
    <div>
    <style>
        .jiejian{
            background: #90EE90;
            padding: .5rem 0px .45rem 0rem;
            text-align: center;
        }
        .jiejian img{
            width: 3rem;
        }
        .jiejian h2{
            font-size: .3rem;
            color: #AA770F;
            margin: .25rem 0rem .4rem;
            font-weight: inherit;
        }
        .jiejian p{
            padding: 0 .5rem;
            font-size: .25rem;
            color: #BAA271;
            word-break: break-all;
        }
    </style>
    <div class="jiejian">
        <h2>
		     云祭思<br>
            一站式殡葬服务平台<br>
            融合风水大师选墓穴等专业服务<br>
            包头市殡仪指定官方合作平台
        </h2>
        <p>
            注：本网站部分资料取材于网络，版权归原作者，如有相关诉求，请联系：tel:13722128886
        </p>
    </div>
</div>
    <div class="onload">
        <script src="../yikong/js/iconfont.js" ></script>
        <script src="../yikong/js/jquery.tmpl.min.js" ></script>
    </div>
    <div>
    <div class="but">

        <!--http://p.qiao.baidu.com/cps/chat?siteId=12200425&userId=23764852-->
        <button>
            <a href="tel:13722128886">电话咨询</a>
        </button>
    </div>
    <div class="zhid">
        <svg aria-hidden="true" class="icon" size="md">
            <use xlink:href="#icon-dingbu"></use>
        </svg>
    </div>
    <script>
        $(function(){
            // 点击顶部功能
            $('.zhid').click(function(e){
                $("html,body").animate({scrollTop:0}, 500);
                e.stopPropagation();
            });

            // 监听手机是向下还是向上滚动
            var mySwiperThml = new Swiper('html',{
                onTouchMove: function(e){
                    var dist=e.touches.currentY-e.touches.startY;
                    console.log(dist);
                    /*<![CDATA[*/
                    if(dist<0){
                        // console.log('向上');
                        $('.but').slideUp();
                        //向上
                    }else if(dist>0){
                        // console.log('向下');
                        $('.but').slideDown();
                        //向下
                    }
                    /*]]>*/

                }
            })
        })


    </script>
</div>
    <script>
        /*<![CDATA[*/
        $(function(){
            // 顶部图片滚动效果
            var mySwiper = new Swiper('.swiper-container',{
                // direction: 'vertical',
                loop: true,
                pagination: '.swiper-pagination',
                paginationType: 'fraction'
            });
            // var show = 1;
            // $('.icon-jiantou').click(function(){
            //     if (show == 1) {
            //         var heightSpan = $("http://m.yiko.org/garden/detail/.myxx .description span.text").height();
            //         $(".myxx .description").animate({'height':heightSpan},500);
            //
            //         $("http://m.yiko.org/garden/detail/.icon-jiantou .icon").animate({},function(){
            //             $("http://m.yiko.org/garden/detail/.icon-jiantou .icon").css({'transform':'rotate(180deg)'},500);
            //         });
            //         show = 2;
            //     }else{
            //         $(".myxx .description").animate({'height':'http://m.yiko.org/garden/detail/1.8rem'},500);
            //         $("http://m.yiko.org/garden/detail/.icon-jiantou .icon").animate({},function(){
            //             $("http://m.yiko.org/garden/detail/.icon-jiantou .icon").css({'transform':'rotate(0deg)'},500);
            //         });
            //         show = 1;
            //     }
            // });

            $('.tablea>div.wenx img').click(function(){
                $('.tablea>div.wenx p').css({height:'auto',display: 'block'});
                $(this).fadeOut();
            });

            $(".tablea").find(".cemteryBox:first").show();    //为每个BOX的第一个元素显示        
            $(".nav_but span").on("click",function(){ //给a标签添加事件  
                var index=$(this).index();  //获取当前a标签的个数  
                $(this).parent().next().find(".cemteryBox").hide().eq(index).show(); //返回上一层，在下面查找css名为box隐藏，然后选中的显示  
                $(this).addClass("active").siblings().removeClass("active"); //a标签显示，同辈元素隐藏
                if(index == 3){
                    // 百度地图API功能
                    var x = '116.42094';
                    var y = '40.41801';
                    var p_name = '\u4E5D\u516C\u5C71\u957F\u57CE\u7EAA\u5FF5\u6797';
                    var map = new BMap.Map("dituContent");
                    var point = new BMap.Point(x,y);
                    map.centerAndZoom(point,15);
                    map.enableDragging();
                    map.enableScrollWheelZoom(true);

                    var marker1 = new BMap.Marker(new BMap.Point(x,y));  // 创建标注
                    map.addOverlay(marker1); // 将标注添加到地图中

                    var point2 = new BMap.Point(x,y);
                    var opts2 = {
                        position : point2,    // 指定文本标注所在的地理位置
                        offset   : new BMap.Size(-20, -55)    //设置文本偏移量
                    }
                    var label2 = new BMap.Label(p_name, opts2);  // 创建文本标注对象
                    label2.setStyle({
                        color : "#bf8e66",
                        fontSize : "12px",
                        border:'1px solid #bf8e66',
                        borderRadius: '5px',
                        height : "20px",
                        lineHeight : "20px",
                        padding:'0px 6px',
                        fontFamily:"微软雅黑"
                    });
                    map.addOverlay(label2);

                    $(".sub").click(function(){
                        var m_action=$('#actionA').val();
                        if(!m_action){
                            alert('请输入起点地址');
                            return;
                        }
                        location.href="http://map.baidu.com/mobile/webapp/search/search/qt=nav&sn=2"+encodeURIComponent("$$$$$$"+m_action+"$$$$$$")+"&en=2"+encodeURIComponent("$$$$$$"+p_name+"$$$$$$")+"&sc=289&ec=289/vt=map/?third_party=uri_api";
                    });
                }
            })
        });
        var preImg = 'https://img.yiko.org/';
        function peiImg(goodsId){
            var url = 'http://m.yiko.org.cn/garden/stele?id='+goodsId;
            $('#bb').html('');
            $.ajax({
                type: 'GET',
                url: url,
                async: false,
                success: function(data){
                    $('.peiImg').css({'visibility':'visible'});
                    var users = {
                        preImgUrl:preImg,
                        imgList:data.goodsGalleryList,
                        goods:data.goods,
                        tagList:data.tagList
                    };
                    console.log(users);
                    $("#peiImgTmp").tmpl(users).appendTo('#bb');
                    var mySwiper2 = new Swiper('.swiper-container2',{
                        loop: true,
                        effect: 'coverflow',
                        grabCursor: true,
                        centeredSlides: true,
                        slidesPerView: 'auto',
                        coverflow: {
                            rotate: 40,
                            stretch: 0,
                            depth: 100,
                            modifier: 1,
                            slideShadows : true
                        }
                    })
                },
                error: function(data){
                    alert(data);
                }
            });
        }
        $(".peiImg").on("click","../../../portal.yaduo.com/auth/servlet/standardAuthServlet/fi000001."/*tpa=http://m.yiko.org/garden/detail/span.xx*/,function(){
            $('#peiImg').css({'visibility':'hidden'});
        });


        var nav_butHeight = $('.nav_but').offset().top;
        $(window).scroll(function(){
            // 滚动条距离顶部的距离 大于 200px时
            if($(window).scrollTop() >= nav_butHeight){
                $('.nav_but').addClass('dingWei');
            } else{
                $('.nav_but').removeClass('dingWei');
            }
        });
        /*]]>*/
        /*post发送活动数据*/

        $('.hongbao_ban .lingqu a').click(function (){
            var hongData = {
                fromUrl : window.location.href,
                activityId : 14,
                smsId : 1,
                targetId : 381,
                targetName : '\u4E5D\u516C\u5C71\u957F\u57CE\u7EAA\u5FF5\u6797',
                areaCode : '110000',
                content : '\u4EAC\u7687\u57CE\u6B63\u5317\u25CF\u5168\u56FD\u552F\u4E00\u80CC\u9760\u957F\u57CE\u5893\u56ED\u25CF\u7231\u56FD\u4E3B\u4E49\u6559\u80B2\u57FA\u5730\u25CF',
                description : '4999',
                name : '\u4E5D\u516C\u5C71\u957F\u57CE\u7EAA\u5FF5\u56ED'
            };
            localStorage.setItem("mycolor", JSON.stringify(hongData));
            window.location.href = "http://m.yiko.org/mobile?path=hongbao/hongbao";
        });

    </script>

</body></html>