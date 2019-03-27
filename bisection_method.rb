require 'pry'
include Math

def polynomial(t)
  (t ** 2) - (4 * t * sin(t)) + (2*sin(t)**2)
end

def sign(x)
  x < 0 ? 'negative' : 'positive'
end

def bisection(left, right, max, tolerance)
  left_value = polynomial(left)
  right_value = polynomial(right)
  distance = right - left
  steps = 1..max
  if sign(left_value) == sign(right_value)
    return "Choose values with different signs, fool."
  end
  steps.each do |step|
    halfway = (right - left)/2
    midpoint = left + halfway
    function_value = polynomial(midpoint)
    puts "Step: #{step}, Point: #{midpoint}, Function Value: #{function_value}"
    return "Found" if function_value == 0
    return "Tolerance Met" if function_value.abs < tolerance
    if sign(right_value) == sign(function_value)
      right = midpoint
    else
      left = midpoint
    end
  end
end

left = 0.5
right = 2.5
max_steps = 1000
tolerance = 0.000000001

p bisection(left, right, max_steps, tolerance)
