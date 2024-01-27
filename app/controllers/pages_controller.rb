class PagesController < ApplicationController
    def home
        # no code needed for static pages, but if we want to send a response to the user's browser, we can use the render method:
        # render html: 'Get ready for a flowery experience!'
        # to render a view, it would be: render 'home'
    end

    def about
    end

    def gallery
    end
    
    def contact
    end
end
