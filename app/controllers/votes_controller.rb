class VotesController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/new
  # GET /votes/new.xml
  def new
    @vote = Vote.new

    # get all the gameids of the votes that this user has made
    @gameids = Vote.find(:all, :conditions => ["votedby = ?", current_user.id], :select => "gameid").collect{|vote| vote.gameid} 
    
    # then, find the first upcoming game from the @games list that is not in @uservotes 
    if (@gameids.count > 0)
        @game = Game.find(:first, :conditions => ["time >= ? AND id not in (?)", DateTime.now, @gameids])
    else
        @game = Game.find(:first, :conditions => ["time >= ?", DateTime.now])
    end
    
    #FIXME - check if game == null a different response needs to be returned
    if (@game.nil?)
        redirect_to :controller => "home", :action => "index" and return
    end
    
    @hometeam = Team.find(@game.hometeamid)
    @visitingteam = Team.find(@game.visitingteamid)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.xml
  def create
    @vote = Vote.new(params[:vote])
    @vote.votedby = current_user.id

    respond_to do |format|
      if @vote.save
        format.html { redirect_to(:action => "new") }
        format.xml  { render :xml => @vote, :status => :created, :location => @vote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to(@vote, :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(votes_url) }
      format.xml  { head :ok }
    end
  end
end
