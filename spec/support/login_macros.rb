module LoginMacros 
    def set_user_session(user)
        session[:usuer_id] = user.id
    end
end    