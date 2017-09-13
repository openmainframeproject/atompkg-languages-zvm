LanguageZvmAsmView = require './language-zvm-asm-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageZvmAsm =
  languageZvmAsmView: null
  modalPanel: null
  subscriptions: null
  elementHadFocus: null
  userVisiblePackageName: 'language-zvm-asm'  # Used for config keys, amongst other things
  debugging: false

  # http://flight-manual.atom.io/behind-atom/sections/configuration-api/
  # https://atom.io/docs/api/v1.19.7/Config
  # config:

  activate: (state) ->
    @languageZvmAsmView = new LanguageZvmAsmView(state.languageZvmAsmViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageZvmAsmView.getElement(), visible: false)
    @languageZvmAsmView.clickToHide(@modalPanel)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-zvm-asm:toggle': => @toggle()
    console.log 'LanguageZvmAsm finished activation' if @debugging

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageZvmAsmView.destroy()

  serialize: ->
    languageZvmAsmViewState: @languageZvmAsmView.serialize()

  toggle: ->

    if @modalPanel.isVisible()
      console.log @userVisiblePackageName + ' was toggled, visible >> invisible'  if @debugging
      @modalPanel.hide()
      @elementHadFocus?.focus()
    else
      console.log @userVisiblePackageName + ' was toggled, visible << invisible' if @debugging
      @modalPanel.show()
      @elementHadFocus = document.activeElement
      @modalPanel.getItem().focus()  # Needed for clickToHide to work
