<%@include file="/taglib/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Buttons</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/templates/css/homepage.css'/>">
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen flex items-center justify-center p-4">
    <div class="fixed top-6 right-8 z-50 flex items-center space-x-2 bg-white/80 px-4 py-2 rounded-full shadow text-indigo-700 font-semibold">
        <i class="fas fa-user-circle text-xl"></i>
        <span>Welcome, ${firstname} ${lastname}</span>
    </div>
    <div class="max-w-6xl w-full space-y-8 mx-auto">
        <div class="text-center">
            <h1 class="text-3xl font-extrabold text-gray-900 mb-2">Welcome to My App</h1>
            <p class="text-gray-600">Choose an action to continue</p>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-12 mt-10">
            <!-- Search Button -->
            <button onclick="navigateTo('search', '${firstname}', '${lastname}')" 
                    class="btn-hover-effect bg-white rounded-xl p-6 flex flex-col items-center justify-center shadow-md hover:shadow-lg border border-gray-200 hover:border-indigo-300">
                <div class="w-16 h-16 bg-indigo-100 rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-search text-indigo-600 text-2xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Search</h3>
                <p class="text-gray-500 text-sm text-center">Find specific items in our database</p>
                <div class="mt-4 px-4 py-2 bg-indigo-100 text-indigo-700 rounded-full text-xs font-medium">
                    Click to continue
                </div>
            </button>
            
            <!-- Display List Button -->
            <button onclick="navigateTo('book', '${firstname}', '${lastname}')" 
                    class="btn-hover-effect bg-white rounded-xl p-6 flex flex-col items-center justify-center shadow-md hover:shadow-lg border border-gray-200 hover:border-green-300">
                <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-list text-green-600 text-2xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Display List</h3>
                <p class="text-gray-500 text-sm text-center">View all available items in a list format</p>
                <div class="mt-4 px-4 py-2 bg-green-100 text-green-700 rounded-full text-xs font-medium">
                    Click to continue
                </div>
            </button>

            <!-- Display Category Button -->
            <button onclick="navigateTo('category', '${firstname}', '${lastname}')" 
                    class="btn-hover-effect bg-white rounded-xl p-6 flex flex-col items-center justify-center shadow-md hover:shadow-lg border border-gray-200 hover:border-yellow-300">
                <div class="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mb-4">
                    <i class="fas fa-tags text-yellow-600 text-2xl"></i>
                </div>
                <h3 class="text-lg font-semibold text-gray-800 mb-2">Display Category</h3>
                <p class="text-gray-500 text-sm text-center">View all categories in the system</p>
                <div class="mt-4 px-4 py-2 bg-yellow-100 text-yellow-700 rounded-full text-xs font-medium">
                    Click to continue
                </div>
            </button>
        </div>
        
        <div class="text-center mt-10 text-sm text-gray-500">
            <p>You'll be redirected to the appropriate page when you click a button</p>
        </div>
        <script type="text/javascript">
            function navigateTo(page, firstname, lastname) {
                window.location = page + "?&firstname="+firstname + "&lastname="+lastname;
            }
        </script>
    </div>
</body>
</html>