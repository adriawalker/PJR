require "rubygems"
require "json"
require "mysql"


class AddProducts
  def AddProductandReview(name, type, growth, definition, dryness, frizz, damage,review, date, reviewer)

    #set database connection parameters
    hostname = '127.0.0.1'
    username = 'root'
    password = ''
    databasename = 'PJR'

    connection = Mysql.new(hostname,username,password,databasename)
    recordset = connection.query("insert into products (name, type) values (" + '"' + name + '"' + "," '"'+ type + '"'+ ")")
    recordset = connection.query("select productid from products where name =" + '"' + name + '"')

    while productinfo = recordset.fetch_row do
      productid = productinfo[0]
    end


    recordset = connection.query("insert into reviews (productid, growth, damage, definition, dryness, frizz, reviewer, date, review) values (" + productid + "," '"' + growth + '"' + "," + '"' + damage + '"' + "," + '"' + definition + '"' + "," + '"' +  dryness + '"' + "," + '"' + frizz + '"' + "," + '"' + reviewer + '"'+ "," + "12/09/2013" + "," + '"' + review + '"'+ ")")
    connection.close

  end


  def AddReview(id, name, type, growth, definition, dryness, frizz, damage, review, date, reviewer)

    #needs refactoring to use mysql instead of json

    #opens products and reviews json files
    productsfile = File.open('products.json').read
    reviewsfile = File.open('reviews.json').read

    #parses json files
    parsedproducts = JSON.parse(productsfile)
    parsedreviews = JSON.parse(reviewsfile)

    #appends passed in Review info to json
    parsedreviews["Reviews"] << {"ProductId" => id, "Growth" => growth , "Definition" => definition, "Dryness" => dryness, "Damage" => damage, "Frizz" => frizz, "Review" => review, "Date" => date, "Reviewer" => reviewer}

    #append new product and review to json  files
    File.open('products.json','w'){ |f| JSON.dump(parsedproducts, f)}
    File.open('reviews.json', 'w'){ |f| JSON.dump(parsedreviews, f)}

    #close files
    #productsfile.close
    #reviewsfile.close
  end

end