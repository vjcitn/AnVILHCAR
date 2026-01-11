# AnVILHCAR

Tools for working with exports from Human Cell Atlas Portal to NHGRI AnVIL

Our aim is to provide R functions that simplify operations with
HCA artifacts exported from the [project collection](https://explore.data.humancellatlas.org/projects).
As of 11 January 2026 an authenticated user can explore 526 projects.  This package
provides tools to work with "common elements" expected to be present in
exportable datasets associated with projects.

## Example user journey

Once you have authenticated, all projects are in view, and on the left
sidebar, filtering is supported.

![All projects view](https://raw.githubusercontent.com/vjcitn/AnVILHCAR/0658c5f7f212cea634e7858a423bc750e0363f6e/figures/concrete1.jpg)


If we select a single project, we have this view:

![Selected project view](https://raw.githubusercontent.com/vjcitn/AnVILHCAR/0658c5f7f212cea634e7858a423bc750e0363f6e/figures/concrete2.jpg)

Drilling down, we find metadata in the right hand sidebar:

![Project metadata](https://raw.githubusercontent.com/vjcitn/AnVILHCAR/0658c5f7f212cea634e7858a423bc750e0363f6e/figures/concrete3.jpg)

The Export tab is used to set up selection of assets for transfer to AnVIL:

![concrete4](https://raw.githubusercontent.com/vjcitn/AnVILHCAR/0658c5f7f212cea634e7858a423bc750e0363f6e/figures/concrete4.jpg)

After we make our selections and identify or create a target workspace, we have, in AnVIL:

![concrete5](https://raw.githubusercontent.com/vjcitn/AnVILHCAR/0658c5f7f212cea634e7858a423bc750e0363f6e/figures/concrete5.jpg)

The purpose of the AnVILHCAR package is to introduce simplifcations to the process
of transforming the imported assets into analyzable data artifacts.
