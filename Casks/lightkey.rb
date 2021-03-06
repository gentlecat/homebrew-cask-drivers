cask 'lightkey' do
  version '2.6.1'
  sha256 'de5f3aa25909c285545eff325541d40001e7774799151a07ce2754b29ee6042a'

  url "https://lightkeyapp.com/content/06-download/Lightkey-#{version.dots_to_hyphens}/LightkeyInstaller.zip"
  appcast 'https://lightkeyapp.com/en/update'
  name 'Lightkey'
  homepage 'https://lightkeyapp.com/'

  depends_on macos: '>= :high_sierra'

  pkg 'LightkeyInstaller.pkg'

  uninstall pkgutil: [
                       'de.monospc.lightkey.pkg.App',
                       'de.monospc.lightkey.pkg.Eurolite',
                       'de.monospc.lightkey.pkg.OLA',
                       'de.monospc.lightkey.pkg.Velleman',
                       'de.monospc.lightkey.pkg.documentation',
                       'com.FTDI.ftdiusbserialdriverinstaller.FTDIUSBSerialDriver.pkg',
                     ]

  zap pkgutil: 'com.FTDI.ftdiusbserialdriverinstaller.FTDIUSBSerialDriver.pkg',
      kext:    'com.FTDI.driver.FTDIUSBSerialDriver'
end
