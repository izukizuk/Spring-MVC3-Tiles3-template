<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<%-- Bootstrap core CSS --%>
<%-- 設定 base tag。如此一來其他的連結都直接從根目錄指過來就好了!--%>
<c:set var="url">${pageContext.request.requestURL}</c:set>
<base
	href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
<%--設定 base tag 完畢 --%>

<link href="static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link rel="shortcut icon" href="static/images/favicon.ico">
<title>Project Name</title>
</head>
<body>
	<div class='navbar navbar-default header'>
		<a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img alt="CHTLogo"
			src="static/images/logo144x42.png">
		</a>
		<p class="navbar-logo-txt pull-left">使用者:李阿民</p>
		<p class="navbar-logo-txt pull-left">單位:北區分公司</p>
		<p class="navbar-logo-txt pull-right">2014-01-01 14:00:00</p>
		<p class="navbar-logo-txt pull-right">歡迎使用 CDRS3 特級系統</p>
	</div>
	<div class='left'>
		<div id='treeMenu' style="display: none">
			<ul>
				<li id="phtml_1">
					<a href="#">A</a>
					<ul style="">
						<li rel="page">
							<a href="">B</a>
						</li>
						
					</ul>
				</li>
				<li id="phtml_2">
					<a href="#" class="">C</a>
					<ul>
						<li rel="page">
							<a href="">D</a>
						</li>
						
					</ul>
				</li>
			</ul>
		</div>
		<%-- jQuery --%>
		<script src="static/js/jquery/jquery-1.10.2.min.js"></script>
		<%-- jsTree. Work with jQuery--%>
		<script src="static/js/jsTree/jquery.jstree.js"></script>
		<%-- jsTree with cookie support --%>
		<script src="static/js/jqueryCookie/jquery.cookie.js"></script>
		<script>
            $("#treeMenu").jstree({
                "types" : {
                    "types" : {
                        "page" : {
                            "icon" : {
                                "image" : "static/images/link.png"
                            }
                        }
                    }
                },
                "plugins" : [ "themes", "html_data", "ui", "cookies", "types" ]
            }).bind('loaded.jstree', function(e, data) {
                // invoked after jstree has loaded
                $("#treeMenu").show();
            });
        <%-- 當按下 a 按鈕的時候，判斷他是不是 leaf。若是 leaf 的話，就去抓她的 href 內容，並且跳轉過去--%>
            $("#treeMenu").delegate("a", "click", function(e) {
                if ($("#treeMenu").jstree("is_leaf", this)) {
                    console.log("ggg");
                    document.location.href = this;
                } else {
                    $("#treeMenu").jstree("toggle_node", this);
                }
            });
        </script>
	</div>
	<div class="right">
		<%--把各個頁面功能實作在這邊 --%>
		<tiles:insertAttribute name="function" />
	</div>
	<div class='footer'>
		<div style="display: inline-block; padding-right: 20px; float: left;">
			<a href=""> <img alt="TLLogo" src="static/images/TLLogo194x41.gif">
			</a>
		</div>
		<div style="display: inline">
			<p class="text-center">
				中華電信股份有限公司版權所有©2014 Chunghwa Telecom Co., Ltd. <br>建議使用 IE8 以上版本，解析度 1280x800。
				本系統為公司之重要資產，非經授權，不得使用。離座時請跳離畫面，以確保資料之保密性與安全性。
			</p>
		</div>
	</div>
</body>
</html>