class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # All references to person_names only reference the
  # 'legal primary', id: 1, name type; other name
  # types are handled by person_names_controller

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
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
    @person_names = @person.person_names.build
    @person.build_person_demography
  end

  # GET /people/1/edit
  def edit
    @person_names = @person.person_names.select { |name| name.core_name_type_id == 1 }
  end

  # POST /people
  # POST /people.json
  def create
    # This removes the :person_name params from person_params
    # and creates the person.person_name separately due to a
    # pluralization naming convention conflict with has_many associations
    name_params = params.fetch(:person_name, {}).permit(:core_name_type_id, :first, :middle, :last).merge!(person_params[:person_name])
    new_pp = person_params
    new_pp.delete :person_name
    @person = Person.new(new_pp)
    @person_names = @person.person_names.build(name_params)

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
    # Same as create with the addition of preventing creating
    # rather than updating the person_name, again due to has_many
    name_params = params.fetch(:person_name, {}).permit(:core_name_type_id, :first, :middle, :last).merge!(person_params[:person_name])
    new_pp = person_params
    new_pp.delete :person_name
    @pn = PersonName.find_or_create_by(person_id: @person.id, core_name_type_id: 1)
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
      params.fetch(:person, {}).permit(person_name: [:core_name_type_id, :first, :middle, :last], person_demography_attributes: [:core_sex_id, :core_gender_id, :birthdate, :alt_birthdate, :gender_description])
    end
end
