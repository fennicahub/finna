# Overview of Finna Collection

## Introduction

This section helps us to have a general overview of the general
collection in Finna. For this purpose we use a separate function
`fetch_finna`. This document demonstrates the use of the `fetch_finna`
function to retrieve data from the Finna API with various queries and
parameters.

## Example 1: Fetching EAD Records

**EAD records** refer to archival descriptions encoded using the
**Encoded Archival Description (EAD)** standard, an XML-based framework
designed to describe archival materials, collections, and finding aids
in a structured, machine-readable format.

### **Purpose of EAD Records**

EAD records provide detailed information about archival collections,
enabling better organization, discovery, and access to historical and
cultural resources stored in archives, libraries, and museums.

### **What EAD Records Contain**

An EAD record typically includes metadata such as:

- **Collection Title**: Name of the archival collection.  
- **Creator(s)**: Person(s) or organization(s) responsible for the
  collection.  
- **Dates**: Time period covered by the materials.  
- **Extent**: Size or physical description (e.g., number of boxes or
  folders).  
- **Scope and Content**: Overview of what the collection contains.  
- **Biographical/Historical Note**: Background on the creator or related
  historical context.  
- **Arrangement**: How the materials are organized.  
- **Access and Use Conditions**: Restrictions or guidelines for
  accessing the materials.  
- **Container List**: Detailed inventory of items or series in the
  collection.

``` r
library(finna)
result <- fetch_finna(
  query = "record_format:ead",
  limit = 0,
  facets = "building",
  lng = "fi",
  prettyPrint = TRUE
)
print(result)
```

    ## # A tibble: 3 × 4
    ##   value                       translated                   count href           
    ##   <chr>                       <chr>                        <int> <chr>          
    ## 1 0/KA/                       Kansallisarkisto           2060481 ?lookfor=recor…
    ## 2 0/KOTUS/                    Kotimaisten kielten keskus     699 ?lookfor=recor…
    ## 3 0/siirtolaisuusinstituutti/ Siirtolaisuusinstituutti      1590 ?lookfor=recor…

## Example 2: Fetching EAD3 Records

``` r
library(finna)
result <- fetch_finna(
  query = "record_format:ead3",
  limit = 0,
  facets = "building",
  lng = "fi",
  prettyPrint = TRUE
)
print(result)
```

    ## # A tibble: 12 × 4
    ##    value              translated                              count href        
    ##    <chr>              <chr>                                   <int> <chr>       
    ##  1 0/AALTOARKISTO/    Aalto-yliopiston arkisto                52163 ?lookfor=re…
    ##  2 0/hka/             Helsingin kaupunginarkisto             321525 ?lookfor=re…
    ##  3 0/NLF/             Kansalliskirjasto                       90064 ?lookfor=re…
    ##  4 0/kansan_arkisto/  Kansan Arkisto                         216461 ?lookfor=re…
    ##  5 0/merkki/          Median museo ja arkisto Merkki          10990 ?lookfor=re…
    ##  6 0/pta/             Porvarillisen Työn Arkisto              23232 ?lookfor=re…
    ##  7 0/FINLIT/          Suomalaisen Kirjallisuuden Seura        37173 ?lookfor=re…
    ##  8 0/elka/            Suomen Elinkeinoelämän Keskusarkisto   501667 ?lookfor=re…
    ##  9 0/SCA/             Svenska centralarkivet                  13545 ?lookfor=re…
    ## 10 0/SLS/             Svenska litteratursällskapet i Finland  70371 ?lookfor=re…
    ## 11 0/tyovaen_arkisto/ Työväen Arkisto                        263163 ?lookfor=re…
    ## 12 0/fsd/             Yhteiskuntatieteellinen tietoarkisto     2335 ?lookfor=re…

More Metadata Formats in Finna can be found in the
[link](https://www.kiwi.fi/display/Finna/OAI-PMH+Harvesting+Interface+for+Finna%27s+Index)
here.

## Conclusion

This document provides examples of how to use the `fetch_finna` function
for retrieving various types of records from the Finna API. The tibbles
contain structured data for further analysis.
