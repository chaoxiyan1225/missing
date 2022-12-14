
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="">
<head>
    <meta charset=UTF-8"utf-8" />
    <meta content="IE=edge" http-equiv="X-UA-Compatible" />
 
<link rel="shortcut icon" type="image/x-icon" href="../staticfile/images/xianhua.jpg"/>
    <script src="./yikong/js/shipei.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" tppabs="http://m.yiko.org/yikong/js/shipei.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3"></script>
    <link rel="stylesheet" href="./yikong/css/swiper.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.css" tppabs="http://m.yiko.org/yikong/css/swiper.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
    <link rel="stylesheet" href="./yikong/css/index.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.css" tppabs="http://m.yiko.org/yikong/css/index.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
    <link rel="stylesheet" href="./yikong/css/reset.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.css" tppabs="http://m.yiko.org/yikong/css/reset.css;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
    <!--begin::页面样式 -->
    
    <!--end::页面样式 -->
    <script src="./yikong/js/jquery-3.0.0.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" tppabs="http://m.yiko.org/yikong/js/jquery-3.0.0.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3"></script>
    <script src="./yikong/js/swiper-3.4.2.jquery.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" tppabs="http://m.yiko.org/yikong/js/swiper-3.4.2.jquery.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3"></script>
    <script>
        var time_range_now = function (beginTime, endTime) {
            var nowdate = Math.round(new Date()/1000);
            console.log(nowdate);

            if(nowdate<endTime && nowdate >= beginTime){
                console.log('添加样式9999');
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
    <div align="center" class="termFilter">
        <div class="fanhui">
    <!-- 导航 -->
    <div class="nav">
        <div class="left">
            <img alt="" class="fanhui" src="./yikong/img/sy-fanhui.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/sy-fanhui.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
            <div>
                <img alt="" src="./yikong/img/s-dw.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/s-dw.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                <span class="dw">包头市</span>
                <img alt="" class="icon" src="./yikong/img/s-sjdw.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/s-sjdw.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
            </div>
        </div>
        <div class="right">
            <img alt="" src="./yikong/img/s-dh.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/s-dh.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
        </div>
        <div class="center sy_sousu">
            <img alt="" src="./yikong/img/s-ss.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/s-ss.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
            <form method="get" action="http://m.yiko.org/garden/search;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3">
                <input disabled="disabled" name="keywords" placeholder="" type="text" value="" />
            </form>
        </div>
        <div class="center wenben"></div>
    </div>

    <!--搜索结构-->
    <div class="sousu">
        <div class="shur">
            <form action="http://m.yiko.org/garden/search" method="get">
                <img alt="" src="./yikong/img/icon_nav_search.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/icon_nav_search.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                <input name="keywords" type="text" value="" />
            </form>
            <span>取消</span>
        </div>
        <div class="remen">
            <h2>
                <img alt="热门搜索" src="./yikong/img/icon_nav_rmss.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/icon_nav_rmss.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />热门搜索
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
                <img alt="" src="./yikong/img/icon_location.png" tppabs="http://m.yiko.org/yikong/img/icon_location.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />

                <span class="dw">当前定位城市：包头市</span>
            </div>
            <div class="dangq">
                <h2 class="tujianH2">
                    <span></span>开通城市
                </h2>
                <div>
                    <span>
                        <a href="#" tppabs="https://beijing.yiko.org/">包头</a>
                    </span>
                </div>
            </div>
            <img alt="" class="sy_csjy" src="./yikong/img/sy_csjy.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/sy_csjy.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
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
            $('http://m.yiko.org/garden/.dingw .hide').click(function(){
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
            <img alt="" src="./yikong/img/icon_jiantou.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/icon_jiantou.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
            陵园墓地
        </h2>
        <div class="term">
            <div>
                <h4>陵园标签:</h4>
                <span class="xuanZP" onclick="">不限</span>
                <span onclick="">生态陵园</span>
                <span onclick="">优质陵园</span>
                <span onclick="">热销陵园</span>
                <span onclick="">低价陵园</span>
            </div>
            <div>
                <h4>按价格选墓:</h4>
                <span class="xuanZP" onclick="">不限</span>
                <span onclick="">1万以下</span>
                <span onclick="">1-2万</span>
                <span onclick="">2-4万</span>
                <span onclick="">4-6万</span>
                <span onclick="">6-10万</span>
                <span onclick="">10万以上</span>
            </div>
        </div>

        <!--暂无数据提示-->
        

        <div class="tuijian">
            <ul class="binzang-list bzyp garden" style="padding-bottom: .5rem;">
                <li>
                    <a href="./fuluyuan" tppabs="http://m.yiko.org/garden/detail/381">
                        <div class="minHeight">
                            <div class="biaoqian">
                                <img alt="" src="./yikong/img/lable_dijia.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/lable_dijia.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                                <img alt="" src="./yikong/img/lable_rexiao.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/lable_rexiao.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                                <img alt="" src="./yikong/img/lable_tuijian.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/lable_tuijian.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                                <img alt="" src="./yikong/img/lable_youzhi.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3.png" tppabs="http://m.yiko.org/yikong/img/lable_youzhi.png;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" />
                            </div>
                            <img alt="福禄园" src="./yikong/img/fuluyuan.jpg" tppabs="https://img.yiko.org//user/download/a02883065a832b9ec10158159031c683.jpg_350x350" />
                            <div class="text">
                                <p>
                                    <span>福禄园</span>
                                    <i class="diqu">[</i><i class="diqu">兴胜区</i><i class="diqu">]</i>
                                </p>
                                <i class="miaoshu">包头市大青山陵园是包头市墓园与殡仪馆配套之陵园。是国家和自治区以及包头市殡葬协会会员单位。是受理骨灰盒安葬业务合法的大型公墓。
								                     大青山陵园占地千余亩，位于包头市区正北方，地貌呈座椅型，东西北三方倚靠大青山，面对黄河</i>
                                <div class="tedian">
                                    <span>风水宝地</span>
                                    <span>大师选穴</span>
                                    <span>免费专车</span>
                                </div>
                                <span>
                                    <span class="qsj">起售价:</span>
                                    ￥0.98万
                                </span>
                                
                            </div>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
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
    </div>
</div>
    <div class="onload">
        <script src="./yikong/js/iconfont.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" tppabs="http://m.yiko.org/yikong/js/iconfont.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3"></script>
        <script src="./yikong/js/jquery.tmpl.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3" tppabs="http://m.yiko.org/yikong/js/jquery.tmpl.min.js;jsessionid=F6AED6C1E4FFA0EDB969E99CED6957A3"></script>
    </div>
    <div>
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
        function index(indexType,param){
            if (indexType=='district'){
                location = "list-district=.htm"/*tpa=http://m.yiko.org/garden/list?district=*/+param+"&price="+'none'+"&distance="+'none'+"&mark="+'none';
            }
            if (indexType=='price'){
                location = "list-district=.htm"/*tpa=http://m.yiko.org/garden/list?district=*/+'none'+"&price="+param+"&distance="+'none'+"&mark="+'none';
            }
            if (indexType=='distance'){
                location = "list-&district=.htm"/*tpa=http://m.yiko.org/garden/list?&district=*/+'none'+"&price="+'none'+"&distance="+param+"&mark="+'none';
            }
            if (indexType=='mark'){
                location = "list-&mark=.htm"/*tpa=http://m.yiko.org/garden/list?&mark=*/+param;
            }
        }

    </script>

</body></html>