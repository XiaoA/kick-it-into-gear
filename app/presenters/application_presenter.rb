class ApplicationPresenter < SimpleDelegator
  
  def initialize(model, view)
    @model, @view = model, view
    super(@model)
  end
end
