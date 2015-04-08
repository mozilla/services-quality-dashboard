require 'rest-client'
require 'json'

complete_percent = 0
SCHEDULER.every '30m', :first_in => 0 do |job|
  # all bugs in operations: deployment request that are resolved
  last_percent = complete_percent
  url = 'https://bugzilla.mozilla.org/rest/bug?include_fields=id,status&f1=blocked&o1=equals&priority=P1&priority=P2&v1=1123529'
  response = RestClient.get(url)
  buglist = JSON.parse(response)
  completed = []
  for bug in buglist["bugs"]
    status = bug["status"]
    if ["VERIFIED", "RESOLVED"].include? status
      completed << bug
    end
  end
  complete_percent = completed.size.to_f / buglist["bugs"].size.to_f
  complete_percent *= 100
  send_event('rl_burndown', { current: complete_percent.round(2), last: last_percent })
end
