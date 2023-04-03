class AdvertisementsController < ApplicationController
    before_action :require_login, except: [:show ]


    def index
        user = User.find_by(id: session[:user_id])
        if user 
            ad = Advertisement.all
            render json: ad.to_json(only: [:image, :title, :genre, :release_date], include: [ user: {only: [:username]}])
        else
            render json: { error: "You are not logged in"}, status: :unprocessable_entity
        end
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
end
