
$.ajaxSettings.traditional = true;

var GOOGLE_API_LOADED = false;
function googleApiLoaded() {
  gapi.client.setApiKey(GOOGLE_API_KEY);
  gapi.client.load('youtube', 'v3', function() {
    GOOGLE_API_LOADED = true;
  });
}

$(document).ready(function() {

  var reset_title_autocomplete = function() {
    $.ajax({
      url: "http://developer.echonest.com/api/v4/artist/songs",
      dataType: "jsonp",
      data: {
        api_key: ECHONEST_API_KEY,
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
          api_key: ECHONEST_API_KEY,
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

  $(document).on("click", ".open-youtube-window", function(e) {
    e.preventDefault();

    var id = $(this).attr("youtube-id");
    var options = "left=20,top=20,width=740,height=580";
    window.open('http://youtube.com/watch?v='+id, 'youtube', options);
  });

  $(document).on("click", ".select-youtube-link", function(e) {
    e.preventDefault();

    var id = $(this).attr("youtube-id");
    $("#lyric_youtube_id").val(id);
  });

  $("#fetch-youtube-results").click(function(e) {
    e.preventDefault();

    if (!GOOGLE_API_LOADED)
      return;

    var q = $("#lyric_artist").val() + " " + $("#lyric_title").val();
    var request = gapi.client.youtube.search.list({
      q: q,
      part: 'id,snippet'
    });

    request.execute(function(response) {
      if (response && response.result) {

        $("#youtube-results").empty();

        var items = response.result.items;
        for (var i = 0; i < items.length; i++) {
          var preview_link = '<a href="#" class="open-youtube-window" youtube-id="'+items[i].id.videoId+'">Preview</a>';
          var select_link = '<a href="#" class="select-youtube-link" youtube-id="'+items[i].id.videoId+'">Select</a>';
          $("#youtube-results").append("<p>"+items[i].snippet.title+" "+preview_link+" | "+select_link+"</p>");
        }
      }
    });
  });
});
