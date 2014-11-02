describe RoutemasterListener do
  it 'broadcasts event to Routemaster' do
    subject.on_vote_cast(1)
    # how to test? without Webmock...
    # can inject client to listener and assert on that
  end
end

