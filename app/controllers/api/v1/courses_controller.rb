class Api::V1::CoursesController < Api::V1::BaseController
  before_action :set_course, only: %i[show update destroy]

  # GET /courses
  def index
    courses = Course.all
    serialized_courses = CourseSerializer.new(courses).serializable_hash
    render_json('Courses fetched successfully!', serialized_courses[:data])
  end

  # GET /courses/1
  def show
    serialized_course = CourseSerializer.new(@course).serializable_hash
    render_json('Courses fetched successfully!', serialized_course[:data])
  end

  # POST /courses
  def create
    course = Course.new(course_params)

    if course.save
      serialized_course = CourseSerializer.new(course).serializable_hash
      render_json('Course Created Successfully!', serialized_course[:data])
    else
      render_422(course.errors.full_messages)
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      serialized_course = CourseSerializer.new(@course).serializable_hash
      render_json('Course Updated Successfully!', serialized_course[:data])
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
    params.require(:course).permit(:name)
  end
end
