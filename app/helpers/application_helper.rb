module ApplicationHelper
  def music_by_type
    pairing = TunesTakeout.top_limit(20)
  end
end
