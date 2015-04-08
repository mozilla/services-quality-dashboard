# TODO: File bugs for each e2e test and tag to track
SCHEDULER.every '30m', :first_in => 0 do |job|
  send_event('rl_coverage', { value: 60 })
end
