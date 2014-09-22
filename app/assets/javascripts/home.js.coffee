# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.datepicker').datetimepicker()

  $("span.event_tag").click ->
    tag_id = $(this).attr('id').split("_").pop()
    if ($(this).hasClass("label-default"))
      $(this).removeClass("label-default")
      $(this).addClass("label-danger")

      $('<input>').attr({
        type: 'hidden',
        name: 'event_tag[]',
        value: tag_id
      } ).appendTo('#event_tag_field')

    else
      $(this).removeClass("label-danger")
      $(this).addClass("label-default")

      $self = $(this)
      $("input[name='event_tag[]']").each ->
        if (@.value == tag_id)
          $(this).remove()
          return
