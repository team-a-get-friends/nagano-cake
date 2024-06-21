Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, skip: [:passwords], controllers: {

    registrations: "public/registrations",

    sessions: 'public/sessions'
  }

#ログイン以外の機能

    scope module: :public do
      root :to =>"homes#top"
      get '/about' => 'homes#about'
      resources :items, only: [:index, :show]
      resources :customers, only: [:show, :edit, :update] do
        collection do
          get 'check_out'
          patch 'withdraw'
        end
      end
      resources :cart_items, only: [:index, :update, :destroy] do
        collection do
        delete 'destroy_all'
        end
      end
      resources :orders, only: [:new, :create, :index, :show] do
        collection do
          get 'confirm'
          get 'complete'
        end
      end
      resources :addresses, except: [:new, :show]
    end

    devise_for :admin, skip: [:registrations, :passwords], controllers: {
	    sessions: "admin/sessions"
	  }

    namespace :admin do
	    get '/' => 'homes#top'
	    resources :items, except: [:destroy]
	    resources :genres, only: [:index, :create, :edit, :update]
	   #顧客詳細情報(管理者)
    	resources :customers, only: [:index, :show, :edit, :update]
	    resources :orders, only: [:show, :update]
	    resources :order_details, only: [:update]
    end
  end
