class PhotosController < ApplicationController
  before_filter :is_user!, :except => [:feed,:show, :index, :last]
  before_filter :getLists, :only => [:new, :create, :edit, :update]
  require "kconv"
  
  # GET /photos
  # GET /photos.xml
  def index
    if (params[:camera_id])
      @photos = Photo.find_all_by_camera_id(params[:camera_id])
    elsif (params[:film_id])
      @photos = Photo.find_all_by_film_id(params[:film_id])
    elsif (params[:album_id])
      @photos = Album.find(params[:album_id]).photos
    else
      @photos = Photo.paginate(:page => params[:page], :order => 'id DESC')
    end
    if (!is_user?)
      @photos.delete_if {|x| !x.isPublished? }
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
      format.json  { render :json => @photos }
    end
  end
  
  #GET /
  def last
    @lastPhotos = Photo.find(:all, :order=>'id DESC', :limit => 10)
  end
  
  
  def feed
    @photos = Photo.all
    respond_to do |format|
      format.atom
    end
  end
  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])
    if (!is_user? && !@photo.isPublished?)
        raise ActiveRecord::RecordNotFound 
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
      format.json  { render :json => @photo }
    end
  end
  
  
  def getLists
    @cameras = Camera.all
    @films = Film.all
  end
  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
      format.json  { render :json => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    
  end

  # POST /photos
  # POST /photos.xml
  def create
    logger.debug "Post should be valid: #{request.headers["Content-Type"]}"
      if (params[:photo])
        params[:photo].image.each do |image|
          photo = Photo.new
          photo.set_mime_type(image)
          photo.name = image.original_filename
          photo.published = false
          photo.save
        end

        respond_to do |format|

          format.html { head :ok }
          format.xml  { render :xml => @photo, :status => :created, :location => @photo }
          format.json  { render :json => @photo, :status => :created, :location => @photo }

        end
      else
        @photo = Photo.new
        @photo.set_mime_type(params[:image])
        @photo.name = params[:image].original_filename
        @photo.published = false
        respond_to do |format|
          if @photo.save
            format.html { head :ok }
            format.xml  { render :xml => @photo, :status => :created, :location => @photo }
            format.json  { render :json => @photo, :status => :created, :location => @photo }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
            format.json  { render :json => @photo.errors, :status => :unprocessable_entity}
          end
        end
      end
   
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])
    @tags = params[:photo][:tagslist].split(',')
    @tags.each{|tagName|
      @tag = Tag.find_by_name(tagName);
      if @tag == nil
        @tag = Tag.new
        @tag.name = tagName
        @tag.save
      end
      @photo.tags << @tag
    }
    @beforeUpdatePublished= @photo.isPublished?
    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        if (@photo.isPublished? && !@beforeUpdatePublished) 
          postToTwitter("New picture on #doyoueatcupcakes ! : "+ request.url)
        end
        format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        format.json  { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
      format.js { render :nothing => true }
    end
  end
end
