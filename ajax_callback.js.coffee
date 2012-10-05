jQuery ->
  # Create
  $(document)
    .on 'ajax:complete', 'form.ajax_create', (event, xhr, status) =>
      target = event.target.dataset.replaceTarget
      location = event.target.dataset.replaceLocation
      if status == 'success' || xhr.status < 500 && xhr.responseText?
        if location?
          $(event.target).closest(location).find(target).prepend( $(xhr.responseText).hide().fadeIn 'medium' )
        else
          $(event.target).parent().find(target).prepend( $(xhr.responseText).hide().fadeIn 'medium' )
        if event.target.dataset.hide != 'false'
          $(event.target).slideToggle 'medium'
          $(event.target).clearForm()

  # Destroy
  $(document)
    .on 'ajax:success', 'a.ajax_destroy', (event, data, status, xhr) =>
      if event.target.dataset.replaceTarget?
        target = event.target.dataset.replaceTarget
      else
        target = "li.fields"
      $(event.target).closest(target).slideUp "slow", ->
        $(event.target).closest(target).remove()

  # Edit, Update, Show
  $(document)
    .on 'ajax:complete', 'a.ajax_edit, form.ajax_update, a.ajax_show', (event, xhr, status) =>
      if event.target.dataset.replaceTarget?
        target = event.target.dataset.replaceTarget
      else
        target = "li.fields"
      if status == 'success' || xhr.status < 500 && xhr.responseText?
        $(event.target).closest(target).replaceWith($(xhr.responseText).hide().fadeIn 'medium')

  # Index
  $(document)
    .on 'ajax:success', 'a.ajax_index', (event, data, status, xhr) =>
      target = event.target.dataset.replaceTarget
      $(target).html($(data).hide().fadeIn 'medium')

  handleError = (event, data, status, xhr) ->
    error_div = $('#flash_alert')
    if error_div.length > 0
      error_div.replaceWith("<div id='flash_alert'>#{data.statusText}</div>")
    else
      $('#page').prepend("<div id='flash_alert'>#{data.statusText}</div>")

  $(document)
    .on 'ajax:before', () =>
      $("body").mask("Processing...")
    .on 'ajax:complete', (event, xhr, status) =>
      $("body").unmask()
    .on 'ajax:success', (event, data, status, xhr) =>
      $("body").unmask()
    .on 'ajax:error', (event, data, status, xhr) =>
      $("body").unmask()
      handleError(event, data, status, xhr)
