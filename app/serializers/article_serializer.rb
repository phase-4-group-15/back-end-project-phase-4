class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :category
end