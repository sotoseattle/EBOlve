# EBOlve

### EDWARDS-BELL-OHLSON aLghorithmic Value Engine

A valuation model based on discounted residual income or abnormal earnings. Similar in nature to EVA (Economic Value Added) developed by Bennett Stewart. Both EVA and EBO rely on the idea of "residual income", defined as earnings in excess of an expected level of performance. Developed initially in the 1930's, it provides an alternative valuation to DCF based on more readily available accounting data and earnings forecasts. Since the theoretical underpinnings are the same as the DDM (and therefore DCF), it  should give similar results to DCF as long as the clear-surplus assumption holds.

### Input Parameters

**eps1, eps2, ltg**: Earnings per share estimates. eps1 and eps2 are the one- and two-year forecasts, respectively. Ltg is the constant growth rate at which earnings per share as forecasted to grow from year 3 till the end of a 'growth period'. For publicly traded firms these values can usually be obtained from online services like finance.yahoo.

**growth_years**: Number of years after Y1 and Y2 at which earnings grow at an specified constant rate. After this period, the earnings are computed according to diminishing ROEs as the annual ROE converges to the FROE value at the end of the time horizon.

**years**: Total number of years considered by the model. It covers three periods: 1) Y1 and Y2 with deterministic earnings eps1 and eps2. 2) growth_years at which earnings grow at a constant rate. 3) remaining period until end of 'years' with earnings for which ROE converges to FROE.

**book_s**: The starting book value (or total shareholder's equity) per share as of the last fiscal year end (year zero). Usually available from last year's annual report or a financial online service.

**r**: Discount Rate. The cost of common equity for the firm. This is the expected rate of return, and should reflect the riskiness of the cash flows to common shareholders. A typical large firm calls for a rate of around 9%.

**pYOUT**: Dividend Payout Ratio. The proportion of earnings expected to be paid out in "net dividends" (dividends + share repurchases - new equity issues) over the forecast period. This variable is typically estimated by dividing the actual dividends per share (DPS) by the earnings per share (EPS). If a firm has a consistent share repurchase policy, the number may need to be adjusted upwards. In case of negative earnings, divide DPS by (6% X total assets per share).

**FROE**: Equilibrium ROE for the industry. The code is designed to mean revert to this level of ROE for the period between the end of the constant eps growth period and the total time horizon (years). Typically, average ROEs are higher than the average cost of equity due to accounting conservatism. If no information about industry ROEs is available, adjust this number until the implied earnings growth rate in the last forecast period is between 6% and 10% (a warning message is displayed for perpetual growth rates outside of this range).

**EBO Value**: The key output of this model is an estimate of the present value of a firm's cash flows to shareholders. 


### Usage

```ruby
> irb
>> x = {:eps1=>1.24, :eps2=>1.54, :ltg=>0.241, :book_s=>5.11, :FROE=>0.2,\
        :r=>0.0960, :pYOUT=>0.16, :years=>12, :growth_years=>5}
>> y = Ebolve.new(input)
>> puts y.ebo
```

```python
> python
>>> import Ebolve
>>> x =   {'eps1':1.24, 'eps2':1.54, 'ltg':0.241, 'book_s':5.11, 'FROE':0.2,\
           'r':0.0960, 'pYOUT':0.16, 'years':20, 'growth_years':5}
>>> z = Ebolve.Ebolve(x)
>>> z.compute_ebo()
```

### Read more about this:

- "[Measuring Wealth](http://www.exinfm.com/pdffiles/ca.pdf)." by Prof. Charles M.V.Lee
- "[Valuing the Dow: A Bottom-Up Approach](http://forum.johnson.cornell.edu/faculty/swaminathan/Published%20Papers/FAJ_99.pdf)" and "[What is the Intrinsic Value of the Dow?](http://forum.johnson.cornell.edu/faculty/swaminathan/Published%20Papers/JF_99.pdf)" by Charles M.C. Lee and Bhaskaran Swaminathan at the Johnson Graduate School of Management, Cornell University.
- "[The P/B ROE Model Revisited](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CCwQFjAA&url=http%3A%2F%2Fwww.northinfo.com%2Fdocuments%2F29.pdf&ei=odzyUcrpH4mbigKwj4GoBA&usg=AFQjCNFGLWYebY8eIMvOyuMWJ_huroUt5Q&bvm=bv.49784469,d.cGE)" by Jarrod Wilcox.
- "[Comparison Of The Residual Income Valuation (EBO), Abnormal Earnings Growth And Free Cash Flow Models](http://www.bbronline.com.br/public/edicoes/5_2/artigos/dpwjpedzii2122010102522.pdf)" by Eric Serrano Ferreira, Valcemiro Nossa, Bruno Cesar Aurichio Ledo, Arilda Magna Campagnharo Teixeira and Alexsandro Broedel Lopes.
 

### License

<table>
<tr><td>Author:</td><td>Javier Soto / fsoto [at] xinaptic [dot] com</td></tr>
<tr><td>Requires:</td><td>Ruby 1.9.x or later and/or Python ??</td></tr>
</table>

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a> Ebolve is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/deed.en_US">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
