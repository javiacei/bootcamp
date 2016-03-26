class ExerciseStatusSerializer < ActiveModel::Serializer
  attributes :state, :resolution_url

  def state
    @object.state_humanize
  end

end
