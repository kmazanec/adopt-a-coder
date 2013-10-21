class Video < Media

  belongs_to :user

  def you_tube_code
   regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
   url.match(regex)[1]
  end
end
