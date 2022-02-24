require 'httparty' 

get '/' do
    paragraph_decision = rand(2)
    paragraph = ""
    if (paragraph_decision == 0) #Get from own database
        puts "GETTING PARAGRAPH FROM DATABASE"
        paragraph = run_sql("SELECT paragraph FROM paragraphs ORDER BY RANDOM() LIMIT 1 ")[0]['paragraph']
    else #Get from api
        puts "GETTING PARAGRAPH FROM API"
        random_sentences = rand(1..4)
        paragraph = HTTParty.get("http://metaphorpsum.com/paragraphs/1/#{random_sentences}")
    end
    top_scores = run_sql("SELECT users.first_name, users.last_name, scores.wpm, scores.accuracy, scores.tests_taken, RANK() OVER(ORDER BY scores.wpm DESC) AS rank FROM scores INNER JOIN users ON scores.user_id = users.id ORDER BY scores.wpm DESC; ")
    
    erb :'speed_tests/index', locals: {
        paragraph: paragraph, 
        top_scores: top_scores
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
        attempts: attempts,
        paragraph: 'placeholder',
        test_visibility: 'hidden'
    }
end

delete '/speed_tests/:id' do
    run_sql('DELETE FROM tests WHERE id = $1', [params['id']])
    redirect '/history'
end

get '/retry/:id' do  
    attempts = get_user_attempts(session['user_id'])
    paragraph = run_sql("SELECT paragraph FROM paragraphs WHERE id = $1", [params['id']])[0]['paragraph']
    puts paragraph
    erb :'speed_tests/history', locals: {
        attempts: attempts,
        paragraph: paragraph, 
        test_visibility: 'visible'
    }
end

get '/all_paragraphs' do
    paragraphs = run_sql("SELECT * FROM paragraphs ORDER BY attempts DESC;")
    
    erb :'/speed_tests/all_tests', locals: { 
        paragraph: 'placeholder',
        test_visibility: 'hidden',
        paragraphs: paragraphs
    }
end


get '/try/:id' do  
    paragraphs = run_sql("SELECT * FROM paragraphs ORDER BY attempts DESC;")
    paragraph = run_sql("SELECT paragraph FROM paragraphs WHERE id = $1", [params['id']])[0]['paragraph']

    erb :'speed_tests/all_tests', locals: { 
        paragraph: paragraph, 
        test_visibility: 'visible',
        paragraphs: paragraphs
    }
end