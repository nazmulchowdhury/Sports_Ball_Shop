class ShopsController < ApplicationController

	def index
		@shops = Shop.all
		
		respond_to do |format|
			format.html
		end
	end

	def admin_index
		@admin = Admin.where('user_name = ? AND password = ?', params[:user_name], params[:password])
		@shops = Shop.all

		respond_to do |format|
			format.html
		end
	end

	def show_index
		@shops = Shop.all
		respond_to do |format|
			format.html
		end
	end

	def find
		@shops = Shop.where('Brand = ? OR Type = ?', params[:search_string], params[:search_string])
	end

	def user_find
		@shops = Shop.where('Brand = ? OR Type = ?', params[:search], params[:search])
	end

	def buy
		@shop = Shop.find(params[:id])
		$t=@shop
	end

	def user
		@flag
		arg = params[:Sold].to_i
		if arg <= 0
			@flag = false
		else
			val=$t.Sold+arg
			if arg >= 1 && arg <= $t.Quantity
				$t.update_attribute(:Sold, val)
				$t.update_attribute(:Quantity, $t.Quantity-arg)
				@flag = true
			else
				@flag = false
			end
		end
	end

	def new
		@shop = Shop.new

		respond_to do |format|
			format.html
		end
	end

	def edit
		@shop = Shop.find(params[:id])
	end

	def create
		@shop = Shop.new(params[:shop])
		respond_to do |format|
			if @shop.save
				format.html { redirect_to action: "show_index" }
			else
				format.html { render action: "new" }
			end
		end
	end

	def update
		@shop = Shop.find(params[:id])

		respond_to do |format|
			if @shop.update_attributes(params[:shop])
				format.html { redirect_to action: "show_index" }
			else
				format.html { render action: "edit" }
			end
		end
	end

	def destroy
		@shop = Shop.find(params[:id])
		@shop.destroy

		respond_to do |format|
			format.html { redirect_to action: "show_index" }
		end
	end

end
