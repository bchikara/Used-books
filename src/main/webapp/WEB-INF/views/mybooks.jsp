<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="My Books - UsedBooks" />
<c:set var="pageCss" value="mybooks.css" />

<h1 class="text-2xl font-bold mb-6 flex items-center gap-2">
    <i class="fas fa-user-book"></i> My Pre-owned Books
</h1>

<c:if test="${empty books}">
    <p class="text-gray-400">You have not purchased any books yet.</p>
</c:if>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
    <c:forEach var="book" items="${books}">
        <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
            <img src="${pageContext.request.contextPath}/images/placeholder.jpg"
                 class="w-full h-48 object-cover" alt="Book cover">
            <div class="p-4">
                <h2 class="text-lg font-semibold">${book.title}</h2>
                <p class="text-sm text-gray-400">${book.author}</p>
                <p class="text-sm text-gray-500">Edition: ${book.edition}</p>
                <p class="text-sm text-green-400 font-bold">$${book.price}</p>

                <c:if test="${book.status == 'SOLD' || book.status eq 'PREOWNED'}">
        <form action="${pageContext.request.contextPath}/books/sell/existing" method="post">
            <input type="hidden" name="id" value="${book.id}" />
            <button class="bg-green-600 text-white px-3 py-1 rounded mt-2">Sell</button>
        </form>
    </c:if>

    <c:if test="${book.status eq 'LISTED'}">
        <form action="${pageContext.request.contextPath}/books/unsell" method="post">
            <input type="hidden" name="id" value="${book.id}" />
            <button class="bg-red-600 text-white px-3 py-1 rounded mt-2">Unlist</button>
        </form>
    </c:if>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="common/footer.jsp" %>
