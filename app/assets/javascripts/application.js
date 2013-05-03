

$(function() {
    $("#invoices th a, #invoices .pagination a").live("click", function() {
        $.getScript(this.href);
        return false;
    });

});