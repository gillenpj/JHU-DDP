load("smartform")

shinyServer(function(input, output) {

    output$table1 <- renderTable({
        df <- subset(historic_races, meeting_date == input$meetingDate, c("race_num", "race_name", "num_runners"))
        df[order(df$race_num),]
    }, include.rownames=F)

    output$table2 <- renderTable({
        df1 <- subset(historic_races, meeting_date == input$meetingDate & race_num == input$raceNumber, c("race_id"))
        df2 <- subset(historic_runners, race_id == df1$race_id[1], c("cloth_number", "name", "starting_price_decimal", "finish_position"))
        odds <- df2$starting_price_decimal
        odds <- odds[!is.na(odds)]
        odds <- odds[order(odds)]
        df2$meets_criteria <- df2$starting_price_decimal <= odds[min(input$topFavourites, length(odds))] & (input$decentBet == FALSE | (df2$starting_price_decimal >= 4.5 & df2$starting_price_decimal <= 5.5))
        df2[order(df2$cloth_number),]
    }, include.rownames=F)

    output$table3 <- renderTable({
        df1 <- subset(historic_races, meeting_date == input$meetingDate & race_num == input$raceNumber, "race_id")
        df2 <- subset(historic_runners, race_id == df1$race_id[1] & cloth_number == input$runnerNumber, "runner_id")
        df3 <- subset(historic_runners, runner_id == df2$runner_id[1], "race_id")
        df4 <- subset(historic_races, race_id %in% df3$race_id & meeting_date <= input$meetingDate, "race_id")
        df5 <- subset(historic_runners, runner_id == df2$runner_id[1] & race_id %in% df4$race_id, c("cloth_number", "stall_number", "jockey_name", "starting_price", "finish_position"))
        }, include.rownames=F)

#     output$text1 <- renderText({
#         paste("% winners in top favourities is", input$topFavourites)
#     })


}
)
