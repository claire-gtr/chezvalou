ActiveAdmin.register Blogpost do
  permit_params :title, :content, :photo, :user_id

  filter :title
  filter :content

  form do |f|
    tabs do
      tab 'Blogpost' do
        f.inputs do
          f.input :title
          f.input :content
          f.input :photo, as: :file, hint: cl_image_tag(f.object.photo.url), label: 'Import a photo'
          f.input :photo_cache, as: :hidden
          f.input :user_id, as: :hidden, input_html: { value: current_user.id }
          f.semantic_errors
          f.button :submit
        end
      end
    end
  end

  index do
    div "Total: #{pluralize(collection.count, 'blogpost')}", class: "index_total"
    column :title
    column :content do |blogpost|
      raw(blogpost.content.truncate(120, separator: ' '))
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :content do |blogpost|
        raw(blogpost.content)
      end
      row :photo do |blogpost|
        image_tag blogpost.photo.url
      end
    end
  end

  controller do
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
