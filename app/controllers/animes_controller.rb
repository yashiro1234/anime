class AnimesController < InheritedResources::Base

  private

    def anime_params
      params.require(:anime).permit(:name, :url)
    end
end

