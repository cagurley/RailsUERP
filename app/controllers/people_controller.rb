class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @name = PersonName.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    render plain: person_params.to_s
    # person_params['person_names'].merge({core_name_type_id: 1})
    # @person = Person.new(person_params)

    # respond_to do |format|
    #   if @person.save
    #     # 
    #     # name_params.inspect
    #     # @name = PersonName.new(name_params)
    #     # if @name.save
    #       format.html { redirect_to @person, notice: 'Person was successfully created.' }
    #       format.json { render :show, status: :created, location: @person }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @person.errors, status: :unprocessable_entity }
    #     # end
    #     # 
    #   end
    # end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
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
      params.fetch(:person, {}).permit(person_names_attributes: [:first, :middle, :last, :_destroy])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def name_params
      params.fetch(:person_name, {}).permit(:first, :middle, :last)
    end
end
