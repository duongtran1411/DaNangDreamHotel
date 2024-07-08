/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
//document.addEventListener('DOMContentLoaded', function () {
//    const itemsPerPage = 6;
//    const items = document.querySelectorAll('#main-room .element');
//    const paginationContainer = document.getElementById('pagination-container');
//
//    function showPage(page) {
//        const start = (page - 1) * itemsPerPage;
//        const end = start + itemsPerPage;
//
//        items.forEach((item, index) => {
//            if (index >= start && index < end) {
//                item.style.display = 'flex';
//            } else {
//                item.style.display = 'none';
//            }
//        });
//        const pageItems = paginationContainer.querySelectorAll('li');
//        pageItems.forEach((item, index) => {
//            if (index === (page - 1)) {
//                item.classList.add('active');
//            } else {
//                item.classList.remove('active');
//            }
//        });
//    }
//
//    function setupPagination() {
//        const totalPages = Math.ceil(items.length / itemsPerPage);
//        paginationContainer.innerHTML = '';
//        const ul = document.createElement('ul');
//        ul.className = 'pagination justify-content-center';
//
//        for (let i = 1; i <= totalPages; i++) {
//            const li = document.createElement('li');
//            li.className = 'page-item';
//
//            const link = document.createElement('a');
//            link.className = 'page-link';
//            link.href = '#';
//            link.innerText = i;
//            (function (page) {
//                link.addEventListener('click', function (event) {
//                    event.preventDefault();
//                    showPage(page);
//                });
//            })(i);
//
//            li.appendChild(link);
//            ul.appendChild(li);
//            if (i === 1) {
//                li.classList.add('active');
//            }
//        }
//
//        paginationContainer.appendChild(ul);
//    }
//    setupPagination();
//    showPage(1);
//});




// Hàm phân trang
//function handlePage() {
//    const itemsPerPage = 6;
//    const items = document.querySelectorAll('#main-room .element');
//    const paginationContainer = document.getElementById('pagination-container');
//
//    function showPage(page) {
//        const start = (page - 1) * itemsPerPage;
//        const end = start + itemsPerPage;
//
//        items.forEach((item, index) => {
//            if (index >= start && index < end) {
//                item.style.display = 'flex';
//            } else {
//                item.style.display = 'none';
//            }
//        });
//        const pageItems = paginationContainer.querySelectorAll('li');
//        pageItems.forEach((item, index) => {
//            if (index === (page - 1)) {
//                item.classList.add('active');
//            } else {
//                item.classList.remove('active');
//            }
//        });
//    }
//
//    function setupPagination() {
//        const totalPages = Math.ceil(items.length / itemsPerPage);
//        paginationContainer.innerHTML = '';
//        const ul = document.createElement('ul');
//        ul.className = 'pagination justify-content-center';
//
//        for (let i = 1; i <= totalPages; i++) {
//            const li = document.createElement('li');
//            li.className = 'page-item';
//
//            const link = document.createElement('a');
//            link.className = 'page-link';
//            link.href = '#';
//            link.innerText = i;
//            (function (page) {
//                link.addEventListener('click', function (event) {
//                    event.preventDefault();
//                    showPage(page);
//                });
//            })(i);
//
//            li.appendChild(link);
//            ul.appendChild(li);
//            if (i === 1) {
//                li.classList.add('active');
//            }
//        }
//
//        paginationContainer.appendChild(ul);
//    }
//    setupPagination();
//    showPage(1);
//}

// Khởi tạo phân trang lần đầu khi tải trang
//document.addEventListener('DOMContentLoaded', function () {
//    handlePage();
//});


