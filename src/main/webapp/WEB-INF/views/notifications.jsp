<%@ include file="common/header.jsp" %>
<c:set var="pageTitle" value="Notifications - UsedBooks" />

<h1 class="text-2xl font-bold mb-6 flex items-center gap-2">
    <i class="fas fa-bell"></i> Your Notifications
</h1>

<c:if test="${empty notifications}">
    <p class="text-gray-400">No active notifications right now.</p>
</c:if>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <c:forEach var="note" items="${notifications}">
        <div class="bg-yellow-800 p-4 rounded shadow relative notification-card">
            <p>${note.message}</p>
            <small class="text-gray-300">
                <span class="timer" data-created="${note.createdAt}">5:00</span> left
            </small>
        </div>
    </c:forEach>
</div>

<script>
function updateTimers() {
    document.querySelectorAll('.timer').forEach(timerEl => {
        const created = new Date(timerEl.dataset.created);
        const now = new Date();
        const diff = Math.max(0, 300 - Math.floor((now - created) / 1000));
        const mins = String(Math.floor(diff / 60)).padStart(2, '0');
        const secs = String(diff % 60).padStart(2, '0');
        timerEl.textContent = `${mins}:${secs}`;

        if (diff <= 0) {
            timerEl.closest('.notification-card').remove();
        }
    });
}
setInterval(updateTimers, 1000);
</script>

<%@ include file="common/footer.jsp" %>
