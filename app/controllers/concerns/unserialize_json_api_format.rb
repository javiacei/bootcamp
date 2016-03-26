module UnserializeJsonApiFormat
  def unserialize_json_api_format(hash)
    ActiveModelSerializers::Adapter::JsonApi::Deserialization.parse(hash)
  end
end
