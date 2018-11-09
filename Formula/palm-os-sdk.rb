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
#    Brew formula for Palm OS SDK.                                            #
#                                                                             #
#    This formula uses the Palm OS SDK archive at                             #
#                                                                             #
#    https://github.com/jichu4n/palm-os-sdk                                   #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

class PalmOsSdk < Formula
  desc "Palm OS SDK"
  homepage "https://github.com/jichu4n/palm-os-sdk"
  url "https://github.com/jichu4n/palm-os-sdk/archive/5.0.3.tar.gz"
  sha256 "ed4dc80bbaf3615b73a41237c310ec64a2cf3b28f3278a0155b1815e567e30ee"

  depends_on "prc-tools"

  def install
    cp_r "sdk-5r3", "#{prefix}"
    mkdir_p "#{HOMEBREW_PREFIX}/opt/prc-tools/palmdev"
    ln_s "#{prefix}/sdk-5r3", "#{HOMEBREW_PREFIX}/opt/prc-tools/palmdev/sdk-5r3"
  end

  def caveats; <<~EOS
    The Palm OS SDK files have been installed. Please run

        palmdev-prep

    to configure prc-tools.
    EOS
  end

  test do
    system "ls", "#{prefix}/sdk-5r3"
  end
end
