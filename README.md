couch\_blog
==========

[![Build Status](https://secure.travis-ci.org/bterkuile/couch_blog.png)](http://travis-ci.org/bterkuile/couch\_blog)

Rails 4 Blog engine using SimplyStored as CouchDB orm. At the moment it
is developed to use together with the
[cmtool](https://github.com/bterkuile/cmtool) gem, so please read the
documentation of this gem first, or try your luck.

## Implement

### Gemfile
A normal `Gemfile` now would look like:

```ruby
gem 'simply_stored', github: 'bterkuile/simply_stored'
gem 'cmtool'
gem 'couch_blog'
```

### Custom layout
You may want to use a custom layout, more fitting together with your
[cmtool](https://github.com/bterkuile/cmtool) website.
Therefore implement the following in your
`app/controllers/application_controller.rb` to render your custom
created layout at location `app/views/layouts/blog.html.slim`
```ruby
class ApplicationController < ActionController::Base

  def couch_blog_render
    @page = Page.find_by_name('blog') || Page.new(name: 'blog', locale: I18n.locale)
    {layout: "blog"}
  end

end
```

### Custom view
To create a custom view, create a file eg:
`app/views/couch_blog/posts/index.html.haml`

having your custom content:
```haml
- for post in @posts
  .post
    .date
      %span.month= post.date.strftime('%b')
      %span.day= post.date.day
      %span.year= post.date.year
    %h2.title= link_to post.title, couch_blog.post_path(post.id, post.title.to_s.downcase.gsub(/[_\W]+/, '-'))
    .post-body=raw post.body

```
