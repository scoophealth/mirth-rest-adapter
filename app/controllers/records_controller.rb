
class RecordsController < ApplicationController
  require 'net/http/post/multipart'

  def relay

      file = File.new('temp_scoop_document.xml', 'w+')
      file.write(params[params.keys[0]].read)

      file.close

      res = nil

      url = URI.parse('http://young-water-9709.herokuapp.com/records/create')
      File.open("temp_scoop_document.xml") do |xml|
        req = Net::HTTP::Post::Multipart.new url.path, "content" => UploadIO.new(xml, "text/xml", "temp_scoop_document.xml")
        res = Net::HTTP.start(url.host, url.port) do |http|
          http.request(req)
        end
      end
      
      File.delete('temp_scoop_document.xml')
  		
      render :text => res.message, :status => res.code
  	#end

  end
end
