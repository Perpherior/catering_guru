class ArticleImagesController < ::ApplicationController
  respond_to :json

  def upload
    @image = ArticleImage.create attachment: params[:file]
  end
end
