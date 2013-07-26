# EBOlve

### EDWARDS-BELL-OHLSON aLghorithmic Value Engine

A valuation model based on discounted residual income or abnormal earnings. Developed initially in the 1930's, it provides an alternative valuation to DCF based on more readily available accounting data and earnings forecasts. Since the theoretical underpinnings are the same as the DDM (and therefore DCF), it  should give similar results to DCF as long as the clear-surplus assumption holds. (see mathematical derivation below).

Coded in Ruby and Python.

#### Input Parameters

**eps1, eps2, ltg**: Earnings per share estimates. eps1 and eps2 are the one- and two-year forecasts, respectively. Ltg is the constant growth rate at which earnings per share as forecasted to grow from year 3 till the end of a 'growth period'. For publicly traded firms these values can usually be obtained from online services like finance.yahoo.

**growth_years**: Number of years after Y1 and Y2 at which earnings grow at an specified constant rate. After this period, the earnings are computed according to diminishing ROEs as the annual ROE converges to the FROE value at the end of the time horizon.

**years**: Total number of years considered by the model. It covers three periods: 1) Y1 and Y2 with deterministic earnings eps1 and eps2. 2) growth_years at which earnings grow at a constant rate. 3) remaining period until end of 'years' with earnings for which ROE converges to FROE.

**book_s**: The starting book value (or total shareholder's equity) per share as of the last fiscal year end (year zero). Usually available from last year's annual report or a financial online service.

**r**: Discount Rate. The cost of common equity for the firm. This is the expected rate of return, and should reflect the riskiness of the cash flows to common shareholders. A typical large firm calls for a rate of around 9%.

**pYOUT**: Dividend Payout Ratio. The proportion of earnings expected to be paid out in "net dividends" (dividends + share repurchases - new equity issues) over the forecast period. This variable is typically estimated by dividing the actual dividends per share (DPS) by the earnings per share (EPS). If a firm has a consistent share repurchase policy, the number may need to be adjusted upwards. In case of negative earnings, divide DPS by (6% X total assets per share).

**FROE**: Equilibrium ROE for the industry. The code is designed to mean revert to this level of ROE for the period between the end of the constant eps growth period and the total time horizon (years). Typically, average ROEs are higher than the average cost of equity due to accounting conservatism. If no information about industry ROEs is available, adjust this number until the implied earnings growth rate in the last forecast period is between 6% and 10% (a warning message is displayed for perpetual growth rates outside of this range).

**EBO Value**: The key output of this model is an estimate of the present value of a firm's cash flows to shareholders. 


Example:

```
$ irb
>> x = {:eps1=>1.24, :eps2=>1.54, :ltg=>0.241, :book_s=>5.11, :FROE=>0.2,\ :r=>0.0960, :pYOUT=>0.16, :years=>12, :growth_years=>5}
>> y = Ebolve.new(input)
>> puts y.ebo
```

Read more about this model in "Valuing the Dow: A Bottom-Up Approach" by Charles M.C. Lee and Bhaskaran Swaminathan at the Johnson Graduate School of Management, Cornell University. Financial Analysts Journal - September/October 1999.


#### Mathematical Derivation

...
