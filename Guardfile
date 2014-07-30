# More info at https://github.com/guard/guard#readme
#notification :libnotify, timeout: 2, transient: false, append: true
#notification timeout: 2, transient: false, append: true
guard :test, :cli => '--use-color' do
  # Watch all exercise files and run their respective test
  watch(%r{.*/lib/(.+)\.rb}) { |m| "test/#{m[1]}_test.rb" }

  # Watch all tests
  watch(%r{^.*/(test/.+_test\.rb)$}) { |m| "#{m[1]}" }

  watch(%r{.+$}) do |m|
    puts "Guardfile match all: #{m}"
  end


  #Watch the test helper, and if modified, run all tests
  #watch('test/test_helper.rb') { 'test' }

  # Watch any test helpers for each chapter
  # watch(test/[chapter|section]+/*_helper.rb) { run test/[chapter]/**/* files}
  #watch(%r{^test/(.+)/.+_helper\.rb$}) { |m| "test/#{m[1]}" }

  # Watch the utils directory, and if modified run all tests
  #noinspection RubyLiteralArrayInspection
  #watch(%r{^src/utils/(.+)\.rb$}) { |m|
  #  ["test/utils/#{m[1]}_test.rb",
  #   'test/chapter_1',
  #   'test/chapter_2',
  #   'test/chapter_3',
  #   'test/chapter_4',
  #   'test/chapter_5',
  #   'test/chapter_6']
  #}

end