class TutorSerializer
  include JSONAPI::Serializer
  attributes :first_name, :last_name

  attribute :course do |obj|
    { id: obj.course.id, name: obj.course.name }
  end
end
