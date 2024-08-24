struct ContractionCounterViewObject {
  var data: [ContractionItemData]
}

struct ContractionItemData: Identifiable { // TODO: implements real data after
  let id: Int
  let start: String
  let end: String
  let duration: String
}
