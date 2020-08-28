module FeelingHelper
  def calculate_period(period)
    case period.try(:to_sym)
    when :day
      Date.today
    when :week
      Date.today-7.days
    when :month
      Date.today-30.days
    when :year
      Date.today - 365.days
    else
      Date.today-7.days
    end
  end
end