require_relative '../lib/test_result'
require_relative '../lib/test_suite'
require_relative '../lib/test_case'
require_relative '../lib/was_run'

class TestCaseTest < TestCase
  def set_up
    @result = TestResult.new
  end

  def test_template_method
    @test = WasRun.new('test_method')
    @test.run(@result)
    assert('set_up test_method tear_down' == @test.log)
  end

  def test_result
    test = WasRun.new('test_method')
    @result = test.run(@result)
    assert('1 run, 0 failed' == @result.summary)
  end

  def test_failed_result
    test = WasRun.new('test_broken_method')
    @result = test.run(@result)
    assert('1 run, 1 failed' == @result.summary)
  end

  def test_failed_result_formatting
    @result.test_started
    @result.test_failed
    assert('1 run, 1 failed' == @result.summary)
  end

  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new('test_method'))
    suite.add(WasRun.new('test_broken_method'))
    suite.run(@result)
    assert('2 run, 1 failed' == @result.summary)
  end
end

suite = TestSuite.new
suite.add(TestCaseTest.new('test_template_method'))
suite.add(TestCaseTest.new('test_result'))
suite.add(TestCaseTest.new('test_failed_result'))
suite.add(TestCaseTest.new('test_failed_result_formatting'))
suite.add(TestCaseTest.new('test_suite'))

result = TestResult.new
suite.run(result)
pp result.summary
