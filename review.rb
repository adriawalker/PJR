require 'active_record'

class Reviews < ActiveRecord::Base
  belongs_to :product, :foreign_key => 'productid'
end

