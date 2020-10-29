# frozen_string_literal: true

class UserController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params['id'])
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], city_id: params[:city_id], email: params[:email], age: params[:age], password: params[:password])
    if @user.save
      puts 'success'
      redirect_to gossip_index_path
    else
      flash[:failure] = 'Echec lors de la création du compte, veuillez réessayer'
      render 'new'
    end
  end
end
