class Question
  attr_reader :n1, :n2
  def initialize
    @n1 = rand(20)+1.0
    @n2 = rand(20)+1.0
  end

  def generate_question(operator)
    "What does #{@n1} #{operator} #{@n2} equal? (round to second decimal place if necessary)"
  end

  def correct?(res, ans)
    @correct = (res == ans)
  end

  def generate_response
    if @correct
      "YES! You are correct."
    else
      "Seriously? No!"
    end
  end


  def check_ans(res, operator)
    case operator
    when "plus"
      ans = @n1 + @n2
    when "multiplied by"
      ans = @n1 * @n2
    when "divided by"
      ans = @n1 / @n2
    when "subtracted by"
      ans = @n1 - @n2
    end
    self.correct?(res.to_f.round(2), ans.round(2))
  end
end


class Sum < Question

  def ask
    self.generate_question("plus")
  end

  def check(res)
    self.check_ans(res, "plus")
  end
end

class Mult < Question

  def ask
    self.generate_question("multiplied by")
  end

  def check(res)
    self.check_ans(res, "multiplied by")
  end
end

class Div < Question

  def ask
    self.generate_question("divided by")
  end

  def check(res)
    self.check_ans(res, "divided by")
  end
end

class Sub < Question

  def ask
    self.generate_question("subtracted by")
  end

  def check(res)
    self.check_ans(res, "subtracted by")
  end
end