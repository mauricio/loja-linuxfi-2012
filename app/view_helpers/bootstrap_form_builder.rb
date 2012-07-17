class BootstrapFormBuilder <
    ActionView::Helpers::FormBuilder

=begin
<div class="control-group">
  <label class="control-label" for="input01">Text input</label>
  <div class="controls">
    <input type="text" class="input-xlarge" id="input01">
    <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
  </div>
</div>
=end

  def text_field( property, options = {} )
    wrap_content( property, super, options )
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