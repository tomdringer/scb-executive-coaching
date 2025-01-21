module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    layout 'admin'
    
    protected
    
    def load_menu_sections
      @menu_sections = Section.uncached do
        Section.where(hide_menu: false).order(Arel.sql('COALESCE(position, 999999), id'))
      end
      Rails.logger.debug "Menu Sections: #{@menu_sections.map { |s| { id: s.id, position: s.position } }}"
    end
  end
end
