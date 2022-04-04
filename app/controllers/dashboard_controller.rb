class DashboardController < ApplicationController

    def search
        # query string  from the url
        # query Question model for the query string
        # case insensitive search
        qs = params['q']
        @questions = Question.where('description ILIKE ?', "%#{qs}%")
    end
end