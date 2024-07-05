'@SGNode Test__BaseScreen
'@TestSuite BaseScreen

'@It createExitDialog

'@Test returns a Dialog node
function BaseScreen__createExitDialog_returns_Dialog_node() as Void
	result = createExitDialog()

	m.AssertNodeContainsFields(result, {
		title: "Exit @{appName}"
		message: "Do you want to exit the @{appName} app?"
		buttons: ["No", "Yes"]
	})
end function
