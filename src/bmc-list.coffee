Polymer 'bmc-list',

  domReady: ->
    @$.textarea.addEventListener 'keydown', @onKeyDown.bind(@)
    @$.textarea.addEventListener 'blur', @clearTextArea.bind(@)

  onKeyDown: (event) ->
    if event.keyCode is 13    # Return key
      event.preventDefault()

      label = event.target.value
      if label.length > 0
        @addItem label

      @clearTextArea()

    else if event.keyCode is 27   # Esc key
      event.preventDefault()
      @cancel()

  cancel: ->
    @clearTextArea()

    @$.textarea.blur()

  addItem: (label) ->
    item = document.createElement 'bmc-listitem'
    item.value label
    @$.list.appendChild item

  removeAllItems: ->
    items = @$.list.querySelectorAll 'bmc-listitem'
    for item in items
      item.remove()

  clearTextArea: ->
    @$.textarea.value = ''

  value: (data) ->
    if data?
      @setValue data
    else
      @getValue()

  setValue: (data) ->
    @removeAllItems()

    for label in data
      @addItem label

  getValue: ->
    data = []

    items = @$.list.querySelectorAll 'bmc-listitem'
    for item in items
      if item?
        data.push item.value()

    return data
