#nosetests -v spec/test_ebo_nose.py 

import Ebolve

def test_1():
    input = {'eps1':1.24, 'eps2':1.54, 'ltg':0.241, 'book_s':5.11, 'FROE':0.2, 'r':0.0960, 'pYOUT':0.16, 'years':12, 'growth_years':5}
    b = Ebolve.Ebolve(input)
    assert b.compute_ebo() == 35.61473978043542


def test_2():
    input = {'eps1':1.24, 'eps2':1.54, 'ltg':0.241, 'book_s':5.11, 'FROE':0.2, 'r':0.0960, 'pYOUT':0.16, 'years':20, 'growth_years':5}
    b = Ebolve.Ebolve(input)
    assert b.compute_ebo() == 75.22110949011996
    
def test_3():
    input = {'eps1':1.47, 'eps2':1.7, 'ltg':0.2995, 'book_s':12.61, 'FROE':0.12, 'r':0.09, 'pYOUT':0, 'years':12, 'growth_years':5}
    b = Ebolve.Ebolve(input)
    assert b.compute_ebo() == 34.228136415711994

    