// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  	$('.datepicker').datePicker({inline:true})
    .bind(
    'dateSelected',
    function(e, selectedDate, $td)
    {
    $('#league_start_on').val(selectedDate.asString());
    }
    );
});