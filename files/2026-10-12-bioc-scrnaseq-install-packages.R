# Workshop setup
# Bioconductor version: 3.23
# Only works with R version 4.6.0 or higher, latest is 4.6.1
# See https://cran.r-project.org/index.html for more info

# 1. Install BiocManager package installer
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

# Dependency needed for installing packages from GitHub (i.e. "MangiolaLaboratory/cellNexus")
if (!requireNamespace("remotes", quietly = TRUE))
  install.packages("remotes")

# 2. Install workshop packages
BiocManager::install(c(
  # SingleCellExperiment and quality control
  "SingleCellExperiment", "MouseGastrulationData", "scater", "scuttle",
  "scrapper", "DropletUtils", "DropletTestFiles", "scDblFinder",
  "EnsDb.Mmusculus.v79", "ggplot2",
  
  # Clustering and cell-type annotation
  "AUCell", "SingleR", "bluster", "GSEABase", "pheatmap", "igraph",
  
  # Multi-sample analysis
  "edgeR", "limma",
  
  # Large datasets and parallel processing
  "HDF5Array", "TENxBrainData", "BiocParallel", "BiocNeighbors",
  "zellkonverter",
  
  # Human Cell Atlas chapter
  "dplyr", "MangiolaLaboratory/cellNexus"
  ),
  ask = FALSE,
  update = FALSE
)

# Verifying the packages needed are installed in the active R library.
required_packages <- c("edgeR", "DropletUtils")
missing_packages <- required_packages[
  !vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)
]

if (length(missing_packages) > 0) {
  stop(
    "Required package(s) were not installed: ",
    paste(missing_packages, collapse = ", "),
    ". Check the R/Bioconductor version and .libPaths(), then rerun this script."
  )
}

# Do you want to install from sources the package which needs compilation? (Yes/no/cancel)
# no

# Update all/some/none? [a/s/n]:
# a
