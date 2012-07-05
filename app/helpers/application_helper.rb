module ApplicationHelper

  IGNORED_COLUMNS = [ 'id', 'updated_at', 'created_at' ]

  def render_head(clazz, * columns)

    if columns.blank?
      columns = clazz.column_names - IGNORED_COLUMNS
    end

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
