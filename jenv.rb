require 'formula'


class Jenv < Formula
  homepage 'http://www.jenv.be'
  url 'https://github.com/gcuisinier/jenv/archive/0.2.0-20140712.tar.gz'
  sha1 '2881d75b3fd689233d7ff35fd8cc63ff48b92c64'
  head 'https://github.com/gcuisinier/jenv.git', :branch => 'master'

  def install
     libexec.install Dir['*']
     bin.write_exec_script libexec/'bin/jenv'
   end

   def caveats; <<-EOS.undent
     To enable shims and autocompletion add to your profile:
       if which jenv > /dev/null; then eval "$(jenv init -)"; fi

     To use Homebrew's directories rather than ~/.jenv add to your profile:
       export JENV_ROOT=#{opt_prefix}
     EOS
   end
end
