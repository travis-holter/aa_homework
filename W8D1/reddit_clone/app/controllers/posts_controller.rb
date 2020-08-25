class PostsController < ApplicationController

    def new
        render :new
    end

    def show
        @post = Post.find(params[:id])
        render :show 
    end

    def create

    end 

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end

end
