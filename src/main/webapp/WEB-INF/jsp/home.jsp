<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Gaurank Goyal">
    <meta name="generator" content="Hugo 0.84.0">
    <title>NAGP Demo App</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-fixed/">



    <!-- Bootstrap core CSS -->
<link href="${ pageContext.request.contextPath }/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>


    <!-- Custom styles for this template -->
    <link href="${ pageContext.request.contextPath }/resources/assets/dist/css/navbar-top-fixed.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/scheduler/main.css">
  </head>
  <body>

<nav class="navbar navbar-expand-md navbar-dark bg-steel fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand p-0 me-2" href="/" aria-label="Bootstrap">
                  <img src="${ pageContext.request.contextPath }/resources/images/nagarro.png" alt="" width="50" height="40">
    </a>
    <a class="navbar-brand" href="#">Nagarro NAGP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Login</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<main class="container">
  <div class="bg-light p-5 rounded">
    <h1>NAGP Kubernetes Application</h1>
    <p class="lead">This is an Demo Java Spring Based WebApp created as a part of NAGP Workshop. In order to view secret click on secret, to view properties click on property.</p>
    <button type="button" class="btn btn-lg btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
      View App Properties &raquo;
    </button>
   <button type="button" class="btn btn-lg btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
     View Secret &raquo;
   </button>
  </div>
</main>

<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-steel">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">© 2022 Nagarro NAGP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">App properties from ConfigMap</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div class="row">
            <div class="col">
              <h5 class="modal-title" id="exampleModalLabel"> Environment Name:</h5>
            </div>
            <div class="col">
              ${environment}
            </div>
          </div>
          <div class="row">
              <div class="col">
                <h5 class="modal-title" id="exampleModalLabel"> Database Name:</h5>
              </div>
              <div class="col">
                ${dbname}
              </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container">
          <div class="row">
            <div class="col">
              <h5 class="modal-title" id="exampleModalLabel"> User Name:</h5>
            </div>
            <div class="col">
              ${environment}
            </div>
          </div>
          <div class="row">
              <div class="col">
                <h5 class="modal-title" id="exampleModalLabel"> Password:</h5>
              </div>
              <div class="col">
                ${dbname}
              </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

    <script src="${ pageContext.request.contextPath }/resources/assets/dist/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
