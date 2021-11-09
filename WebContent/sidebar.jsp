<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2021-11-06
  Time: 오전 6:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .btn-toggle {
        color: #d2b48c;
        width: 10%
    }

    .btn-toggle:hover {
        color: #d2b48c;
    }

    #color, #color1, #color2, #color3 {
        background-color: transparent;
    }

    .list-unstyled .collapse .btn-toggle-nav .link-dark {
        background-color: transparent;
        border-color: gray;
    }
</style>


<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <p href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">
        <svg class="bi me-2" width="30" height="70">
            <use xlink:href="#bootstrap"></use>
        </svg>
    </p>
    <ul class="list-unstyled ps-0">
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#home-collapse" aria-expanded="false" id="color">
                OUTER
            </button>
            <div class="collapse " id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="#" class="link-dark rounded">ZIP UP HOODIE</a></li>
                    <li><a href="#" class="link-dark rounded">COAT</a></li>
                    <li><a href="#" class="link-dark rounded">JACKET</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#dashboard-collapse" aria-expanded="false" id="color1">
                PANTS
            </button>
            <div class="collapse" id="dashboard-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="#" class="link-dark rounded">SHORT PANTS</a></li>
                    <li><a href="#" class="link-dark rounded">DENIM PANTS</a></li>
                    <li><a href="#" class="link-dark rounded">JOGGER PANTS</a></li>
                    <li><a href="#" class="link-dark rounded">SLACKS</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#orders-collapse" aria-expanded="false" id="color2">
                SHOES
            </button>
            <div class="collapse" id="orders-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="#" class="link-dark rounded">SANDAL</a></li>
                    <li><a href="#" class="link-dark rounded">SLIPPER</a></li>
                    <li><a href="#" class="link-dark rounded">BOOTS</a></li>
                    <li><a href="#" class="link-dark rounded">LOAFERS</a></li>
                </ul>
            </div>
        </li>
        <%--                    <li class="border-top my-3"></li>--%>
        <li class="mb-1">
            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
                    data-bs-target="#account-collapse" aria-expanded="false" id="color3">
                Account
            </button>
            <div class="collapse" id="account-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="#" class="link-dark rounded">New...</a></li>
                    <li><a href="#" class="link-dark rounded">Profile</a></li>
                    <li><a href="#" class="link-dark rounded">Settings</a></li>
                    <li><a href="#" class="link-dark rounded">Sign out</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>


<%--<style>--%>
<%--    .btn-toggle{--%>
<%--        color:#d2b48c;--%>
<%--        width: 10%--%>
<%--    }--%>
<%--    .btn-toggle:hover{--%>
<%--        color:#d2b48c;--%>
<%--    }--%>
<%--</style>--%>
<%--<script src="./js/sidebars.js"></script>--%>
<%--<link href="sidebars.css" rel="stylesheet">--%>

<%--<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">--%>
<%--    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none">--%>
<%--        <svg class="bi me-2" width="30" height="70"><use xlink:href="#bootstrap"></use></svg>--%>
<%--    </a>--%>
<%--    <ul class="list-unstyled ps-0">--%>
<%--        <li class="mb-1">--%>
<%--            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">--%>
<%--                OUTER--%>
<%--            </button>--%>
<%--            <div class="collapse " id="home-collapse">--%>
<%--                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">--%>
<%--                    <li><a href="#" class="link-dark rounded">ZIP UP HOODIE</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">COAT</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">JACKET</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--        <li class="mb-1">--%>
<%--            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">--%>
<%--                PANTS--%>
<%--            </button>--%>
<%--            <div class="collapse" id="dashboard-collapse">--%>
<%--                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">--%>
<%--                    <li><a href="#" class="link-dark rounded">SHORT PANTS</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">DENIM PANTS</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">JOGGER PANTS</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">SLACKS</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--        <li class="mb-1">--%>
<%--            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">--%>
<%--                SHOES--%>
<%--            </button>--%>
<%--            <div class="collapse" id="orders-collapse">--%>
<%--                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">--%>
<%--                    <li><a href="#" class="link-dark rounded">SANDAL</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">SLIPPER</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">BOOTS</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">LOAFERS</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--        <li class="mb-1">--%>
<%--            <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">--%>
<%--                Account--%>
<%--            </button>--%>
<%--            <div class="collapse" id="account-collapse">--%>
<%--                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">--%>
<%--                    <li><a href="#" class="link-dark rounded">New...</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">Profile</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">Settings</a></li>--%>
<%--                    <li><a href="#" class="link-dark rounded">Sign out</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</div>--%>
<%--</div>--%>
