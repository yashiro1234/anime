class AnimeStaffRollsController < InheritedResources::Base

  private

    def anime_staff_roll_params
      params.require(:anime_staff_roll).permit(:name, :name_yomi)
    end
end

