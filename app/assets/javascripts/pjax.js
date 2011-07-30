
  $(document).ready(function() {
      tableToGrid('.grid');
      $("#container a").pjax('#container').live('click', function(){})
      
      $('body').live('end.pjax', function() {
        $("#container a").pjax('#container');
        tableToGrid('.grid');
        });
        
        // $('.grid').livequery(function(){ 
        // // use the helper function hover to bind a mouseover and mouseout event 
        //   alert('wwwpppp');
        //   tableToGrid(this);
        //   }, function() {});

        
        // $('table.grid').livequery(function(){ 
        //     // use the helper function hover to bind a mouseover and mouseout event 
        //         alert('wwwpppp');
        //         tableToGrid(this);
        //         // $(this) 
        //         //     .hover(function() { 
        //         //         $(this).addClass('hover'); 
        //         //     }, function() { 
        //         //         $(this).removeClass('hover'); 
        //         //     }); 
        //     }, function() {
        //         // unbind the mouseover and mouseout events 
        //         // $(this) 
        //         //     .unbind('mouseover') 
        //         //     .unbind('mouseout'); 
        //     });
        
        
      
      // $('body')
      //   // .bind('start.pjax', function() { $('#loading').show() })
      //   .bind('end.pjax',   function() { 
      //     alert('heoooollloo')
      //     tableToGrid('.grid')
      //     });
  });
  