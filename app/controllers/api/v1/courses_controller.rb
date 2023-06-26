class Api::V1::CoursesController < Api::V1::BaseController
  before_action :set_course, only: %i[show update destroy]

  # GET /courses
  def index
    courses = Course.all
    render_courses(courses)
  end

  # GET /courses/1
  def show
    render_courses(@course)
  end

  # POST /courses
  def create
    course = Course.new(course_params)

    if course.save
      render_courses('Course saved successfully!', course)
    else
      render_422(course.errors.full_messages)
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render_courses('Course updated successfully!', @course)
    else
      render_422(@course.errors.full_messages)
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    render_json('Course Deleted Successfully!', @course)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find_by(id: params[:id])
    render_404('Course not found!') if @course.blank?
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, tutors_attributes: [:id, :first_name, :last_name])
  end

  def render_courses(message='Courses fetched successfully!', courses)
    serialized_courses = CourseSerializer.new(courses).serializable_hash
    render_json(message, serialized_courses[:data])
  end
end
