#===============================================================================
# DESCRIPTION:
#   Utility file with vector and matrix objects taylors for use in calculations
#   in neural mesh networks
#   
# COPYRIGHT:
#   Steven M. Lyles & 4I Designs
#   steven.lyles@gmail.com
#   stevenlyles.net
#   github.com/four-i-designs/
#===============================================================================
require 'matrix'


#===============================================================================
# Provides basic vector methods
#
# == Parameters
#
# +size+ : The number of elements in the vector<br>
# +initial_data+ : (optional; default=null) An array of data with which to 
# initial the vector<br>
#
#===============================================================================
class NVector < Array

  #============
  # Constructor
  def initialize(size, initial_data=nil)
    if (initial_data.nil?)
      size.times {self << 0.0}
    else
      raise "Initial Data size is smaller than NVector size" if initial_data.length < size
      for i in 0...size
        self[i] = initial_data[i]
      end
    end
  end
  
  #=============================================================================
  # Returns vector as printable string
  #
  # == Parameters
  # none
  #
  # == Returns
  # Vector as a string
  #=============================================================================
  def to_string()
    str = "["
    self.each { |v| str += "#{v}, "}
    str = str.chomp(", ")
    str += "]"
    return str
  end
  
  #=============================================================================
  # Find the inner product of this vector with a given one
  #
  # == Parameters
  # +a_vector+ : Another NVector instance to get dot product with
  #
  # == Returns
  # Inner product as an integer
  #=============================================================================
  def inner_product_with(a_vector) 
    ip = 0.0;

    (self.length - a_vector.length).times { a_vector << 0.0 } if (a_vector.length < self.length)
    self.each_with_index { |value, index| ip += value * a_vector[index] }

    return ip;
  end
  
  #=============================================================================
  # Find the inner product of two NVectors
  #
  # == Parameters
  # +a_vector+ : First NVector instance<br>
  # +b_vector+ : Second NVector instance
  #
  # == Returns
  # Inner product as an integer
  #=============================================================================
  def inner_product(a_vector, b_vector) 
    ip = 0.0;

    (a_vector.length - b_vector.length).times { a_vector << 0.0 } if (a_vector.length < a_vector.length)
    a_vector.each_with_index { |value, index| ip += value * b_vector[index] }

    return ip;
  end
  
  #=============================================================================
  # Find the outer product of two NVectors
  #
  # == Parameters
  # +a_vector+ : First NVector instance<br>
  # +b_vector+ : Second NVector instance
  #
  # == Returns
  # Outer product as a new NVector instance
  #============================================================================
  def outer_product(a_vector, b_vector)
    result = NVector.new(a_vector.length)
    for i in 0...result.length
      result[i] = a_vector[i] * b_vector[i]
    end
    return result
  end
  
  #=============================================================================
  # Add a given vector to this vector<br>
  # NOTE: if the given vector is larger than this one some of it's data will be
  # dropped. If it is smaller only the elements of the given vector will be added 
  # to this vector. <br> e.g. [0,1,3] + [1,2,3,4] = [1,3,6,4]
  #       
  # == Parameters
  # +a_vector+ : Another NVector instance to add to this instance
  #
  # == Returns
  # None; New internal state of this object is updated
  #=============================================================================
  def add(a_vector) 
    if (a_vector.length > self.length) #-- truncate some given data
      self.each_with_index { |value, index| self[index] += a_vector[index] }
    else #-- given vector is same or smaller than this object's vector
      a_vector.each_with_index { |value, index| self[index] += value }
    end
  end
  
  #=============================================================================
  # Subtract a given vector to this vector
  #       
  # == Parameters
  # +a_vector+ : Another NVector instance to subtract from this instance
  #
  # == Returns
  # None; New internal state of this object is updated
  #=============================================================================
  def subtract(a_vector) 
    if (a_vector.length > self.length) #-- truncate some given data
      self.each_with_index { |value, index| self[index] -= a_vector[index] }
    else #-- given vector is same or smaller than this object's vector
      a_vector.each_with_index { |value, index| self[index] -= value }
    end
  end
  
  #=============================================================================
  # Increase each element of the vector by a scaler value
  #       
  # == Parameters
  # +factor+ : scaler value to scale (multiply) vector by
  #
  # == Returns
  # None; New internal state of this object is updated
  #=============================================================================
  def scale_by(factor)
    self.each_with_index { |value, index| self[index] = value * factor }
  end
  
end #-- Class NVector
