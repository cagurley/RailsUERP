class PersonNamesController < ApplicationController
  before_action :set_person
  before_action :set_pn, only: [:show, :edit, :update, :destroy]

  def index
    @names = @person.person_names.order(:core_name_type_id)
  end

  def new
    @pn = @person.person_names.build
    @cnt = @person.person_names.collect { |pn| pn.core_name_type_id }
  end

  def edit
    @cnt = CoreNameType.all.collect { |cnt| cnt.id } .reject { |id| id == @pn.core_name_type_id }
  end

  def create
    @pn = @person.person_names.build(pn_params)

    respond_to do |format|
      if @pn.save
        format.html { redirect_to person_person_names_url, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: person_person_names_url }
      else
        format.html { render :new }
        format.json { render json: @pn.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pn.update(pn_params)
        format.html { redirect_to person_person_names_url, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: person_person_names_url }
      else
        format.html { render :new }
        format.json { render json: @pn.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @pn.core_name_type_id != 1
      @pn.destroy
      respond_to do |format|
        format.html { redirect_to person_person_names_url, notice: 'Name was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to person_person_names_url, notice: "You can't destroy legal primary names!"  }
        format.json { render json: @pn.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_person
      @person = Person.find(params[:person_id])
    end

    def set_pn
      @pn = @person.person_names.find(params[:id])
    end

    def pn_params
      params.require(:person_name).permit(:core_name_type_id, :first, :middle, :last)
    end
end
