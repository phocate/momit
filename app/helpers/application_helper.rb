module ApplicationHelper

    def full_title(page_title = '')
        base_title = 'MOMiT'
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def flash_class(level)
        case level.to_sym
            when :notice then "alert alert-info"
            when :success then "alert alert-success"
            when :error then "alert alert-danger"
            when :alert then "alert alert-warning"
        end
    end

    def active_link(path)
        current_page?(path) ? 'active' : ''
    end
end
