cask "sieve" do
  version "1.0.1"
  sha256 "8b65a8bc519980ecfae23d80879cb774154f339cdc8e08da9518fe7a0718f6a6"

  url "https://github.com/pilinux/sieve/releases/download/v#{version}/Sieve.zip"
  name "Sieve"
  desc "Per-app firewall with Ask and Quiet modes and tracker blocking"
  homepage "https://github.com/pilinux/sieve"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Sieve.app"

  uninstall quit: "me.pilinux.Sieve"

  zap trash: [
    "~/Library/Containers/me.pilinux.Sieve",
    "~/Library/Group Containers/J35MV4847T.me.pilinux.Sieve",
  ]

  caveats <<~EOS
    Sieve's filter is a system extension. To remove it, quit Sieve and
    drag it from /Applications to the Trash in Finder. macOS then
    removes the extension.
  EOS
end
