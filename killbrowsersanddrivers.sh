# just kills stray local chromedriver.exe,geckodriver.exe instances.
# useful if you are trying to clean your project, and your ide is complaining.

pkill chromedriver

pkill msedgedriver

pkill IEDriverServer

pkill safaridriver

osascript -e 'tell app "Google Chrome" to if number of windows >= 2 then close (windows 2 thru -1)'
