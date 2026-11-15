// belongs_to form
$(function() {
  $(".field-unit--belongs-to-search select").each(function initializeSelectize(index, element) {
    var $element = $(element);
    var searchFields = $element.data('search-fields') && $element.data('search-fields').split(',')
    $element.selectize({
      valueField: 'id',
      labelField: 'dashboard_display_name',
      searchField: searchFields || 'dashboard_display_name',
      create: false,
      searchUrl: $element.data('url') + '?search=',

      load: function(query, callback) {
        if (!query.length) return callback();
        var searchUrl = this.settings.searchUrl;
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
      },
    });
  });
});
