Polymer 'bmc-list',

  domReady: ->
    @$.textarea.addEventListener 'keydown', @onKeyDown.bind(@)
    @$.textarea.addEventListener 'blur', @cancel.bind(@)

  onKeyDown: (event) ->
    if event.keyCode is 13    # Return key
      event.preventDefault()

      label = event.target.value
      if label.length > 0
        @addItem label

      # Clear text area
      @$.textarea.value = ''

  addItem: (label) ->
    item = document.createElement 'bmc-listitem'
    item.setLabel label
    @$.list.appendChild item

  cancel: ->
    @$.textarea.value = ''
