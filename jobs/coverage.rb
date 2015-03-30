# TODO: File bugs for each e2e test and tag to track
SCHEDULER.every '1m', :first_in => 0 do |job|
  send_event('coverage', { value: 80.19 })
end
