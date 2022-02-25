
def test_complete(user_id, paragraph, wpm, accuracy)
    
    #Update paragraphs records
    create_or_update_paragraph(user_id, paragraph, wpm, accuracy)   

    para_id = run_sql("SELECT id FROM paragraphs WHERE paragraph=$1",[paragraph])[0]

    user_id = 1 
    existing_test = []
    score = nil
    if session['user_id'] != nil
        user_id = session['user_id']
        # ONLY Update if logged in, otherwise just insert as annonymous user
        existing_test = run_sql("SELECT * FROM tests WHERE user_id = $1 AND paragraph_id = $2;",[user_id.to_i, para_id['id'].to_i]) 
          
    end
    if existing_test.count != 0 then
        run_sql("UPDATE tests SET wpm = $1, accuracy = $2 WHERE id = $3;", [wpm, accuracy, existing_test[0]['id']])
    else
        run_sql("INSERT INTO tests (user_id, paragraph_id, wpm, accuracy) VALUES ($1, $2, $3, $4);", [user_id, para_id['id'], wpm, accuracy])
    end
    score = run_sql("SELECT AVG(wpm) AS speed, AVG(accuracy) AS accuracy, COUNT(*) AS tests_taken FROM tests WHERE user_id = $1;", [user_id])[0]
    puts score
    run_sql("UPDATE scores SET wpm = $1, accuracy = $2, tests_taken = $3 WHERE user_id = $4;", [score['speed'].to_i, score['accuracy'].to_i, score['tests_taken'].to_i, user_id])

    puts "DHLEJERJL KJLKAJLDKDJFLDKJF LSKDFJ KLSDFJ DLKSFJKLSDJF LKSDJ"

    
end


def create_or_update_paragraph(user_id, paragraph, wpm, accuracy) 
    if !logged_in? then
        user_id = 1
    end

    user = run_sql("SELECT first_name, last_name FROM users WHERE id = $1;", [user_id])[0]
    top_scorer = "#{user['first_name']} #{user['last_name']}"

    # Add paragraphs to database unless they exist, then only update
    existing_para = run_sql("SELECT * FROM paragraphs WHERE paragraph = $1;", [ paragraph ])
    p "EXISTING PARAGRAPHS COUNT : " 
    p existing_para.count
    if existing_para.count > 0 then
        attempts = existing_para[0]['attempts'].to_i + 1
        highest = existing_para[0]['highest_score'].to_i  
        if  wpm > highest  
            highest = wpm
        else 
            top_scorer = existing_para[0]['top_scorer'] 
        end
        avg_accuracy =  (( existing_para[0]['avg_accuracy'].to_i * (attempts.to_i - 1) ) + accuracy.to_i) / attempts.to_i

        run_sql("UPDATE paragraphs SET attempts = $1, highest_score = $2, avg_accuracy = $3, top_scorer = $5 WHERE id= $4;", [attempts, highest, avg_accuracy, existing_para[0]['id'], top_scorer])

        puts "UPDATING PARAGRAPHS TABLE *!*!*!*!*!*!*!*!*!*!*"
    else
        
        run_sql("INSERT INTO paragraphs (paragraph, attempts, highest_score, avg_accuracy, top_scorer) VALUES ($1, $2, $3, $4, $5);",[paragraph, 1, wpm, accuracy, top_scorer])
    end 
end



def get_user_attempts(user_id)
    # run_sql( "SELECT * FROM tests
    #     FULL OUTER JOIN paragraphs
    #     ON tests.paragraph_id = paragraphs.id
    #     WHERE user_id = $1;" , [ user_id ])

    run_sql( "SELECT tests.id, paragraphs.paragraph, tests.wpm, tests.accuracy, tests.test_time, paragraphs.attempts, paragraphs.highest_score, paragraphs.avg_accuracy, tests.paragraph_id
        FROM tests
        INNER JOIN paragraphs ON tests.paragraph_id = paragraphs.id
        WHERE user_id = $1 ORDER BY tests.id DESC;", [ user_id ])
end

def get_current_user_score()
    run_sql("SELECT * FROM scores WHERE user_id = $1", [session['user_id']])[0]
end

