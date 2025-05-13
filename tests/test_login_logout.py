import pytest
import json
import os
from pages.login_page import LoginPage

def load_login_data():
    with open("data/login_data.json", encoding="utf-8") as f:
        data = json.load(f)
        return [(d["username"], d["password"]) for d in data]

@pytest.fixture(scope="session", autouse=True)
def clear_result_file():
    if os.path.exists("login_result.txt"):
        os.remove("login_result.txt")

@pytest.mark.parametrize("username,password", load_login_data())
def test_login_logout(page, username, password):
    page.goto("https://practicetestautomation.com/practice-test-login/")
    login_page = LoginPage(page)
    login_page.login(username, password)

    try:
        # 🔍 รอและตรวจสอบการแสดงผลของปุ่ม Log out
        page.get_by_role("link", name="Log out").wait_for(timeout=3000)
        assert page.get_by_role("link", name="Log out").is_visible()
        result = "✅ SUCCESS"

        # page.locator("a[href*='practice-test-login']:has-text('Log out')").wait_for(timeout=3000)
        # assert page.locator("a[href*='practice-test-login']:has-text('Log out')").is_visible()
        # result = "✅ SUCCESS"

    except:
        result = "❌ FAILED"

    with open("login_result.txt", "a", encoding="utf-8") as f:
        f.write(f"{username} / {password} : {result}\n")

    print(f"{result}: {username} / {password}")