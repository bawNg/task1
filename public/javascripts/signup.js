jQuery.ajaxSetup({
    'beforeSend': function (xhr) { xhr.setRequestHeader("Accept", "text/javascript"); }
});

function stateSelected() {
    if (!$('#user_state').val()) { return; }
    var state_name = $('#user_state').val();
    $('#user_city')[0].options.length = 1;
    $('#user_city')[0].options[0] = new Option("Loading...");
    $.post("/javascripts/cities", {"state": state_name}, null, "script");
}

$(document).ready(function (){
    $('#user_date_of_birth').datepicker({changeMonth: true, changeYear: true,
                                         minDate: '-116Y', maxDate: '-16Y',
                                         yearRange: '-100:+100' });
    $('#user_state').bind('change', stateSelected);
    if ($('#user_city')[0].options.length == 1) { stateSelected(); }
});