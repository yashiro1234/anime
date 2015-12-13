class StaffsController < InheritedResources::Base

  private

    def staff_params
      params.require(:staff).permit(:name, :name_yomi)
    end
end

