## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----setup--------------------------------------------------------------------
# library(torchvision)
# library(torch)

## -----------------------------------------------------------------------------
# ds <- coco_detection_dataset(
#   train = FALSE,
#   download = TRUE,
#   transform = \(img) img %>% transform_to_tensor() %>% transform_rgb_to_grayscale(),
#   item_transform = \(item) item %>% item_transform_resize(c(480, 640))
# )

## -----------------------------------------------------------------------------
# ds <- item_transform_random_horizontal_flip(ds, p = 0.5)

## -----------------------------------------------------------------------------
# mnist <- mnist_dataset(root = tempdir(), download = TRUE, transform = transform_to_tensor)
# str(mnist[1])
# #> List of 2
# #>  $ x:Float [1:1, 1:28, 1:28]
# #>  $ y: int 6

## -----------------------------------------------------------------------------
# boxed <- draw_bounding_boxes(ds[1])
# tensor_image_browse(boxed)

## -----------------------------------------------------------------------------
# class(item_transform_rotate(ds[1], angle = 15))
# #> [1] "image_with_rotated_box" "list"

## -----------------------------------------------------------------------------
# seg_ds <- coco_segmentation_dataset(
#   train = FALSE,
#   download = TRUE,
#   transform = transform_to_tensor,
#   target_transform = target_transform_coco_masks
# )
# masked <- draw_segmentation_masks(seg_ds[1])

## -----------------------------------------------------------------------------
# split <- prepare_sahi_split(c(1000, 1200), size = c(512, 512))
# length(split$crop_windows)
# #> [1] 9

## -----------------------------------------------------------------------------
# tiled <- ds[1]
# split <- prepare_sahi_split(tiled$x, size = c(256, 256))
# 
# crops <- transform_sahi_crop(tiled$x, split)
# targets <- target_transform_sahi_crop(tiled$y, split)

## -----------------------------------------------------------------------------
# img <- torch_randint(0, 255, size = c(3, 120, 160))$to(dtype = torch_uint8())
# 
# y <- list(
#   boxes = torch_tensor(rbind(c(10, 20, 60, 90), c(70, 30, 150, 110)), dtype = torch_float()),
#   labels = c("cat", "dog"),
#   image_height = 120,
#   image_width = 160
# )
# class(y) <- c("object_detection_target", "list")
# 
# item <- list(x = img, y = y)
# class(item) <- c("image_with_bounding_box", "list")
# 
# str(item)
# #> List of 2
# #>  $ x:Byte [1:3, 1:120, 1:160]
# #>  $ y:List of 4
# #>   ..$ boxes       :Float [1:2, 1:4]
# #>   ..$ labels      : chr [1:2] "cat" "dog"
# #>   ..$ image_height: num 120
# #>   ..$ image_width : num 160
# #>   ..- attr(*, "class")= chr [1:2] "object_detection_target" "list"
# #>  - attr(*, "class")= chr [1:2] "image_with_bounding_box" "list"

