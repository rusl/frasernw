
$(document).ready(function() {
    $('.tablesorter').tablesorter();
});
$("#container a").pjax('#container').live('click', function(){})
    
$('body').live('end.pjax', function() {
    $("#container a").pjax('#container');
    $('.tablesorter').tablesorter();
  });
