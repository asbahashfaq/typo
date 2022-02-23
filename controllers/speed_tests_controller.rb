require 'httparty'
get '/' do
    random_sentences = rand(1..4)
    paragraph = HTTParty.get("http://metaphorpsum.com/paragraphs/1/#{random_sentences}").parsed_response
    erb :'speed_tests/index', locals: {
        paragraph: paragraph
    }
end
       
  
  