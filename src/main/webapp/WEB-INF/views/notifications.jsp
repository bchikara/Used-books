<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="common/header.jsp" %>

<h1 class="text-2xl font-bold mb-6 flex items-center gap-2">
    <i class="fas fa-bell"></i> Your Notifications
</h1>

<c:if test="${empty notifications}">
    <p class="text-gray-400">You have no recent notifications.</p>
</c:if>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <c:forEach var="n" items="${notifications}">
        <c:if test="${not empty n.createdAt}">
            <!-- Format timestamp for JS parsing (ISO 8601 with time zone) -->
            <fmt:formatDate value="${n.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ssXXX" var="createdAtFormatted" />

            <div class="bg-gray-800 rounded-lg shadow-md p-4 relative animate-fade-in">
                <!-- ⏱ Time top-right -->
                <span class="absolute top-2 right-3 text-green-400 text-xs time-ago" data-created="${createdAtFormatted}">
                    Just now
                </span>

                <p class="text-white text-sm">${n.message}</p>
            </div>
        </c:if>
    </c:forEach>
</div>

<script>
    function timeAgoString(createdDate) {
    if (isNaN(createdDate.getTime())) {
        return 'Just now'; // fallback if invalid date
    }

    const now = new Date();
    const diffMs = now - createdDate;
    const seconds = Math.floor(diffMs / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);

    // 🧪 Debug safely
    console.log('⏰ Created:', createdDate.toISOString(), '| Hours diff:', hours);
    console.log(hours + " hour" + (hours > 1 ? "s" : "") + " ago");

if (Number(hours) >= 1) {
  return hours + " hour" + (Number(hours) > 1 ? "s" : "") + " ago";
}
if (minutes >= 1) {
  return minutes + " minute" + (minutes > 1 ? "s" : "") + " ago";
}
if (seconds >= 10) {
  return seconds + " seconds ago";
}
return "Just now";
}

    document.querySelectorAll('.time-ago').forEach(el => {
        const createdDate = new Date(el.dataset.created);
        const update = () => {
            console.log(timeAgoString(createdDate))
            el.textContent = timeAgoString(createdDate);
        };
        update();
        setInterval(update, 30000); // ⏱ update every 30 seconds
    });
</script>

<%@ include file="common/footer.jsp" %>
