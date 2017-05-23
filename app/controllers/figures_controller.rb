class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])

    if params[:title][:name]
      figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if params[:landmark][:name]
      figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end
    figure.save!

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]

    if params[:title][:name]
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if params[:landmark][:name]
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    @figure.save!

    redirect "/figures/#{@figure.id}"
  end
end
