class AuthorsController < ApplicationController

    # get '/articles'
    def index
        articles = Article.all
        render json: articles
    end

    # get '/authors/:id'
    def show
        author = Author.find(params[:id])
        if author
            article = author.article.all
            render json: article
        else
            render json: {error: "Author cannot be found"}, status: :unprocessable_entity
        end
    end
    
    # get 'authors'
    def author_index
        author = Author.all
        render json: author
    end
    
end
