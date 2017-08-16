class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  def self.search(query)
    __elasticsearch__.search(
      { from:0,size: 10000,
        query: {
          multi_match: {
            query: query,
            fields: ['name']
          }
        }
      }
    )
  end

  # mapping do
  #   indexes :id, type: 'integer'
  #   indexes :name
  # end

  # def self.search(params)
  #   __elasticsearch__.search(page: 1, per_page: 2) do
  #     query do
  #       boolean do
  #       end
  #     end
  #     sort { by :published_at, "desc" } if params[:query].blank?
  #     facet "user" do
  #       terms :user_id
  #     end
  #   end
  # end
  # query: {
  #    parent_id: {
  #     type: "user",
  #     id: 100
  #   }

  # def search_child(query)
  #   __elasticsearch__.search(
  #     { from:0,size: 100,
  #       query: {
  #         parent_id: {
  #           type: "my_child",
  #           id: query
  #         }
  #       }
  #     }
  #   )
  # end


  # "query": {
  #   "filtered": {
  #     "filter": {
  #       "terms": { "user": [1] }
  #     }
  #   }
  # }

  def as_indexed_json(options={})
    as_json only: [:name]
  end
end
#User.import force: true
