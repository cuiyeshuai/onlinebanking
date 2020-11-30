module ApplicationHelper
    # Displays the name on head title, can be used for page title as well-->
    def full_title(page_title = '')
        default_title = "Bank Quail"
        if page_title.empty?
            default_title
        else
            "#{default_title} | #{page_title}"
        end
    end

end
