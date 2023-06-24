class CourseSerializer
  include JSONAPI::Serializer
  attributes :name, :tutors

  attribute :tutors do |obj|
    tutors = []
    obj.tutors.each do |tutor|
      tutors << { id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name }
    end
    tutors
  end
end
