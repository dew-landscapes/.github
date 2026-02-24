DEW-landscapes
================

This is a work in progress. Last update Tuesday, 24 February, 2026.
15:33.

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
  style Legend fill:#FFFFFF00,stroke:#000000;
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Legend
    xa3883d8216f2b511(["Queued"]):::queued
    xd03d7c7dd2ddda2b(["Regular target"]):::none
  end
  subgraph Graph
    direction LR
    x199e33ac94c360fd(["envClean<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x9d3addc2d3c28cb0(["envOcc<br>project"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    xb53407deaf8a50f7(["envDistribution<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>project"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued
    xa419b1871c902a02(["envImport<br>package"]):::queued --> x9d3addc2d3c28cb0(["envOcc<br>project"]):::queued
    x5499a04bf3778295(["envRegCont<br>project"]):::queued --> x2cb0f2dc918c8a98(["envPIA<br>project"]):::queued
    xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued --> x2cb0f2dc918c8a98(["envPIA<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> x5499a04bf3778295(["envRegCont<br>project"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>package"]):::queued --> x5499a04bf3778295(["envRegCont<br>project"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x07cddf360e9b199e(["envSDM<br>package"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>project"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>project"]):::queued
    x6832f874a98057bb(["envFunc<br>package"]):::queued
    xb03046fba8fa1b84(["envTargets<br>package"]):::queued
  end
```

# Assemling data

## [`envImport`](https://github.com/dew-landscapes/envImport)

A package with description: Get data from various data sources and align
naming and data types, including some fixes for common issues when
combining data sources.

## [`envOcc`](https://github.com/dew-landscapes/envOcc)

The project [`envOcc`](https://github.com/dew-landscapes/envOcc)
aggregates many disparate data sources.

## [`envRas`](https://github.com/dew-landscapes/envRas)

This project generates environmental data as rasters, for use in
combination with the biological data assembled via `envOcc`.

# Cleaning data

## [`envClean`](https://github.com/dew-landscapes/envClean)

A package with description: Tools to facilitate cleaning tasks
associated with records of taxa

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
  Can be used to flag or filter records outside of its range, as
  specified by a polygon.

Some `envCleaned` functions will be applied only in downstream projects
as they are only useful with respect to a projects aims. For example,
records taken of only a single taxa within a location (say, as part of
tree health monitoring) provide useful data for a species distribution
model but do not provide useful data for community analyses. Thus the
function
[`envClean::make_effort_mod()`](https://dew-landscapes.github.io/envClean/reference/make_effort_mod.html)
that allows detecting excessively over- or under-sampled visits for
possible filtering is unlikely to be useful in preparing species
distribution models but is essential when undertaking community
analyses.

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
