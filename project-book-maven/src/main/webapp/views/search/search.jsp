<%@include file="/taglib/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Selector</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="<c:url value='/templates/css/search.css'/>"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript">
            function Change() {
                document.getElementById("f1").submit();
            }
        </script>
    </head>
    <body class="bg-gray-100 min-h-screen flex flex-col items-center py-12 px-4">
        <!-- Home icon -->
        <a href="homepage?firstname=${firstname}&lastname=${lastname}" class="fixed top-6 left-8 z-50 flex items-center text-indigo-600 hover:text-indigo-800 transition-colors duration-200">
            <i class="fas fa-home fa-lg"></i>
            <span class="ml-2 font-semibold hidden sm:inline">Trang chủ</span>
        </a>
        <div class="w-full" style="max-width: 1200px; margin: 0 auto;">
            <h1 class="text-3xl font-bold text-center text-indigo-700 mb-2">Book Explorer</h1>
            <p class="text-gray-600 text-center mb-8">Select a category to discover amazing books</p>

            <!-- Select Dropdown -->
            <div class="relative mb-8 w-full max-w-md mx-auto">
                <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-indigo-500">
                    <i class="fas fa-book-open"></i>
                </div>
                <form id ="f1" action="search" >
                    <input type="hidden" name="firstname" value="${firstname}">
                    <input type="hidden" name="lastname" value="${lastname}">
                    <select name="key" id="bookCategory" onchange="Change()" class="bg-white border border-gray-300 text-gray-700 py-3 px-10 pr-8 rounded-lg shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 block w-full appearance-none transition-all duration-200 hover:shadow-md">
                        <option value="" disabled selected>Select a book category...</option>
                        <option value="0">All</option>
                        <c:forEach var="c" items="${category}">
                            <option value="${c.getId()}" <c:if test="${id == c.getId()}">selected</c:if>>${c.getName()}</option>
                        </c:forEach>
                    </select>
                </form>
                <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-gray-500">
                    <i class="fas fa-chevron-down"></i>
                </div>
            </div>

            <div class="book-grid">
                <c:forEach var="book" items="${arrBook}">
                    <div class="book-card fade-in hover:scale-105 hover:shadow-2xl transition-transform duration-200">
                        <div class="book-img-wrap">
                            <img class="book-img" src="${book.getImage()}" alt="${book.getName()}" />
                        </div>
                        <div class="book-info">
                            <div class="book-title">${book.getName()}</div>
                            <div class="book-price">Giá: <span>${book.getPrice()} VNĐ</span></div>
                            <div class="book-author">Tác giả: <span>${book.getAuthor()}</span></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <nav aria-label="Page navigation example" class="mt-6 flex justify-center">
                <ul class="pagination flex space-x-2">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="search?firstname=${firstname}&lastname=${lastname}&key=${id}&page=${currentPage - 1}">Previous</a></li>
                        </c:if>

                    <c:forEach begin="1" end="${numOfPage}" var="i">
                        <li class="page-item"><a class="page-link" href="search?firstname=${firstname}&lastname=${lastname}&key=${id}&page=${i}">${i}</a></li>                      
                        </c:forEach>

                    <c:if test="${currentPage < numOfPage}">
                        <li class="page-item"><a class="page-link" href="search?firstname=${firstname}&lastname=${lastname}&key=${id}&page=${currentPage + 1}">Next</a></li>
                        </c:if>        

                </ul>
            </nav>       
    </body>
</html>