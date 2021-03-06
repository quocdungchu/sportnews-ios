class Component<ViewType: View, ViewModelType, WireframeType>
  where ViewType.ViewModelType == ViewModelType {
  
  let view: ViewType
  let viewModel: ViewModelType
  let wireframe: WireframeType
  
  init(view: ViewType, viewModel: ViewModelType, wireframe: WireframeType) {
    self.view = view
    self.viewModel = viewModel
    self.wireframe = wireframe
    
    setup()
  }
  
  private func setup() {
    view.viewModel = viewModel
  }
}

