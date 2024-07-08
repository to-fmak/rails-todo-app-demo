class RootController < ApplicationController
    # GET /
    # Renders the index page with all posts.
    def index
      @posts = Post.all
      render "index"
    end
  
    # GET /about
    # Renders the about page.
    def about
      render "about"
    end
  
    # GET /tasks
    # Renders the tasks page with all posts.
    def tasks
      @posts = Post.all
      render "tasks"
    end
  
    # POST /add
    # Creates a new post with title and description.
    # Redirects to /tasks after saving.
    def add
      @post = Post.new
      @post.title = params[:title]
      @post.description = params[:description]
      
      if @post.save
        redirect_to tasks_path, notice: "Post was successfully added."
      else
        @posts = Post.all
        render "tasks"
      end
    end
  
    # DELETE /delete/:id
    # Deletes the post with the given id.
    # Redirects to /tasks after deletion.
    def delete
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to tasks_path, notice: "Post was successfully deleted."
    end
  
    # GET /update/:id
    # Renders the update form for the post with the given id.
    def get_update
      @post = Post.find(params[:id])
      render "update"
    end
  
    # PUT /update/:id
    # Updates the post with the given id with new title and description.
    # Redirects to /tasks after updating.
    def update
      @post = Post.find(params[:id])
      @post.title = params[:title]
      @post.description = params[:description]
      
      if @post.save
        redirect_to tasks_path, notice: "Post was successfully updated."
      else
        render "update"
      end
    end
  
    # GET /search
    # Performs a search based on query parameter and renders tasks page with results.
    def search
      @query = params[:query]
      @posts = Post.where("title LIKE ?", "%#{@query}%")
      render "tasks"
    end
  end
  