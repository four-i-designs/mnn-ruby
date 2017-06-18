
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'vector_math'
require_relative './test_utils.rb'

class TestNVector < TestUtils
  
  def setup
    @v = NVector.new(4)
    # populate new vector
    for i in 0...4
      @v[i] = i*1.0
    end
  end
  
  #=============================================================================
  def test_inner_product_with()
    log_banner()
    
    # create test vector
    v_test = NVector.new(3)
    v_test[0] = 2.0
    v_test[1] = 1.0
    v_test[2] = 3.0
    
    # test if smaller
    ip_smaller = @v.inner_product_with(v_test)
    assert_equal(ip_smaller, 7)
    result = (ip_smaller == 7) ? "PASS" : "FAIL"
    log_result(result, "With smaller vector - the inner product of #{@v} and #{v_test} is #{ip_smaller}")

    # test if same size
    v_test[3] = 2.3
    ip_same = @v.inner_product_with(v_test)
    assert_equal(ip_same.round(1), 13.9)
    result = (ip_same.round(1) == 13.9) ? "PASS" : "FAIL"
    log_result(result, "With same size vector - the inner product of #{@v} and #{v_test} is #{ip_same.round(1)}")

    # test if bigger
    v_test[4] = 4.7
    ip_bigger = @v.inner_product_with(v_test)
    assert_equal(ip_bigger.round(1), 13.9)
    result = (ip_bigger.round(1) == 13.9) ? "PASS" : "FAIL"
    log_result(result, "With bigger vector - the inner product of #{@v} and #{v_test} is #{ip_bigger.round(1)}")
  end
  
  #=============================================================================
  def test_add()
    log_banner()

    # create test vector
    v_test = NVector.new(3)
    v_test[0] = 2.0
    v_test[1] = 1.0
    v_test[2] = 3.0
        
    # test if smaller
    msg = "The addition of #{@v} and #{v_test} is "
    @v.add(v_test)
    expected = [2.0, 2.0, 5.0, 3.0]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")

    # test if same size
    v_test[3] = 2.3
    msg = "The addition of #{@v} and #{v_test} is "
    @v.add(v_test)
    expected = [4.0, 3.0, 8.0, 5.3]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")

    # test if bigger
    v_test[4] = 4.7
    msg = "The addition of #{@v} and #{v_test} is "
    @v.add(v_test)
    expected = [6.0, 4.0, 11.0, 7.6]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")
  end
  
  #=============================================================================
  def test_subtract()
    log_banner()

    # create test vector
    v_test = NVector.new(3)
    v_test[0] = 2.0
    v_test[1] = 1.0
    v_test[2] = 3.0
    
    @v[0] = 6.0
    @v[1] = 4.0
    @v[2] = 11.0
    @v[3] = 7.6
        
    # test if smaller
    msg = "The subtraction of #{@v} and #{v_test} is "
    @v.subtract(v_test)
    expected = [4.0, 3.0, 8.0, 7.6]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")

    # test if same size
    v_test[3] = 2.3
    msg = "The addition of #{@v} and #{v_test} is "
    @v.subtract(v_test)
    expected = [2.0, 2.0, 5.0, 5.3]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")

    # test if bigger
    v_test[4] = 4.7
    msg = "The addition of #{@v} and #{v_test} is "
    @v.subtract(v_test)
    expected = [0.0, 1.0, 2.0, 3.0]
    assert_equal(@v, expected)
    result = (@v == expected) ? "PASS" : "FAIL"
    log_result(result, "#{msg} #{@v}")
  end
  
  #=============================================================================
  def test_to_string()
    log_banner()
    
    v_test = NVector.new(3)
    v_test[0] = 2.0
    v_test[1] = 1.0
    v_test[2] = 3.0
    
    expected = "[2.0, 1.0, 3.0]"
    result = (expected == v_test.to_string)  ? "PASS" : "FAIL"
    assert_equal(expected, v_test.to_string)
    msg = "Expected: #{expected} - Actual: #{v_test.to_string}"
    log_result(result, msg)
  end
  
  #=============================================================================
  def test_outer_product()
    log_banner()
     v_test_a = NVector.new(3, [2.0,1.0,3.0])
     v_test_b = NVector.new(3, [4.0,5.0,1.2])
     
    actual = v_test_b.outer_product(v_test_a, v_test_b)
    expected = "[8.0, 5.0, 3.5999999999999996]"
    assert(expected, actual.to_string)
    result = (expected == actual.to_string)  ? "PASS" : "FAIL"
    msg = "Expected: #{expected} - Actual: #{actual.to_string}"
    log_result(result, msg)
  end
  
  #=============================================================================
  def test_scale()
    log_banner()
    
    @v.scale_by(2.1)
    expected = "[0.0, 2.1, 4.2, 6.300000000000001]"
    actual = @v.to_string
    assert_equal(expected, actual)
    result = (expected == actual)  ? "PASS" : "FAIL"
    msg = "Expected: #{expected} - Actual: #{actual}"
    log_result(result, msg)
  end
  
end #-- TestNVector
