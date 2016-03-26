class ExerciseStatusSerializer < ActiveModel::Serializer
  attributes :state, :resolution_url, :description

  def state
    @object.state_humanize
  end

  def description
    @object.exercise.description
  end

end
