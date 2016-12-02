Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20161201094955.4c4eefe3@endymion>
References: <20161201094955.4c4eefe3@endymion>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Dec 2016 11:08:14 +0100
Message-ID: <CACRpkdbVYE3ya+GfQ0+4V4XfdQF548ZOfsEcggDCrAdX-VB4RQ@mail.gmail.com>
Subject: Re: remoteproc/ste: Hide config option by default
Content-Type: text/plain; charset=UTF-8
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Dec 1, 2016 at 9:49 AM, Jean Delvare <jdelvare@suse.de> wrote:

> Back in July 2014 I asked around what was the intended target
> platform for the STE Modem remoteproc driver, so that I could add the
> proper hardware dependency to its config option. The answer I got was
> that there was no known publicly available hardware needing it and it
> was unlikely that there ever would.
>
> Still there were objections to deleting the driver, which I do not
> really understand, but I do respect. But as there is no point in
> presenting the config option by default, let's hide it unless
> build-testing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
> Cc: Suman Anna <s-anna@ti.com>
> ---
> As suggested by Linus Walleij over 2 years ago, sorry for not
> following up back then:
>   https://lkml.org/lkml/2014/7/25/218
>
> The driver could also be moved to staging/.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Also for moving it to staging, if you want. Or deleting it.

Yours,
Linus Walleij
