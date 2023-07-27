$(document).ready(function() {
    var year = new Date().getFullYear();
    var startYear = year - 65;
    var endYear = year - 15;


    for (var i = startYear; i <= endYear; i++) {
        var option = '<option value="'+ i +'">'+ i +'</option>';
        console.log(option); // 이 라인이 추가된 부분입니다.
        $('.birth_year').append(option);
    }

    for (var i = 1; i <= 12; i++) {
        var month = (i < 10) ? '0' + i : i;
        $('.birth_month').append('<option value="'+ month +'">'+ month +'</option>');
    }

    for (var i = 1; i <= 31; i++) {
        var day = (i < 10) ? '0' + i : i;
        $('.birth_day').append('<option value="'+ day +'">'+ day +'</option>');
    }

    var firstOptionValue = $('.birth_year option:first').val();
    console.log(firstOptionValue);

});


function register() {

    var id = $('#user_id').val();
    var pw = $('#user_pw').val();
    var email = $('#user_email').val();
    var tel = $('#user_tel').val();
    var birth = $('.birth_year').val() + '-' + $('.birth_month').val() + '-' + $('.birth_day').val();
    console.log(birth);

    $.ajax({
        url: "registerOK.do",

        data: {
            user_id: id,
            user_pw: pw,
            email: email,
            tel: tel,
            birthdate: birth

        },
        method: "POST",
        dataType: "json",
        success: function(response) {
            console.log(response);
            alert("로그인 성공");

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });

}