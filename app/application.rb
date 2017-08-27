# class Application
#   # @@item = []
#
#   def call(env)
#   resp = Rack::Response.new
#   req = Rack::Request.new(env)
#
#   if req.path.match(/items/)
#     itemName = req.path.split("/items/").last
#     if @@item.include?(itemName)
#
#       item =  @@item.find do |itemI|
#         itemI == itemName
#       end
#         resp.write item.price
#     else
#       resp.write "We don't have that item"
#       resp.status = 404
#     end
#   else
#     resp.write "Route not found"
#     resp.status = 404
#   end
# end
# end
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      itemName = req.path.split("/items/").last
      item = @@items.find do |itemI|
             itemI.name == itemName
      end
      if item
      resp.write item.price
    else
      resp.write "Item not found"
      resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
