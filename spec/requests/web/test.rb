class PullRequest
  TAX = 0.1

  def calculcate
    amount * TAX + amount
  end
end


pull_request = API3dParty.call(id: 1)
pull_request.save

result = Messages::BatchCreate.call(params)
result.data = [
  to_create: [message, reminder],
  to_update: [],
  to_destroy: [],
  to_create_3d_party: [],
  after_commit: {
    send_email: '',
  }
]


# MessageRepository.create(result.data[:to_create])

expect(result.data[:to_create]).eq ([message])

expect(WebMock).to call(3-d)

it 'test Messages::BatchCreate' do
  # clear_database
  result = Messages::BatchCreate.call(params)
  expect(result).to be_successful?
  expect(Message.count).to_eq(1)
  expect(Reminder.count).to_eq(1)
end


# class PullRequest
#   def calculcate
#
#   end
#
#   def chack_assagne!
#
#   end
# end
#
# class PullRequestRepository
#   def save(pull_request)
#
#   end
#
#   def delete(pull_request)
#
#   end
#
#   def list(query)
#
#   end
# end
#
# pull_request = PullRequestRepository.list(id: 23)
#
# pull_request.name = 'New name'
#
# result = PullRequestRepository.save(pull_request)
#
# result


# class PullRequest < ActiveRecord::Base
#   # pull_requests
#   # save
#   # delete
#   # update
# end


