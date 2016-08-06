def solution(a)
  input = a.clone
  daily_ticket = 2
  weekly_ticket = 7
  monthly_ticket = 25

  cost = 0

  return 25 if input.length >= 23

  while input.zero?
    today = input.first

    end_of_week = today + 6
    week_utilization = input.select { |x| x <= end_of_week }

    better_op_exists = false

    week_utilization.each do |day|
      last_day = day + 6
      potential = input.select { |x| x >= day && x <= last_day }
      better_op_exists =  true if potential.length > week_utilization.length
    end

    if week_utilization.length >= 4 && !better_op_exists
      cost += weekly_ticket
      input.reject! { |x| x <= end_of_week }
    else
      cost += daily_ticket
      input.delete(today)
    end
  end
  cost
end
