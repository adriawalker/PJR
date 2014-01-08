require "rubygems"
require "json"
require "mysql"
require "active_record"
ActiveRecord::Base.establish_connection(
    :adapter => "mysql",
    :host => "127.0.0.1",
    :database => "PJR"
)


class Review < ActiveRecord::Base
  belongs_to :products, :foreign_key => 'productid'
end

