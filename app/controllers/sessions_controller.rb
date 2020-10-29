# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    # et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:load] = 'Post successfully created'
      redirect_to gossip_index_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
