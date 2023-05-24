class Student

  attr_reader :name, :age, :scores
 
  def initialize(student_details = {})
    @name = student_details[:name]
    @age = student_details[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    return 0 if @scores.empty?

    total_score = @scores.sum
    average = total_score.to_f / @scores.length
    average.round(2)
  end

end
