$(document).ready(function (){
    $("#thank_you_dialog").dialog({
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

    $("#sending_email_dialog").dialog({
        bgiframe: true,
        height: 140,
        modal: true,
        autoOpen: false
    });
    
    $("#send_email_dialog").dialog({
        bgiframe: true,
        autoOpen: false,
        height: 410,
        width: 450,
        modal: true,
        buttons: {
            'Submit': function() {
                if ($('#messsage').val() == '') { alert("Please enter a message to email to your contacts.") }
                $(this).dialog('close');
                $('#edit_contacts_form').submit();
            }
        }
    });

    $('#send_button').click(function() {
        $('#send_email_dialog').dialog('open');
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