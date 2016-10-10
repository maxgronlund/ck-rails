== README

ck is carikerjaan a web based job marketplace. This web meat to expand our interaction with our followers in instagram

Follow @carikerjaan at instagram to know us more.


### Turbolink integration
Create a file app/assets/javascripts/init_ckeditor.coffee

```coffee
ready = ->
  $('.ckeditor').each ->
  CKEDITOR.replace $(this).attr('id')

$(document).ready(ready)
$(document).on('page:load', ready) } }
```
Make sure the file is loaded from your app/assets/javascripts/application.js
