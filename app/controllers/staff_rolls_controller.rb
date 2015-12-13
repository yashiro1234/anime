class StaffRollsController < InheritedResources::Base

  private

    def staff_roll_params
      params.require(:staff_roll).permit(:name, :name_yomi)
    end
end

