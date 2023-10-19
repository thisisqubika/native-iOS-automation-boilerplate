run-tests:
	rm -rf TestResults*
	xcodebuild -workspace TAU.xcworkspace \
	 -scheme TAUUITests \
	 -destination 'platform=iOS Simulator,name=iPhone 14' test \
	 -resultBundlePath TestResults
	xchtmlreport TestResults.xcresult
	open index.html