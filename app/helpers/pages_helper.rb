module PagesHelper
	Size = 5
	def getPages(model)
		@pageSize = Size
		total = model.count
		@pageCount =  (total / @pageSize).to_i
		@pageCount += total % @pageSize == 0 ? 0 : 1
		index = params[:page] == nil ? 1 : params[:page]
		@i = index.to_i - 1
		model.limit(@pageSize).offset(@i*@pageSize)
	end
end
