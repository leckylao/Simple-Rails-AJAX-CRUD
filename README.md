Simple-Rails-AJAX-CRUD
======================

A simple Rails AJAX JS CRUD within 60 lines.

Dependency
----------
Rails.js - The Unobtrusive JS~!

Demo
----
Demo app under Demo directory

CRUD Usage
----------

###Create
Having a form with a class call ajax_create. Specify a "data-replace-target" as a append target, and specify a 'data-replace-location' as a parent location for jQuery to look for the replace target.

E.g.
```ruby
  <%= form_for comment, :remote => true, :html => {:class => 'ajax_create', 'data-replace-target' => 'ul#comments', 'data-replace-location' => 'body'} do |f| %>
```

###Destroy
Having a link with a class call ajax_destroy, and specify a "data-replace-target" as a remove target, default to "li.fields"

E.g.
```ruby
li.fields
  <%= link_to "delete", comment_path(comment, :format => :json), :method => :delete, :remote => true, :confirm => 'Are you sure?', :class => 'ajax_destroy' %>
```

###Edit
Having a link with a class call ajax_edit, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
```ruby
li.fields
  <%= link_to comment.text, edit_comment_path(comment), :remote => true, :class => 'ajax_edit' %>
```

###Update
Having a form with a class call ajax_update, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
```ruby
  <%= form_for comment, :remote => true, :html => {:class => 'ajax_update'} do |f| %>
```

###Show
Having a link with a class call ajax_show, and specify a "data-replace-target" as a replace target, default to "li.fields"

E.g.
```ruby
li.fields
  <%= link_to "Back", comment_path(comment), :remote => true, :class => 'ajax_show' %>
```

###Index(ajax refresh list)
Having a link with a class call ajax_index, and specify a "data-replace-target" as a replace target

E.g.
```ruby
li.fields
  <%= link_to "Refresh comments", post_comments_path(@post), :remote => true, :class => 'ajax_index', 'data-replace-target'=> 'ul#comments' %>
```

###Error Handle
a div#flash_alert will auto prepend to the body with server error messages
