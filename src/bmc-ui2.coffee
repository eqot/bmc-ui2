Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      box.appendChild @createList()

  createList: ->
    document.createElement 'bmc-list'
