class SportTypesController < ApplicationController
  # GET /sport_types
  # GET /sport_types.xml
  def index
    @sport_types = SportType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sport_types }
    end
  end

  # GET /sport_types/1
  # GET /sport_types/1.xml
  def show
    @sport_type = SportType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sport_type }
    end
  end

  # GET /sport_types/new
  # GET /sport_types/new.xml
  def new
    @sport_type = SportType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sport_type }
    end
  end

  # GET /sport_types/1/edit
  def edit
    @sport_type = SportType.find(params[:id])
  end

  # POST /sport_types
  # POST /sport_types.xml
  def create
    @sport_type = SportType.new(params[:sport_type])

    respond_to do |format|
      if @sport_type.save
        format.html { redirect_to(@sport_type, :notice => 'Sport type was successfully created.') }
        format.xml  { render :xml => @sport_type, :status => :created, :location => @sport_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sport_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sport_types/1
  # PUT /sport_types/1.xml
  def update
    @sport_type = SportType.find(params[:id])

    respond_to do |format|
      if @sport_type.update_attributes(params[:sport_type])
        format.html { redirect_to(@sport_type, :notice => 'Sport type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sport_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sport_types/1
  # DELETE /sport_types/1.xml
  def destroy
    @sport_type = SportType.find(params[:id])
    @sport_type.destroy

    respond_to do |format|
      format.html { redirect_to(sport_types_url) }
      format.xml  { head :ok }
    end
  end
end
