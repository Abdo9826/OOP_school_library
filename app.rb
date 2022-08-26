require_relative 'books'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'rental'

class App
  def initialize
    @book = []
    @rentals = []
    @people = []
  end

  def options
    puts('Welcome to school library App!')
    puts('Please choose an option by entering a a number:')
    puts('1 - List all books')
    puts('2 - List all people')
    puts('3 - Create a person')
    puts('4 - Create a book')
    puts('5 - Create a rental')
    puts('6 - List all rentals for a given person id')
    puts('7 - Exit')
    puts('')
  end

  def display
    options
  end

  def run_choise(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_people
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_of_rentals
    else
      exit
    end
  end

  def run
    options
    puts 'Enter number'
    input = gets.chomp
    run_choise(input)
  end

  # list book
  def list_books
    puts 'The Library is empty ,There is no books added yet!' if @book.length.zero?

    @book.each do |book|
      puts "#{@book.index(book)}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    puts ''
    run
  end

  # list people
  def list_people
    puts 'There is person in the list!' if @book.length.zero?

    @people.each do |person|
      puts "Name: #{person.name}  Age: #{person.age}"
    end

    puts ''
    run
  end

  #   Create person
  def create_people
    puts 'Do you want to create a student (1) or a teacher (2) ? [Input the number]:'
    input = gets.chomp.to_i
    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please Enter 1/2 please'
      create_people
    end
  end

  # create student
  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '

    parent_permission = ''

    case gets.chomp.downcase
    when 'y'
      parent_permission = true

    when 'n'
      parent_permission = false
    else
      puts('please enter [Y/N]: ')
    end

    new_student = Student.new(age, name, parent_permission)
    @people << new_student
    puts @people
    run

    puts('Student person created successfully!')
  end

  # create teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(specialization, age, name)
    @people << new_teacher
    puts('Teacher person created successfully!')
    run
  end

  # create book
  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    new_book = Books.new(title, author)
    @book << new_book

    puts('Book created successfully')
    run
  end

  # create rental
  def create_rental
    puts('Select a book from the following list by number')
    @book.each do |book|
      puts("#{@book.index(book)} Title: \"#{book.title}\", Age: #{book.author}")
    end

    book_id = gets.chomp.to_i
    selected_book = @book[book_id]

    puts('Select a person from the following list by number')
    @people.each do |person|
      puts("#{@people.index(person)}) Name: \"#{person.name}\", Age: #{person.age}")
    end

    person_name = gets.chomp.to_s
    selected_person = @people[person_name]
    puts selected_person

    print('Date: ')
    rental_date = gets.chomp

    new_rental = Rental.new(rental_date, selected_book, selected_person)
    @rentals << new_rental
    run
  end

  def list_of_rentals
    print('name of person: ')
    name = gets.chomp.to_s
    puts('Rentals')
    puts('')

    puts 'There is no rentals' if @rentals.length.zero?

    @rentals.each do |i|
      puts "Date: #{i.date}, Book \"#{i.book.title}\" by #{i.book.author}" if i.person.name == name
    end

    run
  end
end

one = App.new
one.run
