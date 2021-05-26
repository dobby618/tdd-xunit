class TestSuite
  def initialize
    @tests = []
  end

  def add(test)
    @tests << test
  end

  # test_suite と was_run を composit に？
  def run(result)
    @tests.each do |test|
      # ここで引数に渡してるんだから、test_suite も合わせろってことか。
      test.run(result)
    end
    result
  end
end
