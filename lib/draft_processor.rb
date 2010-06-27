class DraftProcessor
  class << self
    def run(teams, draft)
      tmp_round = 0
      draft_order = teams.shuffle
      
      10.times do |r|
        r == 0 ? round = 0 : round = tmp_round
        draft_order.each do |d|
          round += 1
          draft.draft_rounds.create(:round => round, :team_id => d)
        end
        tmp_round = round
      end
    end
  end
end