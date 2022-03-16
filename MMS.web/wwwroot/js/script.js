$(".passwordEye img").click(function () {    
    var src = $(this).attr('src');
    var newsrc = (src==='../images/eye.png') ? '../images/eye_cross.png' : '../images/eye.png';
    $(this).attr('src', newsrc );
});

$(".passwordEye img").click(function () {
    var pwdType = $("#Input_Password").attr("type");
    var newType = (pwdType === "password") ? "text" : "password";
    $("#Input_Password").attr("type", newType);
});
$("td img").click(function (e) {
    alert("sdsdf");
    $(this).parents().closest("td").find(".actionBtn").toggle();
    e.stopPropagation();
});
$(document).ready(function(){
    $('.pageHead i.fa.fa-angle-down').click(function(){
        $('.pageHead .info_Section').slideToggle();
    })
});

$(document).click(function(e) {
   // $(".actionBtn").hide();
});


