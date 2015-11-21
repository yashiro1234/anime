class AnimeStaffsController < InheritedResources::Base

  private

    def anime_staff_params
      params.require(:anime_staff).permit(:name, :name_yomi)
    end
end

