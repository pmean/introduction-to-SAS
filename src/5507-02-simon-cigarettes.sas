data cig;
  input brand $16. tar nicotine weight co;
datalines; 
Alpine           14.1  .86  .9853  13.6
Benson&Hedges    16.0 1.06 1.0938  16.6
BullDurham       29.8 2.03 1.1650  23.5
CamelLights       8.0  .67  .9280  10.2
Carlton           4.1  .40  .9462   5.4
Chesterfield     15.0 1.04  .8885  15.0
GoldenLights      8.8  .76 1.0267   9.0
Kent             12.4  .95  .9225  12.3
Kool             16.6 1.12  .9372  16.3
L&M              14.9 1.02  .8858  15.4
LarkLights       13.7 1.01  .9643  13.0
Marlboro         15.1  .90  .9316  14.4
Merit             7.8  .57  .9705  10.0
MultiFilter      11.4  .78 1.1240  10.2
NewportLights     9.0  .74  .8517   9.5
Now               1.0  .13  .7851   1.5
OldGold          17.0 1.26  .9186  18.5
PallMallLight    12.8 1.08 1.0395  12.6
Raleigh          15.8  .96  .9573  17.5
SalemUltra        4.5  .42  .9106   4.9
Tareyton         14.5 1.01 1.0070  15.9
True              7.3  .61  .9806   8.5
ViceroyRichLight  8.6  .69  .9693  10.6
VirginiaSlims    15.2 1.02  .9496  13.9
WinstonLights    12.0 .82  1.1184  14.9
;

proc print
    data=cig(obs=5);
  title1 "Listing of first five rows of data";
run;