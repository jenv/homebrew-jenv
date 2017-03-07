require "formula"

class Jenv < Formula
  homepage "http://www.jenv.be"
  url "https://github.com/gcuisinier/jenv/archive/0.4.4.tar.gz"
  sha256 "74b48d9c33ceae4e141272c4096086c6ec1a8f10073da379b816518615c79881"
  head "https://github.com/gcuisinier/jenv.git"

  def install
     libexec.install Dir["*"]
     bin.write_exec_script libexec/"bin/jenv"
   end

   def caveats; <<-EOS.undent
     To enable shims and autocompletion add to your profile:
       if which jenv > /dev/null; then eval "$(jenv init -)"; fi

     To use Homebrew's directories rather than ~/.jenv add to your profile:
       export JENV_ROOT=#{opt_prefix}
     EOS
   end

  test do
    (testpath/".java-version").write "homebrew-test"
    output = `jenv version 2>&1`
    assert output.include? "jenv: version `homebrew-test' is not installed"
  end
end
