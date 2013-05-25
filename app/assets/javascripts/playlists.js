
function remove_fields(link) {
  $(link).parent(".field").remove();
}

function add_fields(link, association, content) {
  var html = '<div class="field">';
  html += '<label for="playlist_lyric_ids_">Lyric ID: </label>';
  html += '<input id="playlist_lyric_ids_" name="playlist[lyric_ids][]" size="30" type="text" value="">';
  html += ' <a href="#" onclick="remove_fields(this); return false;">remove</a>';
  html += '</div>';
  
  $(link).before(html);
}

