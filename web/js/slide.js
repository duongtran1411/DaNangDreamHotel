/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const listImage = document.querySelector(".list-image");
const images = document.querySelectorAll("#slide-img");
let current = 0;
const length = images.length;


setInterval(() => {
    if (current == length - 1) {
        current = 0;
        let width = images[0].offsetWidth;
        listImage.style.transform = `translateX(0px)`;
    } else {
        current++;
        let width = images[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
    }
}, 3000);