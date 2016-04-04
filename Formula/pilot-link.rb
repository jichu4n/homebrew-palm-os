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
#    Brew formula for pilot-link (http://www.pilot-link.org).                 #
#                                                                             #
#    Since the original website is now defunct, this formula uses the         #
#    archived source code at https://github.com/jichu4n/pilot-link instead.   #
#                                                                             #
#    This formula is based on the MacPorts Portfile at:                       #
#                                                                             #
#    https://trac.macports.org/browser/trunk/dports/palm/pilot-link/Portfile  #
#                                                                             #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

class PilotLink < Formula
  desc "Suite of tools for connecting to Palm OS devices"
  homepage "http://www.pilot-link.org"
  url "https://github.com/jichu4n/pilot-link/archive/0.12.5.tar.gz"
  sha256 "daf1facbd2da5fbf2f77dd85b0108710dfd87545eeae1271650f5d62070a1a16"

  depends_on "libpng"
  depends_on "readline"

  patch :p0 do
    url "https://raw.githubusercontent.com/jichu4n/pilot-link/master/libpng14.patch"
    sha256 "fa6ec4b3d0552c0db5c0b72fba68414ea2884572cd738b84b040c2db2a953f23"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--libexecdir=#{libexec}",
                          "--mandir=#{man}",
                          "--enable-conduits",
                          "--with-libpng=#{prefix}",
                          "--with-pic",
                          "--enable-shared",
                          "--enable-static"
    system "make", "install"
    system "make", "-C", "doc/man", "install"
    system "make", "-C", "bindings", "install"
  end

  def caveats; <<-EOS.undent
    All pilot-link commands (such as pilot-xfer) require a port argument (-p).
    On OS X, the correct port is "usb:" (note the trailing colon). As an
    example, you would use the following command to list the databases on the
    Palm OS device:

        pilot-xfer -p usb: -l

    To avoid having to type "-p usb:" each time, put the following in your
    ~/.bashrc to set the PILOTPORT environment variable:

        PILOTPORT="usb:"

    EOS
  end

  test do
    system "pilot-xfer", "--version"
  end
end
