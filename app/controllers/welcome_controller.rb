class WelcomeController < ApplicationController
  def index
    @article = Article.last(8)
  end
end
