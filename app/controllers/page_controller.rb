class PageController < ApplicationController
  def home
    @calc_type = "square"
    render({ :template => "game_templates/new" })
  end

  def new
    @calc_type = params.fetch("calc_type")
    render({ :template => "game_templates/new" })
  end

  def results
    @calc_type = params.fetch("calc_type")

    if @calc_type == "square"
      @num = params.fetch("number").to_f
      @result = @num * @num
    elsif @calc_type == "square_root"
      @num = params.fetch("number").to_f
      @result = Math.sqrt(@num)

    elsif @calc_type == "payment"
      @apr = params.fetch("apr").to_f
      @yrs = params.fetch("years").to_i
      @princi = params.fetch("principal").to_f

      r = (@apr / 100.0) / 12.0
      n = @yrs * 12.0
      p = @princi
      @pay = (r * p) / (1 - ((1 + r)**(-n)))

    else #@calc_type == "random"
      @min = params.fetch("min").to_f
      @max = params.fetch("max").to_f
      @result = rand(@min..@max)

    end

    render({ :template => "game_templates/results" })
  end
end
