Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      box.appendChild @createList()

  createList: ->
    document.createElement 'bmc-list'

  value: (data) ->
    if data?
      @setValue data
    else
      @getValue()

  setValue: (data) ->
    for id of data
      box = @$.base.querySelector('#' + id + ' bmc-list')
      box.value data[id]

  getValue: ->
    data = {}

    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      data[box.id] = box.querySelector('bmc-list').value()

    return data
