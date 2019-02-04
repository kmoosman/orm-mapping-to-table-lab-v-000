class Student

  attr_accessor :name, :grade
  attr_reader :id

  @@all = []

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade

    @@all << self
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students;")
  end

  def self.save(name, grade)
    sql = <<-SQL
     INSERT INTO students (name, grade) 
     VALUES (?, ?)
   SQL

    DB[:conn].execute(sql, self.name, self.grade)
  end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

end
