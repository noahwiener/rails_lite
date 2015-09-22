require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      cont_name = self.class.to_s.underscore
      contents = File.read("views/#{cont_name}/#{template_name}.html.erb")
      erbified = ERB.new(contents).result(binding)
      render_content(erbified, "text/html")
    end
  end
end
