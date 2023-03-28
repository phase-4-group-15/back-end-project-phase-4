class AuthorsController < ApplicationController

    # get '/authors/:id'
    author = Author.find(params[:id])
    if author
        article = author.article.all
        render json: article
    else
        render json: {error: "Author cannot be found"}, status: :unprocessable_entity
    end
end
