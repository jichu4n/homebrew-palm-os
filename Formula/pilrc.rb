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
#    Brew formula for PilRC (http://pilrc.sourceforge.net).                   #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

class Pilrc < Formula
  desc "Palm OS resource compiler"
  homepage "http://pilrc.sourceforge.net"
  url "https://downloads.sourceforge.net/project/pilrc/pilrc/3.2/pilrc-3.2.tar.gz"
  sha256 "f3d6ea3c77f5d2a00707f4372a212377ab7bd77b3d68c3db7e28a553b235903f"

  def install
    system "./unix/configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "--libexecdir=#{libexec}",
      "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "pilrc", "--version"
  end
end

