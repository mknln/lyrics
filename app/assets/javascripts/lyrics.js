
$.ajaxSettings.traditional = true;

$(document).ready(function() {

  var reset_title_autocomplete = function() {
    $.ajax({
      url: "http://developer.echonest.com/api/v4/artist/songs",
      dataType: "jsonp",
      data: {
        api_key: "5OIRDLQ1VB9GCZUTX",
        format: "jsonp",
        name: $("#lyric_artist").val(),
        results: 100
      },
      success: function( data ) {
        if (data.response.songs) {
          var songs = $.map(data.response.songs, function( item ) {
            return item.title;
          });

          $("#lyric_title").autocomplete("option", { source: songs })
        } else {
          $("#lyric_title").autocomplete("option", { source: [] });
        }
      }
    });
  };

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
          response($.map(data.response.artists, function( item ) {
            return {
              label: item.name,
              value: item.name
            }
          }));
        },
      });
    },
    select: function(event, ui) {
      reset_title_autocomplete();
    }
  });

  $("#lyric_title").autocomplete({
    source: []
  });

  if ($("#lyric_artist").val()) {
    reset_title_autocomplete();
  }

});
