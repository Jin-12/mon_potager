# frozen_string_literal: true

module ApplicationHelper
    def flash_class(level)
      case level
          when 'notice' then "alert alert-primary alert-info alert-dismissible fade show"
          when 'success' then "alert alert-primary alert-success alert-dismissible fade show"
          when 'warning' then "alert alert-primary alert-warning alert-dismissible fade show"
          when 'alert' then "alert alert-primary alert-error alert-dismissible fade show"
      end
    end

    def full_title(page_title = '')
      base_title = "MonPotager"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end
  
end
