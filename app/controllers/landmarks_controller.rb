class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all 
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:year_completed])
    redirect '/landmarks'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id]) 
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

end
