class TestCase
  def initialize(name)
    @name = name
  end

  def run
    send("#{@name}")
  end

  def assert(object, message = nil)
    if object
      p true
    else
      p 'ERROR'
    end
    p message if message
  end

  def assert_not(object, message = nil)
    if object
      p 'ERROR'
    else
      p true
    end
    p message if message
  end
end
