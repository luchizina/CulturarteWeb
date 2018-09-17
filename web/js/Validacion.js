/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//function validar(){
//    $("#nick").change(function () {
//// ajax                 
//        $.ajax({
//            type: "POST",
//            url: "../usuario",
//            data: {nick: $("#nick").val()}
//        })
//                .done(function (msg) {
//                    if (msg === "no")
//                    {
//                        $('#error_name').show();
//                    } else {
//                        $('#error_name').hide();
//                    }
//                });
//    });
//}

$('#nick').keyup(function(){
    var nick = $('#nick').val();
    if(nick !== ''){
        $.post('usuario',{nick:nick},
        function(data){
            $('#status').html(data);
        });
    }
});
