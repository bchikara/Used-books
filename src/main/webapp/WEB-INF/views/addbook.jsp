<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="Add Book - UsedBooks" />
<c:set var="pageCss" value="addbook.css" />

<div class="flex justify-center items-center min-h-screen bg-gray-900 px-4">
    <div class="w-full max-w-xl bg-gray-800 p-8 rounded-lg shadow-lg">

        <h1 class="text-3xl font-bold mb-6 text-white flex items-center gap-2">
            <i class="fas fa-circle-plus text-green-400"></i> Add New Book
        </h1>

        <form action="${pageContext.request.contextPath}/books/sell/new" method="post" class="space-y-5">
            <div>
                <label for="isbn" class="block text-sm font-semibold text-gray-300">ISBN</label>
                <input type="text" name="isbn" id="isbn" required class="w-full mt-1 px-3 py-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-green-400">
            </div>
            <div>
                <label for="title" class="block text-sm font-semibold text-gray-300">Title</label>
                <input type="text" name="title" id="title" required class="w-full mt-1 px-3 py-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-green-400">
            </div>
            <div>
                <label for="author" class="block text-sm font-semibold text-gray-300">Author</label>
                <input type="text" name="author" id="author" required class="w-full mt-1 px-3 py-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-green-400">
            </div>
            <div>
                <label for="edition" class="block text-sm font-semibold text-gray-300">Edition</label>
                <input type="text" name="edition" id="edition" required class="w-full mt-1 px-3 py-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-green-400">
            </div>
            <div>
                <label for="price" class="block text-sm font-semibold text-gray-300">Original Price ($)</label>
                <input type="number" name="price" id="price" step="0.01" required class="w-full mt-1 px-3 py-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-green-400">
            </div>

            <button type="submit"
                    class="w-full bg-green-600 hover:bg-green-700 text-white py-2 rounded font-semibold transition">
                <i class="fas fa-plus"></i> Submit
            </button>
        </form>
    </div>
</div>

<%@ include file="common/footer.jsp" %>
