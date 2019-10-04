Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <cover.1569572448.git.baolin.wang@linaro.org> <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
In-Reply-To: <e991666ead56cac30a7ef9cec85e802b57d47458.1569572448.git.baolin.wang@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Oct 2019 23:35:43 +0200
Message-ID: <CACRpkdbVP9MsNZGJNEw3gYvg4bhf75gh6WKDPFcbKK2eQuc_5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwspinlock: u8500_hsem: Change to use devm_platform_ioremap_resource()
Content-Type: text/plain; charset="UTF-8"
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Sep 27, 2019 at 10:28 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together, which can simpify the code.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
