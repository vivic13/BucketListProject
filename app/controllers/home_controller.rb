class HomeController < ApplicationController
	def homepage
		@page_title = "Bucket Lists 首頁"
	end
	def about
		@page_title = "關於Bucket Lists"
	end
	def works
		@page_title = "Q&A"
	end
end
