<%@include file="/taglib/taglib.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Category Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="<c:url value='/templates/css/category.css'/>" />

    </head>
    <body class="bg-gray-100 min-h-screen">
        <div class="container mx-auto px-4 py-8">

            <a href="homepage?firstname=${firstname}&lastname=${lastname}"
               class="fixed top-6 left-8 z-50 flex items-center text-indigo-600 hover:text-indigo-800 transition-colors duration-200">
                <i class="fas fa-home fa-lg"></i>
                <span class="ml-2 font-semibold hidden sm:inline">Trang chủ</span>
            </a>
            <!-- Header -->
            <div class="flex flex-col mb-8">
                <h1 class="text-3xl font-bold text-gray-800 text-center mb-4">Category Management</h1>
                <div class="flex justify-end">
                    <button id="addCategoryBtn" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded-lg transition-all duration-200 btn-hover flex items-center">
                        <i class="fas fa-plus mr-2"></i> Add Category
                    </button>
                </div>
            </div>

            <!-- Category Table -->
            <div class="bg-white rounded-lg shadow overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Content</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="categoryTableBody" class="bg-white divide-y divide-gray-200">
                            <c:choose>
                                <c:when test="${empty listCategory}">
                                <tbody id="categoryTableBody" class="bg-white divide-y divide-gray-200">
                                    <!-- Hiển thị trạng thái trống nếu không có dữ liệu -->
                                    <tr>
                                        <td colspan="4" class="text-center text-gray-500 py-4">
                                            Không có danh mục nào.
                                        </td>
                                    </tr>
                                </tbody>
                            </c:when>
                            <c:otherwise>
                                <tbody id="categoryTableBody" class="bg-white divide-y divide-gray-200">
                                    <c:forEach var="category" items="${listCategory}">
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${category.id}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${category.name}</td>
                                            <td class="px-6 py-4 text-sm text-gray-500">${category.content}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                <button data-id="${category.id}" class="edit-btn text-blue-600 hover:text-blue-900 mr-3">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button data-id="${category.id}" class="delete-btn text-red-600 hover:text-red-900">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </c:otherwise>
                        </c:choose>                       
                    </table>
                </div>
            </div>

            <!-- Empty State -->
            <div id="emptyState" class="text-center py-12 hidden">
                <i class="fas fa-folder-open text-4xl text-gray-400 mb-4"></i>
                <h3 class="text-lg font-medium text-gray-900">No categories yet</h3>
                <p class="mt-1 text-sm text-gray-500">Get started by creating a new category.</p>
                <button id="emptyAddCategoryBtn" class="mt-4 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg flex items-center mx-auto transition-colors">
                    <i class="fas fa-plus mr-2"></i> Add Category
                </button>
            </div>

        </div>

        <!-- Add/Edit Category Modal -->
        <div id="categoryModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50 hidden">
            <div class="bg-white rounded-lg shadow-xl w-full max-w-md custom-modal">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 id="modalTitle" class="text-lg font-medium text-gray-900">Add Category</h3>
                        <button id="closeModal" class="text-gray-400 hover:text-gray-500">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <form id="categoryForm" action="addcategory" class="space-y-4">
                        <input type="hidden" id="firstNameId" name="firstname" value="${firstname}">
                        <input type="hidden" id="lastNameId" name="lastname" value="${lastname}">
                        <input type="hidden" id="categoryId" name="id">
                        <div>
                            <label for="categoryName" class="block text-sm font-medium text-gray-700">Name</label>
                            <input type="text" id="categoryName" name="name" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                        </div>
                        <div>
                            <label for="categoryContent" class="block text-sm font-medium text-gray-700">Content</label>
                            <textarea id="categoryContent" name="content" rows="3" class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500"></textarea>
                        </div>
                        <div class="flex justify-end space-x-3 pt-4">
                            <button type="button" id="cancelModal" class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">
                                Cancel
                            </button>
                            <button type="submit" class="px-4 py-2 border border-transparent rounded-md text-sm font-medium text-white bg-blue-600 hover:bg-blue-700">
                                Save
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>              
        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50 hidden">
            <div class="bg-white rounded-lg shadow-xl w-full max-w-md custom-modal">
                <div class="p-6">
                    <div class="flex justify-between items-center mb-4">
                        <h3 class="text-lg font-medium text-gray-900">Confirm Deletion</h3>
                        <button id="closeDeleteModal" class="text-gray-400 hover:text-gray-500">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>
                    <p class="text-gray-700 mb-6">Are you sure you want to delete this category? This action cannot be undone.</p>
                    <div class="flex justify-end space-x-3">
                        <button id="cancelDelete" class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 bg-white hover:bg-gray-50">
                            Cancel
                        </button>
                        <button id="confirmDelete" class="px-4 py-2 border border-transparent rounded-md text-sm font-medium text-white bg-red-600 hover:bg-red-700">
                            Delete
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example" class="mt-6 flex justify-center">
            <ul class="pagination flex space-x-2">
                <c:if test="${currentPage > 1}">
                    <li class="page-item"><a class="page-link" href="category?firstname=${firstname}&lastname=${lastname}&page=${currentPage - 1}">Previous</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${numOfPage}" var="i">
                    <li class="page-item ${i == currentPage ? 'font-bold text-blue-600' : ''}"><a class="page-link" href="category?firstname=${firstname}&lastname=${lastname}&page=${i}">${i}</a></li>
                    </c:forEach>
                    <c:if test="${currentPage < numOfPage}">
                    <li class="page-item"><a class="page-link" href="category?firstname=${firstname}&lastname=${lastname}&page=${currentPage + 1}">Next</a></li>
                    </c:if>
            </ul>
        </nav>     
        <script>


            // DOM Elements
            const firstName = document.getElementById('firstNameId');
            const lastName = document.getElementById('lastNameId');
            const categoryTableBody = document.getElementById('categoryTableBody');
            const emptyState = document.getElementById('emptyState');
            const addCategoryBtn = document.getElementById('addCategoryBtn');
            const emptyAddCategoryBtn = document.getElementById('emptyAddCategoryBtn');
            const categoryModal = document.getElementById('categoryModal');
            const deleteModal = document.getElementById('deleteModal');
            const categoryForm = document.getElementById('categoryForm');
            const modalTitle = document.getElementById('modalTitle');
            const categoryIdInput = document.getElementById('categoryId');
            const categoryNameInput = document.getElementById('categoryName');
            const categoryContentInput = document.getElementById('categoryContent');
            const editCategory = document.getElementById('editCategory');
            // Variables for delete operation
            let categoryToDelete = null;

            // Initialize the app
            function init() {
                renderCategories();
                setupEventListeners();
            }

            // Render categories to the table
            function renderCategories() {
                emptyState.classList.add('hidden');
            }

            // Set up event listeners
            function setupEventListeners() {
                // Add category buttons
                addCategoryBtn.addEventListener('click', openAddModal);
                if (emptyAddCategoryBtn) {
                    emptyAddCategoryBtn.addEventListener('click', openAddModal);
                }

                // Modal controls
                document.getElementById('closeModal').addEventListener('click', closeModal);
                document.getElementById('cancelModal').addEventListener('click', closeModal);
                document.getElementById('closeDeleteModal').addEventListener('click', closeDeleteModal);
                document.getElementById('cancelDelete').addEventListener('click', closeDeleteModal);

                // Form submission
                //categoryForm.addEventListener('submit', handleFormSubmit);

                // Delete confirmation
                document.getElementById('confirmDelete').addEventListener('click', confirmDelete);

                // Event delegation for edit and delete buttons
                document.addEventListener('click', function (e) {
                    if (e.target.classList.contains('edit-btn') || e.target.closest('.edit-btn')) {
                        const btn = e.target.classList.contains('edit-btn') ? e.target : e.target.closest('.edit-btn');
                        const id = parseInt(btn.getAttribute('data-id'));
                        openEditModal(id);
                    }

                    if (e.target.classList.contains('delete-btn') || e.target.closest('.delete-btn')) {
                        const btn = e.target.classList.contains('delete-btn') ? e.target : e.target.closest('.delete-btn');
                        const id = parseInt(btn.getAttribute('data-id'));
                        openDeleteModal(id);
                    }
                });
            }

            // Open modal for adding a new category
            function openAddModal() {
                modalTitle.textContent = 'Add Category';
                categoryIdInput.value = '';
                categoryNameInput.value = '';
                categoryContentInput.value = '';
                categoryModal.classList.remove('hidden');
            }

            // Open modal for editing a category
            function openEditModal(id) {
                // Tìm dòng chứa nút edit vừa bấm
                const row = document.querySelector('button.edit-btn[data-id="' + id + '"]').closest('tr');
                const name = row.children[1].textContent.trim();
                const content = row.children[2].textContent.trim();

                modalTitle.textContent = 'Edit Category';
                categoryIdInput.value = id;
                categoryNameInput.value = name;
                categoryContentInput.value = content;
                categoryForm.action = "updatecategory";
                categoryModal.classList.remove('hidden');
            }

            // Close the add/edit modal
            function closeModal() {
                categoryModal.classList.add('hidden');
            }

            // Open delete confirmation modal
            function openDeleteModal(id) {
                categoryToDelete = id;
                deleteModal.classList.remove('hidden');
            }

            // Close delete confirmation modal
            function closeDeleteModal() {
                categoryToDelete = null;
                deleteModal.classList.add('hidden');
            }

            // Confirm category deletion
            function confirmDelete() {
                const id = categoryToDelete;
                window.location = "deletecategory?&firstname=" + firstName.value
                        + "&lastname=" + lastName.value
                        + "&id=" + id;
                renderCategories();
            }

            // Initialize the application
            document.addEventListener('DOMContentLoaded', init);
        </script>
    </body>
</html>