require_relative '../Author/author'
require_relative '../Item/Game/game'
require 'json'

class GameAuthor
  DATA_FILE_PATH = 'Application/Data/game_author.json'.freeze

  def initialize
    @games = []
    @authors = []
    load_data
  end

  def add_game
    puts 'Enter ID:'
    id = gets.chomp.to_i

    puts "Enter Author's First Name:"
    first_name = gets.chomp

    puts "Enter Author's Last Name:"
    last_name = gets.chomp

    author = find_or_create_author(id, first_name, last_name)

    puts 'Enter Publish Date (DD-MM-YYYY):'
    publish_date = gets.chomp

    puts 'Is it Multiplayer? (true/false):'
    multiplayer = gets.chomp.downcase == 'true'

    puts 'Enter Last Played (DD-MM-YYYY) (or press Enter for the current date):'
    last_played = gets.chomp
    last_played = Time.now.strftime('%d-%m-%Y') if last_played.empty?

    game = Game.new(id, publish_date, multiplayer, last_played)
    author.add_item(game)
    @games << game
    save_data
  end

  def list_games
    puts 'List of Games:'
    @games.each do |game|
      puts "ID: #{game.id}, Publish Date: #{game.publish_date}, Multiplayer: #{game.multiplayer}, " \
           "Last Played: #{game.last_played}"
    end
  end

  def list_authors
    puts 'List of Authors:'
    @authors.each do |author|
      puts "ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name}"
    end
  end

  private

  def save_data
    game_data = prepare_game_data
    author_data = prepare_author_data
    data = {
      games: game_data,
      authors: author_data
    }
    save_to_file(data, DATA_FILE_PATH)
  end

  def prepare_game_data
    @games.map do |game|
      {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played: game.last_played
      }
    end
  end

  def prepare_author_data
    @authors.map do |author|
      {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
  end

  def prepare_author_items(author)
    author.items.map do |item|
      {
        id: item.id,
        publish_date: item.publish_date,
        multiplayer: item.multiplayer,
        last_played: item.last_played
      }
    end
  end

  def save_to_file(data, file_path)
    File.write(file_path, JSON.pretty_generate(data))
  end

  def load_data
    data = load_data_from_file(DATA_FILE_PATH)
    return initialize_data unless data

    unless data.is_a?(Hash) && data.key?('games') && data.key?('authors')
      puts 'Error: Invalid data structure in game_author.json.'
      return initialize_data
    end

    @games = data['games'].map { |game_data| Game.new(*game_data.values) }
    @authors = data['authors'].map do |author_data|
      Author.new(
        author_data['id'],
        author_data['first_name'],
        author_data['last_name']
      )
    end
  end

  def load_data_from_file(file_path)
    return nil unless File.exist?(file_path)

    JSON.parse(File.read(file_path))
  rescue JSON::ParserError => _e
    nil
  end

  def initialize_data
    @games = []
    @authors = []
  end

  def find_or_create_author(id, first_name, last_name)
    author = @authors.find { |a| a.id == id }
    return author if author

    new_author = Author.new(id, first_name, last_name)
    @authors << new_author
    new_author
  end
end
