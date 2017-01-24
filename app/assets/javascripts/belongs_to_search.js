// belongs_to form
$(function() {
  $(".field-unit--belongs-to-search select").selectize({
    valueField: 'id',
    labelField: 'dashboard_display_name',
    searchField: 'dashboard_display_name',
    create: false,

    load: function(query, callback) {
      if (!query.length) return callback();
      this.searchUrl = this.searchUrl || $(".field-unit--belongs-to-search select").data('url');
      var searchUrl = this.searchUrl + '?search=';
      $.ajax({
        url: searchUrl + encodeURIComponent(query),
        type: 'GET',
        error: function() {
          callback();
        },
        success: function(res) {
          callback(res.resources);
        }
      });
    }
  });
});
