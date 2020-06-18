## holreaR

# Creating a dendrogram (tree diagram) of a chart saved as a csv.
# The chart contains relevant dimensions and stems
# of your research field or topic to visualise
# fields, issues, aspects, and subcategories, as well as, specific literature.
# Useful to get a more intuitive and holistic perspective on your research.

# Loading the library

library(collapsibleTree)
# if not installed use:
# install.packages("collapsibleTree")
# for help:
# ?collapsibleTree

# a chart of research topics

chart <- read.csv2("C:/dendro_literaturetable.csv", # specify your path, here "C:/" is used
                 header = T
                 ) # load the chart, farmatted compatible with the logic of a dendrogram

# creat the dendrogram

collapsibleTree(chart,
                hierarchy = c("root",
                              "stem1", "dim1",	"dim2", #..., "dim_i",
                              "stem2", "dim21", "dim22",#..., 
                              "stem3", "dim31", "dim32",#...,
                              #"stem_i",  ...,      ..., ..., "dim_ip",
                              "literature"),
                width = 700, # you have to play with these values depending on the dimension of your chart
                height =500  # sometimes 5000-7000 is adequate and sometime lower values between 500 and 700
)

# specific formatting

collapsibleTreeSummary(tab,
                       hierarchy = c("root",
                                     "stem1", "dim1",	"dim2", #..., "dim_i",
                                     "stem2", "dim21", "dim22",#..., 
                                     "stem3", "dim31", "dim32",#...,
                                     #"stem_i",  ...,           ..., "dim_ip",
                                     "literature"),
                       attribute = 'count', # weight the nodes per 'count'
                       # (also 'leafCount' is possible or an numeric agument from the data)
                       # #For further information use the help()-function or ?collapsibleTree
                       maxPercent = 50,     # Weighting for the palette; Should not be weighted to high
                       width = 700, # you have to play with these values depending on the dimension of your chart
                       height =200, # sometimes 5000-7000 is adequate and sometime lower values between 500 and 700
                       nodeSize = 'count',  # also 'leafCount' can be used
                       # Weights the size of the nodes relative to absolute number of nodes
                       zoomable = TRUE,     # 'TRUE' or 'FALSE', depending on the width and height, in most cases True is adequate
                       collapsed = FALSE    # 'FALSE' for an unfolded dendrogram; 'TRUE' for a folded one
) # The warnings can be ignored, because we only use the dendrogram for visualisations, they simply give the information that NAs were not colored.

# In RStudio a dendrogram is now created, to save this grafic:
# look on the right side,
# go to the Viewer tab,
# and use the Export button to save it as a webpage to get an interactive one.
# If this is not required, save it as image.
# Now you can specify a path and open your dendrogram in a browser.
# Your dendrogram can be very big, so if you see a white page it is normal, use the sroller, within the browser, to zoom in and out.