module ApplicationHelper
  def randomMediumPicture(object)
    if object.photos.size != 0
      object.photos.sort_by{rand}[0].image.url(:square)
    else
      'blank.jpeg'
    end
  end
  
  def yield_for(content_sym, default)
      output = content_for(content_sym)
      output = default if output.blank?
      output
    end
    
    def setup_recipe(recipe)
        returning(recipe) do |r|
          r.steps.build if r.steps.empty?
          r.ingredients.build if r.ingredients.empty?
        end
      end
      def link_to_remove_fields(name, f)
          f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
        end

        def link_to_add_fields(name, f, association)
          new_object = f.object.class.reflect_on_association(association).klass.new
          fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
            render(association.to_s.singularize + "_fields", :f => builder)
          end
          link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}  ')"))
        end
end
