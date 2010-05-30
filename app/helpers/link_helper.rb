module LinkHelper
  def link_to_object(object, options={})
    link_to name_for_object(object), path_for_object(object), options
  end

  def name_for_object(object)
    case object
    when User then object.name
    when Document then object.title    
    else object.to_s
    end
  end

  def path_for_object(object)
    case object
    when User then "/#{object.to_param}"
    when Document then "/#{object.user.to_param}/#{object.to_param}"    
    else object
    end
  end
  module_function :path_for_object
end