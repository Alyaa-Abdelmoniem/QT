#include "translator.h"

Translator::Translator(QObject *parent)
    : QObject(parent), m_language("en")
{
    initStrings();
}

void Translator::initStrings()
{
    QMap<QString, QString> en;
    en["dashboard_title"] = "Smart Home Dashboard";
    en["dashboard"] = "Dashboard";
    en["settings"] = "Settings";
    en["login_title"] = "Smart Home Login";
    en["username"] = "Username";
    en["password"] = "Password";
    en["login"] = "Login";
    en["login_error"] = "Please enter both username and password";
    en["usage"] = "Usage";
    en["devices"] = "devices";
    en["living_room_light"] = "Living Room Light";
    en["bedroom_light"] = "Bedroom Light";
    en["air_conditioner"] = "Air Conditioner";
    en["fan"] = "Fan";
    en["garage_door"] = "Garage Door";
    en["language_toggle"] = QString::fromUtf8("العربية");
    en["settings_title"] = "Settings";
    en["back"] = "Back";
    en["app_language"] = "Application Language";
    en["screen_brightness"] = "Screen Brightness";
    en["room_temperature"] = "Room Temperature";
    en["enable_notifications"] = "Enable Notifications";
    en["save_settings"] = "Save Settings";
    en["english"] = "English";
    en["arabic"] = "Arabic";
    en["french"] = "French";
    en["german"] = "German";

    QMap<QString, QString> ar;
    ar["dashboard_title"] = QString::fromUtf8("لوحة تحكم المنزل الذكي");
    ar["dashboard"] = QString::fromUtf8("لوحة التحكم");
    ar["settings"] = QString::fromUtf8("الإعدادات");
    ar["login_title"] = QString::fromUtf8("تسجيل الدخول");
    ar["username"] = QString::fromUtf8("اسم المستخدم");
    ar["password"] = QString::fromUtf8("كلمة المرور");
    ar["login"] = QString::fromUtf8("تسجيل الدخول");
    ar["login_error"] = QString::fromUtf8("من فضلك أدخل اسم المستخدم وكلمة المرور");
    ar["usage"] = QString::fromUtf8("الاستخدام");
    ar["devices"] = QString::fromUtf8("أجهزة");
    ar["living_room_light"] = QString::fromUtf8("إضاءة غرفة المعيشة");
    ar["bedroom_light"] = QString::fromUtf8("إضاءة غرفة النوم");
    ar["air_conditioner"] = QString::fromUtf8("مكيف الهواء");
    ar["fan"] = QString::fromUtf8("مروحة");
    ar["garage_door"] = QString::fromUtf8("باب الجراج");
    ar["language_toggle"] = "English";
    ar["settings_title"] = QString::fromUtf8("الإعدادات");
    ar["back"] = QString::fromUtf8("رجوع");
    ar["app_language"] = QString::fromUtf8("لغة التطبيق");
    ar["screen_brightness"] = QString::fromUtf8("سطوع الشاشة");
    ar["room_temperature"] = QString::fromUtf8("درجة حرارة الغرفة");
    ar["enable_notifications"] = QString::fromUtf8("تفعيل الإشعارات");
    ar["save_settings"] = QString::fromUtf8("حفظ الإعدادات");
    ar["english"] = QString::fromUtf8("الإنجليزية");
    ar["arabic"] = QString::fromUtf8("العربية");
    ar["french"] = QString::fromUtf8("الفرنسية");
    ar["german"] = QString::fromUtf8("الألمانية");

    m_strings["en"] = en;
    m_strings["ar"] = ar;
}

QString Translator::language() const
{
    return m_language;
}

void Translator::setLanguage(const QString &lang)
{
    if (m_language != lang) {
        m_language = lang;
        emit languageChanged();
    }
}

bool Translator::isRtl() const
{
    return m_language == "ar";
}

QString Translator::t(const QString &key) const
{
    if (m_strings.contains(m_language) && m_strings[m_language].contains(key))
        return m_strings[m_language][key];
    return key;
}

void Translator::toggleLanguage()
{
    setLanguage(m_language == "en" ? "ar" : "en");
}
