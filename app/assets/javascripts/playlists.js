
function inject_youtube_iframe_api() {
  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
}

function countdown_to_page_skip() {
  if ($("#next-lyric-id").length > 0) {

    var stop_timer = false;
    $(".stop-timer").click(function(e) {
      e.preventDefault();
      stop_timer = true;
    });

    $("#countdown-timer").show();
    var counter = function(n) {
      if (stop_timer) {
        return;
      }

      if (n == 0) {
        window.location = window.location.pathname + "?lyric_id=" + $("#next-lyric-id").html();
      } else {
        $("#countdown-timer .time").html(n);
        setTimeout(function() { counter(n - 1); }, 1000);
      }
    }
    counter(5);
  }
}


$(document).ready(function() {
  
  inject_youtube_iframe_api();

  window.onYouTubeIframeAPIReady = function() {
    if ($(".video-player #youtube-id").length > 0) {
      var id = $(".video-player #youtube-id").html();
      new YT.Player('player_' + id, {
        events: {
          'onStateChange': function(event) {
            if (event.data == YT.PlayerState.ENDED) {
              if ($("#next-lyric-id").length > 0) {
                window.location = window.location.pathname + "?lyric_id=" + $("#next-lyric-id").html();
              }
              // forward them to the next video
            }
          },
          'onReady': function(event) {
            event.target.playVideo();
          }
        }
      });
    } else {
      countdown_to_page_skip();
    }
  };

  var options = {
    source: "/lyrics/search.json",
    select: function(event, ui) {
      $(this).prevAll(".lyric_id").val(ui.item.id);
    }
  };

  $(".lyric_id_search").autocomplete(options);

  $(document).on("focus", ".lyric_id_search:not(.ui-autocomplete-input)", function (event) {
    $(this).autocomplete(options);
  });
  
});

