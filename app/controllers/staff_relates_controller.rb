class StaffRelatesController < InheritedResources::Base

  private

    def staff_relate_params
      params.require(:staff_relate).permit(:tid, :staff_id, :staff_roll_id)
    end
end

