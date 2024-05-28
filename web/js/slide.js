/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const listImage = document.querySelector(".list-image");
const images = document.querySelectorAll(".img-slide");
const btnLeft = document.querySelector(".btn-Left");
const btnRight = document.querySelector(".btn-Right");
let current = 0;
const length = images.length;

const handleChaneSLide = ()=>{
    if(current == length - 1){
        current = 0;
        let width =images[0].offsetWidth;
        listImage.style.transform = `translateX(0px)`;
    }else{
        current++;
        let width = images[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
    }
};
let handleEventChangeSlide = setInterval(handleChaneSLide, 3000);

btnRight.addEventListener('click',()=>{
    clearInterval(handleEventChangeSlide);
    handleChaneSLide();
    handleEventChangeSlide = setInterval(handleChaneSLide,3000);
});

btnLeft.addEventListener('click',()=>{
    clearInterval(handleEventChangeSlide);
    if(current == 0){
        current = length-1;
        let width =images[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
    }else{
        current--;
        let width = images[0].offsetWidth;
        listImage.style.transform = `translateX(${width * -1 * current}px)`;
    }
    handleEventChangeSlide = setInterval(handleChaneSLide,3000);
});