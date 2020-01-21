/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
let today = new Date();
let tomorrow = new Date();
tomorrow.setDate(today.getDate() + 6);

let url = location.href;
let href = url.split("/");

$(document).ready(function () {

    $('.datepicker').datepicker({
        setDefaultDate: true,
        defaultDate: new Date(),
        minDate: new Date(),
        maxDate: tomorrow,
        format: "dd mmmm yyyy"
    });

    $('select').formSelect();

    if (href[4] === 'TravelTicket') {
        $('.butt.active').removeClass('active');
        $('.one').addClass('active');
    } else if (href[4] === 'PaymentTicket') {
        $('.butt.active').removeClass('active');
        $('.two').addClass('active');
    } else if (href[4] === 'MyTicket') {
        $('.butt.active').removeClass('active');
        $('.three').addClass('active');
    }

    $('select').change(function (e) {
//        let tot = e.target.value;
//        for (var i = 0; i < tot; i++) {
//            $('input[type=checkbox]').eq(i + 1).attr('disabled', 'disabled');
//        }
    });

    $('.dropdown-trigger').dropdown();
    
    $('.modal').modal({
        preventScrolling: false,
    });
    
    $('.timepicker').timepicker({
        twelveHour: false
    });
});
