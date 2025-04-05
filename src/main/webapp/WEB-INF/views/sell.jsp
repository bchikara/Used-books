<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="Sell a Book - UsedBooks" />
<c:set var="pageCss" value="sell.css" />

<h1 class="text-2xl font-bold mb-6 flex items-center gap-2">
    <i class="fas fa-book-open"></i> Sell a Book
</h1>

<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
    <!-- Sell from existing -->
    <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
        <h2 class="text-lg font-semibold mb-2 text-yellow-400">
            <i class="fas fa-box"></i> Sell a Book You Bought
        </h2>
        <p class="text-sm text-gray-300 mb-4">Resell a book you previously bought from UsedBooks.</p>
        <a href="${pageContext.request.contextPath}/books/myBooks"
           class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded inline-block">
            View My Books
        </a>
    </div>

    <!-- Sell a new book -->
    <div class="bg-gray-800 p-6 rounded-lg shadow-lg">
        <h2 class="text-lg font-semibold mb-2 text-blue-400">
            <i class="fas fa-upload"></i> Add a New Book to Sell
        </h2>
        <p class="text-sm text-gray-300 mb-4">Haven't bought this book from us? No problem -- list it yourself.</p>
        <a href="${pageContext.request.contextPath}/books/add"
           class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded inline-block">
            Add New Book
        </a>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
