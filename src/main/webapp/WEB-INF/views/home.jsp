<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
   
</style>
</head>
<body>
	<%-- <%@include file="/WEB-INF/include/header.jsp"%> --%>

	<%-- <%@include file="/WEB-INF/include/nav.jsp"%> --%>

	<section>
		<div id="PostCard">
			<div class="grand_banner_wrap mx-5">
				<h2 class="header ms-3">채용 공고</h2>
				<div class="row my-3 ms-3 justify-content-center">
					<div class="col-auto">
						<div class="input-group">
							<div class="mcontainer">
								<div class="selects">
									<!-- 옵션1 선택 -->
									<select class="form-select" id="">
										<option selected>옵션1</option>
										<option value="옵션1">옵션1</option>

									</select>
									<!-- 옵션2 선택 -->
									<select class="form-select" id="">
										<option selected>옵션2</option>
										<option value="옵션2">옵션2</option>
									</select>
									<!-- 옵션3 선택 -->
									<select class="form-select" id="">
										<option selected>옵션3</option>
										<option value="옵션3">옵션3</option>
									</select>
									<!-- 옵션4 선택 -->
									<select class="form-select" id="">
										<option selected>옵션4</option>
										<option value="옵션4">옵션4</option>
									</select>
								</div>
								<!-- 검색창 -->
								<div class="search ms-5">
									<input type="text" name="keyword" class="form-control"
										id="keyword" placeholder="검색어">
									<button type="submit" class="btn btn-outline-secondary"
										id="btn_search">찾기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex flex-wrap ms-3 justify-content-center">
					<c:forEach var="mainPageList" items="${mainPageList}">
						<div class="cardinterval me-5 my-3">
							<a href="/Company/Viewpost?post_idx=${mainPageList.post_idx}">
								<div class="card" style="width: 20rem; height: 300px;">
									<c:if test="${usertype.type == 2}">
										<div class="bookmark-icon"
											style="position: absolute; right: 10px; top: 10px; z-index: 10;"
											onclick="toggleBookmark(event, ${mainPageList.post_idx})">
											<c:choose>
												<c:when test="${mainPageList.bookmarked}">
													<img src="/img/moew_on.png"
														id="bookmark_${mainPageList.post_idx}" alt="북마크"
														style="width: 24px; height: 24px;">
												</c:when>
												<c:otherwise>
													<img src="/img/moew_off.png"
														id="bookmark_${mainPageList.post_idx}" alt="북마크"
														style="width: 24px; height: 24px;">
												</c:otherwise>
											</c:choose>
										</div>
									</c:if>
									<img src="${mainPageList.logo}" class="card-img-top" alt="회사로고"
										style="height: 150px;">
									<div class="card-body">
										<p class="card-company">${mainPageList.name}</p>
										<h5 class="card-title">${mainPageList.title}</h5>
										<p class="card-deadline">${mainPageList.deadline}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>
		</div>
	</section>
	<%-- <%@include file="/WEB-INF/include/footer.jsp"%> --%>
</body>
</html>






