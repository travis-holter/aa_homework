class SubsController < ApplicationController

    before_action :ensure_logged_in, only: [:edit, :update]

    def new
        @sub = Sub.new
        render :new
    end
    
    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def create
        @sub = Sub.new(sub_params)

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = current_user.subs.find_by(id: params[:id])        
        render :edit
    end

    def update
        @sub = current_user.subs.find_by(id: params[:id])
        
        if @sub && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else 
            flash.now[:errors] = ["Not yours bro"]
            render :edit  
        end 
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        
        if current_user.id == @sub.moderator_id    
            @sub.destroy
        end
        redirect_to subs_url
    end

    private 

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
