class Form::StatusCollection < Form::Base
  attr_accessor :statuses
  attr_reader :questions
  attr_reader :answer_selections

  def initialize(attributes = {})
    super attributes
    self.statuses = Settings.questions.map { |q| Form::Status.new({ "question" => q }) } unless statuses.present?
    @questions = Settings.questions
    @answer_selections = Settings.answer_selections
  end

  def statuses_attributes=(attributes)
    self.statuses = attributes.map do |_, status_attributes|
      Form::Status.new(status_attributes)
    end
  end

  def valid?
    valid_statuses = self.statuses.map(&:valid?).all?
    super && valid_statuses
  end

  def save
    return false unless valid?
    Status.transaction { self.statuses.each(&:save!) }
    true
  end
end