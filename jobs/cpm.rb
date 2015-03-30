# TODO: Where to get crash stats?
# DataDog when ready
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('cpm', { current: 0, last: 0 })
end
