# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".selectpicker").selectpicker ->
    style: "btn-info"
    size: 4

  $(".selectpicker").change ->
    chekilist_id = $(this).attr("id").split "_"
    $.ajax "/cheki_list/update",
      type: "POST"
      dataType: "html"
      data: {
              id : chekilist_id[1],
              status : $(":selected").attr("value")
            }
      success: (data, textStatus, jqXHR) ->
        $('.alert-success').fadeIn(500).delay(2000).fadeOut(2000)
      error: (jqXHR, textStatus, errorThrown) ->
        $('.alert-danger').fadeIn(500).delay(2000).fadeOut(2000)
