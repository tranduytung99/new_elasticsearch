class Post < ApplicationRecord
  belongs_to :user
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mapping do
    indexes :id, type: :integer
    indexes :user_id, type: :integer
    indexes :title, type: :string
  end

  def self.search(params)
    __elasticsearch__.search(page: 1, per_page: 2) do
      query do
        boolean do
        end
      end
      sort { by :published_at, "desc" } if params[:query].blank?
      facet "user" do
        terms :user_id
      end
    end
  end

  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       post:{
  #         _parent:{
  #           type: "user"
  #         }
  #     }
  #   )
  # end
end
#Post.import force: true
