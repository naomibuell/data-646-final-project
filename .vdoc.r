#
#
#
#
#
#
#
#
#
#
#| label: load packages

pacman::p_load(tidyverse, janitor, httr, jsonlite, skimr, RSocrata, CDCPLACES)
#
#
#
#
#
#

# API endpoint from link above
base_url <- "https://data.cdc.gov/resource/swc5-untb.json?measure=Feeling%20socially%20isolated%20among%20adults"

# Define the query parameters
query_params <- list()

# Make a GET request to the API endpoint with query parameters
response <- GET(base_url, query = query_params)

# Check if the request was successful
if (status_code(response) == 200) {
    # Parse the JSON response
    data <- fromJSON(content(response, "text"))
} else {
    cat(
        "Failed to retrieve data. HTTP Status code:",
        status_code(response),
        "\n"
    )
}
#
#
#
#
#
#| label: data exploration

clean_data <- data |> clean_names()

clean_data |> skim()

#
#
#
