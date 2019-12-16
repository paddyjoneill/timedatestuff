require_relative('./sqlrunner')
require_relative('../models/time_date')

TimeDate.delete_all()

@timedate1 = TimeDate.new({
  'date' => Date.new(2019,12,15),
  'time' => '12:00'
  })
@timedate1.save()
