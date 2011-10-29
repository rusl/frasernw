$ ->
  $('form').bind 'nested:fieldAdded', (e) ->
    if e.field.parent().hasClass('office')
      e.field.children().last('hr').remove()
      e.field.children().first('h4').html('Location 2 (if applicable)')
      $('#add_office').remove()