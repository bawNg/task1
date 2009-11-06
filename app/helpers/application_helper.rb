# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_user(user)
    returning(user) do |u|
      u.coverage ||= Coverage.new
      u.coverage_period ||= CoveragePeriod.new
    end
  end
end
