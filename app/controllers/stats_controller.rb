class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @numbers.max-@numbers.min

    # Median
    # ======

    @len = @sorted_numbers.length
    
    @median = (@sorted_numbers[(@len - 1) / 2] + @sorted_numbers[@len / 2]) / 2.0

    @sum = @numbers.sum

    @mean = ((@numbers.sum)/(@numbers.count)).to_f

    # Variance
    # ========

    @variance = @numbers.map{ |sample| (@mean - sample) ** 2 }.inject(0,:+) / @numbers.size.to_f

    @standard_deviation = Math.sqrt(@variance)

    # Mode
    # ====

    @freq = @numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    
    @mode = @numbers.max_by { |v| @freq[v] }

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
