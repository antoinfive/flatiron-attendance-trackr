class StudentSerializer < ActiveModel::Serializer  
  attributes :id, :first_name, :last_name, :email, :github_username
end  