require_relative('./models/time_date')
require 'sinatra'
require 'sinatra/contrib/all'
require 'pg'
require 'pry'

TimeDate.delete_all()

@timedate1 = TimeDate.new({
  'date' => Date.new(2019,12,15),
  'time' => '12:00'
  })
@timedate1.save()

@timedate2 = TimeDate.all()

binding.pry
nil
