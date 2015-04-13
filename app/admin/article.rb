ActiveAdmin.register Article, as: "Page" do
  permit_params :name, :description, :content, :article_type, :thumb_img, :sequence

  index do
    column :name
    column :sequence
    column :created_at
    column :article_type
    actions
  end

  scope("about us") { |scope| scope.where(article_type: "about_us") }
  scope("contact us") { |scope| scope.where(article_type: "contact_us") }
  scope("services") { |scope| scope.where(article_type: "services") }

  config.per_page = 10
  config.sort_order = 'sequence_asc'

  filter :name
  filter :content

  form do |f|
    f.inputs "Article Details" do
      f.input :name
      f.input :description
      f.input :sequence, :input_html => { :length => 10 }
      f.input :article_type,
        as: :select, collection: %w(services about_us contact_us)
      f.input :thumb_img, :as => :file,
        :hint => image_tag(f.object.thumb_img.url(:thumb))
    end
    f.inputs "Content edit" do
      f.input :content, as: :text, :input_html => { :id => "redactor"  }
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :description
      row :sequence
      row :article_type
      row :thumb_img do
        image_tag(ad.thumb_img.url(:thumb)) if ad.thumb_img_file_name.present?
      end
      row "Content" do
        ad.content.html_safe
      end
    end
  end
end
