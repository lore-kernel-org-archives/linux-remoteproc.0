Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <cover.1569572448.git.baolin.wang@linaro.org> <c3070351e137bffd2b4b639fb14b1baa19df5641.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <c3070351e137bffd2b4b639fb14b1baa19df5641.1569572448.git.baolin.wang@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2019 23:36:48 +0200
Message-ID: <CACRpkdYNXcL3StU4sX2Yyvz5zH1RFr5E6mvAm+1dJFOC5ophxg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwspinlock: u8500_hsem: Use devm_kzalloc() to
 allocate memory
Content-Type: text/plain; charset="UTF-8"
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Sep 27, 2019 at 10:28 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Use devm_kzalloc() to allocate memory.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
