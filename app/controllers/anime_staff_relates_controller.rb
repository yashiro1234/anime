class AnimeStaffRelatesController < InheritedResources::Base

  private

    def anime_staff_relate_params
      params.require(:anime_staff_relate).permit(:tid, :staff_id, :staff_roll_id)
    end
end

