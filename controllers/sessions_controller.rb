#get signin page
get '/sign_in' do
    erb :'sessions/new', locals:{
        message: ""
    }
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)
    if user && BCrypt::Password.new(user['password_digest']) == params['password']
        session['user_id'] = user['id']
        redirect '/'
    else
        erb :'sessions/new' , locals:{
            message: "Invalid Username or Password"
        }
    end
end

delete '/sessions' do
    session['user_id'] = nil
    redirect '/'
end