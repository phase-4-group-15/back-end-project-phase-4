class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :article_id ,:user_id
end
