module Api::PlantsHelper

  include Api::KindsHelper

  def json_format_plant
    return :include => {:global_kind => json_format_kind},
        :only => [:id, :name, :description]
  end

end

