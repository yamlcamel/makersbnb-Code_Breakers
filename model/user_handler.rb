class UserHandler
  attr_reader :user_id, :user_name

  def initialize (user_id = '', user_name = '')
    @user_id = user_id
    @user_name = user_name
  end

  def self.get_user_id(user_name)
    result = DatabaseConnection.query("SELECT user_id FROM users WHERE user_name= '#{user_name}';")
    result.map { |user| UserHandler.new(user['user_id']) }
  end

  def self.add_user(user_name)
    DatabaseConnection.query("INSERT INTO users(user_name) VALUES('#{user_name}');")
  end
end