class TestCase
  def initialize(name)
    @name = name
  end

  def run
    result = TestResult.new
    result.test_started
    set_up
    begin
      send("#{@name}")
    rescue StandardError
      result.test_failed
    end
    tear_down
    result
  end

  def set_up; end

  def tear_down; end

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
