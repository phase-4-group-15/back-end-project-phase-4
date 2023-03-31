class ArticlesController < ApplicationController
    before_action :require_login
    # , only: [:index,:show, :create, :update, :destroy]
  
    def index
      articles = Article.all
      render json: articles
    end
  
    def show
      article = Article.find_by(id: params[:id])
      if article
        render json: article
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
    def create
      article = current_user.articles.build(article_params)
      if article.save
        render json: article, status: :created
      else
        render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      article = Article.find_by(id: params[:id])
      if article && article.user == current_user
        if article.update(article_params)
          render json: article
        else
          render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Article not found or unauthorized" }, status: :not_found
      end
    end
  
    def destroy
      article = Article.find_by(id: params[:id])
      if article && article.user == current_user
        article.destroy
        head :no_content
      else
        render json: { error: "Article not found or unauthorized" }, status: :not_found
      end
    end
  
    def like
      article = Article.find_by(id: params[:id])
      if article
        article.likes += 1
        article.save
        render json: article
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
    def dislike
      article = Article.find_by(id: params[:id])
      if article
        article.dislikes += 1
        article.save
        render json: article
      else
        render json: { error: "Article not found" }, status: :not_found
      end
    end
  
    private
  
    def article_params
      params.require(:article).permit(:title, :description, :image, :category)
    end
  
   
    
  end
  








#   before_action :session_expired?, except: [:index]
 
#   def index
#     articles = Article.all
#     render json: articles
#   end
 
# def create
#     todo = user.todos.create(todo_params)
#     if todo.valid?
#         app_response(status: :created, data: todo)
#     else
#         app_response(status: :unprocessable_entity, data: todo.errors, message: 'failed')
#     end
# end

# def update
#     todo = user.todos.find(params[:id]).update(todo_params)
#     if todo
#         app_response(data: { info: 'updated todo successfully' })
#     else
#         app_response(message: 'failed', data: { info: 'something went wrong. could not update todo' }, status: :unprocessable_entity)
#     end
# end

# def destroy
#     user.todos.find(params[:id]).destroy
#     app_response(message: 'success', data: { info: 'deleted todo successfully' }, status: 204)
# end

# private

# def todo_params
#     params.permit(:title, :description, :status, :priority)
# end

# def authorize
#   return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
# end

# end
#   def index
#     # user = User.find_by(id: session[:user_id])
#     # author = Author.find_by(id: session[:user_id])
#     user 
#       articles = Article.all
#       render json: articles
#     # else
#     #   render json: { errors: ["You are not logged in."] }, status: :unprocessable_entity
#     # end
#   end

#   def show
#     user = User.find_by(id: session[:user_id])
#     author = Author.find_by(id: session[:user_id])

#     if user 
#       article = Article.find(params[:id])
#       render json: @article
#     else
#       render json: article.errors, status: :unprocessable_entity
#     end
#   end

#   def create
#     article = Article.create(article_params)
#     if article
#       render json: article, status: :created
#     else
#       render json: article.errors, status: :unprocessable_entity
#     end 
#   end

#   def update
#     article = Article.find(params[:id])

#     if article.update(article_params)
#       render json: article
#     else
#       render json: article.errors, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     article = Article.find(params[:id])
#     article.destroy
#   end

#   private

#   def article_params
#     params.permit(:title, :description, :image, :category)
#   end

# end
  