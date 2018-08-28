class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    while call_input != "exit"
      case call_input 
      when "list songs"
        list_songs
      when "list artists"
        list_artists   
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end
  
  def list_songs 
    Song.all.sort_by(&:name).each.with_index(1) do |song, list_num|
      puts "#{list_num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, list_num|
      puts "#{list_num}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, list_num|
      puts "#{list_num}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, list_num|
        puts "#{list_num}. #{song.name} - #{song.genre.name}"
      end 
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, list_num|
        puts "#{list_num}. #{song.artist.name} - #{song.name}"
        #binding.pry
      end 
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i 
    Song.all.sort_by(&:name).each.with_index(1) do |song, list_num| 
      if list_num == input
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end