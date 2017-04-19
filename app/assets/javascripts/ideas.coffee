$ ->
  $('.idea-body').hide()
  $('.idea-title').click ->
    $(this).find('.idea-body').slideToggle()
