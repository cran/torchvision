## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# library(torchvision)
# 
# # Search for specific topics
# search_rf100("cell")        # Find cell-related datasets
# search_rf100("solar")       # Find solar panel datasets
# search_rf100("x-ray")       # Find X-ray datasets
# 
# # List all datasets in a collection
# search_rf100(collection = "biology")
# search_rf100(collection = "medical")
# 
# # View complete catalog
# catalog <- get_rf100_catalog()
# View(catalog)

## ----eval=FALSE---------------------------------------------------------------
# # Search for solar/photovoltaic datasets
# search_rf100("solar")
# search_rf100("photovoltaic")
# 
# # Result shows:
# # - solar_panel in infrared collection
# # - solar_panel in damage collection

## ----eval=FALSE---------------------------------------------------------------
# library(torchvision)
# library(knitr)
# 
# catalog <- get_rf100_catalog()
# 
# # Display key columns
# kable(catalog[, c("collection", "dataset", "description", "total_size_mb", "estimated_images")])

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "biology")

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "medical")

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "infrared")

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "damage")

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "underwater")

## ----eval=FALSE---------------------------------------------------------------
# search_rf100(collection = "document")

## ----eval=FALSE---------------------------------------------------------------
# library(torchvision)
# 
# # Search for blood cell dataset
# search_rf100("blood")
# 
# # Load the dataset
# ds <- rf100_biology_collection(
#   dataset = "blood_cell",
#   split = "train",
#   download = TRUE
# )
# 
# # Inspect a sample
# item <- ds[1]
# print(item$y$labels)  # Object classes
# print(item$y$boxes)   # Bounding boxes
# 
# # Visualize with bounding boxes
# boxed <- draw_bounding_boxes(item)
# tensor_image_browse(boxed)

## ----eval=FALSE---------------------------------------------------------------
# catalog <- get_rf100_catalog()
# 
# # Total size of all datasets
# sum(catalog$total_size_mb) / 1024  # In GB
# 
# # Datasets by size
# catalog[order(-catalog$total_size_mb), c("dataset", "collection", "total_size_mb")]
# 
# # Smallest and largest datasets
# catalog[which.min(catalog$total_size_mb), ]
# catalog[which.max(catalog$total_size_mb), ]
# 
# # Average size by collection
# aggregate(total_size_mb ~ collection, data = catalog, FUN = mean)

## ----eval=FALSE---------------------------------------------------------------
# # Find small datasets (< 20 MB total)
# subset(catalog, total_size_mb < 20)
# 
# # Find large datasets (> 200 MB total)
# subset(catalog, total_size_mb > 200)
# 
# # Find datasets with specific keywords
# subset(catalog, grepl("tumor|cancer|disease", description, ignore.case = TRUE))
# 
# # Datasets with all three splits
# subset(catalog, has_train & has_test & has_valid)

