# frozen_string_literal: true

require_dependency "decidim/components/namer"
require "decidim/challenges/admin"
require "decidim/challenges/engine"
require "decidim/challenges/admin_engine"

# Sustainable Development Goals
Decidim.register_component(:challenges) do |component|
  component.engine = Decidim::Challenges::Engine
  component.admin_engine = Decidim::Challenges::AdminEngine
  component.icon = "decidim/challenges/icon.svg"

  # component.on(:before_destroy) do |instance|
  #   # Code executed before removing the component
  # end

  # These actions permissions can be configured in the admin panel
  # component.actions = %w()

  # component.settings(:global) do |settings|
  #   # Add your global settings
  #   # Available types: :integer, :boolean
  #   # settings.attribute :vote_limit, type: :integer, default: 0
  # end

  # component.settings(:step) do |settings|
  #   # Add your settings per step
  # end

  # component.register_resource(:some_resource) do |resource|
  #   # Register a optional resource that can be references from other resources.
  #   resource.model_class_name = "Decidim::Challenges::SomeResource"
  #   resource.template = "decidim/challenges/some_resources/linked_some_resources"
  # end

  # component.register_stat :some_stat do |context, start_at, end_at|
  #   # Register some stat number to the application
  # end

  # component.seeds do |participatory_space|
  #   # Add some seeds for this component
  # end
end
