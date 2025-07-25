<%@include file="/taglib/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Management System</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="<c:url value='/templates/css/book.css'/>" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-gray-100 min-h-screen">
        <div class="container mx-auto px-4 py-8">
            <h1 class="text-3xl font-bold text-center text-indigo-700 mb-8">Book Management System</h1>
            <a href="homepage?firstname=${firstname}&lastname=${lastname}"
               class="fixed top-6 left-8 z-50 flex items-center text-indigo-600 hover:text-indigo-800 transition-colors duration-200">
                <i class="fas fa-home fa-lg"></i>
                <span class="ml-2 font-semibold hidden sm:inline">Trang chủ</span>
            </a>
            <!-- Add Book Button -->
            <div class="flex justify-end mb-6">
                <button id="addBookBtn"
                        class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg flex items-center transition-colors">
                    <i class="fas fa-plus mr-2"></i> Add New Book
                </button>
            </div>

            <!-- Book Table -->
            <div class="bg-white rounded-lg shadow-md overflow-hidden responsive-table">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-indigo-50">
                        <tr>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                ID</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Image</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Name</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Price</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Author</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Category ID</th>
                            <th
                                class="px-6 py-3 text-left text-xs font-medium text-indigo-700 uppercase tracking-wider">
                                Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">        
                        <c:forEach var="book" items="${ListBook}">
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${book.getId()}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <img src="${book.getImage()}" alt="${book.getName()}" class="book-image">
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                    ${book.getName()}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">$${book.getPrice()}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${book.getAuthor()}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${book.getCateID()}
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                    <!-- edit button -->
                                    <div class="flex space-x-2">                                                                                                          
                                        <button
                                            class="editBookBtn text-indigo-600 hover:text-indigo-900"
                                            type="button"
                                            data-id="${book.getId()}"
                                            data-name="${book.getName()}"
                                            data-price="${book.getPrice()}"
                                            data-author="${book.getAuthor()}"
                                            data-cateid="${book.getCateID()}"
                                            data-image="${book.getImage()}"
                                            >
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <!-- delete button -->            
                                        <button onclick="showDeleteModal(${book.getId()})"
                                                class="text-red-600 hover:text-red-900">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Đặt nav phân trang ngay dưới bảng, căn giữa -->
            <nav aria-label="Page navigation example" class="mt-6 flex justify-center">
                <ul class="pagination flex space-x-2">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item"><a class="page-link" href="book?firstname=${firstname}&lastname=${lastname}&page=${currentPage - 1}">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${numOfPage}" var="i">
                        <li class="page-item"><a class="page-link" href="book?firstname=${firstname}&lastname=${lastname}&page=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${currentPage < numOfPage}">
                        <li class="page-item"><a class="page-link" href="book?firstname=${firstname}&lastname=${lastname}&page=${currentPage + 1}">Next</a></li>
                    </c:if>
                </ul>
            </nav>       
            <!-- Add Book Modal -->
            <div id="bookModal"
                 class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
                <div class="bg-white rounded-lg shadow-xl w-full max-w-md mx-4">
                    <div class="flex justify-between items-center border-b px-6 py-4">
                        <h3 id="modalTitle" class="text-lg font-semibold text-gray-800">Add New Book</h3>
                        <button id="closeModalBtn" class="text-gray-500 hover:text-gray-700">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div class="p-6">
                        <form id="bookForm" action="addbook" method="post">
                            <input type="hidden" name="firstname" value="${firstname}">
                            <input type="hidden" name="lastname" value="${lastname}">
                            <input type="hidden" id="bookId" name="id">
                            <div class="mb-4">
                                <label for="bookName" class="block text-sm font-medium text-gray-700 mb-1">Book
                                    Name</label>
                                <input name="name" type="text" id="bookName"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div class="mb-4">
                                <label for="bookPrice" class="block text-sm font-medium text-gray-700 mb-1">Price
                                    ($)</label>
                                <input name="price" type="number" id="bookPrice" step="0.01"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div class="mb-4">
                                <label for="bookAuthor"
                                       class="block text-sm font-medium text-gray-700 mb-1">Author</label>
                                <input name="author" type="text" id="bookAuthor"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       required>
                            </div>
                            <div class="mb-4">
                                <label for="bookCategory" class="block text-sm font-medium text-gray-700 mb-1">Category
                                    ID</label>
                                <select name="cateID" id="bookCategory"
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                        required>
                                    <c:forEach var="cate" items="${ListCate}">
                                        <option value="${cate.getId()}">${cate.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-4">
                                <label for="bookImage" class="block text-sm font-medium text-gray-700 mb-1">Image
                                    URL</label>
                                <input name="image" type="text" id="bookImage"
                                       class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"
                                       placeholder="https://example.com/book.jpg">
                            </div>
                            <div class="flex justify-end border-t px-6 py-4">
                                <button id="cancelModalBtn"
                                        type="button"
                                        class="px-4 py-2 text-gray-600 hover:text-gray-800 mr-2">Cancel</button>
                                <button type="submit"
                                        class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 transition-colors">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteModal"
                 class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
                <div class="bg-white rounded-lg shadow-xl w-full max-w-md mx-4">
                    <div class="flex justify-between items-center border-b px-6 py-4">
                        <h3 class="text-lg font-semibold text-gray-800">Confirm Delete</h3>
                        <button id="closeDeleteModalBtn" class="text-gray-500 hover:text-gray-700">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <div>
                        <input id="firstnameId" type="hidden" name="firstname" value="${firstname}">
                        <input id="lastnameId" type="hidden" name="lastname" value="${lastname}">
                    </div>
                    <div class="p-6">
                        <p class="text-gray-700">Are you sure you want to delete this book? This action cannot be
                            undone.</p>
                        <input type="hidden" id="deleteBookId">
                    </div>
                    <div class="flex justify-end border-t px-6 py-4">
                        <button id="cancelDeleteBtn"
                                class="px-4 py-2 text-gray-600 hover:text-gray-800 mr-2">Cancel</button>
                        <a href="#" onclick="deleteBook()">
                            <button type="submit"
                                    class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 transition-colors">Delete</button>
                        </a>
                    </div>

                </div>
            </div>

            <script>
                const addBookBtn = document.getElementById('addBookBtn');
                const bookModal = document.getElementById('bookModal');
                const deleteModal = document.getElementById('deleteModal');
                const closeModalBtn = document.getElementById('closeModalBtn');
                const closeDeleteModalBtn = document.getElementById('closeDeleteModalBtn');
                const cancelModalBtn = document.getElementById('cancelModalBtn');
                const cancelDeleteBtn = document.getElementById('cancelDeleteBtn');
                const bookForm = document.getElementById('bookForm');
                const modalTitle = document.getElementById('modalTitle');
                const bookIdInput = document.getElementById('bookId');
                const bookNameInput = document.getElementById('bookName');
                const bookPriceInput = document.getElementById('bookPrice');
                const bookAuthorInput = document.getElementById('bookAuthor');
                const bookCategoryInput = document.getElementById('bookCategory');
                const bookImageInput = document.getElementById('bookImage');
                const deleteBookIdInput = document.getElementById('deleteBookId');
                const firstName = document.getElementById('firstnameId');
                const lastName = document.getElementById('lastnameId');

                function showAddModal() {
                    modalTitle.textContent = 'Add New Book';
                    bookForm.reset();
                    bookIdInput.value = '';
                    bookForm.action = 'addbook';
                    bookModal.classList.remove('hidden');
                }

                function showDeleteModal(id) {
                    deleteBookIdInput.value = id;
                    deleteModal.classList.remove('hidden');
                }


                function deleteBook() {
                    const id = parseInt(deleteBookIdInput.value);
                    window.location = "deletebook?" + "firstname=" + firstName.value
                            + "&lastname=" + lastName.value
                            + "&id=" + id;
                    deleteModal.classList.add('hidden');
                }

                addBookBtn.addEventListener('click', showAddModal);
                closeModalBtn.addEventListener('click', () => bookModal.classList.add('hidden'));
                closeDeleteModalBtn.addEventListener('click', () => deleteModal.classList.add('hidden'));
                cancelModalBtn.addEventListener('click', () => bookModal.classList.add('hidden'));
                cancelDeleteBtn.addEventListener('click', () => deleteModal.classList.add('hidden'));


                window.addEventListener('click', (e) => {
                    if (e.target === bookModal) {
                        bookModal.classList.add('hidden');
                    }
                    if (e.target === deleteModal) {
                        deleteModal.classList.add('hidden');
                    }
                });

                // Edit book button click event
                document.querySelectorAll('.editBookBtn').forEach(button => {
                    button.addEventListener('click', function () {
                        const id = this.getAttribute('data-id');
                        const name = this.getAttribute('data-name');
                        const price = this.getAttribute('data-price');
                        const author = this.getAttribute('data-author');
                        const cateid = this.getAttribute('data-cateid');
                        const image = this.getAttribute('data-image');

                        modalTitle.textContent = 'Edit Book';
                        bookIdInput.value = id;
                        bookNameInput.value = name;
                        bookPriceInput.value = price;
                        bookAuthorInput.value = author;
                        bookCategoryInput.value = cateid;
                        bookImageInput.value = image;
                        bookForm.action = 'updatebook';
                        bookForm.method = 'get';
                        bookModal.classList.remove('hidden');
                    });
                });
            </script>
        </div>
    </body>

</html>