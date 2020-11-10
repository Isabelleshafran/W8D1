class SubsController < ApplicationController

    before_action :require_logged_in
    # before_action :is_moderator?, only: [:edit, :update]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub.id)
        else 
            flash[:errors] = ["Title and description can't be blank"]
            render :new
        end
    end

    def index 
        @subs = Sub.all 
        render :index
    end

    def show 
        @sub = Sub.find_by(id: params[:id])
        if @sub 
            render :show 
        else 
            flash[:errors] = ["Sub not found"]
            redirect_to subs_url
        end
    end

    def edit 
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub
            render :edit
        else
            flash[:errors] = ["You don't own this sub!"]
            redirect_to sub_url(params[:id])
        end
    end

    def update 
        @sub = current_user.subs.find_by(id: params[:id])

        if @sub && @sub.update(sub_params)
            redirect_to sub_url(params[:id])
        else 
            flash[:errors] = @sub.errors.full_messages 
            render :edit
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
