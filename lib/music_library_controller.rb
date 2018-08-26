require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    call_input = ""
    while call_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."     
      puts "What would you like to do?"
      call_input = gets.chomp
      case call_input 
      when "list songs"
        songs
      when "list artists"
        artists   
      when "list genres"
        genres
      when "list artist"
        artist
      when "list genre"
        genre
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
    input = gets.chomp
    binding.pry
      #list_songs.each do |song|
        #puts "Playing #{song.name} by #{song.artist.name}"
        
      #end
    #end
    
    
  end
end