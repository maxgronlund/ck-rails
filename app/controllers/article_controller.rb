class ArticleController < ApplicationController
  include SessionHelper
  before_action :ensureAdmin
  layout "admin"

  def list
    @current = User.find(session[:user_id])
    @active = 'articles'
    @section = 'Articles'

    @articles = Article.find_by_sql("select * from articles inner join users on articles.user_id = users.id")
  end

  def new
    @current = User.find(session[:user_id])
    @active = 'articles'
    @section = 'Articles'
    @tags = Tag.all
  end

  def submit
    hashid = Hashids.new('carikerjaan indonesia',8)
    @current = User.find(session[:user_id])
    currentArticle = Article.create({
                       article_title: params[:article][:title],
                       article_body: params[:article][:body],
                       user_id: session[:user_id]
                   })
    article = Article.find(currentArticle.id)
    article.article_hash_id = hashid.encode(currentArticle.id)
    article.save

    params[:article][:tags].each do |tid|
      ArticleTagsRel.create({
                                article_id: currentArticle.id,
                                tag_id: tid
                            })
    end

    flash[:success] = 'Article published.'
    redirect_to '/admin/articles'
  end


end
