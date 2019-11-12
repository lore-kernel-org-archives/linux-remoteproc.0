Date: Mon, 11 Nov 2019 23:08:47 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v20 3/4] rpmsg: add rpmsg support for mt8183 SCP.
Message-ID: <20191112070845.GR3108315@builder>
References: <20191014075812.181942-1-pihsun@chromium.org>
 <20191014075812.181942-4-pihsun@chromium.org>
 <20191111231023.GD3108315@builder>
 <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANdKZ0frU9+dRYeMaJjjKm6emxj41c_jBk_RX3G7bXn_oXKp4g@mail.gmail.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matthias Brugger <matthias.bgg@gmail.com>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 11 Nov 22:42 PST 2019, Pi-Hsun Shih wrote:
> On Tue, Nov 12, 2019 at 7:10 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 14 Oct 00:58 PDT 2019, Pi-Hsun Shih wrote:
> > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
[..]
> > > +static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
> > > +     .send_ipi = scp_ipi_send,
> > > +     .register_ipi = scp_ipi_register,
> > > +     .unregister_ipi = scp_ipi_unregister,
> >
> > These are exported symbols, so unless you see a need to support
> > alternative implementations in the near future just skip the function
> > pointers and call them directly.
> >
> 
> Yes there is request from MTK that they do want to reuse the mtk_rpmsg
> driver for things other than mtk_scp, so there's a need to support
> alternative implementations for this.
> 

Fair enough, let's leave it like this for now!

Looking forward to the next revision of the patches.

Regards,
Bjorn
