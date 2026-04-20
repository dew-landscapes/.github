DEW-landscapes
================

This is a work in progress. Last update Monday, 20 April, 2026. 16:35.

DEW-landscapes holds packages and projects we have found useful for
creating, cleaning and analysing large, unstructured biological and
environmental data sets in the context of providing lines of evidence
for decision making in natural resources management.

This readme aims to:

- document the various `env` packages and projects
- specify the aims of each package and project
- point to useful supporting projects

Package specific information is limited here - refer to the package repo
for further description.

Note that most projects are private github repositories. Links are
provided to reports resulting from use of the projects, where available.

# Background

DEW-landscapes packages and projects have been roughly guided by the
paper *Essential biodiversity variables for mapping and monitoring
species populations* ([Jetz et al. 2019](#ref-RN4609)) in that once data
are accumulated, they are cleaned with reference to a regular cube of
specific extent (generally with reference to temporal and geographic
extent) and grain (generally with reference to temporal, geographic and
taxonomic grain). Apparently, this aligns with the Earth Systems Data
Cubes (ESDCs) concept (e.g. [Montero et al. 2024](#ref-RN4610)). The R
package `sits` ([Simoes et al. 2026](#ref-R-sits),
[2021](#ref-sits2021)), while not used in any `env` packages or
projects, also provides useful background on [regular
cubes](https://e-sensing.github.io/sitsbook/dc_regularize.html#the-need-for-regular-eo-data-cubes)
within the context of earth observation (EO) cubes.

# Overview

The following figure shows a cartoon of the links between various `env`
packages and projects.

``` mermaid
graph LR
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Links between env packages and projects
    direction LR
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> x0658f5015c0c4be5(["DFaB<br>project"]):::queued
    x0da89b87fbc34bf3(["envDetection<br>project"]):::queued --> x0658f5015c0c4be5(["DFaB<br>project"]):::queued
    x5499a04bf3778295(["envRegCont<br>project"]):::queued --> x0658f5015c0c4be5(["DFaB<br>project"]):::queued
    x199e33ac94c360fd(["envClean<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    xb53407deaf8a50f7(["envDistribution<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x9d3addc2d3c28cb0(["envOcc<br>project"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>project"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> x0da89b87fbc34bf3(["envDetection<br>project"]):::queued
    x3c05f6553dd2ee1d(["envModel<br>package"]):::queued --> xc70bb609a37b98f0(["envEco<br>project"]):::queued
    x3c533c4f6ac5a427(["envEcosystems<br>package"]):::queued --> xc70bb609a37b98f0(["envEco<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> xc70bb609a37b98f0(["envEco<br>project"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>project"]):::queued --> xc70bb609a37b98f0(["envEco<br>project"]):::queued
    x9eca96d789260dc6(["envCluster<br>package"]):::queued --> xc70bb609a37b98f0(["envEco<br>project"]):::queued
    xa419b1871c902a02(["envImport<br>package"]):::queued --> x9d3addc2d3c28cb0(["envOcc<br>project"]):::queued
    xf290cd0a0c6ffe34(["envStatus<br>project"]):::queued --> xdfa068c3ebc0366d(["envPIA_pt1<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> xdfa068c3ebc0366d(["envPIA_pt1<br>project"]):::queued
    x5499a04bf3778295(["envRegCont<br>project"]):::queued --> xdfa068c3ebc0366d(["envPIA_pt1<br>project"]):::queued
    xdfa068c3ebc0366d(["envPIA_pt1<br>project"]):::queued --> xe5749d29c71b6a92(["envPIA_pt2<br>project"]):::queued
    xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued --> xe5749d29c71b6a92(["envPIA_pt2<br>project"]):::queued
    xd8ce469e231f9860(["envBiome<br>project"]):::queued --> x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued
    xb53407deaf8a50f7(["envDistribution<br>package"]):::queued --> x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued
    x89ac92b9bcad912d(["envRaster<br>package"]):::queued --> x67b5feaf09e4d0ca(["envRas<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued --> x880df32bd41b0aa9(["envRegAssess<br>project"]):::queued
    x5499a04bf3778295(["envRegCont<br>project"]):::queued --> x880df32bd41b0aa9(["envRegAssess<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued --> x5499a04bf3778295(["envRegCont<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> x5499a04bf3778295(["envRegCont<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    xdfa068c3ebc0366d(["envPIA_pt1<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x07cddf360e9b199e(["envSDM<br>package"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    xe5749d29c71b6a92(["envPIA_pt2<br>project"]):::queued --> x2d1dcea9060b62fe(["envSens<br>project"]):::queued
    xb2a4767da474386b(["sa_va<br>project"]):::queued --> x0f16edc93d113ef9(["fire_sensitivity<br>project"]):::queued
    xc70bb609a37b98f0(["envEco<br>project"]):::queued --> x0f16edc93d113ef9(["fire_sensitivity<br>project"]):::queued
    xb092d78dc6463536(["envFire<br>package"]):::queued
    x6832f874a98057bb(["envFunc<br>support package"]):::queued
    xb03046fba8fa1b84(["envTargets<br>support package"]):::queued
    xa92bc89dfa147112(["envVec<br>support project"]):::queued
  end
```

# Assemling

## [`envImport`](https://github.com/dew-landscapes/envImport)

A package with description: Get data from various data sources and align
naming and data types, including some fixes for common issues when
combining data sources.

## [`envOcc`](https://github.com/dew-landscapes/envOcc)

The project `envOcc` aggregates occurrence data from many disparate data
sources.

## [`envVec`](https://github.com/dew-landscapes/envVec)

This project generates spatial vector data (i.e. point, line and polygon
layers, as geoparquet files) for use in other env projects.

## [`envRaster`](https://github.com/dew-landscapes/envRaster)

A package with description: Tools for creating a base grid (a template
that defines extent, resolution, and CRS), as well as naming,
retrieving, and interacting with environmental raster data. envRaster no
longer aims to help process external data. Possibly see envRas instead.

## [`envRas`](https://github.com/dew-landscapes/envRas)

This project generates environmental data as rasters, for use in
combination with the biological data assembled via `envOcc`.

## [`envFire`](https://github.com/dew-landscapes/envFire)

A package with description: Functions to facilitate ecological fire
analysis

# Cleaning

## [`envClean`](https://github.com/dew-landscapes/envClean)

A package with description: Tools to facilitate cleaning tasks
associated with records of taxa

`envClean` functions are most obviously applied in the `envCleaned`
workflow. However, many `envClean` functions will be applied only in
downstream projects as they are only useful with respect to a specific
projects aims. For example, records taken of only a single taxa within a
location (say, as part of tree health monitoring) provide useful data
for a species distribution model but do not provide useful data for
community analyses. Thus the function
[`envClean::make_effort_mod()`](https://dew-landscapes.github.io/envClean/reference/make_effort_mod.html)
– that allows detecting excessively over- or under-sampled visits for
possible filtering – is unlikely to be useful in preparing species
distribution models but is essential when undertaking community
analyses.

## [`envDistribution`](https://github.com/dew-landscapes/envDistribution)

A package with description: Functions for sourcing, creating and working
with species distributions (geographic ranges).

## [`envCleaned`](https://github.com/dew-landscapes/envCleaned)

The project `envCleaned` takes the data assembled by `envOcc` and
applies generic cleaning steps that will be relevant to any downstream
use.

Some example generic cleaning steps include:

- [`envClean::make_taxonomy()`](https://dew-landscapes.github.io/envClean/reference/make_taxonomy.html).
  Query online databases to retrieve a good guess (at best!) for
  standardised taxonomy for use across all the assembled data sources.
- [`envClean::filter_geo_range()`](https://dew-landscapes.github.io/envClean/reference/filter_geo_range.html).
  Can be called directly on a dataframe to filter records to those
  occurring within a polygon (or its bounding box).
- [`envDistribution::filter_by_distribution()`](https://dew-landscapes.github.io/envDistribution/reference/filter_by_distribution.html).
  Can be used to flag or filter records of a taxa outside of its range,
  as specified by a polygon.

## [`envStatus`](https://github.com/dew-landscapes/envStatus)

Generates taxonomically aligned (using ‘envClean::make_taxonomy’)
information on taxa listed under various legislation.

# Main outputs

## [`envRegCont`](https://github.com/dew-landscapes/envRegCont)

What contribution does any region (represented by a polygon) make to the
distribution (usually Australian) of a taxa (based on IUCN Red List AOO
and EOO metrics)?

## [`envSDMs`](https://github.com/dew-landscapes/envSDMs)

Generate many, many species distribution models (SDMs). Generates
outputs that sit somewhere between dots-on-a-map and broad,
envelope-type distribution models. In many cases, the models show
sub-landscape preference. For example, *Sminthopsis psammophila* more
likely to be found on sand dunes in landscapes of sandy dunes and
calcareous-loam swales.

## [`envPIA`](https://github.com/dew-landscapes/envPIA)

For any area of interest (aoi) generate maps of areas that are more or
less likely to trigger various biodiversity legislation via the
following process:

1)  Generate an initial inclusive list of binomials for any aoi
    (aoi-taxa), made up of any taxa with:
    1)  records within the aoi, including a buffer
    2)  one of the following overlaps the study area
        1)  an existing *Environment Protection and Biodiversity
            Conservation Act 1999 (EPBC Act)* distribution that overlaps
            the study area, not including a buffer, or, if not available
        2)  an existing expert distribution generated for some fauna
            (about 70 fauna taxa), including a buffer, or, if not
            available
        3)  a minimum convex polygon (mcp) around all suitable records
            of a taxa, including a buffer
2)  Identify taxa of concern (aoi-concern), made up of any aoi-taxa:
    1)  listed as threatened by the *EPBC Act*
    2)  listed on schedules 7 (Endangered), 8 (Vulnerable) or 9 (Rare)
        of the *National Parks and Wildlife Act 1972 (NPW Act)*
    3)  likely to be listed in the future under the *EPBC Act* or *NPW
        Act*
    4)  with a significant proportion of their Australian distribution
        in the aoi (see
        [`envRegCont`](https://github.com/dew-landscapes/envRegCont/))
3)  Provide a fine-scale representation of where, within the aoi,
    aoi-concern taxa are likely to occur based on (in order):
    1)  fine-scale distribution model for each taxa (species
        distribution model - sdm)
    2)  if no fine_scale distribution model could be developed, then
        based on EPBC Act distribution
    3)  if no fine-scale distribution model could be developed, and the
        taxa had no EPBC Act distribution, then based on association
        between records and an appropriate environmental layer
4)  Summarise the fine-scale representations into counts of taxa:
    1)  listed on the *EPBC Act*
    2)  listed on schedules 7, 8 or 9 of the *NPW Act*
    3)  likely to be listed in future
    4)  that are not listed on any legislation but that have a
        significant proportion of their Australian distribution in the
        aoi

## [`envEco`](https://github.com/dew-landscapes/envEco)

For any area of interest (aoi) generate maps and descriptions of
ecosystems.

## [`envSens`](https://github.com/dew-landscapes/envSens)

Based on species trait data, estimate sensitivity to stresses.

## `sa_va`

Build trait database for fire-relevant traits for South Australian taxa.

## `fire_sensitivity`

Preferred fire return interval for South Australian ecosystems (based on
`envEco`) using trait information from `sa_va`.

## [`envDetection`](https://github.com/dew-landscapes/envDetection)

Generates detection estimates associated with different sampling methods
for taxa via occupancy models. Used to determine the relevant sampling
methods for each taxa to improve target group sampling, and generation
of bias layers and background points in SDMs.

## [`DFaB`](https://github.com/Calamanthus/DFaB)

Dynamic Fire and Biodiversity tool for managing habitat of fire
dependent fauna via burning.

## `envRegAssess`

IUCN Red List regional assessments for a region based on Criterion B
(i.e. regional AOO & EOO estimates and associated threat ratings).

# Supporting packages

## [`envFunc`](https://github.com/dew-landscapes/envFunc)

Generic tools useful across `envBlah` packages.

## [`envTargets`](https://github.com/dew-landscapes/envTargets)

The goal of envTargets is to help automate the creation, execuation, and
maintenance of targets workflows in other ‘env’ projects.

Specifically, in conjunction with supporting files `scales.yaml` and
`_targets.yaml`, `envTargets` provides support for generating machine-
and human-readable directory structures explicitly referencing the
extent and grain

## [`envShiny`](https://github.com/dew-landscapes/envShiny)

Helper functions for creating shiny apps for env projects

Again with explicit support around extent and grain.

# References

<div id="refs" class="references csl-bib-body hanging-indent"
entry-spacing="0">

<div id="ref-RN4609" class="csl-entry">

Jetz, Walter, Melodie A McGeoch, Robert Guralnick, Simon Ferrier, Jan
Beck, Mark J Costello, Miguel Fernandez, et al. 2019. “Essential
Biodiversity Variables for Mapping and Monitoring Species Populations.”
*Nature Ecology & Evolution* 3 (4): 539–51.

</div>

<div id="ref-RN4610" class="csl-entry">

Montero, David, Guido Kraemer, Anca Anghelea, César Aybar, Gunnar
Brandt, Gustau Camps-Valls, Felix Cremer, et al. 2024. “Earth System
Data Cubes: Avenues for Advancing Earth System Research.” *Environmental
Data Science* 3: e27. <https://doi.org/10.1017/eds.2024.22>.

</div>

<div id="ref-sits2021" class="csl-entry">

Simoes, Rolf, Gilberto Camara, Gilberto Queiroz, Felipe Souza, Pedro
Andrade, Lorena Santos, Alexandre Carvalho, and Karine Ferreira. 2021.
“Satellite Image Time Series Analysis for Big Earth Observation Data.”
*Remote Sensing* 13 (13): 2428. <https://doi.org/10.3390/rs13132428>.

</div>

<div id="ref-R-sits" class="csl-entry">

Simoes, Rolf, Gilberto Camara, Felipe Souza, and Felipe Carlos. 2026.
*Sits: Satellite Image Time Series Analysis for Earth Observation Data
Cubes*. <https://github.com/e-sensing/sits/>.

</div>

</div>
