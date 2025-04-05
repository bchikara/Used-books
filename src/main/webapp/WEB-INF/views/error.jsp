<%@ page isErrorPage="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>An error occurred</h1>
    <p>Status code: ${pageContext.errorData.statusCode}</p>
    <p>Exception: ${pageContext.errorData.throwable.message}</p>
</body>
</html>