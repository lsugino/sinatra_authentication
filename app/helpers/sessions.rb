helpers do

  def current_user
    if session[:id]
      User.find(session[:id])
    end
    # TODO: return the current user if there is a user signed in.
  end

end
