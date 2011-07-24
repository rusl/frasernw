Stash = {
  supported: function() {
    try {
      return 'localStorage' in window && window['localStorage'] !== null;
    } catch(e) {
      return false;
    }
  },
  storage_check: function(url) {
    return !!localStorage[url];
  },
  fetch: function(url) {
    var mycopy = null;
    if (this.supported() && this.storage_check(url)) {
      mycopy_data = localStorage[url];
      mycopy = eval(mycopy_data);
      setTimeout(this.normal_fetch, 5000, url, false); // background update
    } else {
      mycopy = this.normal_fetch(url, true); // blocking fetch 
    }
    return mycopy;
  },
  save: function(url, data) {
    try {
      localStorage[url] = data;
    } catch (e) {
      return false;
    } 
    return true;
  },
  normal_fetch: function(url, blocking) {
    var self = this;
    var is_blocking = !!blocking;
    var myurl = url;
    var mycopy;
    $.ajax({
      url: myurl,
      async: (is_blocking ? false : true),
      success: function(data) {
        mycopy = eval(data);
        Stash.save(myurl, data);
      },
      error: function(data) {

      }
    });
    return mycopy;
  }
};