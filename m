Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20190131093131.245531-1-pihsun@chromium.org> <20190131093131.245531-3-pihsun@chromium.org>
 <20190202001749.GT81583@google.com>
In-Reply-To: <20190202001749.GT81583@google.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Wed, 13 Feb 2019 11:20:18 +0800
Message-ID: <CANdKZ0ds2s46h-Rs-4aJSuVFkoaeEzXi96m2zbx5XjBhhsc3Xw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] remoteproc/mediatek: add SCP support for mt8183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

Thanks for the review, would address most comments in next version of patch=
.

On Sat, Feb 2, 2019 at 8:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Pi-Hsun,
>
> a few comments inline.
>
> It's the first time I dabble into remoteproc, I don't claim to have a
> complete understanding of the driver at this point ;-)
>
> On Thu, Jan 31, 2019 at 05:31:27PM +0800, Pi-Hsun Shih wrote:
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.=
c
> > new file mode 100644
> > index 00000000000000..920c81c3525c2a
> > --- /dev/null
> > +++ b/drivers/remoteproc/mtk_scp.c
> > +             return ret;
> > +     }
> > +
> > +     writel(0x0, scp->reg_base + MT8183_SCP_SRAM_PDN);
>
> what is the purpose of this write?
>

Answer from Erin:
The code needs to execute on scp=E2=80=99s SRAM.
We need to turn on the power of SRAM before using it.
