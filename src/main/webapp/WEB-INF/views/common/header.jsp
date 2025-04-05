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

    <!-- Dynamic page-specific CSS -->
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
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/books/inventory"
                       class="nav-link ${fn:contains(currentPath, '/books/inventory') ? 'text-green-400 font-bold' : ''}">
                        Inventory
                    </a>
                    <a href="${pageContext.request.contextPath}/books/myBooks"
                       class="nav-link ${fn:contains(currentPath, '/books/myBooks') ? 'text-green-400 font-bold' : ''}">
                        My Books
                    </a>
                    <a href="${pageContext.request.contextPath}/books/sell"
                       class="nav-link ${fn:contains(currentPath, '/books/sell') ? 'text-green-400 font-bold' : ''}">
                        Sell
                    </a>
                    <a href="${pageContext.request.contextPath}/books/notifications"
                       class="nav-link ${fn:contains(currentPath, '/books/notifications') ? 'text-green-400 font-bold' : ''}">
                        Notifications
                    </a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="nav-link text-red-400 hover:text-red-300">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/signin"
                       class="nav-link ${fn:contains(currentPath, '/signin') ? 'text-green-400 font-bold' : ''}">
                        Sign In
                    </a>
                    <a href="${pageContext.request.contextPath}/signup"
                       class="nav-link ${fn:contains(currentPath, '/signup') ? 'text-green-400 font-bold' : ''}">
                        Sign Up
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
    
    <main class="px-6 py-4">
