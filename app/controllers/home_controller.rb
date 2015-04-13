class HomeController < ::ApplicationController
  def index
    @service_article = Article.batch_articles("services").order(sequence: :asc).take(5)
    @about_us = Article.find_by_type("about_us")
    @slideshows = Slideshow.all

    @enquiry = Enquiry.new
  end

  def show
    @partial_name = return_parital_name
    
    @articles = Article.batch_articles(params[:partial])
      .order(sequence: :asc).pagination(params[:page], 4)
  end

  def show_article
    @partial_name = return_parital_name

    raise ActionController::RoutingError.new('Not Found') unless get_article.present?
    @article = get_article
  end

  def search
    @index = 0;
    @results = search_articles.order(updated_at: :desc).pagination(params[:page], 6)
  end

  private

  def search_articles
    Article.batch_articles("services").search(params[:key_words])
  end

  def return_parital_name
    raise ActionController::RoutingError.new('Not Found') unless partial?
    params[:partial].include?('-') ? params[:partial].gsub!(/-/, "_") : params[:partial]
  end

  def get_article
    Article.find_by_token(params[:nav_token])
  end

  def partial?
    %w(informations services about-us contact-us).include? params[:partial]
  end
end
