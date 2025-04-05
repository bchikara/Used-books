<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="Register - UsedBooks" />
<c:set var="pageCss" value="register.css" />

<div class="flex justify-center items-center min-h-[70vh]">
    <div class="bg-gray-800 p-8 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold text-blue-400 mb-6 text-center">
            <i class="fas fa-user-plus"></i> Create an Account
        </h2>

        <c:if test="${not empty error}">
            <div class="bg-red-500 text-white text-sm px-4 py-2 rounded mb-4">
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/signup" method="post" class="space-y-4">
            <div>
                <label for="name" class="block text-sm font-medium">Name</label>
                <input type="text" name="name" id="name" required
                       class="w-full p-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium">Email</label>
                <input type="email" name="email" id="email" required
                       class="w-full p-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <div>
                <label for="password" class="block text-sm font-medium">Password</label>
                <input type="password" name="password" id="password" required
                       class="w-full p-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>
            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded transition duration-150">
                <i class="fas fa-user-plus"></i> Sign Up
            </button>
        </form>

        <p class="text-sm text-gray-400 mt-4 text-center">
            Already have an account?
            <a href="${pageContext.request.contextPath}/signin" class="text-blue-400 hover:underline">Login</a>
        </p>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
