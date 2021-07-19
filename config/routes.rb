Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # https://guides.rubyonrails.org/routing.html#shallow-nesting
      resources :posts, only: %i[index show create update destroy], shallow: true do
        resources :comments, only: %i[index show create update destroy] do
          resources :reactions, only: %i[create destroy]
        end
      end
    end
  end
end
