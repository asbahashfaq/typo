
def create_user(first_name, last_name, email, password) 
    password_digest = BCrypt::Password.create(password)
    user = run_sql("INSERT INTO users (first_name, last_name, email, password_digest) VALUES ($1, $2, $3, $4) RETURNING users.id", [first_name, last_name, email, password_digest])[0]
    run_sql("INSERT INTO scores (user_id, wpm, accuracy, tests_taken) VALUES ($1, $2, $3, $4);", [user['id'].to_i, 0, 0, 0 ])
end


def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])
    if users.to_a.count > 0
        users[0]
    else 
        nil
    end
end


def find_user_by_id(id)
    run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end