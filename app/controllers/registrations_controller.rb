class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(person)
    '/people/' + person.id.to_s + '/edit'
  end
end
