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

	def colours
		%w[scb-black scb-blue scb-green scb-gray scb-white]
	end

	def alignment
		%w[text-left text-center text-right text-justify]
	end

	def font_size
		%w[text-xs text-sm text-base text-lg text-xl text-2xl text-3xl text-4xl text-5xl text-6xl text-7xl text-8xl text-9xl]
	end
end