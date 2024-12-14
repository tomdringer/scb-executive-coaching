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

  def json_validations_for(model, field)
    validations_hash = {}

    validators = model.class.validators_on(field)
    validators.each do |validator|
      validator_name = validator.class.name.demodulize.underscore.to_sym

      if validator_name == :length_validator
        options = validator.options.dup
        validations_hash[:length] = { min: options[:minimum].present? ? options[:minimum] : 1,
                                      max: options[:maximum].present? ? options[:maximum] : 1000 }
      end

      validations_hash[:presence] = true if validator_name == :presence_validator
      validations_hash[:numericality] = true if validator_name == :numericality_validator
    end

    validations_hash[:strong_password] = true if field == :password
    validations_hash[:email] = true if field == :email

    validations = validations_hash.map do |key, value|
      { key.to_s => value }
    end

    validations.to_json.html_safe
  end
end