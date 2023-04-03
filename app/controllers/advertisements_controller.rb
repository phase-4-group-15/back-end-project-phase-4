class AdvertisementsController < ApplicationController

        before_action :require_login, except: [:show, :index, :create ]

        def index
            advertisements = Advertisement.all.includes(:user)
            render json: advertisements.to_json(only: [:image, :title, :genre, :release_date], include: { user: { only: [:username] } })
         end
          
    
        def show
            user = User.find_by(id: session[:user_id])
            if user 
                ad = Advertisement.find_by(id: params[:id])
                render json: ad.to_json(only: [:image, :title, :genre, :release_date], include: [ user: {only: [:username]}])
            else
                render json: { error: "You are not logged in"}, status: :unprocessable_entity
            end
        end

        def create
            ad = Advertisement.create(title: params[:title], content: params[:content], release_date: params[:release_date], image: params[:image], user_id: params[:userId])
          
            if ad.save
              render json: ad, status: :created
            else
              render json: { errors: ad.errors.full_messages }, status: :unprocessable_entity
            end
        end
    
    
end
