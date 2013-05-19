
$(document).ready(function() {

  $("#lyric_artist").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: "http://developer.echonest.com/api/v4/artist/search",
        dataType: "jsonp",
        data: {
          api_key: "5OIRDLQ1VB9GCZUTX",
          format: "jsonp",
          name: request.term,
          sort: 'familiarity-desc',
          results: 10
        },
        success: function( data ) {
          //console.log(data);
          response($.map(data.response.artists, function( item ) {
            return {
              label: item.name,
              value: item.name
            }
          }));
        }
      });
    }
  });
});
