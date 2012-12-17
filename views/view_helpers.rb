module ViewHelpers

  # Returns a random quote
  def random_quote()
    require "net/http"
    require "uri"

    url = "http://iheartquotes.com/api/v1/random?format=text&max_lines=4&max_characters=140&show_permalink=false&show_source=false&source=simpsons_ralph+simpsons_homer+simpsons_chalkboard"
    uri = URI.parse url

    response = Net::HTTP.get_response(uri)
    response.body.chomp!
  end

  # Encodes a string in a URL-safe way
  def encode(string)
    require "uri"

    URI::encode string
  end

end