//Parameters for the coalescence simulation program : fastsimcoal.exe
15 samples to simulate :
//Population effective sizes (number of genes)
NER
NDC
NSA
NBU
NFC
NAB
NLCB
NBW
Ncor
NCat
NGC
NIC
NCC
NKF
NTH
//Haploid samples sizes 
4
4
4
4
4
4
4
4
4
4
4
4
4
4
4
//Growth rates: negative growth implies population expansion
0
0
0
0
0
0
0
0
0
0
0
0
0
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	m1	0	0	0	0	0	0	0	0	0	0	0	0
0	m1	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	m1	0	0	0	0	0
0	0	0	0	0	0	0	0	m1	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
//Migration matrix 1
0	0	0	0	0	0	0	0	0	0	0	0	0	0	m2
0	0	m1	m2	m2	m2	m2	m2	0	0	0	0	0	m2	0
0	m1	0	m2	m2	m2	m2	m2	0	0	0	0	0	m2	0
0	m2	m2	0	m1	m2	m2	m2	0	0	0	0	0	m2	0
0	m2	m2	m1	0	m2	m2	m2	0	0	0	0	0	m2	0
0	m2	m2	m2	m2	0	m2	m2	0	0	0	0	0	m1	0
0	m2	m2	m2	m2	m2	0	m1	0	0	0	0	0	m2	0
0	m2	m2	m2	m2	m2	m1	0	0	0	0	0	0	m2	0
0	0	0	0	0	0	0	0	0	m1	m2	m2	m2	0	0
0	0	0	0	0	0	0	0	m1	0	m2	m2	m2	0	0
0	0	0	0	0	0	0	0	m2	m2	0	m2	m2	0	0
0	0	0	0	0	0	0	0	m2	m2	m2	0	m2	0	0
0	0	0	0	0	0	0	0	m2	m2	m2	m2	0	0	0
0	m2	m2	m2	m2	m1	m2	m2	0	0	0	0	0	0	0
m2	0	0	0	0	0	0	0	0	0	0	0	0	0	0
//Migration matrix 2
0	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m2
m3	0	m1	m2	m2	m2	m2	m2	m3	m3	m3	m3	m3	m2	m3
m3	m1	0	m2	m2	m2	m2	m2	m3	m3	m3	m3	m3	m2	m3
m3	m2	m2	0	m1	m2	m2	m2	m3	m3	m3	m3	m3	m2	m3
m3	m2	m2	m1	0	m2	m2	m2	m3	m3	m3	m3	m3	m2	m3
m3	m2	m2	m2	m2	0	m2	m2	m3	m3	m3	m3	m3	m1	m3
m3	m2	m2	m2	m2	m2	0	m1	m3	m3	m3	m3	m3	m2	m3
m3	m2	m2	m2	m2	m2	m1	0	m3	m3	m3	m3	m3	m2	m3
m3	m3	m3	m3	m3	m3	m3	m3	0	m1	m2	m2	m2	m3	m3
m3	m3	m3	m3	m3	m3	m3	m3	m1	0	m2	m2	m2	m3	m3
m3	m3	m3	m3	m3	m3	m3	m3	m2	m2	0	m2	m2	m3	m3
m3	m3	m3	m3	m3	m3	m3	m3	m2	m2	m2	0	m2	m3	m3
m3	m3	m3	m3	m3	m3	m3	m3	m2	m2	m2	m2	0	m3	m3
m3	m2	m2	m2	m2	m1	m2	m2	m3	m3	m3	m3	m3	0	m3
m2	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	m3	0
//historical event: time, source, sink, migrants, new deme size, new growth rate, migration matrix index
2 historical event
Tnew 0 0 0 1 0 1
Told 0 0 0 1 0 2
//Number of independent loci [chromosome] 
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per generation recombination and mutation rates and optional parameters
FREQ 1 0 5e-9 OUTEXP

