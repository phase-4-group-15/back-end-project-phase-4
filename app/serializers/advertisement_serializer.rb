class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :genre, :release_date
end
