class Video < Media

  def you_tube_code
   regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
   url.match(regex)[1]
  end
end