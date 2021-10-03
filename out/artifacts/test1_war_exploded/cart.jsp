<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2021-10-03
  Time: 오후 7:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- Bootstrap -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <style>
        body {padding-top: 60px;}
    </style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- 상단메뉴의 이름 -->
        <a class="navbar-brand" href="#"> Bootstrap</a>
        <!-- 상단 메뉴가 좁아지면서 햄버거 버튼됨 -->
        <div class="navbar-header">
            <button class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#target">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!--펼쳐진 상단 메뉴 -->
        <div class="collapse navbar-collapse" id="target">
            <ul class="nav navbar-nav">
                <!-- 상단메뉴의 드롭다운메뉴 -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span>HTML5</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Basic Concept</a></li>
                        <li><a href="#">Drag and Drop</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Motion</a></li>
                    </ul>
                </li>
                <!-- 상단메뉴의 드롭다운메뉴의 끝 -->
                <li><a href="#">CSS3</a></li>
                <li><a href="#">JavaScript</a></li>
                <li><a href="#">Node</a></li>
                <li><a href="#">API</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Node</a></li>
                <li><a href="#">API</a></li>
            </ul>
            <!-- 폼태그를 이용한 서칭창 -->
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search"/>
            </form>
            <!-- 폼태그를 이용한 서칭창 끝-->
        </div>
        <!--펼쳐진 상단 메뉴끝 -->
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <!-- 사이드 바 메뉴-->
            <div class="panel panel-info">
                <div class="panel-heading">
                    <!-- 패널 타이틀1 -->
                    <h3 class="panel-title">
                        <!-- 아이콘 붙이기 -->

                        <span>Panel Title</span>
                    </h3>
                </div>
                <!-- 사이드바 메뉴목록1 -->
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">HTML</a></li>
                    <li class="list-group-item"><a href="#">CSS</a></li>
                    <li class="list-group-item"><a href="#">ECMAScript5</a></li>
                </ul>
            </div>
            <!-- 패널 타이틀2 -->
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel Title</h3>
                </div>
                <!-- 사이드바 메뉴목록2 -->
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">jQuery</a></li>
                    <li class="list-group-item"><a href="#">BootStrap</a></li>
                </ul>
            </div>
            <!-- 패널 타이틀3 -->
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel Title</h3>
                </div>
                <!-- 사이드바 메뉴목록3 -->
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">About</a></li>
                    <li class="list-group-item"><a href="#">Help</a></li>
                </ul>
            </div>
        </div>
        <!-- 9단길이의 첫번째 열 -->
        <div class="col-md-9">
            <div class="jumbotron">
                <h1>Hello, world!</h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mollis nisl id est rutrum elementum. Vivamus laoreet elit eu blandit vehicula. Ut quis dolor in risus faucibus laoreet. Morbi dictum sodales vestibulum. Aliquam ullamcorper at neque ac auctor. Ut in varius elit, cursus ornare ante. Donec magna diam, mattis vitae facilisis in, porttitor quis risus. Quisque ac quam vel ante commodo ornare non sit amet nisi. Sed bibendum, dui nec iaculis tincidunt, orci enim gravida magna, a bibendum nibh augue eget sem. Nulla lacus nulla, varius in rhoncus et, rutrum in ex. Quisque bibendum libero et viverra vulputate. Ut ultrices, dui et imperdiet sollicitudin, orci ligula consectetur lacus, ac pulvinar nibh magna vel nibh. Praesent dignissim urna non sollicitudin lobortis. Sed pulvinar erat id suscipit ornare. Nullam euismod felis ac bibendum volutpat. Integer gravida nibh quis magna ultricies, at vehicula orci ullamcorper.
                    Duis tincidunt sapien at odio tristique rutrum. Suspendisse eu mauris metus. Aliquam ullamcorper, felis et tristique hendrerit, diam felis fringilla orci, ut pulvinar felis augue lobortis magna. Cras hendrerit mollis purus vel dignissim. Mauris erat turpis, consectetur et varius vitae, lacinia eget metus. Pellentesque scelerisque enim lectus, in aliquam purus laoreet vel. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam rutrum at orci eget interdum.
                </p>
                <a class="btn btn-primary btn-large" href="#" role="button">Learn More</a>
            </div>
        </div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="./js/bootstrap.min.js"></script>
</body>
</html>
