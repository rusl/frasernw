// add parser through the tablesorter addParser method 
$.tablesorter.addParser({ 
    // set a unique id 
    id: 'waitime', 
    is: function(s) { 
        // return false so this parser is not auto detected 
        return false; 
    }, 
    format: function(s) { 
        // format your data for normalization 
        alert(s);
        return $.tablesorter.formatFloat(s.gsub('','0')); 
    },
    // set type, either numeric or text 
    type: 'numeric' 
});