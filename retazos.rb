#else  # (return to equlibrium abnormal earn == 0 at end)
##  base = (eps - (@r * bv))
##  abn_step = base / (@years - @growth_years - 2)
##  
##  (2+@growth_years..@years-1).each do |j|
##    base -= abn_step
##    abn_eps = base / ((1 + @r)**(j+1))
##    cum_ab_eps += abn_eps
##    
##    eps += abn_eps
##    bv += eps * @retain
##    roe = eps / bv
##    puts "abnormal roe: #{100*(roe-@r)}%"
##	end
##	terminal_Value = abn_eps / @r
#end
