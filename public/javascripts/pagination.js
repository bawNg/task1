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
        if(Number($("#contactcount")[0].value) >= 3){
            alert("you have already selected 3 users");
            cbox.checked = null;
        }
        else{
            cids_array.push(cbox.value);
            $("#contactcount").val(Number($("#contactcount")[0].value)+1);
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
        $("#contactcount").val(Number($("#contactcount")[0].value)-1);
    }

    $("#rawcids").val(cids_array.join(","));
}