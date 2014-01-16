require 'sinatra'
require 'haml'
require_relative './product'
require_relative './review'
require 'active_record'
require 'pry'



ActiveRecord::Base.establish_connection(
    :adapter => "mysql",
    :host => "127.0.0.1",
    :database => "PJR"
)



get '/' do
 #binding.pry
  haml :index

end


get '/reviews' do
  haml :reviews
end

get '/yourHair' do
  haml :yourHair
end


post '/searchReviews' do
    @Products = ""
    @Count = Reviews.where(frizz: params[:Frizz], growth: params[:Growth], damage: params[:Damage], definition: params[:Definition], dryness: params[:Dryness]).count

    for i in 0..@Count-1 do
      @Products = @Products + Reviews.where(frizz: params[:Frizz], growth: params[:Growth], damage: params[:Damage], definition: params[:Definition], dryness: params[:Dryness])[i].product.name + "<br/>"
    end

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







