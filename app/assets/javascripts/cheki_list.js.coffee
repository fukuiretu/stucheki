# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".selectpicker").selectpicker ->
    style: "btn-info"
    size: 4

  $(".selectpicker").change ->
    chekievent_id = $(this).parents('article').attr('id').split("_").pop()
    $.ajax "/cheki_list/update/",
      type: "POST"
      dataType: "html"
      data: {
              id : chekievent_id,
              status : $(this).val()
            }
      success: (data, textStatus, jqXHR) ->
        $('.alert-success').fadeIn(500).delay(2000).fadeOut(500)
      error: (jqXHR, textStatus, errorThrown) ->
        $('.alert-danger').fadeIn(500).delay(2000).fadeOut(500)

  $("a[name='del_link']").click ->
    chekievent_id = $(this).parents('article').attr('id').split("_").pop()
    $("#del_exec").attr("href", "/cheki_list/delete/" + chekievent_id)
    $('#myModal').modal()
