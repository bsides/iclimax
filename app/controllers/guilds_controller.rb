class GuildsController < ApplicationController
  # GET /guilds
  # GET /guilds.json
  def index
    @guilds = Guild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guilds }
    end
  end

  # GET /guilds/1
  # GET /guilds/1.json
  def show
    @guild = Guild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guild }
    end
  end

  # GET /guilds/new
  # GET /guilds/new.json
  def new
    @guild = Guild.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guild }
    end
  end

  # GET /guilds/1/edit
  def edit
    @guild = Guild.find(params[:id])
  end

  # POST /guilds
  # POST /guilds.json
  def create
    @guild = Guild.new(params[:guild])

    respond_to do |format|
      if @guild.save
        format.html { redirect_to @guild, notice: 'Guild was successfully created.' }
        format.json { render json: @guild, status: :created, location: @guild }
      else
        format.html { render action: "new" }
        format.json { render json: @guild.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guilds/1
  # PUT /guilds/1.json
  def update
    @guild = Guild.find(params[:id])

    respond_to do |format|
      if @guild.update_attributes(params[:guild])
        format.html { redirect_to @guild, notice: 'Guild was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guild.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guilds/1
  # DELETE /guilds/1.json
  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy

    respond_to do |format|
      format.html { redirect_to guilds_url }
      format.json { head :no_content }
    end
  end
end
