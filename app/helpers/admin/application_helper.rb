module Admin::ApplicationHelper

  def admin_form_for( record, &block )
    form_for( record,
              :url => [ :admin, record ],
              :html => {
                  :class => 'form-horizontal',
                  :multipart => true
              },
              :builder => BootstrapFormBuilder,
              &block)
  end

end