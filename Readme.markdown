# Poirot

## Description

Allows you to use [Mustache](http://mustache.github.com/) template partials in Rails, also
ads a helper method to easily allow JavaScript to re-use the same templates.

## Usage

Create a partial just like you would with erb, prefixing the name with an underscore.

    app/views/posts/_post_list.html.mustache

The template will have access to all normal rails helper methods and any instance variables
that were set in the controller.  If you need more than this an optional view class can be
included, it should have the same name as the partial, but without the underscore.

    app/views/posts/post_list_view.rb
    
    module Posts
      class PostListView < Poirot::View
        def foo
          "bar"
        end
    
        def post_link
          post_path(post)
        end
      end
    end

The view class has access to all the normal Rails helpers and access to the controller
instance variables, e.g @post becomes the method post.

Also included is a simple view helper for including mustache templates in a page ready for
use by JavaScript.

    <%= template_include_tag 'post_list' %>

The above will insert a script tag with the contents of the partial called `post_list`, the 
type will be set as `text/mustache` and the id will be `post-list-template`.

    <script id="post-list-template" type="text/mustache">
      <!-- template will be here! -->
    </script>

### Javascript Helper

Poirot also adds a javascript helper for using mustache templates from the browser.  In Rails 3.1 this will be automatically added to the asset pipeline.

If you are using rails 3 then you can run the `rails g poirot:install` to install the javascripts in your application.

Using the poirot javascript helper is simple, given a template added to the page using `template_include_tag`

    <%= template_include_tag 'post_list' %>

You can render this template from javascript by doing the following

    poirot.postList()

This will return the contents of the `post_list` template wrapped in a jQuery object, ready for inserting into the dom.  If you have data to pass to the template then you can pass it as the argument to the function, e.g.

    poirot.postList({foo: "bar"})

## Dependencies

*  Rails >3.0.0
*  Mustache

## More

An [example](http://github.com/olivernn/notepad) app using Poirot

## Credits

[Mark Evans](http://github.com/markevans) & [Oliver Nightingale](http://github.com/olivernn)