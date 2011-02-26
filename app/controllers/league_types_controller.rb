class LeagueTypesController < ApplicationController
  # GET /league_types
  # GET /league_types.xml
  def index
    @league_types = LeagueType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @league_types }
    end
  end

  # GET /league_types/1
  # GET /league_types/1.xml
  def show
    @league_type = LeagueType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @league_type }
    end
  end

  # GET /league_types/new
  # GET /league_types/new.xml
  def new
    @league_type = LeagueType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @league_type }
    end
  end

  # GET /league_types/1/edit
  def edit
    @league_type = LeagueType.find(params[:id])
  end

  # POST /league_types
  # POST /league_types.xml
  def create
    @league_type = LeagueType.new(params[:league_type])

    respond_to do |format|
      if @league_type.save
        format.html { redirect_to(@league_type, :notice => 'League type was successfully created.') }
        format.xml  { render :xml => @league_type, :status => :created, :location => @league_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @league_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /league_types/1
  # PUT /league_types/1.xml
  def update
    @league_type = LeagueType.find(params[:id])

    respond_to do |format|
      if @league_type.update_attributes(params[:league_type])
        format.html { redirect_to(@league_type, :notice => 'League type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @league_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /league_types/1
  # DELETE /league_types/1.xml
  def destroy
    @league_type = LeagueType.find(params[:id])
    @league_type.destroy

    respond_to do |format|
      format.html { redirect_to(league_types_url) }
      format.xml  { head :ok }
    end
  end
end
