require 'twitter_bootstrap_form_for'

module TwitterBootstrapFormFor::FormHelpers
  [:form_for, :fields_for].each do |method|
    module_eval do
      define_method "bootstrap_#{method}" do |record, *args, &block|
        # add the TwitterBootstrap builder to the options
        options           = args.extract_options!
        options[:builder] = TwitterBootstrapFormFor::FormBuilder
      end
    end
  end

  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
    "#{html_tag}".html_safe
  end
  
end
