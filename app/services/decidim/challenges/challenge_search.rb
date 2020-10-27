# frozen_string_literal: true

module Decidim
  module Challenges
    # A service to encapsualte all the logic when searching and filtering
    # challenges in a participatory process.
    class ChallengeSearch < ResourceSearch
      # text_search_fields :title

      # Public: Initializes the service.
      # component   - A Decidim::Component to get the challenges from.
      # page        - The page number to paginate the results.
      # per_page    - The number of challenges to return per page.
      def initialize(options = {})
        super(Challenge.published.all, options)
      end

      # Handle the search_text filter
      def search_search_text
        query.where("title ->> '#{I18n.locale}' ILIKE ?", "%#{search_text}%")
      end


      # Handle the state filter
      def search_state
        in_proposal = state.include?("proposal") ? query.in_proposal : nil
        in_executing = state.member?("executing") ? query.in_executing : nil
        in_finished = state.member?("finished") ? query.in_finished : nil

        query
          .where(id: in_proposal)
          .or(query.where(id: in_executing))
          .or(query.where(id: in_finished))
      end
    end
  end
end