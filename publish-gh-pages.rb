 #!/usr/bin/env ruby

require 'fileutils'

if `git branch`.split("\n").detect{|x| x.match(/^\*/)}.match(/master/)
  puts "Updating the gh-pages branch"

  myrepo = "git@github.com:ncuesta/gabbo-prototype.git"
  temp = "/tmp/gabbo-gh-pages"

  `serve export . build`

  FileUtils.mkdir_p(temp)
  `git clone -b gh-pages #{myrepo} #{temp}`
  FileUtils.cp_r(Dir["build/*"], temp)
  FileUtils.cd(temp) do
    system("git remote add github #{myrepo}")
    system("git add . && git commit -am 'Re-generating prototype' && git push github gh-pages")
  end
  FileUtils.rm_rf(temp)
end