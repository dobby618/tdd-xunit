require_relative '../lib/test_case'
require_relative '../lib/was_run'

class TestCaseTest < TestCase
  def test_template_method
    @test = WasRun.new('test_method')
    @test.run
    assert('set_up test_method tear_down' == @test.log)
  end
end

TestCaseTest.new('test_template_method').run
