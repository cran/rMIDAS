## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- eval = FALSE------------------------------------------------------------
#  
#  library(rMIDAS)
#  
#  set_python_env(python = "~/path/to/bin/python")
#  
#  # Then proceed as normal...
#  

## ---- eval = FALSE------------------------------------------------------------
#  
#  library(rMIDAS)
#  
#  set_python_env(python = "myenv", type = "virtualenv")
#  
#  # or
#  
#  set_python_env(python = "mycondaenv", type = "conda")
#  
#  # Then proceed as normal...
#  

## ---- eval = FALSE------------------------------------------------------------
#  
#  library(rMIDAS)
#  
#  reticulate::use_condaenv(condaenv = "myenv", conda = "some_conda_executable", required = FALSE)
#  midas_setup()
#  
#  # Then proceed as normal...
#  

## ---- eval = FALSE------------------------------------------------------------
#  
#  set_python_env("/usr/local/bin/python3")
#  
#  # Then proceed as normal...

## ---- eval = FALSE------------------------------------------------------------
#  
#  reticulate::virtualenv_create(envname = "myenv", python = "/path/to/your/python3/bin")
#  set_python_env("myenv", type = "virtualenv")
#  
#  # Then proceed as normal...
#  

