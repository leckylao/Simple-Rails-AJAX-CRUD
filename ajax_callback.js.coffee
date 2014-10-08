# Functions
handleError = (event, xhr, status, error) ->
  error_div = $('div#alert')
  if error_div.length > 0
    error_div.replaceWith("<div id='alert'>#{xhr.statusText}</div>")
  else
    $('header').append("<div class='alert alert-error'><a href='#' class='close' data-dismiss='alert'>&times;</a><div id='alert'>#{xhr.statusText}</div></div>")

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
      $(event.target)[0].reset()

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
  .on 'ajax:success', 'a.ajax_edit, form.ajax_update, a.ajax_show', (event, data, status, xhr) =>
    if event.target.dataset.replaceTarget?
      target = event.target.dataset.replaceTarget
    else
      target = "li.fields"
    if status == 'success' && data?
      $(target).replaceWith(data)

# Index
$(document)
  .on 'ajax:success', 'a.ajax_index, form.ajax_index', (event, data, status, xhr) =>
    target = event.target
    $target = $(target)
    replace_target = $target.data("replace-target")
    $(replace_target).html(data).hide().fadeIn('medium')

# Error
$(document)
  .on 'ajax:error', (event, xhr, status, error) =>
    if(xhr.status is 401)
      location.reload()
    else
      handleError(event, xhr, status, error)
    end

# Before Hook
$(document)
  .on 'ajax:beforeSend', (event, xhr, settings) =>
    $target = $(event.target)
    replace_target = $target.data("replace-target")
    mask(replace_target)

# After Hook
$(document)
  .on 'ajax:complete', (event, xhr, status) =>
    $target = $(event.target)
    replace_target = $target.data("replace-target")
    unmask(replace_target)
    anchor = $target.data('anchor')
    try
      history.replaceState({turbolinks: true, url: $target.attr('href')}, anchor, location.href)
    catch error
      if error.message is "Object doesn't support property or method 'replaceState'"
        # Ignore for IE less than 10
      else
        console.log error
