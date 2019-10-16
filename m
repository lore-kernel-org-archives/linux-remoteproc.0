Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
References: <cover.1571036463.git.baolin.wang@linaro.org> <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
In-Reply-To: <45600b3601cbfe3685f4c9e088be9a30ae3eb8f2.1571036463.git.baolin.wang@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2019 14:55:38 +0200
Message-ID: <CACRpkda6hT5Nma-vrtd3oxQ64QppwkmP75DJch2kMUUGpzDzZQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] hwspinlock: u8500_hsem: Remove redundant PM runtime implementation
Content-Type: text/plain; charset="UTF-8"
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Lyra Zhang <zhang.lyra@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Oct 14, 2019 at 9:08 AM Baolin Wang <baolin.wang@linaro.org> wrote:

> Since the hwspinlock core has changed the PM runtime to be optional, thus
> remove the redundant PM runtime implementation in the u8500 HWSEM driver.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
