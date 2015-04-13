ActiveAdmin.register Slideshow do
  permit_params :title, :content, :article_id, :image

  filter :title

  index do
    column :title
    column :content
    column :article_id
    actions
  end

  form do |f|
    f.inputs "Slideshow Details" do
      f.input :title
      f.input :content
      f.input :article_id, as: :select, collection: Article.all.map{|a| [a.name, a.id]}
      f.input :image, :as => :file,
        :hint => image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :title
      row :content
      row :article_id
      row :attachment do
        image_tag(ad.image.url(:thumb))
      end
    end
  end
end
