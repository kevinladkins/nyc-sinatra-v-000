
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    Helpers.check_if_exists(params, @figure)
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
  end

  post '/figures/:id' do
    binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @figure.save
    Helpers.check_if_exists(params, @figure)
    redirect "figures/#{@figure.id}"
  end



end
