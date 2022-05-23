-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
function exitHyperMode()
  hyper:exit()
  if not hyper.triggered then
		--hs.eventtap.keyStroke({}, 'ESCAPE')
		hs.hid.capslock.toggle()
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

launch = function(appname)
  hs.application.launchOrFocus(appname)
  hyper.triggered = true
end

-- Single keybinding for app launch
singleapps = {
  {'t', 'kitty'}, -- t is for terminal
  {'f', 'Firefox'},
  {'d', 'Discord Canary'}
}

for i, app in ipairs(singleapps) do
  hyper:bind({}, app[1], function() launch(app[2]); end)
end

-- up down left right misson control controls
hyper:bind({}, 'h', function() hs.eventtap.keyStroke({'fn','ctrl','alt','shift','cmd'}, 'left'); hyper.triggered = true; end)
hyper:bind({}, 'l', function() hs.eventtap.keyStroke({'fn','ctrl','alt','shift','cmd'}, 'right'); hyper.triggered = true; end)
hyper:bind({}, 'k', function() hs.eventtap.keyStroke({'fn','ctrl','alt','shift','cmd'}, 'up'); hyper.triggered = true; end)
hyper:bind({}, 'j', function() hs.eventtap.keyStroke({'fn','ctrl','alt','shift','cmd'}, 'down'); hyper.triggered = true; end)
