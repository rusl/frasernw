
// added by krh
$.tablesorter.addParser({ 
    // set a unique id 
    id: 'waittime', 
    is: function(s) { 
      return false; 
    }, 
		format: function(s) {
			if (s === ('' || "n/a")) {
  			return null;
			} else {
			  return s;
			}
		}, 
    // set type, either numeric or text 
    type: 'numeric' 
});
// added by krh to push blanks to bottom
$.tablesorter.addParser({ 
    // set a unique id 
    id: 'blanks_to_bottom', 
    is: function(s) { 
      return false; 
    }, 
		format: function(s) {
			if (s === ('' || "n/a")) {
  			return null;
			} else {
			  return s;
			}
		}, 
    // set type, either numeric or text 
    type: 'text'
});