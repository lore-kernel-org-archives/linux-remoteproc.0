Return-Path: <pihsun@chromium.org>
MIME-Version: 1.0
References: <20191014075812.181942-1-pihsun@chromium.org> <20191014075812.181942-4-pihsun@chromium.org>
 <20191111231023.GD3108315@builder>
In-Reply-To: <20191111231023.GD3108315@builder>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Tue, 12 Nov 2019 14:42:47 +0800
Message-ID: <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matthias Brugger <matthias.bgg@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,
Thanks for the review, I'll address them in the next version. Some
inline comment below.

On Tue, Nov 12, 2019 at 7:10 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:
>
> > Add a simple rpmsg support for mt8183 SCP, that use IPI / IPC directly.
> >
>
> Hi Pi-Hsun,
>
> Sorry for not reviewing this in a timely manner! This looks good, just
> some very minor comments below.
>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> [..]
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index f2e5e70a58f2..7896cefb2dc0 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/remoteproc/mtk_scp.h>
> > +#include <linux/rpmsg/mtk_rpmsg.h>
> >
> >  #include "mtk_common.h"
> >  #include "remoteproc_internal.h"
> > @@ -407,6 +408,31 @@ static void scp_unmap_memory_region(struct mtk_scp *scp)
> >       of_reserved_mem_device_release(scp->dev);
> >  }
> >
> > +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> > +     .send_ipi = scp_ipi_send,
> > +     .register_ipi = scp_ipi_register,
> > +     .unregister_ipi = scp_ipi_unregister,
>
> These are exported symbols, so unless you see a need to support
> alternative implementations in the near future just skip the function
> pointers and call them directly.
>

Yes there is request from MTK that they do want to reuse the mtk_rpmsg
driver for things other than mtk_scp, so there's a need to support
alternative implementations for this.

> > +                struct rpmsg_device *rpdev, rpmsg_rx_cb_t cb, void *priv,
> > +                u32 id)
> > +{
>
> Regards,
> Bjorn

Regards,
Pi-Hsun
