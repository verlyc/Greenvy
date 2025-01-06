<c:if test="${ !empty error }">
	<p class=" alert alert-danger m-1 p-2">
		<c:out value="${ error }" />
	</p>
</c:if>

<c:if test="${ !empty success }">
	<p class="alert alert-success m-1 p-2">
		<c:out value="${ success }" />
	</p>
</c:if>