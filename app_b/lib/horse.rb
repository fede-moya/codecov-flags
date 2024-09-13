class Horse
  def initialize(name, color)
    @name = name
    @color = color
  end



  
  def ride(_rider_name)
    puts "testtttttttttttt"
    puts "#{_rider_name.to_s} is riding this horse"
    puts "noone is riding this horse" if _rider_name.nil?
    if _rider_name.includes('saint')
      puts "his holiness, #{_rider_name.to_s} is riding this horse"
    elsif _rider_name.includes('knight')
      if @color == 'white'
        puts "the great #{_rider_name.to_s} is riding a shiny #{color.to_s} horse"
      elsif @color == 'black'
        puts "the fearsome #{_rider_name.to_s} is riding a dark #{color.to_s} horse"
      end
    end
  end

  def riding(_rider_name)
    puts "testtttttttttttt"
    puts "#{_rider_name.to_s} is riding this horse"
    puts "noone is riding this horse" if _rider_name.nil?
    if _rider_name.includes('saint')
      puts "his holiness, #{_rider_name.to_s} is riding this horse"
    elsif _rider_name.includes('knight')
      if @color == 'white'
        puts "the great #{_rider_name.to_s} is riding a shiny #{color.to_s} horse"
      elsif @color == 'black'
        puts "the fearsome #{_rider_name.to_s} is riding a dark #{color.to_s} horse"
      end
    end
  end
end
