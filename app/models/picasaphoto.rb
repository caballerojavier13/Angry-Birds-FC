class Picasaphoto
  	
  def subir_imagen photo 
	begin
	        client = self.conexion
	  
    	        album = self.buscar_album client

		photo_bin = File.binread(photo.tempfile)

		  imagen_creada=client.photo.create(album,
		    {
		      :binary => photo_bin,
		      :content_type => photo.content_type,
		      :title => photo.original_filename,
		      :summary => ""
		    })

		return imagen_creada
	rescue Picasa::ForbiddenError

		return nil
	end

  end

  def eliminar  photo_id
	begin
	  	@client = conexion
	  	
		@photo = buscar_photo @client, photo_id
		@album_id = @photo.album_id.to_s
		if @client.photo.delete(@photo.album_id, photo_id)
			return true	
		else
			return false
		end

	rescue Picasa::ForbiddenError
	  	return false
	end
  end

  def conexion
	return Picasa::Client.new(:user_id => "xavier.linux13@gmail.com", :password => "AIzaSyDdiC3ZZiDp2q6GIJ1U3IE0T23nSds_UNM")
  end
  def buscar_album client
	albums = client.album.list.entries
	return albums.find { |album| album.title == "imagenes" }.id
  end
  def buscar_photo client, photo_id 
	album_id = buscar_album client
	return client.album.show(album_id).entries.find{|photo| photo.id == photo_id}
  end
end
