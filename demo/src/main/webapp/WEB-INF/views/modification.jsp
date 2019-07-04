<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drinker</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
        body {
          margin: 0;
          font-family: Arial, Helvetica, sans-serif;
        }

        .topnav {
          overflow: hidden;
          background-color: #333;
          margin: 0;
          padding: 0;
          text-align: center;
          display: inline-block;
          list-style-type: none;
        }

        .topnav a {
          float: left;
          color: #f2f2f2;
          text-align: center;
          padding: 14px 16px;
          text-decoration: none;
          font-size: 17px;
        }

        .topnav a:hover {
          background-color: #ddd;
          color: black;
        }

        .topnav a.active {
          background-color: #a7afa7 ;
          color: white;
        }
        </style>
    </head>
    <body>
        <div align="center">
            <div class="topnav">
              <a href="pino">Drinker</a>
              <a href="bars">Beers</a>
              <a href="beers">Bars</a>
              <a class="active" href="modification">Modification</a>
            </div>
            <h1>Mod Page</h1>
        </div>
    </body>
</html>