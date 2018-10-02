Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <159d6244-8077-e21f-36d9-ccb1eeb3ed78@lechnology.com>
References: <20180621073706.22812-1-brgl@bgdev.pl> <20180621073706.22812-3-brgl@bgdev.pl>
 <160f4225-236c-af54-9693-120e834af578@lechnology.com>
 <CAMRc=McmwWt5OdCxGntDJ-5cxte+Ad2FJcnmWT8NxnBtzP40DA@mail.gmail.com>
 <159d6244-8077-e21f-36d9-ccb1eeb3ed78@lechnology.com>
Message-ID: <153849568750.119890.126631906736660249@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v7 2/4] clk: davinci: kill davinci_clk_reset_assert/deassert()
Date: Tue, 02 Oct 2018 08:54:47 -0700
To: Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting David Lechner (2018-10-02 08:28:44)
> On 10/02/2018 10:08 AM, Bartosz Golaszewski wrote:
> > pt., 6 lip 2018 o 19:54 David Lechner <david@lechnology.com> napisa=C5=
=82(a):
> >>
> >> On 06/21/2018 02:37 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>
> >>> This code is no longer used. Remove it.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>> Reviewed-by: David Lechner <david@lechnology.com>
> >>> Acked-by: Stephen Boyd <sboyd@kernel.org>
> >>> ---
> >>
> >> I've picked this up in clk-davinci-4.20, so it will just hang out
> >> there for a while until the rest of this series gets merged.
> >>
> > =

> > Hi David,
> > =

> > I don't see this patch in next yet. Is it queued for 4.20?
> > =

> > Thanks in advance,
> > Bartosz
> > =

> =

> This is currently the only clk-davinici patch I have queued, so it
> might be easier to just resend it and let Stephen/Mike pick it up
> directly instead of me sending a pull request for one patch.
> =


Ok I applied it directly to clk-next.
