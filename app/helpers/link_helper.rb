module LinkHelper
  def link_to_object(object, options={})
    link_to name_for_object(object), path_for_object(object), options
  end

  def name_for_object(object)
    case object
    when User then object.name
    end
  end

  def path_for_object(object)
    case object
    when User then "/#{object.name}"
    else object
    end
  end
end