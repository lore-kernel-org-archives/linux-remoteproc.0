Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20161205141021.2d9ada51@endymion>
References: <20161205141021.2d9ada51@endymion>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Dec 2016 11:49:37 +0100
Message-ID: <CACRpkdac2iFXt+Ffd315SzWrzpz5z4bX9c6_pufs52-5i7wj4Q@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/ste: Delete unused driver
Content-Type: text/plain; charset=UTF-8
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>, Dmitry Tarnyagin <dt@jetro.no>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Dec 5, 2016 at 2:10 PM, Jean Delvare <jdelvare@suse.de> wrote:

> Back in July 2014 I asked around what was the intended target
> platform for the STE Modem remoteproc driver, so that I could add the
> proper hardware dependency to its config option. The answer I got was
> that there was no known publicly available hardware needing it and it
> was unlikely that there ever would.
>
> So I think it's time to delete this driver to lower the maintenance
> burden.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Suman Anna <s-anna@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I put Dmitry in CC, last chance to protest :)

Yours,
Linus Walleij
