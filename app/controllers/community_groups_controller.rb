class CommunityGroupsController < InheritedResources::Base

  private

    def community_group_params
      params.require(:community_group).permit(:name)
    end
end

