module UserData

$names = ["Alice", "Brad", "Caroline", "David", "Eliza", "Felipe", "Grant", "Holly", "Irene", "Jaina", "Kelly", "Laura", "Manny", "Nina", "Quentin", "Ophelia", "Peter", "Sammy"]
$current_name = ""

  def self.user_name
    $current_name = $names.sample
  end

  def self.user_email
    email = []
    domains = ["@email.com", "@gmail.com", "@hotmail.com", "@usa.com", "@google.com", "@microsoft.com", "@example.com", "@bloc.com", "@ymail.com"]
    email << $current_name
    email << domains.sample
    puts email
    email.join("")
  end

end
