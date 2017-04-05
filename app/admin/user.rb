ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

 config.comments = false
  index do
    column :first_name
    column :last_name
    column :email
    column :previous_experience
    column :interests
    column :availability

    actions
  end

  filter :firstname
  filter :lastname
  filter :availability
  filter :interests

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :firstname
      f.input :lastname
    end
    f.actions
  end
  
  member_action :reset_password do
    flash[:error] = "Please contact the administrator to change your password."
  end
  
  show :title =>  proc {|user|user.firstname + " " + user.lastname } do
    #page_title user.firstname + " " + user.lastname
    attributes_table :email, :firstname, :lastname, :previous_experience, :interests, :availability, :address, :city, :state, :zipcode, :phonenumber, :additional_comments
  end
  
end
