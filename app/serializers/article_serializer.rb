class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :author_name
  has_one :user
end
