require 'has_many_autocomplete'

class PlaylistsController < ApplicationController

  autocomplete :lyric, :printable_title

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlists }
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist }
    end
  end

  # GET /playlists/new
  # GET /playlists/new.json
  def new
    @playlist = Playlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist }
    end
  end

  # GET /playlists/1/edit
  def edit
    @playlist = Playlist.find(params[:id])
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(params[:playlist])

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render json: @playlist, status: :created, location: @playlist }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playlists/1
  # PUT /playlists/1.json
  def update
    @playlist = Playlist.find(params[:id])
    @playlist.lyrics = []

    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end

  # GET /playlists/1/play
  def play
    @playlist = Playlist.find(params[:id])

    if params[:lyric_id]
      index = @playlist.lyrics.find_index { |lyric| lyric.id == params[:lyric_id].to_i }
      @current_lyric = @playlist.lyrics[index]
      @prev_lyric = @playlist.lyrics[(index - 1) % @playlist.lyrics.count]
      @next_lyric = @playlist.lyrics[(index + 1) % @playlist.lyrics.count]
    else
      @current_lyric = @playlist.lyrics.first
      @prev_lyric = @playlist.lyrics.last
      @next_lyric = @playlist.lyrics[1 % @playlist.lyrics.count]
    end

  end

  # POST /playlists/1/add_lyric.json?lyric_id=5
  def add_lyric
    respond_to do |format|
      format.json do
        @playlist = Playlist.find(params[:id])
        if params[:lyric_id]
          @playlist.lyric_ids_list = @playlist.lyric_ids + [params[:lyric_id]]
          if @playlist.save
            render :json => @playlist, :status => 200
          else
            render :json => { errors: @playlist.errors.full_messages }, :status => 422
          end
        else
          render :json => { errors: ['lyric_id parameter must be supplied'] }, :status => 400
        end
      end
    end
  end

end
