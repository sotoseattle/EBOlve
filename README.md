EBOlve
======

EDWARDS-BELL-OHLSON aLghorithmic Value Engine
---------------------------------------------

A valuation model based on discounted residual income or abnormal earnings.

Developed in the 1930's initially, provides an alternative valuation to DCF based on more readily available accounting data and earnings forecasts. Should give similar results to DCF.

Coded in Ruby and Python.

Input Parameters

Example:

input = {:eps1=>1.24, :eps2=>1.54, :ltg=>0.241, :book_s=>5.11, :FROE=>0.2,\ :r=>0.0960, :pYOUT=>0.16, :years=>12, :growth_years=>5} b = Bebop.new(input) puts b.ebo

eps1, eps2, ltg: Earnings per share (EPS) estimates, supplied by the user. eps1 and eps2 are the one- and two-year-ahead forecasts, respectively. Ltg is the expected long-term earnings growth rate. For publicly traded firms, all three variables can usually be obtained from online services like finance.yahoo.

book_s: The book value (or total shareholder's equity) per share as of the last fiscal year end. Typically available from last year's annual report or a financial online service.

r: Discount Rate. The cost of common equity for the firm. This is the expected rate of return, and should reflect the riskiness of the cash flows to common shareholders. Large U.S. corporations typically have had historical discount rates of 12 percent. Smaller, more leverage firms, and firms in more volatile industries require higher rates. A typical large cap. firm (Beta=1) calls for a rate of around 9%.

pYOUT: Dividend Payout Ratio. The proportion of earnings expected to be paid out in "net dividends" (dividends + share repurchases - new equity issues) over the forecast period. This variable is typically estimated by dividing the actual dividends per share (DPS) by the earnings per share (EPS). If a firm has a consistent share repurchase policy, the number may need to be adjusted upwards. In case of negative earnings, divide DPS by (6% X total assets per share).

FROE: Equilibrium ROE for the industry. The code is designed to mean revert to this level of ROE for the period between the end of the constant eps growth (ltg) and the total horizon (years). Typically, average ROEs are higher than the average cost of equity due to accounting conservatism. If you have no information about industry ROEs, you may wish to adjust this number until the implied earnings growth rate in the last forecast period (this is the number in the bottom right-most cell of the spreadsheet) is between 6% and 10%. This number represents the nominal earnings growth rate in the last forecast period implied by your target ROE. Given 3 to 4% inflation, and 3 to 4% real earnings growth, an assumption of 6% to 10% for this earnings growth number is justifiable in today's environment.

IMPLIED PRICE

The key output of this model is an estimate of the present value of a firm's cash flows to shareholders. This variable is label "Implied price (best estimate of today's price)." Note that this number is the best estimate of today's stock price. The estimate varies, depending on how many periods we explicitly forecast. However, it is always an estimate of today's price. Generally, the implied price from the last (12th) period is best. The other "Implied Price" numbers (for years 10 to 14) show you what today's price would be if we had truncated the calculation earlier. That is, if we had used a shorter forecast horizon. They illustrate how sensitive the model is to the forecast horizon assumption.

Desarrollo matematico

Read more about this model in "Valuing the Dow: A Bottom-Up Approach" by Charles M.C. Lee and Bhaskaran Swaminathan at the Johnson Graduate School of Management, Cornell University. Financial Analysts Journal - September/October 1999.
