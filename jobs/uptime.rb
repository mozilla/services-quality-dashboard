# TODO: Where to get uptime stats?
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('uptime', { value: 99.99 })
end
