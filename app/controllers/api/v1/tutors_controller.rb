class Api::V1::TutorsController < Api::V1::BaseController
  before_action :set_tutor, only: %i[show update destroy]

  # GET /tutors
  def index
    tutors = Tutor.all

    render_tutors(tutors)
  end

  # GET /tutors/1
  def show
    render_tutors(@tutor)
  end

  # POST /tutors
  def create
    tutor = Tutor.new(tutor_params)

    if tutor.save
      render_tutors('Tutor saved successfully!', tutor)
    else
      render_422(tutor.errors.full_messages)
    end
  end

  # PATCH/PUT /tutors/1
  def update
    if @tutor.update(tutor_params)
      render_tutors('Tutor updated successfully!', @tutor)
    else
      render_422(@tutor.errors.full_messages)
    end
  end

  # DELETE /tutors/1
  def destroy
    @tutor.destroy
    render_json('Tutor Deleted Successfully!', @tutor)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    @tutor = Tutor.find_by(id: params[:id])
    render_404('Tutor not found!') if @tutor.blank?
  end

  # Only allow a list of trusted parameters through.
  def tutor_params
    params.require(:tutor).permit(:first_name, :last_name, :course_id)
  end

  def render_tutors(message= "Tutors fetched successfully!", tutors)
    serialized_tutors = TutorSerializer.new(tutors).serializable_hash
    render_json(message, serialized_tutors[:data])
  end
end
