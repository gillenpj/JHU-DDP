shinyUI(fluidPage(

    titlePanel("Horse Racing Form Viewer"),

    sidebarLayout(position="right",
                  sidebarPanel(
                      h3("Set Race Criteria"),
                      sliderInput("topFavourites",
                                  "# Top favourites:",
                                  min = 1,
                                  max = 5,
                                  value = 3),
#                       br(),
#                       textOutput("text1"),
                      br(),
                      img(src = "Horserace_520133030.jpg"),
                      br(), br(),
#                       sliderInput("recentForm",
#                                   "# Days since in-the-money:",
#                                   min = 1,
#                                   max = 179,
#                                   value = 39),
#                       br(),
                      checkboxInput("decentBet", "Odds of 7-2 to 9-2", value = TRUE)
                  ),

                  mainPanel(
                      fluidRow(
                          column(3, dateInput("meetingDate", "Meeting:", value="2013-01-02", min="2013-01-02", max="2013-10-16")),
                          column(3, numericInput("raceNumber", "Race:", value=1, min=1, max=8, step=1)),
                          column(3, numericInput("runnerNumber", "Runner:", value=1, min=1, max=18, step=1))
                      ),
                      tabsetPanel(type = "pills",
                                  tabPanel("Meeting", tableOutput("table1")),
                                  tabPanel("Race", tableOutput("table2")),
                                  tabPanel("Runner", tableOutput("table3")),
                                  position="above"
                      )
                  )
    )
)
)
