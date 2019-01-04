# Api Version 1
module V1
  # Main super class of the Version 1
  class MainController < ApplicationController
    include Response
    include ExceptionHandler
  end
end
