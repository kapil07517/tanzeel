#require "logger"

require "sinatra"
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :database => "lesson_breakdown",
  :username => "root",
  :password => "root"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require "action_mailer"

ActionMailer::Base.view_paths = File.join(File.dirname(__FILE__),"views")

autoload :Lesson,File.join(File.dirname(__FILE__),"models","lesson")

get "/" do
 erb :"lessons/new.html"
end

