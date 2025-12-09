cask "pandora-launcher" do
  version "0.1.0-20241208.1"
  sha256 "PLACEHOLDER"

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
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
                   args: ["-f", "#{appdir}/Pandora Launcher.app"]
  end

  zap trash: [
    "~/Library/Application Support/PandoraLauncher",
    "~/Library/Caches/PandoraLauncher",
  ]
end
