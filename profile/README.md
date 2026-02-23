DEW-landscapes
================

This is a work in progress. Last update Tuesday, 24 February, 2026.
08:40.

DEW-landscapes holds packages and workflows (projects) we have found
useful for creating, cleaning and analysing large, unstructured
biological and environmental data sets in the context of providing lines
of evidence for decision making in natural resources management.

This readme aims to:

- document the various `env` packages and workflows
- specify the aims of each package and workflow
- point to useful supporting workflows

Note that most workflows are private github repositories. Links are
provided to reports resulting from use of the workflows, where
available.

# Background

DEW-landscapes packages and workflows have been roughly guided by the
paper *Essential biodiversity variables for mapping and monitoring
species populations* ([Jetz et al. 2019](#ref-RN4609)) in that once data
are accumulated, they are cleaned with reference to a regular cube of
specific extent (generally with reference to temporal and geographic
extent) and grain (generally with reference to temporal, geographic and
taxonomic grain). Apparently, this aligns with the Earth Systems Data
Cubes (ESDCs) concept (e.g. [Montero et al. 2024](#ref-RN4610)). The R
package `sits` ([Simoes et al. 2026](#ref-R-sits),
[2021](#ref-sits2021)), while not used directly in any `env` packages or
workflows, also provides useful background on [regular
cubes](https://e-sensing.github.io/sitsbook/dc_regularize.html#the-need-for-regular-eo-data-cubes)
within the context of earth observation (EO) cubes.

# Workflows

The following figure shows a cartoon of the links between various `env`
packages and workflows.

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
    x199e33ac94c360fd(["envClean<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>package"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued
    x9d3addc2d3c28cb0(["envOcc<br>workflow"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>workflow"]):::queued --> x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued
    xa419b1871c902a02(["envImport<br>package"]):::queued --> x9d3addc2d3c28cb0(["envOcc<br>workflow"]):::queued
    x5499a04bf3778295(["envRegCont<br>workflow"]):::queued --> x2cb0f2dc918c8a98(["envPIA<br>workflow"]):::queued
    xc1054dd4c63b18e0(["envSDMs<br>workflow"]):::queued --> x2cb0f2dc918c8a98(["envPIA<br>workflow"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued --> x5499a04bf3778295(["envRegCont<br>workflow"]):::queued
    x4f41d9ef8b70ed0e(["envRange<br>package"]):::queued --> x5499a04bf3778295(["envRegCont<br>workflow"]):::queued
    x07cddf360e9b199e(["envSDM<br>package"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>workflow"]):::queued
    x67b5feaf09e4d0ca(["envRas<br>workflow"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>workflow"]):::queued
    x4e1f08a5bd05b882(["envCleaned<br>workflow"]):::queued --> xc1054dd4c63b18e0(["envSDMs<br>workflow"]):::queued
    x6832f874a98057bb(["envFunc<br>package"]):::queued
    xb03046fba8fa1b84(["envTargets<br>package"]):::queued
  end
```

# envImport and envOcc

The workflow [`envOcc`](https://github.com/dew-landscapes/envOcc) helps
aggregate many disparate data sources. Functions for accessing publicly
accessible data sources are available within
[`envImport`](https://github.com/dew-landscapes/envImport).

# envClean and envCleaned

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
