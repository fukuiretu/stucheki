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
        $('.alert-success').fadeIn(500).delay(1000).fadeOut(1000)
      error: (jqXHR, textStatus, errorThrown) ->
        $('.alert-danger').fadeIn(500).delay(1000).fadeOut(1000)

  $("a[name='del_link']").click ->
    self = $(this)
    alert('aaaaa:' + self.attr('id'))

    # TODO modalの中を書き換える
    $("#del_exec").attr("href", "/cheki_list/delete/" + self.attr('id'))
    $('#myModal').modal()

    #
    # $('#myModal').on('show.bs.modal', (e) ->
    #   alert('hogehoge:' + self.attr('id'))
    # )

    # alert()
    # $('#myModal').modal({show:true})
    # location.href = $(this).attr("href")
