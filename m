Return-Path: <mka@chromium.org>
Return-Path: <mka@chromium.org>
Date: Wed, 13 Feb 2019 09:01:05 -0800
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 2/6] remoteproc/mediatek: add SCP support for mt8183
Message-ID: <20190213170105.GX117604@google.com>
References: <20190131093131.245531-1-pihsun@chromium.org>
 <20190131093131.245531-3-pihsun@chromium.org>
 <20190202001749.GT81583@google.com>
 <CANdKZ0ds2s46h-Rs-4aJSuVFkoaeEzXi96m2zbx5XjBhhsc3Xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANdKZ0ds2s46h-Rs-4aJSuVFkoaeEzXi96m2zbx5XjBhhsc3Xw@mail.gmail.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Feb 13, 2019 at 11:20:18AM +0800, Pi-Hsun Shih wrote:
> Hi,
> 
> Thanks for the review, would address most comments in next version of patch.
> 
> On Sat, Feb 2, 2019 at 8:17 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Pi-Hsun,
> >
> > a few comments inline.
> >
> > It's the first time I dabble into remoteproc, I don't claim to have a
> > complete understanding of the driver at this point ;-)
> >
> > On Thu, Jan 31, 2019 at 05:31:27PM +0800, Pi-Hsun Shih wrote:
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > new file mode 100644
> > > index 00000000000000..920c81c3525c2a
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/mtk_scp.c
> > > +             return ret;
> > > +     }
> > > +
> > > +     writel(0x0, scp->reg_base + MT8183_SCP_SRAM_PDN);
> >
> > what is the purpose of this write?
> >
> 
> Answer from Erin:
> The code needs to execute on scp’s SRAM.
> We need to turn on the power of SRAM before using it.

Please add a brief comment since this is not evident from the code.

Thanks

Matthias
