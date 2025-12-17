# Introduction to finna

## Introduction

[Finna](https://www.finna.fi/) is a Finnish national search service that
provides access to the collections of Finnish museums, libraries, and
archives. It is maintained by the National Library of Finland in
collaboration with other cultural and scientific institutions. Finna
allows users to search and explore a wide range of resources, including
books, images, maps, artifacts, and digital content from various
institutions across Finland.

This vignette provides an overview of how to use the finna package.

To make a simple search use the following code.

**N.B** In the search_finna() default limit of 100 records is being
used. Specify ‘limit’ argument for more records.

``` r
library(finna)
record <- search_finna("sibelius")
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 lapinkirjasto.15… Sibe… Sibel… 2001  NA       Äänite… NA       Lapin … NA    
    ##  2 anders.429115     SIBE… TAWAS… 1997  fin      Kirja,… SIBELIUS Anders… NA    
    ##  3 arto.005369812    Sibe… Tawas… 1997  fin      Kirja,… Sibeliu… Kansal… NA    
    ##  4 blanka.9f562bdb-… Sibe… Tawas… 2003  fin      Kirja,… Sibeliu… Blanka… NA    
    ##  5 heili.c21edab3-8… Sibe… Downe… 1945  fin      Kirja,… Sibeliu… Heili-… NA    
    ##  6 anders.135108     Sibe… Tawas… 1968  swe      Kirja,… Sibeliu… Anders… NA    
    ##  7 helle.1362060     SIBE… RINGB… 1948  swe      Kirja,… SIBELIU… Helle-… NA    
    ##  8 helle.1363050     SIBE… TAWAS… 1968  swe      Kirja,… SIBELIU… Helle-… NA    
    ##  9 piki.108828       Sibe… Gray,… 1934  eng      Kirja,… Sibeliu… PIKI-k… NA    
    ## 10 vanamo.46acd7d9-… Sibe… Gray,… 1945  eng      Kirja,… Sibeliu… Vanamo… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

### Searching as subject

``` r
library(finna)
record <- search_finna(query = '"orkesterimusiikki"', type = "Subject", lng = "en-gb")
print(record)
```

    ## # A tibble: 100 × 10
    ##    id            Title     Author Year  Language Formats Subjects Library Series
    ##    <chr>         <chr>     <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 fikka.1505988 Konsertt… Helsi… 1902  swe      Book m… orkeste… The Na… NA    
    ##  2 fikka.1505975 Konsertt… Helsi… 1912  fin      Book m… 1910-lu… The Na… NA    
    ##  3 fikka.1505980 Konsertt… Helsi… 1912  fin      Book m… 1910-lu… The Na… NA    
    ##  4 fikka.1506009 Konsertt… Helsi… 1916  fin      Book m… 1910-lu… The Na… NA    
    ##  5 fikka.1506017 Konsertt… Helsi… 1904  fin      Book m… 1900-19… The Na… NA    
    ##  6 fikka.1506016 Konsertt… Helsi… 1904  fin      Book m… 1900-19… The Na… NA    
    ##  7 fikka.1505881 Konsertt… Orkes… 1892  swe      Book m… 1890-lu… The Na… NA    
    ##  8 fikka.1506019 Konsertt… Helsi… 1907  swe      Book m… 1900-19… The Na… NA    
    ##  9 fikka.1505982 Konsertt… Helsi… 1898  fin      Book m… 1890-lu… The Na… NA    
    ## 10 fikka.1506018 Konsertt… Helsi… 1902  fin      Book m… 1900-19… The Na… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

### Bulk search

I we need a bulk download we use `search_finna("sibelius", limit = Inf)`
where we add the term `limit = Inf`.

### Search phrase examples

``` r
library(finna)
phrase <- search_finna("bicycle")
print(phrase)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 turkuamk_finna.9… Bicy… Sica,… 1981  eng      Kirja,… Italia.… Turun … NA    
    ##  2 kavi_kirjasto.34… Bicy… Barto… 1952  eng      Kirja,… kaunoki… Kansal… NA    
    ##  3 helmet.1928272    Bicy… Kalim… 2009  zxx      Äänite… 2000-20… Helmet… NA    
    ##  4 piki.914540       Bicy… NA     2009  zxx      Äänite… NA       PIKI-k… NA    
    ##  5 vaari.565915      Bicy… Scios… 1983  eng      Kirja,… NA       Varast… NA    
    ##  6 eepos.2088987     Bicy… Gaddy… 1987  eng      Äänite… NA       Eepos-… NA    
    ##  7 jamk.99372411640… Bicy… Leagu… 1984  eng      Opinnä… Cycling… Jyväsk… NA    
    ##  8 mobilia.mobilia.… Bicy… Geist… 1978  NA       Kirja,… NA       Mobili… NA    
    ##  9 lastu.234274      Bicy… Byrne… 2010  eng      Kirja,… Byrne, … Lastu-… NA    
    ## 10 vaari.565339      Bicy… NA     1900  eng      Kirja,… NA       Varast… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### Search operators + and !-

In addition to the most common Boolean operators (AND, OR, NOT), Finna
uses the + and !- operators.

#### +

The + sign indicates that the search term must be found in every search
result.

For example, if you are looking for material that must feature economics
and which may also feature Keynes:

``` r
library(finna)
search_oper <- search_finna("+economics Keynes”)")
print(search_oper)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 uef.998588837059… Keyn… Lawso… 1985  eng      Kirja,… NA       Itä-Su… NA    
    ##  2 abo.991952734059… Keyn… Lawso… 1989  eng      Kirja,… NA       Åbo Ak… NA    
    ##  3 hanna.29001       The … Harri… 1947  eng      Kirja,… Keynes.… Svensk… NA    
    ##  4 fikka.567288      The … Harri… 1948  eng      Kirja,… Keynes,… Kansal… NA    
    ##  5 utu.991459665540… The … Harri… 1968  eng      Kirja,… NA       Turun … NA    
    ##  6 vaari.1080451     The … Harri… 1965  eng      Kirja,… NA       Varast… NA    
    ##  7 ekk.991689954006… The … Harri… 1949  eng      Kirja,… keynesi… Edusku… NA    
    ##  8 tuni.99329737420… The … Harri… 1950  eng      Kirja,… Keynes,… Tamper… NA    
    ##  9 vaari.113512      The … Harri… 1949  eng      Kirja,… NA       Varast… NA    
    ## 10 jamk.99362852690… Keyn… Kurok… 2013  eng      Kirja,… Keynesi… Jyväsk… Routl…
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### !-

The symbols !- remove any search results which feature the search term
following the operator !-.

For example, if you want to find material that feature the term
economics but not the term Keynes:

``` r
library(finna)
search_oper <- search_finna("economics !-Keynes”)")
print(search_oper)
```

    ## # A tibble: 100 × 10
    ##    id            Title     Author Year  Language Formats Subjects Library Series
    ##    <chr>         <chr>     <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 fikka.5889175 Economic… Econo… 2020  eng      Kirja,… NA       Kansal… Publi…
    ##  2 fikka.5891206 Economic… Econo… 2023  eng      Kirja,… NA       Kansal… Publi…
    ##  3 fikka.5891595 Economic… Econo… 2024  eng      Kirja,… NA       Kansal… Publi…
    ##  4 fikka.5892163 Economic… Econo… 2025  eng      Kirja,… NA       Kansal… Publi…
    ##  5 fikka.5893361 2018 Dra… Econo… 2017  eng      Kirja,… NA       Kansal… Minis…
    ##  6 fikka.5888261 Economic… Econo… 2019  eng      Kirja,… NA       Kansal… Publi…
    ##  7 fikka.5888331 Economic… Econo… 2019  eng      Kirja,… NA       Kansal… Publi…
    ##  8 fikka.5892332 Economic… Econo… 2025  eng      Kirja,… NA       Kansal… Publi…
    ##  9 fikka.5888296 Economic… Econo… 2019  eng      Kirja,… NA       Kansal… Publi…
    ## 10 fikka.5888384 Economic… Econo… 2020  eng      Kirja,… NA       Kansal… Publi…
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

##### NB! The !- operator cannot be used in single-word searches.

For example, the following search will yield no results:

``` r
library(finna)
search_oper <- search_finna("!-economics”)")
print(search_oper)
```

    ## # A tibble: 100 × 10
    ##    id            Title     Author Year  Language Formats Subjects Library Series
    ##    <chr>         <chr>     <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 3amk.116997   Terminol… Sanas… 2006  fin      Kirja,… Termino… 3AMK-k… TSK, …
    ##  2 3amk.209999   Päihdeti… NA     2013  fin      Kirja,… alkohol… 3AMK-k… Suome…
    ##  3 3amk.211317   Sosiaali… NA     2019  fin      Kirja,… tilasto… 3AMK-k… Suome…
    ##  4 3amk.211318   Päihdeti… NA     2018  fin      Kirja,… alkohol… 3AMK-k… Suome…
    ##  5 3amk.292496   Koti- ja… Koti-… 2013  fin      Kirja,… Leisure… 3AMK-k… Sosia…
    ##  6 3amk.91452    Kybertur… Olin,… 2018  fin      Kirja,… kybertu… 3AMK-k… Sanas…
    ##  7 3amk.39381    Teknolog… Markk… 2003  fin      Kirja,… teknolo… 3AMK-k… Edusk…
    ##  8 3amk.55142    Työsuoje… Sanas… 2006  fin      Kirja,… Diction… 3AMK-k… TSK, …
    ##  9 jykdok.884085 Hyvä tie… Karja… 2002  fin      Kirja,… ethics;… Jyväsk… NA    
    ## 10 3amk.66893    Mahdolli… Holma… 2008  fin      Kirja,… Turun a… 3AMK-k… Turun…
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### Fine-tuning your search

##### Fuzzy search

Fuzzy search will also yield results that feature words which are
similar to your search term.

The search operator ~ will perform a fuzzy search when it is used as the
final character of a single-word search.

For example, a fuzzy search with the word roam will also return results
with the words foam and roams.

``` r
fuzzy_search <- search_finna("roam~")
print(fuzzy_search)
```

    ## NULL

##### Proximity search

Proximity searches look for material in which the search terms are
within a specified distance, but not necessarily one after the other.

``` r
fuzzy_search <- search_finna("economics Keynes~10")
print(fuzzy_search)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 abo.991952734059… Keyn… Lawso… 1989  eng      Kirja,… NA       Åbo Ak… NA    
    ##  2 uef.998588837059… Keyn… Lawso… 1985  eng      Kirja,… NA       Itä-Su… NA    
    ##  3 jamk.99362852690… Keyn… Kurok… 2013  eng      Kirja,… Keynesi… Jyväsk… Routl…
    ##  4 helmet.1199524    KEYN… CODDI… 1983  eng      Kirja,… NA       Helmet… NA    
    ##  5 vaari.1130778     Keyn… Gilbe… 1982  eng      Kirja,… Keynesi… Varast… NA    
    ##  6 ekk.993218740062… On K… Leijo… 1968  eng      Kirja,… Keynes,… Edusku… NA    
    ##  7 helka.9916561935… The … Johns… 1978  eng      Kirja,… Keynes,… Helka-… NA    
    ##  8 vaari.2696406     The … Johns… 1978  eng      Kirja,… Keynes,… Varast… NA    
    ##  9 uef.998437037059… The … Johns… 1978  eng      Kirja,… NA       Itä-Su… NA    
    ## 10 aalto.9982217144… John… David… 2007  eng      Kirja,… Keynes,… Aalto-… Great…
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

### Advanced search: to see available online

``` r
record <- search_finna("sibelius", filters = c("free_online_boolean:1"))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 jtm.158774447824… Sibe… Tappe… 1967  NA       Taidet… NA       Jyväsk… NA    
    ##  2 lahdenmuseo.lkm-… Sibe… Favén… NA    NA       Taidet… kaljuus… Lahden… NA    
    ##  3 sibelius.DF70D25… Evel… NA     1875  NA       Kuva, … NA       Sibeli… NA    
    ##  4 helka.9913244350… Jean… Johns… 1959  eng      Kirja,… Compose… Helka-… NA    
    ##  5 jarvenpaantaidem… Jean… Eero … NA    NA       Taidet… maalaus… Järven… NA    
    ##  6 aboakademi_taide… Jean… Kakko… NA    NA       Taidet… NA       Åbo Ak… NA    
    ##  7 aboakademi_taide… Jean… Munst… 1910  NA       Taidet… NA       Åbo Ak… NA    
    ##  8 jarvenpaantaidem… Aino… Venny… 1900  NA       Taidet… maalaus… Järven… NA    
    ##  9 kansallisgalleri… Jean… Järne… 1906  NA       Taidet… NA       Kansal… NA    
    ## 10 kansallisgalleri… Jean… Alane… 1919  NA       Taidet… NA       Kansal… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### search image

For specific collection of images from specific organisation we can
search metadata for example: We take an image from organisation:
“Military Museum” and choose search key to be “Laatokka”.
(<https://www.finna.fi/Search/Results?lookfor=laatokka&type=AllFields&filter%5B%5D=%7Ebuilding%3A%220%2FSA-kuva%2F%22&limit=20&sort=relevance>)

``` r
record <- search_finna("laatokka",filters = c('~building:"0/SA-kuva/"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 sa-kuva.sa-kuva-… Laat… Sot.v… NA    NA       Kuva, … NA       Sotamu… NA    
    ##  2 sa-kuva.sa-kuva-… Hote… Manni… 1941  NA       Kuva, … NA       Sotamu… NA    
    ##  3 sa-kuva.sa-kuva-… Hote… Manni… 1941  NA       Kuva, … NA       Sotamu… NA    
    ##  4 sa-kuva.sa-kuva-… Aava… Saul … 1942  NA       Kuva, … NA       Sotamu… NA    
    ##  5 sa-kuva.sa-kuva-… Laat… Sot.v… 1942  NA       Kuva, … NA       Sotamu… NA    
    ##  6 sa-kuva.sa-kuva-… Taip… Sot.v… 1941  NA       Kuva, … NA       Sotamu… NA    
    ##  7 sa-kuva.sa-kuva-… Jouk… Kersa… 1944  NA       Kuva, … NA       Sotamu… NA    
    ##  8 sa-kuva.sa-kuva-… Hels… Saul … 1942  NA       Kuva, … NA       Sotamu… NA    
    ##  9 sa-kuva.sa-kuva-… Fiat… Hanho… 1941  NA       Kuva, … NA       Sotamu… NA    
    ## 10 sa-kuva.sa-kuva-… Vies… Sot.v… 1944  NA       Kuva, … NA       Sotamu… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

Similarly, we can do the same for specific search keysas follows:

``` r
record <- search_finna("sibelius", filters = c('~media_type_str_mv:"0/image/"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 abo.kortkat_0518… Sibe… Picke… NA    NA       Kirja,… NA       Åbo Ak… NA    
    ##  2 abo.kortkat_0991… Sibe… Schou… 1949  NA       Kirja,… NA       Åbo Ak… NA    
    ##  3 jtm.158774447824… Sibe… Tappe… 1967  NA       Taidet… NA       Jyväsk… NA    
    ##  4 lahdenmuseo.lkm-… Sibe… Favén… NA    NA       Taidet… kaljuus… Lahden… NA    
    ##  5 abo.kortkat_1535… Sibe… Sugan… 1967  NA       Kirja,… NA       Åbo Ak… NA    
    ##  6 abo.kortkat_0872… Sibe… Ringb… 1948  NA       Kirja,… NA       Åbo Ak… NA    
    ##  7 abo.kortkat_1648… Sibe… Tawas… 1968  NA       Kirja,… NA       Åbo Ak… NA    
    ##  8 abo.kortkat_0441… Sibe… Ottaw… 1968  NA       Kirja,… NA       Åbo Ak… NA    
    ##  9 sibelius.DF70D25… Evel… NA     1875  NA       Kuva, … NA       Sibeli… NA    
    ## 10 jarvenpaantaidem… Jean… Eero … NA    NA       Taidet… maalaus… Järven… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### Audio book

``` r
record <- search_finna("sibelius", filters = c('~format:"1/Book/AudioBook/"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 rutakko.8d75bf0b… Jean… Sibel… 1991  zxx      Kirja,… romanss… Rutakk… NA    
    ##  2 lastu.1707418     Aino… Kontt… 2020  fin      Kirja,… Sibeliu… Lastu-… NA    
    ##  3 rutakko.d8834d11… Aino… Kontt… 2019  fin      Kirja,… Sibeliu… Rutakk… NA    
    ##  4 eepos.2627672     Aino… Kontt… 2019  fin      Kirja,… Sibeliu… Eepos-… NA    
    ##  5 siilinjarvi.5680… Aino… Kontt… 2019  fin      Kirja,… Sibeliu… Siilin… NA    
    ##  6 lapinkirjasto.80… Sibe… Matti… 1995  NA       Kirja,… Illalle… Lapin … NA    
    ##  7 tiekko.901913     The … Sibel… 1994  zxx      Kirja,… NA       Joki-k… NA    
    ##  8 rutakko.f475d692… Aino… Kirve… 2015  fin      Kirja,… Sibeliu… Rutakk… NA    
    ##  9 fikka.5491741     Aino… Kirve… 2020  fin      Kirja,… NA       Kansal… NA    
    ## 10 lastu.298756      Aino… Kirve… 2016  fin      Kirja,… Sibeliu… Lastu-… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### Year of manufacture

``` r
record <- search_finna("sibelius", filters = c('search_daterange_mv:"overlap|[-5000 TO 5000]"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 lapinkirjasto.15… Sibe… Sibel… 2001  NA       Äänite… NA       Lapin … NA    
    ##  2 anders.429115     SIBE… TAWAS… 1997  fin      Kirja,… SIBELIUS Anders… NA    
    ##  3 arto.005369812    Sibe… Tawas… 1997  fin      Kirja,… Sibeliu… Kansal… NA    
    ##  4 blanka.9f562bdb-… Sibe… Tawas… 2003  fin      Kirja,… Sibeliu… Blanka… NA    
    ##  5 heili.c21edab3-8… Sibe… Downe… 1945  fin      Kirja,… Sibeliu… Heili-… NA    
    ##  6 anders.135108     Sibe… Tawas… 1968  swe      Kirja,… Sibeliu… Anders… NA    
    ##  7 helle.1362060     SIBE… RINGB… 1948  swe      Kirja,… SIBELIU… Helle-… NA    
    ##  8 helle.1363050     SIBE… TAWAS… 1968  swe      Kirja,… SIBELIU… Helle-… NA    
    ##  9 piki.108828       Sibe… Gray,… 1934  eng      Kirja,… Sibeliu… PIKI-k… NA    
    ## 10 vanamo.46acd7d9-… Sibe… Gray,… 1945  eng      Kirja,… Sibeliu… Vanamo… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### Search using Geofilter syntax (Geographical region)

``` r
record <- search_finna("trump", filters = c('{!geofilt sfield=location_geo pt=61.663987171517796,24.17263895273209 d=212.53603751769646}'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 museovirasto.1E1… naam… NA     NA    NA       Esine   naamiai… Suomen… NA    
    ##  2 arto.016649605    Oike… Huhti… 2018  fin      Lehti/… Trump, … Kansal… Kolum…
    ##  3 museovirasto.810… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  4 museovirasto.276… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  5 museovirasto.B22… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  6 museovirasto.DC1… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  7 museovirasto.37D… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  8 museovirasto.434… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  9 museovirasto.551… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ## 10 museovirasto.AEB… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### geofilter ouside of finland

``` r
record <- search_finna("trump", filters = c('{!geofilt sfield=location_geo pt=39.3130504637139,-76.33021295070648 d=281.83790818401854}'))
print(record)
```

    ## # A tibble: 9 × 10
    ##   id    Title Author Year  Language Formats Subjects Library Series last_indexed
    ##   <chr> <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr>  <chr>       
    ## 1 arto… Kulu… NA     1988  fin      Lehti/… Trump, … Kansal… NA     NA          
    ## 2 outi… The … Mahle… 2025  eng      Kirja,… 1980-lu… OUTI-k… NA     NA          
    ## 3 tuni… The … The J… 2022  eng      Kirja,… Trump, … Tamper… NA     NA          
    ## 4 piki… A fo… Bunch… 2019  eng      Kirja,… Nationa… PIKI-k… NA     NA          
    ## 5 vask… Oath… Chene… 2023  eng      Kirja,… Cheney,… Vaski-… NA     NA          
    ## 6 helm… Mela… Wolko… 2020  eng      Kirja,… Wolkoff… Helmet… NA     NA          
    ## 7 utu.… Goth… Stein… 2014  eng      Kirja,… Yhdysva… Turun … NA     NA          
    ## 8 fikk… The … Roman… 2024  eng      Kirja,… Village… Kansal… NA     NA          
    ## 9 ande… Swee… Simol… 2018  fin      Kirja,… Simola,… Anders… NA     NA

#### Narrowing the search

When narrowing search you can use codes as a combination as follows

``` r
record <- search_finna("trump", filters = c('{!geofilt sfield=location_geo pt=61.663987171517796,24.17263895273209 d=212.53603751769646},author_facet:"Häkkinen,Hannu"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 museovirasto.1E1… naam… NA     NA    NA       Esine   naamiai… Suomen… NA    
    ##  2 arto.016649605    Oike… Huhti… 2018  fin      Lehti/… Trump, … Kansal… Kolum…
    ##  3 museovirasto.810… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  4 museovirasto.276… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  5 museovirasto.B22… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  6 museovirasto.DC1… Hels… Häkki… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  7 museovirasto.37D… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  8 museovirasto.434… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ##  9 museovirasto.551… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ## 10 museovirasto.AEB… Hels… Hoppa… 2018  NA       Kuva, … Helsink… Museov… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

#### specific search

``` r
record <- search_finna("era:'2010-luku'", filters = c('building:"0/3AMK/"'))
```

#### search without removing duplication

In order to search data without removing duplication example.

``` r
record <- search_finna('era:"2010-luku"', filters = c('~building:"0/3AMK/"', 'finna.deduplication:"1"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id          Title       Author Year  Language Formats Subjects Library Series
    ##    <chr>       <chr>       <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 3amk.293263 Sukupolvie… Hämäl… 2021  fin      Kirja,… 2010-lu… 3AMK-k… Väest…
    ##  2 3amk.85597  Hyvinvoint… Taimi… 2015  fin      Kirja,… 2010-lu… 3AMK-k… Rapor…
    ##  3 3amk.88454  Yksinäiste… Saari… 2016  fin      Kirja,… 2010-lu… 3AMK-k… NA    
    ##  4 3amk.134144 Tervetuloa… Sjöbl… 2013  fin      Kirja,… opiskel… 3AMK-k… Siirt…
    ##  5 3amk.131653 Erilaisuuk… Saukk… 2013  fin      Kirja,… 2010-lu… 3AMK-k… NA    
    ##  6 3amk.132507 Toimeentul… Kuiva… 2013  fin      Kirja,… 2010-lu… 3AMK-k… Rapor…
    ##  7 3amk.123287 Hyvinvoinn… Kanga… 2010  fin      Kirja,… Public … 3AMK-k… NA    
    ##  8 3amk.284506 Virkamiesv… Murto… 2014  fin      Kirja,… 1980-lu… 3AMK-k… NA    
    ##  9 3amk.291790 Medioitunu… Reuna… 2021  fin      Kirja,… 2010-lu… 3AMK-k… NA    
    ## 10 3amk.294316 Kahdeksan … Kanto… 2022  fin      Kirja,… 2010-lu… 3AMK-k… NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

We can confirm this as follows by checking the count

``` r
record <- search_finna('era:"2010-luku"', filters = c('~building:"0/3AMK/"', 'finna.deduplication:"1"'))
result_count <- attr(record, "result_count")
print(result_count)
```

    ## [1] 1005

Removing duplication can be done as follows

``` r
record <- search_finna('era:"2010-luku"', filters = c('~building:"0/3AMK/"', 'finna.deduplication:"0"'))
print(record)
```

    ## # A tibble: 100 × 10
    ##    id          Title       Author Year  Language Formats Subjects Library Series
    ##    <chr>       <chr>       <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 3amk.293263 Sukupolvie… Hämäl… 2021  fin      Kirja,… 2010-lu… 3AMK-k… Väest…
    ##  2 3amk.85597  Hyvinvoint… Taimi… 2015  fin      Kirja,… 2010-lu… 3AMK-k… Rapor…
    ##  3 3amk.132507 Toimeentul… Kuiva… 2013  fin      Kirja,… 2010-lu… 3AMK-k… Rapor…
    ##  4 3amk.288732 Muuttoliik… Marti… 2020  fin      Kirja,… 1800-lu… 3AMK-k… Julka…
    ##  5 3amk.291790 Medioitunu… Reuna… 2021  fin      Kirja,… 2010-lu… 3AMK-k… NA    
    ##  6 3amk.292443 Muuttoliik… Bäckm… 2020  fin      Kirja,… 1800-lu… 3AMK-k… Julka…
    ##  7 3amk.298602 Hidasta ka… Kivij… 2022  fin      Kirja,… 2000-lu… 3AMK-k… Julka…
    ##  8 3amk.284506 Virkamiesv… Murto… 2014  fin      Kirja,… 1980-lu… 3AMK-k… NA    
    ##  9 3amk.267454 Nuorten pä… Raita… 2016  fin      Kirja,… 1995-20… 3AMK-k… Rapor…
    ## 10 3amk.302201 Kansanperi… Koski… 2023  fin      Kirja,… 2000-lu… 3AMK-k… Tieto…
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>

To confirm this we can check the count

``` r
record <- search_finna('era:"2010-luku"', filters = c('~building:"0/3AMK/"', 'finna.deduplication:"0"'))
result_count <- attr(record, "result_count")
print(result_count)
```

    ## [1] 722

## Search Finna with multiple filters

To find scholarly journals and digital repository materials regarding
music

``` r
results <- search_finna(
  query = "musiikki OR taide OR tanssi OR teatteri",
  filters = c(
    '~hierarchy_parent_title:"Institutional Repository"',
    '~format_ext_str_mv:"1/Thesis/Gradu/"',
    '~format_ext_str_mv:"1/Thesis/Masters/"',
    '~format_ext_str_mv:"1/Thesis/MastersPolytechnic/"',
    '~format_ext_str_mv:"1/Thesis/Thesis/"',
    '~format_ext_str_mv:"1/Thesis/Licentiate/"',
    '~format_ext_str_mv:"0/OtherText/"',
    '~format_ext_str_mv:"0/Journal/"',
    '~format_ext_str_mv:"0/Book/"',
    'free_online_boolean:"1"'
  ),
  type = "AllFields",
  lng = "en-gb",
  prettyPrint = TRUE
)

# Print the results
print(results)
```

    ## # A tibble: 100 × 10
    ##    id                Title Author Year  Language Formats Subjects Library Series
    ##    <chr>             <chr> <chr>  <chr> <chr>    <chr>   <chr>    <chr>   <chr> 
    ##  1 journalfi.articl… "Tan… Huota… 2011  fin      Journa… Johtaju… Journa… Näkök…
    ##  2 theseus_oamk.100… "Tan… Hoppu… 2019  fin      Journa… tanssi   Oulu U… NA    
    ##  3 theseus_oamk.100… "Tea… Kaupp… 2021  fin      Journa… tanssi;… Oulu U… NA    
    ##  4 valto.11111_4608  "Tea… Hakal… 2002  fin      Text, … opetusm… Instit… NA    
    ##  5 theseus_oamk.100… "Tan… Vuorj… 2025  fin      Journa… tanssi;… Oulu U… Diak …
    ##  6 theseus_tuamk.10… "Mus… Suoma… 2017  fin      Thesis… musiikk… Turku … NA    
    ##  7 gmc.10047         "Kuu… Veint… 2002  fin      Thesis… maahanm… Global… NA    
    ##  8 3amk.284618       "Muu… Välim… 2015  fin      Book m… musiikk… 3AMK l… NA    
    ##  9 theseus_oamk.100… "Tan… Hakos… 2025  fin      Book m… harjoit… Oulu U… Oamk …
    ## 10 theseus_tuamk.10… "\"S… Niemi… 2019  fin      Thesis… Sovelta… Turku … NA    
    ## # ℹ 90 more rows
    ## # ℹ 1 more variable: last_indexed <chr>
