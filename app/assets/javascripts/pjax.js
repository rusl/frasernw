
  $(document).ready(function() {

      $("#container a").pjax('#container').live('click', function(){})
      $("#container").bind('end.pjax', function() { $("#container a").pjax('#container') })
      tableToGrid('.grid');
  });
  