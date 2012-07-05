module ApplicationHelper

  def render_head(clazz, * columns)

    content_tag :thead do
      content_tag :tr do
        table_headers = columns.map do |column|
          content_tag(
              :th,
              clazz.human_attribute_name(column))
        end

        table_headers.join("\n").html_safe
      end
    end

  end

end
