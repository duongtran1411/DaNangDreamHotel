/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var date = new Date();
var tdate = date.getDate();
var tmonth = date.getMonth() + 1;
if (tdate < 10) {
    tdate = '0' + tdate;
}
if (tmonth < 10) {
    tmonth = '0' + tmonth;
}
var year = date.getUTCFullYear();
var minDate = year + '-' + tmonth + '-' + tdate;
var checkIn = document.getElementById('now-date').setAttribute('min', minDate);
var showDateIn = document.getElementById('now-date').setAttribute('value', minDate);
document.getElementById('now-date').addEventListener('input', function (e) {
    if (e.target.value === '') {
        e.preventDefault();
        e.target.value = e.target.defaultValue;
    }
});