module ApplicationHelper
 

 
  def flash_messages()
    flash.each do |msg_type, message|
      concat(content_tag(:div, message) do 
              concat message 
            end)
    end
    nil
  end
end

