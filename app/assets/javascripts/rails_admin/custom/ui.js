$(document).on('rails_admin.dom_ready', function(){
    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
            vars[key] = value;
        });
        return vars;
    }

    $('.order_id_field[title="'+getUrlVars()['o']+'"]').parents('tr').find('td').css('background-color', '#f7f786');
});
