require 'rubygems'
require 'flickraw'
require 'launchy'
class Flickrphoto

  def subir_imagen photo
    titulo = photo.original_filename
    file_path = photo.tempfile
    return conectar.upload_photo(photo.tempfile.path)
  end

  def get_url_flickr photo_id
    info = conectar.photos.getInfo(:photo_id => photo_id)
    return FlickRaw.url_b(info)
  end

  def conectar
    FlickRaw.api_key = "eae68215d59780be03b633438a293bf3"

    FlickRaw.shared_secret= "257b632e7e63243d"

    flickr.access_token = "72157634581998494-c302f018aec4cb5e"

    flickr.access_secret = "57bb0c9b979cc7d5"
    return flickr
  end

  def set_id
    return "72157634575363966"
  end

  def user
    return '96738179@N08'
  end
  
  def verify
    return "421-134-141"
  end

end
