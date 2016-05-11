#!/usr/bin/env ruby

require 'sinatra'
require 'sequel'
require 'oj'

DB = Sequel.postgres('ruby-can-too-scale_production')

class App < Sinatra::Base
  get '/articles.json' do
    content_type :json
    Oj.dump(DB[:articles].all)
  end

  get '/articles/:id.json' do
    content_type :json
    Oj.dump(DB[:articles].where(id: params[:id]).all)
  end
end

if __FILE__ == $0
  App.run!
end
