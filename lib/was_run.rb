class WasRun < TestCase
  attr_reader :log

  def initialize(name)
    super
  end

  def set_up
    @log = :set_up
  end

  def tear_down
    @log = "#{@log} tear_down"
  end

  def test_method
    @log = "#{@log} test_method"
  end

  def test_broken_method
    @log = "#{@log} test_broken_method"
    raise Exception # 一旦、棚上げ
  end
end
