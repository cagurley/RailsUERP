class PersonNamesController < ApplicationController
  before_action :set_person

  def index
    @names = @person.person_names.order(:core_name_type_id)
  end

  def new
    # @person = Person.find(params[:person_id])
    @pn = @person.person_names.build
  end

  def edit
  end

  def create
    # @person = Person.find(params[:person_id])
    @pn = @person.person_names.build(pn_params)
    # render plain: pn_params.to_s

    respond_to do |format|
      if @pn.save
        format.html { redirect_to @pn.person, notice: 'Name was successfully created.' }
        format.json { render :show, status: :created, location: @pn.person }
      else
        format.html { render :new }
        format.json { render json: @pn.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    render plain: params
  end

  private
    def set_person
      @person = Person.find(params[:person_id])
    end

    def pn_params
      params.require(:person_name).permit(:core_name_type_id, :first, :middle, :last)
    end
end
