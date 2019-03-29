class PersonPhotosController < ApplicationController
  before_action :set_person
  before_action :set_photo, only: [:show, :serve]

  def index
  end

  def show
  end

  def new
    @photo = @person.person_photos.build
  end

  def create
    @photo = @person.person_photos.build(photo_params) do |p|
      if photo_params[:image]
        p.image = photo_params[:image].read
      end
    end

    respond_to do |format|
      if @photo.save
        format.html { redirect_to person_person_photos_url, notice: 'Photo was successfully uploaded.' }
        format.json { render :show, status: :created, location: person_person_photos_url }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def serve
    send_data @photo.image
  end

  private
    def set_person
      @person = Person.find(params[:person_id])
    end

    def set_photo
      @photo = @person.person_photos.find(params[:id])
    end

    def photo_params
      params.require(:person_photo).permit(:image, :current)
    end
end
