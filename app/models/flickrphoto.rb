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
    FlickRaw.api_key="72e33da5261da953174cda791fd2d5f1"
    FlickRaw.shared_secret="439da9196651a5c8"

    flickr.access_token = "72157646410063679-426c6b389b96430f"


    flickr.access_secret = "1fe5934fd34b7e8e"

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
