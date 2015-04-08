# TODO: Where to get uptime stats?
SCHEDULER.every '30m', :first_in => 0 do |job|
  send_event('rl_downtime', { current: 1.2, last: 0 })
end
