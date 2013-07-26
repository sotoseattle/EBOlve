require 'rubygems'

###################################################
#	 EBOLVE                                         #
#	 EDWARDS-BELL-OHLSON aLghorithmic Value Engine  #
#	 Javier Soto © 2013                             #
###################################################

class Bebop
  attr_reader :ebo
  
	def initialize (input)
		@eps1 = input[:eps1]                    # forecasted eps Year 1
		@eps2 = input[:eps2]                    # forecasted eps Year 2, not neg
		@ltg = input[:ltg]                      # contant rate of eps growth, format 0.25
	  @book_s = input[:book_s]                # starting book value
		@FROE = input[:FROE]                    # long term equilibrium ROE, not neg
		@r = input[:r]                          # discount rate, format 0.08
	  @retain = 1.0 - input[:pYOUT]           # % dividend payout, format 0.16
		@years = input[:years]                  # total years horizon, i.e. 12
		@growth_years = input[:growth_years]    # years of LTG, i.e. 5
		@ebo = compute_ebo
	end

	def compute_ebo
	  eps, roe, abn_eps, cum_ab_eps, eps_g = 0.0, 0.0, 0.0, 0.0, 0.0
	  bv = @book_s
	  roe_step = nil
	  
	  in_eps = [@eps1, @eps2]
	  @growth_years.times{|i| in_eps << in_eps.last*(1 + @ltg)}
	  
	  (0..@years-1).each do |year|
	    if year <= 1 + @growth_years
	      bv += eps * @retain
	      eps = in_eps[year]
	      roe = eps / bv
	    else
        roe_step ||= (@FROE - roe) / (@years - @growth_years - 2)
        bv *= 1 + (roe * @retain)
  		  roe += roe_step

  		  eps_g = eps
  		  eps = bv * roe
  		  eps_g = (eps-eps_g)/eps_g
      end
      
      abn_eps = (roe - @r) * bv
      cum_ab_eps += abn_eps / ((1 + @r)**(year+1))
    end

    terminal_Value = ((@FROE - @r) * bv) / (@r * (1 + @r)**@years)

    warn("WARN: book value is negative: #{bv}") if bv<0.0
    warn("WARN: terminal value is negative: #{terminal_Value}") if terminal_Value<0.0
    warn("WARN: negative earnings in perpetuity: #{eps}") if eps<0.0
    warn("WARN: negative abnormal earnings in perpetuity: #{abn_eps}") if abn_eps<0.0
    warn("WARN: earnings growing in perpetuity at : #{100*eps_g}") if eps_g>0.1

    return (@book_s + cum_ab_eps + terminal_Value)
	end
	private :compute_ebo
end