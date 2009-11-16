
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
                var message = $("#message").val();
                $("#email_message").val(message);
                $(this).dialog('close');
                 if ($('#overall_contactcount').val() > 2){
                    $('#edit_contacts_form').submit();
                 }
                 else{
                     alert("You need to select 3 contacts as a minimum");
                 }


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

//A variable to store which ids will be passed to the controller for saving as a contact
var cids_array = [];

//Gets called onload to initialize the pagination links for ajax
$(function(){
    $(".pagination a").live("click",function(){
       $(".pagination").html("loading...");
       $.get(this.href,null,null,"script");
       return false;
    });


});

//toggles if the last checked id should be in the array to be passed to the controller for saving as a contact
function toggleInArray(cbox){
    if(cbox.checked){
        if(Number($("#currentpage_contactcount")[0].value) >= 3){
            alert("you have already selected 3 users");
            cbox.checked = null;
        }
        else{
            cids_array.push(cbox.value);
            $("#currentpage_contactcount").val(Number($("#currentpage_contactcount")[0].value)+1);
            $("#overall_contactcount").val(Number($("#overall_contactcount")[0].value)+1);
        }
    }
    else{
        for(var i=0; i < cids_array.length; i++){
            if(cids_array.length == 1){
                cids_array = [];
            }
            else if(cids_array[i] == cbox.value){
               cids_array.pop(i);
            }

        }
        $("#currentpage_contactcount").val(Number($("#currentpage_contactcount")[0].value)-1);
        $("#overall_contactcount").val(Number($("#overall_contactcount")[0].value)-1);
    }

    $("#rawcids").val(cids_array.join(","));
}