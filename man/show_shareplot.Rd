% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_shareplot.R
\name{show_shareplot}
\alias{show_shareplot}
\title{show_shareplot}
\usage{
show_shareplot(landscape, points, buffer_width, max_width,
  return_df = FALSE)

show_shareplot(landscape, points, buffer_width, max_width,
  return_df = FALSE)
}
\arguments{
\item{landscape}{Raster* object}

\item{points}{Point(s) represented by a two-column matrix or data.frame; SpatialPoints*; SpatialPolygons*; SpatialLines; Extent; a numeric vector representing cell numbers; or sf* POINT object}

\item{buffer_width}{Buffer width in which landscape share is measured}

\item{max_width}{Max distance to which buffer_width is summed up; the x axis in the plot}

\item{return_df}{Logical value indicating if a tibble with the underlying data should be returned}
}
\value{
ggplot2 Object
}
\description{
Plot the landscape share in subsequential buffers around a/multiple point(s) of interest
}
\examples{
# create single point
new_point = matrix(c(75,75), ncol = 2)

# show landscape and point of interest
show_landscape(classified_landscape, discrete = TRUE) +
ggplot2::geom_point(data = data.frame(x = new_point[,1], y = new_point[,2]),
                    ggplot2::aes(x = x, y = y),
                    col = "grey", size = 3)

# show single point share
show_shareplot(classified_landscape, new_point, 10, 50)

# show multiple points share
new_points = matrix(c(75, 110, 75, 30), ncol = 2)
show_shareplot(classified_landscape, new_points, 10, 50)

# get data frame with results back
result <- show_shareplot(classified_landscape, new_points, 10, 50, return_df = TRUE)
result$share_df

}
