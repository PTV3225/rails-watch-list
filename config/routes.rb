Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# A user can see all the lists
get '/lists', to: 'lists#index'

# A user can see the details of a given list and its name
get '/lists/new', to: 'lists#new'
post '/lists', to: 'lists#create'

get '/lists/:id', to: 'lists#show', as: :list

# A user can add a new bookmark (movie/list pair) to an existing list
get '/lists/:list_id/bookmarks/newbookmark', to: 'bookmarks#newbookmark', as: :add_bookmarks
post '/lists/:list_id/bookmarks', to: 'bookmarks#create', as: :list_bookmarks

# A user can delete a bookmark from a list
delete '/bookmarks/:id', to: 'bookmarks#destroy', as: :delete_bookmarks

end


# Features
# Once again, you must have a precise idea of the features of your app in order to build your routes. Here is the list of features:

# A user can see all the lists
# GET "lists"
# A user can see the details of a given list and its name
# GET "lists/42"
# A user can create a new list
# GET "lists/new"
# POST "lists"
# 4 - Routing, Controller, Views for bookmarks
# A user can add a new bookmark (movie/list pair) to an existing list
# Checkout simple_form docs about f.association to easily create a select dropdown for our list of movies.
# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"
# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
