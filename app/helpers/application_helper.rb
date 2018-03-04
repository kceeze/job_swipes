module ApplicationHelper
	def add_name_fields (caption, f, association)
		singluar_name = name_s = association.to_s.singularize
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "1" ) do |builder|
			@worker.names.build
			render(singluar_name + "_fields", :f => builder)
		end
		link_to_function(caption, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", "")
	end

	def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick, :id => name))
  end


end
