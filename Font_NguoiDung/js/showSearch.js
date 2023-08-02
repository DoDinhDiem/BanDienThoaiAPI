$(document).ready(function() {
    $('#show-search').css('display', 'none');
    $('#button-search').click(function() {
        $('#show-search').css('display', 'block');
        $('#non-search').css('display', 'none');
        $('#product').css('display', 'none');
    });
});
