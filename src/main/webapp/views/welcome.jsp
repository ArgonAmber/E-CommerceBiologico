<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
    <h2>Welcome</h2>
     <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Accedi">
    </form>
    <p>${message}</p>
    
    <h2>Non hai un account?<a href="/preReg">Iscriviti</a></h2>
    
</body>
</html>
