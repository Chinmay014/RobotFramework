## About this repository
This repository demonstrates a test automation of website testing(specifically, ebay.com) in robot framework. It tests the following:
- whether the correct product is being searched
- whether the consideration of search category is taken into account
- whether the sorting of products by price works

It appears the sorting algorithm at Ebay takes other factors than just the price into account, since the 'low to high' sorting is incorrect almost 50% of the time.

## How to run
The repository contains three scripts(at this version), one for each of the above tests. They are further divided based on input data.

To run test for correct product and category, type the following in terminal:
<code>robot -d Results/BasicSearch Tests/eBay/BasicSearch.robot</code>

To run test for low to high sort, type the following:
<code> robot -d Results/PriceSort Tests/eBay/PriceSort.robot</code>

To run test for high to low sort, type the following:
<code> robot -d Results/PriceReverseSort Tests/eBay/PriceReverseSort.robot</code>

The argument next to `-d` indicates the location of test reports. These are located in the `Results` folder.

## Dependencies
Following is the list of packages that were used with python 3.9
<pre>
attrs                          23.2.0
certifi                        2024.2.2
cffi                           1.16.0
docutils                       0.20.1
exceptiongroup                 1.2.0
h11                            0.14.0
idna                           3.6
outcome                        1.3.0.post0
pip                            24.0
pycparser                      2.21
Pygments                       2.17.2
PySocks                        1.7.1
robotframework                 7.0
robotframework-datadriver      1.11.0
robotframework-pythonlibcore   4.3.0
robotframework-seleniumlibrary 6.2.0
selenium                       4.18.1
setuptools                     57.4.0
sniffio                        1.3.1
sortedcontainers               2.4.0
trio                           0.24.0
trio-websocket                 0.11.1
typing_extensions              4.10.0
urllib3                        2.2.1
wsproto                        1.2.0
</pre>
the `requirements.txt` is also included