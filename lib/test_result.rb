class TestResult
  def initialize
    @run_count = 0
  end

  def test_started
    @run_count += 1
  end

  def summary
    "#{@run_count} run, 0 failed"
  end
end
