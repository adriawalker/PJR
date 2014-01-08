require 'sinatra'
require 'haml'
require_relative 'product'
require_relative 'review'
require 'active_record'



get '/' do
  haml :index
end


get '/reviews' do
  haml :reviews
end

get '/yourHair' do
  haml :yourHair
end


post '/searchReviews' do
    p = Product.new
    @products = p.where(:growth =>params[:Growth])
    puts "Products: " + @products.inspect
   # @Products = ""
   # Products.find_each do |products|
   #   if products.ptype == params[:ProductType]
   #     @Products = @Products + "</br>" + products.name
   #   end
   # end
    haml :reviews
end

post '/submitNewProductReview' do

      #update database with new product review info
      newProduct = Products.new
      newProduct.create(:name => params[:Name], :type => params[:Type])


    haml :reviews
end

post '/submitReview' do

    Products = PJR.new
    UpdatedProducts = Products.add_review(params[:ProductId],params[:ProductName],params[:Type],params[:Growth],params[:Definition],params[:Dryness],params[:Damage],params[:Frizz],params[:Review],params[:Date],params[:Reviewer])

  haml :reviews
end







