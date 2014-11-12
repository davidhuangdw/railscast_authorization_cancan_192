class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author_name, :site_url, :content
  has_one :article
  has_one :user
end
