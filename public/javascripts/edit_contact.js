$(document).ready(function (){
    $("#dialog").dialog({
        bgiframe: true,
        height: 140,
        modal: true,
        autoOpen: false,
        buttons: {
            'Continue': function(){
                $(this).dialog('close');
            }
        }
    });
    
    $("#send_email").dialog({
        bgiframe: true,
        autoOpen: false,
        height: 410,
        width: 450,
        modal: true,
        buttons: {
            'Submit': function() {
                //TODO: send mail
                $(this).dialog('close');
                $("#dialog").dialog('open');
            }
        }
    });

    $('#send_button').click(function() {
        $('#send_email').dialog('open');
        return false;
    })
    .hover(
        function(){
            $(this).addClass("ui-state-hover");
        },
        function(){
            $(this).removeClass("ui-state-hover");
        }
    )
    .mousedown(function(){
        $(this).addClass("ui-state-active");
    })
    .mouseup(function(){
            $(this).removeClass("ui-state-active");
    });
});