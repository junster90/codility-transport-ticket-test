def solution(a)
  daily_ticket_price = 2
  weekly_ticket_price = 7
  monthly_ticket_price = 25

  input = a.clone

  cost = 0

  return monthly_ticket_price if input.length >= 23

  until input.length.zero?
    today = input.first

    end_of_week = today + 6
    week_utilization = input.select { |x| x <= end_of_week }

    better_op_exists = false

    week_utilization.each do |day|
      last_day = day + 6
      potential = input.select { |x| x >= day && x <= last_day }
      better_op_exists = true if potential.length > week_utilization.length
    end

    if week_utilization.length >= 4 && !better_op_exists
      cost += weekly_ticket_price
      input.reject! { |x| x <= end_of_week }
    else
      cost += daily_ticket_price
      input.delete(today)
    end
  end
  cost
end

puts solution(ARGV.map(&:to_i))
