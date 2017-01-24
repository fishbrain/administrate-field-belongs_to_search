require 'administrate/field/belongs_to'
require 'rails'

module Administrate
  module Field
    class BelongsToSearch < Administrate::Field::BelongsTo
      class Engine < ::Rails::Engine
        Engine.config.assets.precompile << 'belongs_to_search.js'
        Administrate::Engine.add_javascript 'belongs_to_search.js'
      end

      def associated_resource_options
        [[display_candidate_resource(data), data.id]]
      end

      def associated_class
        data.class
      end
    end
  end
end
