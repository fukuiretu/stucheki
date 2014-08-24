# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.datepicker').datetimepicker()

  $("span.event_tag").click ->
    if ($(this).hasClass("label-default"))
      $(this).removeClass("label-default")
      $(this).addClass("label-danger")
    else
      $(this).removeClass("label-danger")
      $(this).addClass("label-default")
