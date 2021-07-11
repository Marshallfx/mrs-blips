marshall = {}

$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    $("#marshall").click(function () {
        let inputValue = $("#marshall").val() 
        return;
    })
})

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27:
            marshall.Close();
            break;
    }
});

marshall.Close = function() {
    $("#container").fadeOut(175);
    $.post('http://mrs-blips/close');
}

$('#kiyafet-ackapat').on('change',function(){
    if(this.checked){
        $.post('https://mrs-blips/kiyafetac', JSON.stringify({blip: true}));
    }
    else{
        $.post('https://mrs-blips/kiyafetkapat', JSON.stringify({blip: false}));
    }
});

