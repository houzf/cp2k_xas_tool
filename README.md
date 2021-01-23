# cp2k_xas_tool

Broaden the XAS spectra simulated by CP2K.

# input file: 

!---template of input file: **axas.in**----

1

c6h6-at    at

0.3   8.0

800  -231.99076834049202

1     -221.53324945125019   10.66107591480774

.false.

1  260

1   

## Comments for the input files

n        #number of excited atoms

t_ifile    t_ofile  

sigma_min     sigma_max

ne    egs  

iatom(1)   eexcit(1)   eb(1)

iatom(2)   eexcit(2)   eb(2)

... 

iatom(i)   eexcit(i)   eb(i)

...

iatom(n)   eexcit(n)   eb(n)

lsum         #logical variable. if true, sum up the spectra of the selected atoms

nsatom       # number of selected atoms

ebmin         #the starting energy point of broadened XAS data

isatom(1)... isatom(i)... isatom(nsatom)   #the index of selected atoms

## Notes for the remaining variables**

**t_ifile**: prefix of input files of spectra (e.g., if aaa-at1.spectrum is generated by cp2k, then 'aaa-at' will be used for t_ifile)
          
**t_ofile**: prefix of output file. 

**sigma_min**: minimum of sigma (i.e.,$\sigma_\mathrm{min}$ (in eV).

**sigma_max**: maximum of sigma (i.e.,$\sigma_\mathrm{max}$ (in eV). 

**ne**: number of points in the energy axis. 

**egs**: total energy of ground state (in Hartree 

**iatom(i)**: index of excited ato

**eexcit(i)**: total energy of excited state in the DSCF (i.e., deltaSCF) calculations for the excited atom i  (in Hartree).

**eb(i)**: the ionization energy (or binding energy) in the TP_HH  calculations for the excited atom i (in Hartree, positive).

## References

The principles of XAS simulations in CP2K code:

Marcella Iannuzzi and Jürg Hutter, Inner-shell spectroscopy by the Gaussian and augmented plane wave method, *Phys. Chem. Chem. Phys.*, 2007,**9**, 1599-1610; DOI: [10.1039/B615522G](https://doi.org/10.1039/B615522G).

If you use this tool to post-process the XAS data of CP2K, please cite our paper:

Zhufeng Hou, Xianlong Wang, Takashi Ikeda, Shen-Feng Huang, Kiyoyuki Terakura, Mauro Boero, Masaharu Oshima, Masa-aki Kakimoto, and Seizo Miyata, Effect of Hydrogen Termination on Carbon *K*-Edge X-ray Absorption Spectra of Nanographene, *J. Phys. Chem. C* 2011 **115** (13), 5392-5403 DOI: [10.1021/jp110879d](https://doi.org/10.1021/jp110879d).
