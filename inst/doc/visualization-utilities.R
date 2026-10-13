## ----echo = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(eval = FALSE)

## ----setup--------------------------------------------------------------------
# library(torchvision)
# library(torch)
# 
# gallery <- "https://raw.githubusercontent.com/pytorch/vision/main/gallery/assets/"
# dog1 <- base_loader(paste0(gallery, "dog1.jpg")) %>% transform_to_tensor()
# dog2 <- base_loader(paste0(gallery, "dog2.jpg")) %>% transform_to_tensor()

## -----------------------------------------------------------------------------
# grid <- vision_make_grid(dog1, dog2, per_row = 2)
# tensor_image_browse(grid)

## -----------------------------------------------------------------------------
# boxes <- torch_tensor(rbind(
#   c(50, 50, 100, 200),
#   c(210, 150, 350, 430)
# ), dtype = torch_float())
# 
# boxed <- draw_bounding_boxes(dog1, boxes,
#                              labels = c("tree", "partial corgi"), font_size = 18,
#                              colors = c("darkorange", "yellow"), width = 5)
# tensor_image_browse(boxed)

## -----------------------------------------------------------------------------
# norm_mean <- c(0.485, 0.456, 0.406)
# norm_std <- c(0.229, 0.224, 0.225)
# 
# batch <- list(dog1, dog2) %>%
#   torch_stack() %>%
#   transform_normalize(norm_mean, norm_std)
# 
# model <- model_rfdetr_base(pretrained = TRUE, num_queries = 40)
# model$eval()
# detections <- with_no_grad(model(batch))$detections

## -----------------------------------------------------------------------------
# tensor_image_browse(vision_make_grid(
#   draw_bounding_boxes(dog1, detections[[1]]$boxes),
#   draw_bounding_boxes(dog2, detections[[2]]$boxes)
# ))

## -----------------------------------------------------------------------------
# draw_high_confidence_bboxes <- function(image, detection, width = 4, font_size = 25, ...) {
#   keep <- as.logical(as.array(detection$scores > 0.6))
#   draw_bounding_boxes(
#     image,
#     detection$boxes[keep, , drop = FALSE],
#     labels = coco_classes(as.integer(detection$labels[keep])),
#     width = width,
#     font_size = font_size,
#     ...
#   )
# }

## -----------------------------------------------------------------------------
# tensor_image_browse(vision_make_grid(
#   draw_high_confidence_bboxes(dog1, detections[[1]], color = "yellow"),
#   draw_high_confidence_bboxes(dog2, detections[[2]], color = "yellow")
# ))
# 

## -----------------------------------------------------------------------------
# resized <- list(dog1, dog2) %>%
#   torch_stack() %>%
#   transform_resize(size = c(520, 520))
# 
# batch <- resized %>%
#   transform_normalize(norm_mean, norm_std)
# 
# model <- model_fcn_resnet50(pretrained = TRUE)
# model$eval()
# scores <- with_no_grad(model(batch))$out

## -----------------------------------------------------------------------------
# segmented <- draw_segmentation_masks(resized[1,..], scores[1, ..], alpha = 0.6)
# tensor_image_browse(segmented)

## -----------------------------------------------------------------------------
# tensor_image_browse(vision_make_grid(
#   draw_segmentation_masks(resized[1,..], scores[1, ..], alpha = 0.6),
#   draw_segmentation_masks(resized[2,..], scores[2, ..], alpha = 0.6)
#   )
# )

## -----------------------------------------------------------------------------
# keypoints <- torch_tensor(rbind(
#   c(220, 171),
#   c(296, 176),
#   c(239, 222),
#   c(262, 226),
#   c(242, 250)
# ), dtype = torch_float())$reshape(c(1, 5, 2))
# 
# connectivity <- list(c(1, 3), c(2, 4), c(3, 4), c(3, 5), c(4, 5))
# 
# posed <- draw_keypoints(dog1, keypoints, connectivity = connectivity,
#                         radius = 6, width = 3)
# tensor_image_browse(posed)

