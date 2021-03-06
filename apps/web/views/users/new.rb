module Web::Views::Users
  class New
    include Web::View

    layout :login

    def form
      form_for :user, routes.register_path do
        div class: 'row input-field' do
          label :name
          text_field :name
        end
        div class: 'row input-field' do
          label :email
          text_field :email, type: 'email'
        end
        div class: 'row input-field' do
          label :password
          password_field :password
        end
        div class: 'row' do
          submit 'Create', class: 'btn teal darken-4 waves-effect waves-light'
          a 'Back', href: '/', class: 'btn grey'
        end
      end
    end
  end
end
