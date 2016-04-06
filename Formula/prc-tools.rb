# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                             #
#    Copyright (C) 2016 Chuan Ji <jichuan89@gmail.com>                        #
#                                                                             #
#    Licensed under the Apache License, Version 2.0 (the "License");          #
#    you may not use this file except in compliance with the License.         #
#    You may obtain a copy of the License at                                  #
#                                                                             #
#     http://www.apache.org/licenses/LICENSE-2.0                              #
#                                                                             #
#    Unless required by applicable law or agreed to in writing, software      #
#    distributed under the License is distributed on an "AS IS" BASIS,        #
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
#    See the License for the specific language governing permissions and      #
#    limitations under the License.                                           #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                             #
#    Brew formula for prc-tools (http://prc-tools.sourceforge.net).           #
#                                                                             #
#    This formula is based on the the prc-tools remix codebase at             #
#                                                                             #
#    https://github.com/jichu4n/prc-tools-remix                               #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

class PrcTools < Formula
  desc "Collection of tools supporting C and C++ programming for Palm OS"
  homepage "http://prc-tools.sourceforge.net"
  url "https://github.com/jichu4n/prc-tools-remix/archive/2.3.3.tar.gz"
  sha256 "e3225c8bc0ef9c56e276e0e0c6d2ece6a5192eae1a19b17c28eee441d0710200"

  depends_on "autoconf" => :build

  def install
    ENV.deparallelize
    mkdir "build" do
      system "../prc-tools-2.3/configure",
        "--enable-targets=m68k-palmos,arm-palmos",
        "--enable-languages=c,c++",
        "--disable-nls",
        "--host=i686-apple-darwin",
        "--with-palmdev-prefix=#{opt_prefix}/palmdev",
        "--prefix=#{prefix}",
        "--libexecdir=#{libexec}",
        "--mandir=#{man}",
        "--infodir=#{info}"
      system "make"
      system "make", "install"
    end
  end

  def caveats; <<-EOS.undent
    prc-tools is now installed. Please install Palm OS SDK in

        #{opt_prefix}/palmdev

    You can install the Palm OS SDK from this tap:

        brew install palm-os-sdk

    EOS
  end

  test do
    system "m68k-palmos-gcc", "--version"
  end
end
