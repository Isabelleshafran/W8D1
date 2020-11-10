class PostsController < ApplicationController

    def new 
        @post = Post.new
        @post.sub_id = params[:sub_id] #we need this so our rendering new template doesnt break between http requests 
        render :new 
    end

    def create 
        @post = Post.new(post_params)
        @post.sub_id = params[:sub_id]
        @post.author_id = current_user.id
        if @post.save 
            redirect_to post_url(@post.id)
        else  
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show 
        @post = Post.find_by(id: params[:id])

        if @post 
            render :show 
        else  
            flash[:errors] = ["Post does not exist"]
            redirect_to subs_url
        end
    end

    def edit
        @post = current_user.posts.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = current_user.posts.find_by(id: params[:id])

        if @post && @post.update(post_params)
            redirect_to post_url(params[:id])
        else 
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def destroy
        @post = current_user.posts.find_by(id: params[:id])

        if @post && @post.delete 
            redirect_to sub_url(@post.sub_id)
        else 
            flash[:errors] = ["Can only delete your own posts"]
            redirect_to post_url(@post.id)
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end


end
