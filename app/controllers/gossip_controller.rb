# frozen_string_literal: true

class GossipController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    params[:id]
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @gossip = Gossip.new(user: current_user, content: params[:content], title: params[:title])

    if @gossip.save # essaie de sauvegarder en base @gossip
      puts 'ok'
      flash[:notice] = 'Post successfully created'
      redirect_to gossip_index_path
      # si ça marche, il redirige vers la page d'index du site
    else
      flash[:failure] = 'Echec lors de la création du gossip, veuillez réessayer'
      puts 'pas ok'
      render 'new'
      # redirect_to request.referrer

      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(post_params)
      redirect_to gossip_index_path
    else
      render :edit
    end
  end

  def post_params
    params.require(:gossip).call(title: params[:title], content: params[:content])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      flash[:destroy] = 'Post successfully destroy'
      redirect_to gossip_index_path
    end
  end
end
