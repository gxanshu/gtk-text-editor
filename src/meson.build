text_editor_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

text_editor_deps = [
  config_dep,
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.4'),
]

text_editor_sources += gnome.compile_resources('text-editor-resources',
  'text-editor.gresource.xml',
  c_name: 'text_editor'
)

executable('text-editor', text_editor_sources,
  dependencies: text_editor_deps,
  include_directories: config_inc,
       install: true,
)
