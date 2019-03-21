class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    # includes(:person_names).where('person_names.core_name_type_id = 1').references(:person_names)
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @lpname = @person.person_names.find_by(core_name_type_id: 1)
    @demography = @person.person_demography
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.person_names.build
    @person.build_person_demography
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @pn = PersonName.find_or_create_by(person_id: @person.id, core_name_type_id: 1)
    name_params = params.fetch(:person_name, {}).permit(:core_name_type_id, :first, :middle, :last).merge!(person_params[:person_names_attributes]['0'])
    new_pp = person_params
    new_pp.delete :person_names_attributes
    respond_to do |format|
      if @person.update(new_pp) and @pn.update(name_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.fetch(:person, {}).permit(person_names_attributes: [:core_name_type_id, :first, :middle, :last], person_demography_attributes: [:core_sex_id, :core_gender_id, :birthdate, :alt_birthdate, :gender_description])
    end
end
