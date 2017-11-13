class PostController < ApplicationController
  def index #게시글 다 보여주눈 페이지
    @posts = Post.all #[게시글 1, 게시글2, 게시글3] 배열로 저장
  end

  def new #게시글 작성하는 form 페이지
  end

  def create #작성된 게시글 DB에 넣는 액션
    Post.create(
      title: params[:title],
      content: params[:content]
    )
    redirect_to '/'
  end

  def show #1개의 게시글 보는 페이지
    @post = Post.find(params[:id]) #id /숫자 값을 받아온다
  end

  def create_comment #해당하는 글에 댓글 다는 액션(show)
    Comment.create(
      content: params[:comment],
      post_id: params[:id]
    )
    redirect_to :back
  end
end
