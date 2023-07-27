function login() {

    var id = $('#user_id').val();
    var pw = $('#user_pw').val();

    $.ajax({
        url: "loginOK.do",

        data: {
            user_id: id,
            user_pw: pw,

        },
        method: "POST",
        dataType: "json",
        success: function(response) {
            console.log(response);
            if(response.status === 'success') {
                window.location.href = "home.do";
            } else {
                alert("아이디와 비밀번호를 확인해주세요");
            }
        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });

}