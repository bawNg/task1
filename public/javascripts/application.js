$(document).ready(function (){
    $('#user_date_of_birth').datepicker({changeMonth: true, changeYear: true,
                                         minDate: '-116Y', maxDate: '-16Y',
                                         yearRange: '-100:+100' });
});