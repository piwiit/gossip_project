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
    @gossip = Gossip.new(title: params[:title],
                         content: params[:content],
                         user_id: params[:user_id])

    if @gossip.save # essaie de sauvegarder en base @gossip
      flash[:notice] = 'Post successfully created'
      redirect_to gossip_index_path
      # si ça marche, il redirige vers la page d'index du site
    else
      flash[:failure] = 'Echec lors de la création du gossip, veuillez réessayer'
      render 'new'
      # redirect_to request.referrer

      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
