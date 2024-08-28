@MainActor
struct ContractionCounterViewObject {
  var data: [ContractionItemData] = []
}

@MainActor
struct ContractionItemData: Identifiable, Equatable { // TODO: implements real data after
  let id: Int
  let start: String
  let end: String
  let duration: String
}
