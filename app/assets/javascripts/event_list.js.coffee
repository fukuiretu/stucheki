# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("a[name='stock_link']").click ->
    alert($(this).attr("id"))
    $("#stock_exec").attr("href", "/event_list/stock/" + $(this).attr("id"))
    $('#modal').modal()
