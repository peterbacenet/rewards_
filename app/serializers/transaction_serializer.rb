class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :points, :redeemed, :timestamp
end
