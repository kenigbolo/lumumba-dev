module ApplicationHelper
	class ActionView::Helpers::Tags::Base
	  include ActionView::Helpers::TagHelper
	  include ActionView::Helpers::FormTagHelper
	  include ActionView::Helpers::FormOptionsHelper
	  include ActionView::Helpers::CaptureHelper
	  include ActionView::Helpers::AssetTagHelper

    def to_region_select_tag(parent_region, options = {}, html_options = {})
      html_options = html_options.stringify_keys
      add_default_name_and_id(html_options)
      options[:include_blank] ||= true unless options[:prompt] || select_not_required?(html_options)

      value = options[:selected] ? options[:selected] : value(object)
      priority_regions = options[:priority] || []
      opts = add_options(region_options_for_select(parent_region.subregions, value, 
                                                  :priority => priority_regions), 
                         options, value)
      select = content_tag("select", opts, html_options)
      if html_options["multiple"] && options.fetch(:include_hidden, true)
        tag("input", :disabled => html_options["disabled"], :name => html_options["name"], 
                     :type => "hidden", :value => "") + select
      else
        select
      end
    end

    def select_not_required?(html_options)
      !html_options["required"] || html_options["multiple"] || html_options["size"].to_i > 1
    end
	end
end
