`import Ember from 'ember'`

ConfigureEmberEasyForm =
  name: 'configureEmberEasyForm'

  initialize: (container) ->
    Ember.EasyForm.Config.registerTemplate(
      'bootstrap-input', container.lookup('template:bootstrap-input')
    )
    Ember.EasyForm.Config.registerTemplate(
      'bootstrap-error', container.lookup('template:bootstrap-error')
    )

    Ember.EasyForm.Config.registerWrapper 'bootstrap-horizontal',
      inputTemplate: 'bootstrap-input'
      errorClass: 'help-block error'
      labelClass: 'control-label col-md-2 col-sm-2'
      formClass: 'form-horizontal'
      fieldErrorClass: 'has-error'
      controlsWrapperClass: 'col-md-8 col-sm-10'

`export default ConfigureEmberEasyForm`
