
# Docker image Ubuntu + python + poetry (+ Quarto + R)

A minimal docker image for python projects. The latest version comes
with

- Ubuntu 22.04.1 LTS
- Python 3.11.1
- Poetry (version 1.3.2)
- Optional:
  - Quarto 1.2.313
  - R version 4.2.2 Patched (2022-11-10 r83330)

The image is maintained in
[GitHub](https://github.com/Shena4746/ubuntu-python-poetry).

## Install

Available on [Docker
Hub](https://hub.docker.com/r/shena4746/ubuntu-python-poetry).

Every image tag like 3.11.1q represents `python version` +
`q: plus Quarto` + `r: plus R`. For instance, 3.11.1qr includes
python3.11.1 with Quarto and R.

## Change Python/Quarto version

You can specify the version just by passing `PYTHON_VERSION=` in `./.env`, and then run
`make build`. The specified python version should be available by the
latest pyenv.

## Package/Version detail

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
    base64enc   base64enc   0.1-3
    bslib           bslib   0.4.2
    cachem         cachem   1.0.6
    cli               cli   3.6.0
    digest         digest  0.6.31
    ellipsis     ellipsis   0.3.2
    evaluate     evaluate    0.20
    fastmap       fastmap   1.1.0
    fs                 fs   1.5.2
    glue             glue   1.6.2
    here             here   1.0.1
    highr           highr    0.10
    htmltools   htmltools   0.5.4
    jquerylib   jquerylib   0.1.4
    jsonlite     jsonlite   1.8.4
    knitr           knitr    1.41
    lifecycle   lifecycle   1.0.3
    magrittr     magrittr   2.0.3
    memoise       memoise   2.0.1
    mime             mime    0.12
    rappdirs     rappdirs   0.3.3
    rlang           rlang   1.0.6
    rmarkdown   rmarkdown    2.20
    rprojroot   rprojroot   2.0.3
    sass             sass   0.4.4
    stringi       stringi  1.7.12
    stringr       stringr   1.5.0
    tinytex       tinytex    0.43
    vctrs           vctrs   0.5.1
    withr           withr   2.5.0
    xfun             xfun    0.36
    yaml             yaml   2.3.6
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

``` bash
python --version;
pip list
```

    Python 3.11.1
    Package    Version
    ---------- -------
    pip        22.3.1
    setuptools 65.5.0
