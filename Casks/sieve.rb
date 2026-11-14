cask "sieve" do
  version "1.0.0"
  sha256 "b346dd9071f40597b9093a0f2fa2ce11c779b7a54ca5ebe12d1e59d814413c1c"

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
