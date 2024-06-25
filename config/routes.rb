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
          get 'unsubscribe'
          patch 'withdraw'
        end
      end
      resources :cart_items, only: [:index, :update, :destroy, :create] do
        collection do
        delete 'destroy_all'
        end
      end
      resources :orders, only: [:new, :create, :index, :show] do
        collection do
          get 'confirm'
          # アプリケーション詳細設計書に合わせて修正
          get 'thanks'
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
	    resources :genres, only: [:index, :create, :edit, :update] #only: %i[index show new create edit update] 必要に応じて
	   #顧客詳細情報(管理者)
    	resources :customers, only: [:index, :show, :edit, :update]
	    resources :orders, only: [:index, :show, :edit, :update]
	    resources :order_details, only: [:update]
    end
  end
