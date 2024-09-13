# This is the dog class
class Dog
  def initialize(name)
    @name = name
  end

  # This method is currently covered by a test
  def name
    "#{@name}!!!"
  end

  # FIXME: add a condition
  # This method is NOT currently covered by a test
  def age_in_dog_years
    46
  end

  def age_in_human_years
    9
  end

  def bark
    name
  end

  def not_tested
    "I am not tested"
  end

  def not_tested_2
    if a
      if b
        if c
          if d
            if e
              if f
                if g
                  if h
                    if i
                      if j
                        if k
                          puts "foo"
                        else
                          "I am not tested"
                        end
                      else
                        "I am not tested"
                      end
                    else
                      "I am not tested"
                    end
                  else
                    "I am not tested"
                  end
                else
                  "I am not tested"
                end
              else
                "I am not tested"
              end
            else
              "I am not tested"
            end
          else
            "I am not tested"
          end
        else
          "I am not tested"
        end
      else
        "I am not tested"
      end
    else
      "I am not tested"
    end
  end
end
