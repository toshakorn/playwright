class LoginPage:
    def __init__(self, page):
        self.page = page

    def login(self, username, password):
        self.page.get_by_label("Username").fill(username)
        self.page.get_by_label("Password").fill(password)
        self.page.get_by_role("button", name="Submit").click()