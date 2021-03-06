class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def tagged
	  if params[:tag].present?
	    @articles = Article.tagged_with(params[:tag])
	  else
	    @articles = Article.postall
	  end
	end

	def create
  		@article = Article.new(article_params)
  		@article.user_id = current_user.id
	  	if @article.save
	    	redirect_to @article
	  	else
	    	render 'new'
  		end
	end

	def destroy
	  @article = Article.friendly.find(params[:id])
	  @article.destroy

	  redirect_to articles_path
	end

	def show
  		@article = Article.friendly.find(params[:id])
	end

	def index
 		@articles = Article.all
 		 if params[:tag]
		    @articles = Article.tagged_with(params[:tag])
		  else
		    @articles = Article.all
		  end
	end

	def edit
  		@article = Article.friendly.find(params[:id])
	end

	def update
	  @article = Article.friendly.find(params[:id])

	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

  	private
	  def article_params
	    params.require(:article).permit(:title, :text, :tag_list, :pics
	    	)
	  end


end
