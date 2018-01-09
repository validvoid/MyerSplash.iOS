import Foundation
import UIKit
import SnapKit

class SettingsSwitchItem: SettingsItem {
    private var switchButton: UISwitch!

    private (set) var key: String?

    var checked: Bool = true {
        didSet {
            switchButton.isOn = checked
        }
    }

    var onCheckedChanged: ((Bool) -> Void)?

    convenience init(_ key: String) {
        self.init(frame: CGRect.zero)
        self.key = key
        updateSwitchByKey()
    }

    override func initUi() {
        super.initUi()

        switchButton = UISwitch()
        switchButton.onTintColor = Colors.THEME.asUIColor()
        switchButton.addTarget(self, action: #selector(onSwitchStatusChanged), for: .valueChanged)

        addSubview(switchButton)

        switchButton.snp.makeConstraints { (maker) in
            maker.right.equalTo(self.snp.right).offset(-12)
            maker.centerY.equalTo(self)
        }
    }

    private func updateSwitchByKey() {
        if (key != nil) {
            switchButton.isOn = UserDefaults.standard.bool(key: key!, defaultValue: true)
        }
    }

    override func onClick() {
        super.onClick()
        onSwitchStatusChanged()
    }

    @objc
    private func onSwitchStatusChanged() {
        switchButton.setOn(!switchButton.isOn, animated: true)
        if (key != nil) {
            UserDefaults.standard.set(switchButton.isOn, forKey: key!)
            onCheckedChanged?(switchButton.isOn)
        }
    }
}
