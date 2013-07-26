import warnings

class Ebolve:
  """"  EBOLVE (EDWARDS-BELL-OHLSON aLghorithmic Value Engine"""
  
  def __init__(self, input):
    self.eps1 = input['eps1']                    # forecasted eps Year 1
    self.eps2 = input['eps2']                    # forecasted eps Year 2, not neg
    self.ltg = input['ltg']                      # contant rate of eps growth, format 0.25
    self.book_s = input['book_s']                # starting book value
    self.FROE = input['FROE']                    # long term equilibrium ROE, not neg
    self.r = input['r']                          # discount rate, format 0.08
    self.retain = 1.0 - input['pYOUT']           # % dividend payout, format 0.16
    self.years = input['years']                  # total years horizon, i.e. 12
    self.growth_years = input['growth_years']    # years of LTG, i.e. 5
    
  def compute_ebo(self):
    eps, roe, abn_eps, cum_ab_eps, eps_g = 0.0, 0.0, 0.0, 0.0, 0.0
    bv = self.book_s
    roe_step = 0

    in_eps = [self.eps1, self.eps2]
    for i in range(self.growth_years):
      in_eps.append(in_eps[-1]*(1 + self.ltg))
    
    for year in range(self.years):
      if year <= 1 + self.growth_years:
        bv += eps * self.retain
        eps = in_eps[year]
        roe = eps / bv
      else:
        if roe_step == 0:
          roe_step = (self.FROE - roe) / (self.years - self.growth_years - 2)
        bv *= 1 + (roe * self.retain)
        roe += roe_step
        eps_g = eps
        eps = bv * roe
        eps_g = (eps-eps_g)/eps_g
            
      abn_eps = (roe - self.r) * bv
      cum_ab_eps += abn_eps / ((1 + self.r)**(year+1))
    terminal_Value = ((self.FROE - self.r) * bv) / (self.r * (1 + self.r)**self.years)
    
    if bv<0.0 : print("WARN: book value is negative: %f" % bv)
    if terminal_Value<0.0 : print("WARN: terminal value is negative: %f" % terminal_Value)
    if eps<0.0 : print("WARN: negative earnings in perpetuity: %f" % eps)
    if abn_eps<0.0 : print("WARN: negative abnormal earnings in perpetuity: %f" % abn_eps)
    if (eps_g>0.1 or eps_g<0.06) : print('Earnings growing in perpetuity at: %f' % (100*eps_g) + "%")
    
    return (self.book_s + cum_ab_eps + terminal_Value)
  
