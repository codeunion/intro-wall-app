# CodeUnion Social Wall Application

This is a basic web application written in Ruby using the
[Sinatra web framework][sinatra-homepage].  It's meant to illustrate
some of the key ideas in a database-backed web application.

## Core Ideas

The Wall App is meant to illustrate a few critical ideas:

1.  Using templates (aka _views_) to generate HTML
2.  Conventional patterns for [defining routes][glossary-routes], rendering
    views, and processing requests.
3.  Using a relational database to store structured information.  We use
    the [SQLite][sqlite-homepage] database in this application.
4.  Using an [object-relational mapper][glossary-orm] (aka an _ORM_) to
    interact with the database in Ruby.  We use the
    [DataMapper][datamapper-homepage] library in this application.

## What to Build

Once you have the application running (see below), visit the homepage.  You
should see a large empty text field (a `<textarea>` tag in HTML).  Enter some
text into the box and click the _Post Message_ button.

Open `wall-app.rb` in your editor of choice.  Try to figure out which parts
of the page you're looking at correspond to which pieces of code in
`wall-app.rb`.  It helps a lot to have the browser and code open side-by-side
so that you can look at both simultaneously.

Your goal is to make the web application do something — _anything_ — different
than what it does when you first run it.  This can involve anything from
adding new pages to adding new behavior to a particular page.  Here are some
ideas:

1.  Add a new field to the `Message` model, e.g., `author`.  Modify the
    form in `views/index.erb` to allow users to enter this information.
    Modify the relevant pieces of code in `wall-app.rb` so that this
    information is saved to the database when a user submits the form.

2.  Modify the template code to use a _layout template_ (or just _layout_).
    A _layout_ is a template that acts as a "harness" into which your other
    templates can be inserted.

    Most commonly your layout template would contain whatever HTML is shared
    among all of your pages, e.g., the `<html>` tag, the `<head>...</head>`
    tag, any shared headers or footers, and so on.  See the
    [layouts section][sinatra-layouts] in the Sinatra Book.

3.  Add support for upvoting messages.  Change the homepage so that the
    messages are ordered by the number of upvotes.

    If you've done this, allow the user to specify whether they want to sort
    the  messages chronologically or by number of upvotes with a URL parameter
    along the lines of `/?order=recent`, `/?order=upvotes`, etc.  Link to these
    URLs from the homepage so a user can simply click a link to change the sort
    order rather than having to manually modify the URL.

4.  Really, any ideas you have are great — big or small, serious or silly! The
    list above is just meant to give you some ideas.

## Running the Application

### Installing the Required Dependencies

Before you run this application, you have to install the libraries it requires
to do its work (these are specified in the `Gemfile`).  To do this, run

```shell-session
$ bundle install --without production
```

This will ensure you've installed all the libraries required to run the
application.  **Note**: you only have to run this command _once_.

### Launching the Web Application

Next, run the following command:

```shell-session
$ ruby wall-app.rb
```

To stop your application, press `Ctrl+c`.  That's "Control" plus the "c" key.

  [sinatra-homepage]: http://www.sinatrarb.com/
  [datamapper-homepage]: http://datamapper.org/
  [sqlite-homepage]: http://sqlite.org/
  [glossary-routes]: http://glossary.codeunion.io/route-sinatra/
  [glossary-orm]: http://glossary.codeunion.io/object-relational-mapping/
  [sinatra-layouts]: https://github.com/sinatra/sinatra-book/blob/master/book/Getting_to_know_Sinatra.markdown#templates
