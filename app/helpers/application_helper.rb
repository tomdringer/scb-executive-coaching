module ApplicationHelper
  def button_class_for_background(background_colour)
	case background_colour
	when 'scb-gray', 'scb-white'
	  'bg-scb-blue'
	when 'scb-blue', 'scb-green', 'scb-black'
	  'bg-scb-gray'
	else
	  ''
	end
  end

  def button_class_for_text(button_background_colour)
	case button_background_colour
	when 'bg-scb-blue', 'bg-scb-green', 'bg-scb-black'
	  'text-scb-white'
	when 'bg-scb-gray', 'bg-scb-white'
	  'text-scb-black'
	else
	  ''
	end
  end
end