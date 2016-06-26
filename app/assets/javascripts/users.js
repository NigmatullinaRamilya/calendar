$(document).on('ready page:load', function () {
  $(function() {
    $( "#birthday" ).datepicker({
      dateFormat: "dd-mm-yy",
      firstDay: 1
    });
  });
});
