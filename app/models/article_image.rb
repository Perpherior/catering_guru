class ArticleImage < ActiveRecord::Base
  belongs_to :article

  PAPERCLIP_OPTIONS = {
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "missing.png",
    path:    ":rails_root/public/system/:attachment/:id-:hash/:style/:filename",
    url:     "/system/:attachment/:id-:hash/:style/:filename",
    storage: (:filesystem),
    hash_secret:  "ThisIsThePiSecretStringForPractices",
    preserve_files: "true"
  }

  has_attached_file :attachment, PAPERCLIP_OPTIONS
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  def url
    attachment.url
  end
end
