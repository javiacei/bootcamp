Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  resources :courses, only: [] do
    resources :exercises, param: :number, only: [:update]
  end
end
