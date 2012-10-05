Simple-Rails-AJAX-CRUD
======================

A simple Rails AJAX JS CRUD within 60 lines.

Dependency
----------
Rails.js - The Unobtrusive JS~!

CRUD Usage
----------

###Create
Having a form with a class call ajax_create, and specify a "data-replace-target" as a append target.

E.g.
= form_for xxx, :remote => true, :html => {:class => 'ajax_create', 'data-replace-target' => 'ul.itemList'}

###Destroy
Having a link with a class call ajax_destroy, and specify a "data-replace-target" as a remove target, default to "li.fields"

E.g.
li.fields
  = link_to "Remove", comment_path(comment, :format => :json), :method => :delete, :remote => true, :confirm => "Are you sure?", :class => "ajax_destroy"

###Edit
Having a link with a class call ajax_edit, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
li.fields
  = link_to "Edit", edit_comment_path(comment), :remote => true, :class => "ajax_edit"

###Update
Having a form with a class call ajax_update, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
= form_for @comment, :url => comment_path(@comment), :remote => true, :html => {:class => 'ajax_update', :multipart => true} do |f|

###Show
Having a link with a class call ajax_show, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
li.fields
  = link_to 'Cancel', comment_path(@comment), :remote => true, :class => 'ajax_show'

###Index(ajax refresh list)
Having a link with a class call ajax_index, and specify a "data-replace-target" as a replace target

E.g.
li.fields
= link_to "Comments", comments_path, :remote => true, :class => 'ajax_index', :data => {:target => "commets", 'replace-target' => 'ul.itemList#tasks'}

###Error Handle
a div#flash_alert will auto prepend to the #page element with server error messages
