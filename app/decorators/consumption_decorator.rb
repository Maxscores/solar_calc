class ConsumptionDecorator < SimpleDelegator
  def graphable_daily_consumption
    start_day = Time.new("01-01")
    daily_consumption.map do |energy|
      formatted = [start_day, energy]
      start_day += 1.day
      formatted
    end
  end

  def graph_formatter(daily_total)
    start_hour = Time.new("00:00:00")
    (default_consumption_profile).reduce([]) do |formatted, energy|
      if formatted.empty?
        formatted << [start_hour, energy * daily_total]
      else
        formatted << [start_hour, formatted[-1][1] + energy * daily_total]
      end
      start_hour += 1.hour
      formatted
    end
  end

  def consumption_on_spring_equinox
    graph_formatter(avg_daily_consumption[2])
  end

  def consumption_on_summer_solstice
    graph_formatter(avg_daily_consumption[5])
  end

  def consumption_on_fall_equinox
    graph_formatter(avg_daily_consumption[8])
  end

  def consumption_on_winter_solstice
    graph_formatter(avg_daily_consumption[10])
  end
end