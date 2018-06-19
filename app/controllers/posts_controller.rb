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

    flash[:notice]="글이 작성되었습니다."
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
    flash[:alert]="글이 삭제되었습니다."
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(title: params[:title],
                body: params[:body])
    flash[:notice]="글이 수정되었습니다."
    redirect_to "/posts/#{post.id}"
  end

end
