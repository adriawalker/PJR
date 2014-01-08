require 'rubygems'
require 'json'
require 'mysql'
require "active_record"
ActiveRecord::Base.establish_connection(
    :adapter => "mysql",
    :host => "127.0.0.1",
    :database => "PJR"
)

class Product < ActiveRecord::Base
  has_many :reviews, class_name: "Review"
end

