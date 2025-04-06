<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    String currentPath = request.getRequestURI();
    request.setAttribute("currentPath", currentPath);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${pageTitle != null ? pageTitle : "UsedBooks WebApp"}</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <!-- Page-specific CSS (optional) -->
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/${pageCss}">
    </c:if>
</head>

<body class="dark bg-gray-900 text-white font-sans">
<nav class="flex items-center justify-between px-6 py-4 bg-gray-800 shadow-md">
    <div class="flex items-center space-x-3">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="UsedBooks Logo" class="w-8 h-8">
        <span class="text-xl font-semibold tracking-wide text-blue-400">UsedBooks</span>
    </div>

    <div class="space-x-4 hidden md:flex">
        <c:set var="currentPath" value="${pageContext.request.requestURI}" />
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <c:choose>
                    <c:when test="${fn:contains(currentPath, '/inventory')}">
                        <a href="${pageContext.request.contextPath}/books/inventory"
                           class="text-green-400 font-bold px-3 py-1 transition duration-150">Inventory</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/books/inventory"
                           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">Inventory</a>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${fn:contains(currentPath, '/mybooks')}">
                        <a href="${pageContext.request.contextPath}/books/myBooks"
                           class="text-green-400 font-bold px-3 py-1 transition duration-150">My Books</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/books/myBooks"
                           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">My Books</a>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${fn:contains(currentPath, '/sell')}">
                        <a href="${pageContext.request.contextPath}/books/sell"
                           class="text-green-400 font-bold px-3 py-1 transition duration-150">Sell</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/books/sell"
                           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">Sell</a>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${fn:contains(currentPath, '/notifications')}">
                        <a href="${pageContext.request.contextPath}/books/notifications"
                           class="text-green-400 font-bold px-3 py-1 transition duration-150">Notifications</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/books/notifications"
                           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">Notifications</a>
                    </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/logout"
                   class="text-red-400 hover:text-red-300 px-3 py-1 transition duration-150">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </c:when>

            <c:otherwise>
                <c:choose>
    <c:when test="${fn:contains(currentPath, '/login')}">
        <a href="${pageContext.request.contextPath}/signin"
           class="text-green-400 font-bold px-3 py-1 transition duration-150">Sign In</a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/signin"
           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">Sign In</a>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${fn:contains(currentPath, '/register')}">
        <a href="${pageContext.request.contextPath}/signup"
           class="text-green-400 font-bold px-3 py-1 transition duration-150">Sign Up</a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/signup"
           class="text-gray-300 hover:text-white px-3 py-1 transition duration-150">Sign Up</a>
    </c:otherwise>
</c:choose>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<main class="px-6 py-4">
