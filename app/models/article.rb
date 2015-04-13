class Article < ActiveRecord::Base
  include SaveNavToken
  has_many :article_images
  before_save :set_nav_token

  validates_presence_of :name

  PAPERCLIP_OPTIONS = {
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "../missing.png",
    path:    ":rails_root/public/system/:attachment/:id-:hash/:style/:filename",
    url:     "/system/:attachment/:id-:hash/:style/:filename",
    storage: (:filesystem),
    hash_secret:  "ThisIsThePiSecretStringForPractices",
    preserve_files: "true"
  }

  has_attached_file :thumb_img, PAPERCLIP_OPTIONS
  validates_attachment_content_type :thumb_img, :content_type => /\Aimage\/.*\Z/

  scope :batch_articles, ->(type) { where( article_type: type)}

  include PgSearch
  pg_search_scope :search,
                  :against => [:name, :content,:description, :article_type],
                  :using => {
                    :tsearch => {:prefix => true, :dictionary => "english", :any_word => true}
                  }

  def self.find_by_type(type)
    Article.find_by article_type: type
  end

  def self.find_by_token(token)
    Article.find_by nav_token: token
  end

  def self.pagination(page, per_page)
    paginate(page: page, per_page: per_page)
  end

  def brief_info(info, size)
    info.nil? ? "" : (info.split.first(size).join(" ")) + " ..."
  end

  def thumb_img_url
    thumb_img.url(:thumb)
  end

  def content
    super || ""
  end
end
