<%--
  Created by IntelliJ IDEA.
  User: lulud
  Date: 5/19/2020
  Time: 8:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>All Users</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("[id^=ajaxBtnEdit]").click(function () {
                var $row = $(this).closest('tr');
                var Id = $row.find("td")[0];
                var name = $row.find("td")[1];
                var address = $row.find("td")[2];
                var phone = $row.find("td")[3];
                var Idv = $(Id).html();
                var IdI = Number(Idv);
                var namev= $(name).html();
                var addressv = $(address).html();
                var phonev = $(phone).html();
                var data = {id: IdI, name: namev, address: addressv, phone: phonev};
                // 发送ajax请求
                $.ajax({
                    url: '/resume/EditUser',
                    type: 'POST',
                    data: JSON.stringify(data),
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json'
                }).done(function (data) {
                    console.log('AJAX call was successfully executed ;)');
                    console.log('data = ', data);
                }).fail(function (data) {
                    console.log('AJAX call failed :(');
                    console.log('data = ', data);
                })
            })
        });
        $(function () {
            $('[id^=ajaxBtnDelete]').click(function () {
                var $row = $(this).closest('tr');
                var Id = $row.find("td")[0];
                var name = $row.find("td")[1];
                var address = $row.find("td")[2];
                var phone = $row.find("td")[3];
                var Idv = $(Id).html();
                var IdI = Number(Idv);
                var namev= $(name).html();
                var addressv = $(address).html();
                var phonev = $(phone).html();
                var data = {id: IdI, name: namev, address: addressv, phone: phonev};
                // 发送ajax请求
                $.ajax({
                    url: '/resume/deleteUser',
                    type: 'POST',
                    data: JSON.stringify(data),
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json'
                }).done(function (data) {
                    console.log('AJAX call was successfully executed ;)');
                    console.log('data = ', data);
                }).fail(function (data) {
                    console.log('AJAX call failed :(');
                    console.log('data = ', data);
                })
            })
        })

    </script>

</head>
<body>
<form method="POST" action="/resume/AddUser">
    Name: <input type = "text" name = "Name" id="Name" />
    <br>
    Address: <input type = "text" name = "Address" id="Address"/>
    <br>
    Phone: <input type = "text" name = "Phone" id="Phone"/>
    <input type="submit" id="Add" value="Add" />
</form>
         <table >
            <thead>
            <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            </tr>
            </thead>
            <c:forEach items="${data}" var="user">
        <tr>
            <td contenteditable="false">${user.id}</td>
            <td contenteditable="true">${user.name}</td>
            <td contenteditable="true">${user.address}</td>
            <td contenteditable="true">${user.phone}</td>
            <td><input type=button id="ajaxBtnEdit${user.id}" value="Save" /></td>
            <td><input type=button id="ajaxBtnDelete${userid}" value="Delete"/></td>
        </tr>
    </c:forEach>
    </table>
</body>
</html>
