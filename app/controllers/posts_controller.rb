class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    #1.
    post = Post.create(title: params[:title],
                body: params[:body]
    )

    #text안에 변수를 넣을 때 (string interpolation)
    #반드시 ""를 사용해야 함.
    redirect_to "/posts/#{post.id}"

    # #1.1
    # Post.create(:title => params[:title], :body => params[:body])
    # #2.
    # post = Post.new
    # post.title = params[:title]
    # post.body = params[:body]
    # post.save
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end

end
