require_relative('../db/sqlrunner')

class TimeDate

attr_reader :id
attr_accessor :time, :date

def initialize(options)
  @id = options['id'].to_i if options['id']
  @time = options['time']
  @date = options['date']
end

def save()
  sql = "INSERT INTO time_date
  (
    time, date
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@time, @date]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM time_date"
  results = SqlRunner.run( sql )
  timedate_array = results.map { |hash| TimeDate.new( hash ) }
  for timedate in timedate_array
    timedate.date = Date.parse timedate.date
  end
  return timedate_array
end

def update()
  sql = " UPDATE time_date SET
    (time, date) = ( $1, $2)
   WHERE id = $3;"
  values = [@time, @date]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = " DELETE FROM time_date"
  SqlRunner.run(sql)
end

end
