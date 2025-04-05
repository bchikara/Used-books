<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="Inventory - UsedBooks" />
<c:set var="pageCss" value="inventory.css" />

<h1 class="text-2xl font-bold mb-6 flex items-center gap-2">
    <i class="fas fa-book"></i> Available Books
</h1>

<!-- ✅ Snackbar-style message -->
<c:if test="${not empty message}">
    <div id="snackbar"
         class="fixed top-4 left-1/2 transform -translate-x-1/2 bg-green-600 text-white px-6 py-3 rounded shadow-lg z-50 transition-opacity duration-300">
        ${message}
    </div>
    <script>
        setTimeout(() => {
            const el = document.getElementById('snackbar');
            if (el) {
                el.style.opacity = '0';
                setTimeout(() => el.remove(), 500);
            }
        }, 3000);
    </script>
</c:if>

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
    <c:forEach var="book" items="${books}">
        <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
            <img src="${pageContext.request.contextPath}/images/placeholder.jpg"
                 alt="Book cover"
                 class="w-full h-48 object-cover">

            <div class="p-4 space-y-1">
                <h2 class="text-lg font-semibold">${book.title}</h2>
                <p class="text-sm text-gray-400">${book.author}</p>
                <p class="text-sm text-gray-500">Edition: ${book.edition}</p>
                <p class="text-sm text-green-400 font-bold">$${book.price}</p>

                <!-- Buy Button -->
                <c:if test="${book.status == 'LISTED' && book.ownerId ne user.id}">
                    <form action="${pageContext.request.contextPath}/books/buy" method="post" class="mt-2">
                        <input type="hidden" name="id" value="${book.id}" />
                        <button type="submit"
                                class="w-full bg-blue-600 hover:bg-blue-700 text-white py-1 rounded">
                            <i class="fas fa-cart-plus"></i> Buy
                        </button>
                    </form>
                </c:if>

                <!-- Notify Button -->
                <c:if test="${book.status == 'PREOWNED' || book.status == 'SOLD'}">
                    <form action="${pageContext.request.contextPath}/books/notify" method="post" class="mt-2">
                        <input type="hidden" name="id" value="${book.id}" />
                        <button type="submit"
                                class="w-full bg-yellow-500 hover:bg-yellow-600 text-white py-1 rounded">
                            <i class="fas fa-bell"></i> Notify Me
                        </button>
                    </form>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="common/footer.jsp" %>
