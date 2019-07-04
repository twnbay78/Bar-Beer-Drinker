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
              <a class="active" href="#home">Drinker</a>
              <a href="#news">Bars</a>
              <a href="#contact">Beers</a>
              <a href="#about">Modification</a>
            </div>
            <h1>Drinker List</h1>
            <h3><a href="/newDrinker">New Drinker</a></h3>
            <table border="1">
                <th>Drinker Name</th>
                <th>Drinker Phone #</th>
                <th>Credit Card Number</th>
                <th>CC Expiration Date</th>
                <th>Action</th>

                <c:forEach var="drinker" items="${listDrinker}">
                <tr>
                    <td>${drinker.drinker_name}</td>
                    <td>${drinker.drinker_phone}</td>
                    <td>${drinker.cc_number}</td>
                    <td>${drinker.cc_expiration}</td>
                    <td>
                        <a href="/editContact?id=${drinker.id}">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/deleteContact?id=${drinker.id}">Delete</a>
                    </td>

                </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>