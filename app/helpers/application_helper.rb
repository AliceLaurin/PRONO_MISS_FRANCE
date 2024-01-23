module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def category_emoji(category)
    case category
    when "bombe"
      "🔥"
    when "mignonne"
      "💁🏼‍♀️"
    when "pas ouf"
      "🤔"
    when "deg"
      "🚛"
    else
      "" # Default case
    end
  end
  
end
