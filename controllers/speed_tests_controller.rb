require 'httparty'
require 'pry'

get '/' do
    random_sentences = rand(1..4)
    paragraph = HTTParty.get("http://metaphorpsum.com/paragraphs/1/#{random_sentences}")
    puts paragraph
    erb :'speed_tests/index', locals: {
        paragraph: paragraph
    }
end
       
  
post '/speed_tests' do 

    paragraph = params["paragraph"]
    accuracy = params["accuracy"].to_i
    wpm = params["speed"].to_i
    puts "I'm here right now, saving test data :O :O :O "
    puts " "
    puts " "
    puts " "
    test_complete(session['user_id'], paragraph, wpm, accuracy)

end

get '/history' do
    attempts = get_user_attempts(session['user_id'])
    erb :'/speed_tests/history', locals: {
        attempts: attempts
    }
end

delete '/speed_tests/:id' do
    run_sql('DELETE FROM tests WHERE id = $1', [params['id']])
    redirect '/history'
end

get '/retry/:id' do 
    random_sentences = rand(1..4)
    paragraph = run_sql("SELECT paragraph FROM paragraphs WHERE id = $1", [params['id']])[0]['paragraph']
    puts paragraph
    erb :'speed_tests/index', locals: {
        paragraph: paragraph
    }
end
