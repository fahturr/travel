/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let today = new Date();
let tomorrow = new Date();
tomorrow.setDate(today.getDate() + 6);

const select = document.querySelectorAll("select");
M.FormSelect.init(select);

const datePicker = document.querySelectorAll(".datepicker");
M.Datepicker.init(datePicker, {
    setDefaultDate: true,
    defaultDate: new Date(),
    minDate: new Date(),
    maxDate: tomorrow,
    format: "dd mmmm yyyy"
});

var btnContainer = document.getElementById("navigation");
var btns = btnContainer.getElementsByClassName("butt");

for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
    });
}
