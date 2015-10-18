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

  def edit
    @current = User.find(session[:user_id])
    @active = 'articles'
    @section = 'Articles'

    article_id = params[:ids]

    @currentArticle = Article.where(:article_hash_id => article_id).first
    @alltags = Tag.all
    @tags = Tag.find_by_sql("select * from tags inner join article_tags_rels on article_tags_rels.tag_id = tags.id where article_tags_rels.article_id = "+@currentArticle.id.to_s)
  end

  def update
    article_id = params[:ids]
    currentArticle = Article.where(:article_hash_id => article_id).first
    currentArticle.article_title = params[:article][:title]
    currentArticle.article_body = params[:article][:body]
    currentArticle.save

    ArticleTagsRel.destroy_all(article_id: currentArticle.id)

    params[:article][:tags].each do |tid|
      ArticleTagsRel.create({
                                article_id: currentArticle.id,
                                tag_id: tid
                            })
    end
    flash[:success] = 'Article updated.'
    redirect_to '/admin/articles'
  end

end
