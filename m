Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <cover.1569572448.git.baolin.wang@linaro.org> <a6b18f17b995bceaf2fc0129866301dd8f46bee4.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <a6b18f17b995bceaf2fc0129866301dd8f46bee4.1569572448.git.baolin.wang@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2019 23:38:12 +0200
Message-ID: <CACRpkdYF3hPit5EgWCXuM1exoWMFn_7k=OyM99ojS9WeJeMRFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwspinlock: u8500_hsem: Use devm_hwspin_lock_register()
 to register hwlock controller
Content-Type: text/plain; charset="UTF-8"
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Sep 27, 2019 at 10:28 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Use devm_hwspin_lock_register() to register the hwlock controller instead of
> unregistering the hwlock controller explicitly when removing the device.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
