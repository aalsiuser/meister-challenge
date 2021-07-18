Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :posts, shallow: true do
        # https://guides.rubyonrails.org/routing.html#shallow-nesting
        resources :comments do
          resources :reactions
        end
      end
    end
  end
end
