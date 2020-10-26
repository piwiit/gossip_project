class GossipController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    id = params[:id]
    @gossip = Gossip.find(params[:id])
  end
end
