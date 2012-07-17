class BootstrapFormBuilder <
    ActionView::Helpers::FormBuilder


  [ :text_field,
    :text_area,
    :password_field,
    :file_field].each do |item|

    metodo = %Q!

          def #{item}( property, options = {} )
            wrap_content( property, super, options )
          end

        !
    class_eval( metodo, __FILE__, __LINE__ )
  end

  def select( property, items, options = {}, html_options = {} )
    wrap_content( property, super, options )
  end

  def primary_submit( value )
    submit( value, :class => 'btn btn-primary' )
  end

  def wrap_content( property, content, options = {} )
    label_name = self.object.class.human_attribute_name(property)

    help = unless options[:help].blank?
      %Q!<p class="help-block">#{options[:help]}</p>!
    else
      ''
    end

    error_class = ''
    error = ''
    unless self.object.errors[property].blank?
      error_class = 'error'
      error_message = self.object.errors[property].to_sentence
      error = %Q!<span class="help-inline">#{error_message}</span>!
    end

    %Q!<div class="control-group #{error_class}">
      <label class="control-label">#{label_name}</label>
      <div class="controls">
        #{content}
        #{error}
        #{help}
      </div>
    </div>!.html_safe
  end

end