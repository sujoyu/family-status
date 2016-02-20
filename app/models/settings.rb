class Settings

	def self.questions
		@@QUESTIONS
	end

	def self.answer_selections
		@@ANSWER_SELECTIONS
	end

	@@QUESTIONS =
      [
        "げんきがない。",
        "ぐあいがわるい。",
        "おでかけしたい。",
        "みんなおうちにいて。",
        "やるべきことがある。",
        "いやなことがあった。"
      ].freeze

  @@ANSWER_SELECTIONS =
      {
        "とてもそう思う" => "so_so",
        "まぁそう思う" => "so",
        "なんとも言えない" => "neither",
        "みんなにまかせる" => "either",
        "あまりそう思わない" => "not_so",
        "まったくそう思わない" => "not_so_at_all"
      }.freeze
end