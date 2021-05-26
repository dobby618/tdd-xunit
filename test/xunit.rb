require_relative '../lib/test_case'
require_relative '../lib/was_run'

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    assert_not(test.was_run)
    test.run
    assert(test.was_run)
  end
end

TestCaseTest.new('test_running').run
