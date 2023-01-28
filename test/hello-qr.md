
For a demonstration of a line plot on a polar axis, see
[Figure 1](#fig-polar).

``` python
import numpy as np
import matplotlib.pyplot as plt

r = np.arange(0, 2, 0.01)
theta = 2 * np.pi * r
fig, ax = plt.subplots(
  subplot_kw = {'projection': 'polar'} 
)
ax.plot(theta, r)
ax.set_rticks([0.5, 1, 1.5, 2])
ax.grid(True)
plt.show()
```

<figure>
<img src="hello-qr_files/figure-commonmark/fig-polar-1.png"
id="fig-polar" alt="Figure 1: A line plot on a polar axis" />
<figcaption aria-hidden="true">Figure 1: A line plot on a polar
axis</figcaption>
</figure>

Display linux info of this docker conitainer.

``` bash
cat /etc/os-release
cat /proc/version
```

    PRETTY_NAME="Ubuntu 22.04.1 LTS"
    NAME="Ubuntu"
    VERSION_ID="22.04"
    VERSION="22.04.1 LTS (Jammy Jellyfish)"
    VERSION_CODENAME=jammy
    ID=ubuntu
    ID_LIKE=debian
    HOME_URL="https://www.ubuntu.com/"
    SUPPORT_URL="https://help.ubuntu.com/"
    BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
    PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
    UBUNTU_CODENAME=jammy
    Linux version 5.15.79.1-microsoft-standard-WSL2 (oe-user@oe-host) (x86_64-msft-linux-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34.0.20200220) #1 SMP Wed Nov 23 01:01:46 UTC 2022

Show versions of R and installed packages.

``` r
R.version
```

                   _                                          
    platform       x86_64-pc-linux-gnu                        
    arch           x86_64                                     
    os             linux-gnu                                  
    system         x86_64, linux-gnu                          
    status         Patched                                    
    major          4                                          
    minor          2.2                                        
    year           2022                                       
    month          11                                         
    day            10                                         
    svn rev        83330                                      
    language       R                                          
    version.string R version 4.2.2 Patched (2022-11-10 r83330)
    nickname       Innocent and Trusting                      

``` r
# R packages
library(magrittr)
installed.packages() %>%
    as.data.frame() %>%
    .[, c("Package", "Version")]
```

                  Package Version
    R6                 R6   2.5.1
    Rcpp             Rcpp  1.0.10
    RcppTOML     RcppTOML   0.2.1
    base64enc   base64enc   0.1-3
    bslib           bslib   0.4.2
    cachem         cachem   1.0.6
    cli               cli   3.6.0
    digest         digest  0.6.31
    ellipsis     ellipsis   0.3.2
    evaluate     evaluate    0.20
    fastmap       fastmap   1.1.0
    fs                 fs   1.6.0
    glue             glue   1.6.2
    here             here   1.0.1
    highr           highr    0.10
    htmltools   htmltools   0.5.4
    jquerylib   jquerylib   0.1.4
    jsonlite     jsonlite   1.8.4
    knitr           knitr    1.42
    lifecycle   lifecycle   1.0.3
    magrittr     magrittr   2.0.3
    memoise       memoise   2.0.1
    mime             mime    0.12
    png               png   0.1-8
    rappdirs     rappdirs   0.3.3
    reticulate reticulate    1.28
    rlang           rlang   1.0.6
    rmarkdown   rmarkdown    2.20
    rprojroot   rprojroot   2.0.3
    sass             sass   0.4.5
    stringi       stringi  1.7.12
    stringr       stringr   1.5.0
    tinytex       tinytex    0.43
    vctrs           vctrs   0.5.2
    withr           withr   2.5.0
    xfun             xfun    0.36
    yaml             yaml   2.3.7
    KernSmooth KernSmooth 2.23-20
    MASS             MASS  7.3-58
    Matrix         Matrix   1.5-1
    base             base   4.2.2
    boot             boot  1.3-28
    class           class  7.3-20
    cluster       cluster   2.1.4
    codetools   codetools  0.2-18
    compiler     compiler   4.2.2
    datasets     datasets   4.2.2
    foreign       foreign  0.8-82
    grDevices   grDevices   4.2.2
    graphics     graphics   4.2.2
    grid             grid   4.2.2
    lattice       lattice 0.20-45
    methods       methods   4.2.2
    mgcv             mgcv  1.8-41
    nlme             nlme 3.1-161
    nnet             nnet  7.3-18
    parallel     parallel   4.2.2
    rpart           rpart  4.1.19
    spatial       spatial  7.3-15
    splines       splines   4.2.2
    stats           stats   4.2.2
    stats4         stats4   4.2.2
    survival     survival   3.4-0
    tcltk           tcltk   4.2.2
    tools           tools   4.2.2
    utils           utils   4.2.2
