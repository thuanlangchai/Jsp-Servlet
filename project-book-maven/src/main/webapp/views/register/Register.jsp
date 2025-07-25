<%@include file="/taglib/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login & Registration</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="<c:url value='/templates/css/register.css'/>" >
    </head>
    <body class="bg-gradient-to-r from-blue-500 to-purple-600 min-h-screen flex items-center justify-center p-4">
        <div class="relative w-full max-w-md mx-auto">
            <!-- Toggle switch -->
            <input type="checkbox" id="toggle" class="hidden">
            <label for="toggle" class="absolute top-4 right-4 flex items-center cursor-pointer z-10">
                <span class="mr-2 text-white font-medium">Login</span>
                <div class="relative">
                    <div class="w-12 h-6 bg-white rounded-full shadow-inner"></div>
                    <div class="absolute left-1 top-1 w-4 h-4 bg-blue-500 rounded-full transition transform translate-x-0 toggle-dot"></div>
                </div>
                <span class="ml-2 text-white font-medium">Register</span>
            </label>

            <!-- Login Form -->
            <div class="form-container login-container absolute top-0 left-0 w-full bg-white rounded-lg shadow-xl p-8">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Welcome Back</h2>

                <form action="signin" method="POST">
                    <div class="relative mb-6">
                        <input type="email" name="email" id="login-email" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                        <label for="login-email" class="form-label absolute left-4 top-2 text-gray-500 transition">Email Address</label>
                    </div>

                    <div class="relative mb-6">
                        <input type="password" name="password" id="login-password" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                        <label for="login-password" class="form-label absolute left-4 top-2 text-gray-500 transition">Password</label>
                    </div>

                    <div class="flex items-center justify-between mb-6">
                        <div class="flex items-center">
                            <input type="checkbox" id="remember" class="h-4 w-4 text-blue-500 focus:ring-blue-500 border-gray-300 rounded">
                            <label for="remember" class="ml-2 block text-sm text-gray-700">Remember me</label>
                        </div>
                        <a href="#" class="text-sm text-blue-500 hover:underline">Forgot password?</a>
                    </div>
                    <c:if test="${not empty error}">
                        <p style="color:red">${error}</p>
                    </c:if>
                    <button type="submit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition duration-200">
                        Sign In
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-gray-600">Don't have an account? <label for="toggle" class="text-blue-500 hover:underline cursor-pointer">Register here</label></p>
                </div>

                <div class="mt-8">
                    <div class="relative flex items-center">
                        <div class="flex-grow border-t border-gray-300"></div>
                        <span class="flex-shrink mx-4 text-gray-500">or continue with</span>
                        <div class="flex-grow border-t border-gray-300"></div>
                    </div>

                    <div class="flex justify-center gap-4 mt-4">
                        <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center hover:bg-gray-200 transition">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="#3b5998">
                            <path d="M22.675 0h-21.35c-.732 0-1.325.593-1.325 1.325v21.351c0 .731.593 1.324 1.325 1.324h11.495v-9.294h-3.128v-3.622h3.128v-2.671c0-3.1 1.893-4.788 4.659-4.788 1.325 0 2.463.099 2.795.143v3.24l-1.918.001c-1.504 0-1.795.715-1.795 1.763v2.313h3.587l-.467 3.622h-3.12v9.293h6.116c.73 0 1.323-.593 1.323-1.325v-21.35c0-.732-.593-1.325-1.325-1.325z"/>
                            </svg>
                        </a>
                        <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center hover:bg-gray-200 transition">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="#db4437">
                            <path d="M12.545 10.239v3.821h5.445c-.712 2.315-2.647 3.972-5.445 3.972-3.332 0-6.033-2.701-6.033-6.032s2.701-6.032 6.033-6.032c1.498 0 2.866.549 3.921 1.453l2.814-2.814c-1.8-1.682-4.256-2.703-6.735-2.703-5.522 0-10 4.477-10 10s4.478 10 10 10c8.396 0 10-7.193 10-10 0-.782-.086-1.539-1.455-1.539h-8.545z"/>
                            </svg>
                        </a>
                        <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center hover:bg-gray-200 transition">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="#1da1f2">
                            <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Register Form -->
            <div class="form-container register-container absolute top-0 left-0 w-full bg-white rounded-lg shadow-xl p-8">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-8">Create Account</h2>

                <form action="signup" method="POST">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                        <div class="relative">
                            <input type="text" name="firstname" id="first-name" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                            <label for="first-name" class="form-label absolute left-4 top-2 text-gray-500 transition">First Name</label>
                        </div>
                        <div class="relative">
                            <input type="text" name="lastname" id="last-name" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                            <label for="last-name" class="form-label absolute left-4 top-2 text-gray-500 transition">Last Name</label>
                        </div>
                    </div>

                    <div class="relative mb-4">
                        <input type="email" name="email" id="register-email" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                        <label for="register-email" class="form-label absolute left-4 top-2 text-gray-500 transition">Email Address</label>
                    </div>

                    <div class="relative mb-4">
                        <input type="password" name="password" id="register-password" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                        <label for="register-password" class="form-label absolute left-4 top-2 text-gray-500 transition">Password</label>
                    </div>

                    <div class="relative mb-6">
                        <input type="password" name="confirmpassword" id="confirm-password" class="form-input w-full px-4 py-2 border-b-2 border-gray-300 focus:border-blue-500 outline-none transition" placeholder=" " required>
                        <label for="confirm-password" class="form-label absolute left-4 top-2 text-gray-500 transition">Confirm Password</label>
                    </div>

                    <div class="mb-6">
                        <div class="flex items-center">
                            <input type="checkbox" id="terms" class="h-4 w-4 text-blue-500 focus:ring-blue-500 border-gray-300 rounded" required>
                            <label for="terms" class="ml-2 block text-sm text-gray-700">
                                I agree to the <a href="#" class="text-blue-500 hover:underline">Terms of Service</a> and <a href="#" class="text-blue-500 hover:underline">Privacy Policy</a>
                            </label>
                        </div>
                    </div>
                    <c:if test="${not empty error1}">
                        <p style="color:red">${error1}</p>
                    </c:if>
                    <c:if test="${not empty error2}">
                        <p style="color:red">${error2}</p>
                    </c:if>
                    <c:if test="${not empty success}">
                        <p style="color:greenyellow">${success}</p>
                    </c:if>
                    <button type="submit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition duration-200">
                        Sign Up
                    </button>
                </form>

                <div class="mt-6 text-center">
                    <p class="text-gray-600">Already have an account? <label for="toggle" class="text-blue-500 hover:underline cursor-pointer">Login here</label></p>
                </div>
            </div>
        </div>
    </body>
</html>
