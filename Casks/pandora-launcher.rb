cask "pandora-launcher" do
  version "0.1.1"
  sha256 "feff84573d389d99ccc7df028604cbacef3ee4c3d5b7a9b08cb47ab32da44243"

  url "https://github.com/StarbirdTech/PandoraLauncher/releases/download/v#{version}/PandoraLauncher-macos.zip"
  name "Pandora Launcher"
  desc "Minecraft launcher with mod deduplication and secure credential management"
  homepage "https://github.com/Moulberry/PandoraLauncher"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Pandora Launcher.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Pandora Launcher.app"]
    system_command "/System/Library/Frameworks/CoreServices.framework/" \
                   "Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/Pandora Launcher.app"]
  end

  zap trash: [
    "~/Library/Application Support/PandoraLauncher",
    "~/Library/Caches/PandoraLauncher",
  ]
end
