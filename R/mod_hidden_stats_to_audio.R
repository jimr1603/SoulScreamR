#' hidden_stats_to_audio UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_hidden_stats_to_audio_ui <- function(id){
  ns <- NS(id)
  tagList(
    textInput(inputId = ns("player_name"),
              label = "player name",
              value = "Derrick Krueger"),
    selectInput(inputId = ns("waveform"),
                label = "Waveform",
                choices = c("sine",
                            "square",
                            "triangle",
                            "sawtooth")),
    downloadButton(outputId = ns("go"),
                 label = "Scream for me")

  )
}
    
#' hidden_stats_to_audio Server Function
#'
#' @noRd 
mod_hidden_stats_to_audio_server <- function(input, output, session){
  ns <- session$ns
  output$go = downloadHandler(filename = paste0(input$player_name, ".wav"),
                              content = function(file){
                                hidden_values_to_audio(player_name = input$player_name, 
                                                       waveform = input$waveform) %>% 
                                tuneR::writeWave(., file)
                                },
                              contentType = "audio/wav")


}