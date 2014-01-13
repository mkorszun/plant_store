class Api::V1::KindsController < Api::V1::BaseController

  include Api::KindsHelper

  def index
    kinds = GlobalKind.all
    render :json => kinds.to_json(json_format_kind)
  end

end
