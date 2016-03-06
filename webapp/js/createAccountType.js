//$("#scheduleBtn").button();
//$("#loginBtn").button().click(function(){});
$("#newActTypeBtn").on('click', function () {
    bootbox.dialog({
        title: "Create New Account Type",
        message: "<form role='form' id='actType' method='POST' action='ActTypeValidation.jsp' onsubmit='return validate()'>"
                + "<div class='form-group'>"
                + "<label for='name'>Name</label>"
                + "<input class='form-control' type='text' name='name' id='name' value=''>"
                + "</div>"
                + "</form>"
//                + "<input type='submit' value='Login' id='loginBtn2' class='btn btn-default'>"
        ,
        buttons: {
            success: {
                label: "Create",
                className: "btn-primary",
                callback: function () {
                    document.getElementById("actType").submit();
                }
            }
        }

    });
//    bootbox.alert("noooooo", function(){});
});
$("#leftAccordion").accordion({heightStyle: content});
$("#rightAccordion").accordion({heightStyle: content});
//$("#scheduleBtn").button().click(function(){});


function validate() {
    var name = document.forms["actType"]["name"].value;
    
    if (name === null || name === "") {
        $("#name").notify("Please enter a name", "error",
                {elementPosition: 'bottom center',
                    globalPosition: 'bottom center'})
        return false;
    }

    
}