
#TODO: Roxygen skeleton

hidden_values_to_audio = function(player_name, 
                                  latest = TRUE,
                                  waveform = "sine"){
  stats = blaseballData::player_info(name = player_name)
  
  if(!is.null(stats$error)){ #API don't know them
    return(stats$message)
  }

  hidden_values = dplyr::slice_tail(stats, n=1) %>% 
    dplyr::select(anticapitalism:cinnamon) %>% 
    tidyr::pivot_longer(anticapitalism:cinnamon) %>% 
    dplyr::mutate(value = as.numeric(value)) %>% 
    dplyr::pull(value) 
  
  sound = sonify::sonify(y = hidden_values,
                         duration = 10,
                         flim = c(220, 880*2),
                         waveform = waveform,
                         play = FALSE)
  return(sound)
}
