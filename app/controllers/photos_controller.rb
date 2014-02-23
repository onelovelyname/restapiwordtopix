class PhotosController < ApplicationController
  # Make these helpers available to the view too
  helper_method :photo, :photos

  respond_to :html, :json, :xml
    
  def index
    respond_with photos
  end

  def show
    @photo = Photo.find(params[:word_id]) 
    respond_with photo
  end

  def create
    photo.save
    respond_with photo
  end

  def update
    photo.update_attributes(params[:photo])
    respond_with photo
  end

  def destroy
    photo.destroy
    respond_with photo
  end
  
  private

  
  def photo
    # If the action is new or create...
    if @photo = params[:action] =~ /new|create/
      Photo.new(params[:photo])
    else
      Photo.find(params[:id])
    end
  end

  def photos
    @photos = Photo.all
  end
end
