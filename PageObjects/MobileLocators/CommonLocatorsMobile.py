BASE_ID = 'id=in.bizom.android:id/'
BASE_Xpath = 'xpath=//android.widget.'
elements = {
    ########################################LoginScreen###############################################################
    'usernameTxtField': BASE_Xpath + 'EditText[@resource-id="in.bizom.android:id/username"]',
    'passwordTxtField': BASE_Xpath + 'EditText[@resource-id="in.bizom.android:id/password"]',
    'loginBtn1': BASE_Xpath + 'Button[@resource-id="in.bizom.android:id/sign_in_button"]',
    'clickForEnv': (BASE_Xpath + 'LinearLayout[@resource-id="in.bizom.android:id/email_login_form"]/android'
                                 '.widget.LinearLayout[3]/android.widget.LinearLayout'),
    'envDropdown': BASE_ID + 'urlSelect',
    'stagingEnvOption': BASE_Xpath + 'CheckedTextView[@resource-id="android:id/text1" and @text="Development"]',
    'plusBtn': BASE_ID + 'fab',
    ##################################################################################################################
    ########################################Attendance_Screen#########################################################
    'AttendanceHeader': 'xpath=//android.widget.TextView[@text="Attendance"]',
    'syncDoneBtn': BASE_Xpath + 'Button[@resource-id="in.bizom.android:id/syncDoneBtn"]',
    'plusIconAddOutlet': BASE_Xpath + 'ImageButton[@resource-id="in.bizom.android:id/fab"]',
    'notWorkingBtn': BASE_ID + 'action_skip',
    'cameraIcon': BASE_ID + 'mCameraButton',
    'cameraRotateIcon': BASE_ID + 'switch_camera',
    'cameraScreen': BASE_Xpath + 'FrameLayout[@resource-id="in.bizom.android:id/preview"]/android.view.View',
    'addressField': BASE_ID + 'txtAddress',
    'phoneField': BASE_ID + 'txtphone',
    'emailField': BASE_ID + 'txtEmail',
    'designationField': BASE_ID + 'txtDesignation',
    'presentButton': BASE_ID + 'mPresentButton',
    'absentButton': BASE_ID + 'mAbsentButton',
    'alert': 'xpath=//*[@text="Please take your picture to mark attendance"]',
    'takePhotoIcon': BASE_ID + 'take_photo',
    'confirmationPopUp': BASE_Xpath + 'ScrollView/android.widget.LinearLayout',
    'absentTitle': BASE_ID + 'textview_discription',
    'remarkTitle': BASE_Xpath + 'TextView[@text="Remarks"]',
    'outletHeader': BASE_Xpath + 'TextView[@text="Outlet"]',
    'remarkTxtField': BASE_Xpath + 'EditText',
    'cancelButton': BASE_ID + 'button_cancel',
    'submitButton': BASE_ID + 'button_submit',
    'markAttendanceOption': BASE_ID + 'markAttendance',
    'eodOption': BASE_ID + 'markEos',
    'myInfoOption': BASE_ID + 'myInfo',
    'attendanceStatusMyInfo': BASE_ID + 'text_AttendanceStatus',
    ##################################################################################################################

}
