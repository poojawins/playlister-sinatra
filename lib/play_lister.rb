"Browse by artist or genre"


  parser = Parser.new
  catalog = parser.parse_songs

    "artist"
      new_catalog = []
      artist_songs = {}
      catalog.each do |file|
        new_catalog << file[0]
        if artist_songs[file[0]].nil?
          artist_songs[file[0]] = 1
        else
          artist_songs[file[0]] += 1
        end
      end

      new_catalog.uniq!
      artist_songs.each do |artist, count|
        puts "#{artist} - #{count} song(s)"
      end
      puts "There are #{new_catalog.count} artists in this list."
      --------------------------------------------------------
      "Select an artist"

      artist_genre = {}
      catalog.each do |file|
        if file[0] == which_artist
          artist_genre[file[1]] = file[2]
        end
       
      end
      i = 1
      artist_genre.each do |song, genre|
        puts i.to_s + ". #{song} - #{genre}"
        i += 1
      end
 
=================================================================



    "genre"
      genre_catalog = []
      catalog.each do |file|
        genre_catalog<< file[2]
      end
      genre_catalog.uniq!
      puts genre_catalog
      puts "There are #{genre_catalog.count} genres in this list."

      genre_hash = {}
      catalog.each do |file|
        if genre_hash[file[2]].nil?
          genre_hash[file[2]] = 1
        else
          genre_hash[file[2]] += 1
        end
      end
      sorted_array = genre_hash.sort_by {|k, v| v}
      sorted_hash = Hash[*sorted_array.flatten]
      i = 1
      sorted_hash.each do |genre, count|
        puts i.to_s + ". #{genre}: #{count} songs, "
        i += 1
      end
      
      puts "Select a genre"

      --------------------------------------------------------
      "Select an artist"
      the_genre_hash = {}
      catalog.each do |file|
        if file[2] == which_genre
          the_genre_hash[file[0]] = file[1]
        end
      end

      i = 1
      the_genre_hash.each do |artist, songs|
        puts i.to_s + ". #{artist} - #{songs}"
        i += 1
      end

      "Select a song or artist"

      if which_thing == #artist

      elsif which_thing == #song

      end
      #a user should be able to type artist name (M83) and be taken to artist "page" 
      #or type song name (Midnight City) and get taken to the songs "page"
      #the song page should list all the available info on the song, the artist and genre.
    
