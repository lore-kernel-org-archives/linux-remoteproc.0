Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com> <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-2-nikita.shubin@maquefel.me> <20200414164519.GA24061@xps15>
 <45761587100993@mail.yandex.ru> <CANLsYkxvuwFdG3YnE7tTxQaD7uF0d_XnPjt1KS++FFe0W3fbdw@mail.gmail.com>
 <20200417202653.00002500@maquefel.me>
In-Reply-To: <20200417202653.00002500@maquefel.me>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 17 Apr 2020 16:24:21 -0600
Message-ID: <CANLsYkyUoG9fW7NoXMS1D7WjPGew7FT0jyOP1E0ipmwW-qEG7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
Content-Type: text/plain; charset="UTF-8"
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Nikita Shubin <nshubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 17 Apr 2020 at 11:27, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Fri, 17 Apr 2020 11:01:22 -0600
> Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> > On Thu, 16 Apr 2020 at 23:40, <nikita.shubin@maquefel.me> wrote:
> > >
> > > Hi Mathieue,
> > >
> > > Hi Nikita,
> > >
> > > On Mon, Apr 06, 2020 at 02:33:08PM +0300, nikita.shubin@maquefel.me
> > > wrote:
> > >
> > >  In case elf file interrupt vector is not supposed to be at OCRAM_S,
> > >  it is needed to write elf entry point to OCRAM_S + 0x4, to boot M4
> > >  firmware.
> > >
> > >  Otherwise firmware located anywhere besides OCRAM_S won't boot.
> > >
> > >  The firmware must set stack poiner as first instruction:
> > >
> > >  Reset_Handler:
> > >      ldr sp, = __stack /* set stack pointer */
> > >
> > >  Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > >
> > >
> > > The address in the SoB has to match what is found in the "From:"
> > > field of the email header. Checkpatch is complaining about that,
> > > something I would have expected to be fixed before sending this set
> > > out.
> > >
> > > Noted and will be fixed.
> > >
> > >  ---
> > >   drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
> > >   1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 3e72b6f38d4b..bebc58d0f711
> > > 100644 --- a/drivers/remoteproc/imx_rproc.c
> > >  +++ b/drivers/remoteproc/imx_rproc.c
> > >  @@ -45,6 +45,8 @@
> > >
> > >   #define IMX7D_RPROC_MEM_MAX 8
> > >
> > >  +#define IMX_BOOT_PC 0x4
> > >  +
> > >   /**
> > >    * struct imx_rproc_mem - slim internal memory structure
> > >    * @cpu_addr: MPU virtual address of the memory region
> > >  @@ -85,6 +87,7 @@ struct imx_rproc {
> > >           const struct imx_rproc_dcfg *dcfg;
> > >           struct imx_rproc_mem mem[IMX7D_RPROC_MEM_MAX];
> > >           struct clk *clk;
> > >  + void __iomem *bootreg;
> > >   };
> > >
> > >   static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> > >  @@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc
> > > *rproc) struct device *dev = priv->dev;
> > >           int ret;
> > >
> > >  + /* write entry point to program counter */
> > >  + writel(rproc->bootaddr, priv->bootreg);
> > >
> > >
> > > What happens on all the other IMX systems where this fix is not
> > > needed? Will they continue to work properly?
> > >
> > > Yes, my bad, it is also needed for IMX6 (but even so i need to
> > > study this topic more carefully), this should be applied
> > > exclusively for imx7d for now, and if will be needed someone with
> > > imx6 hardware to test on can extend this on imx6 also.
> > >
> > >
> > >
> > >
> > >  +
> > >           ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > >                                    dcfg->src_mask, dcfg->src_start);
> > >           if (ret)
> > >                   dev_err(dev, "Failed to enable M4!\n");
> > >
> > >  + dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> > >  +
> > >           return ret;
> > >   }
> > >
> > >  @@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> > >           if (ret)
> > >                   dev_err(dev, "Failed to stop M4!\n");
> > >
> > >  + /* clear entry points */
> > >  + writel(0, priv->bootreg);
> > >  +
> > >           return ret;
> > >   }
> > >
> > >  @@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc
> > > *rproc, u64 da, int len) static const struct rproc_ops
> > > imx_rproc_ops = { .start = imx_rproc_start,
> > >           .stop = imx_rproc_stop,
> > >  - .da_to_va = imx_rproc_da_to_va,
> > >  + .da_to_va = imx_rproc_da_to_va,
> > >  + .get_boot_addr = rproc_elf_get_boot_addr,
> > >
> > >
> > > How is this useful? Sure it will set rproc->bootaddr in
> > > rproc_fw_boot() but what good does that do when it is invariably
> > > set again in imx_rproc_start() ?
> > >
> > > The priv->bootreg is the address where we are writing Entry Point
> > > and it is fixed, 0x04 address is translated to 0x00180004, so don't
> > > quite understand you we are writing rproc->bootaddr into
> > > priv->bootreg, not wiseversa.
> > >
> >
> > What is your reason to set ops->get_boot_addr ?  How does that help
> > the work done in this patch?
>
> The reason is the following :
>
> remoteproc_core.c:
> | rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> | rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
>
> remoteproc_internal.h
> | static inline
> | u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware
> *fw) | {
> |       if (rproc->ops->get_boot_addr)
> |               return rproc->ops->get_boot_addr(rproc, fw);
> |
> |       return 0;
> | }

And as I said above the value of rproc->bootaddr is set to
priv->bootreg in imx_rproc_stop().  What am I missing?  More over
imx_rproc_ops doesn't have a ->load() function and as such rproc_alloc
will set it to rproc_elf_get_boot_addr()

>
> >
> > >
> > >   };
> > >
> > >   static int imx_rproc_addr_init(struct imx_rproc *priv,
> > >  @@ -360,6 +372,8 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev) goto err_put_rproc;
> > >           }
> > >
> > >  + priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC,
> > > sizeof(u32)); +
> > >           /*
> > >            * clk for M4 block including memory. Should be
> > >            * enabled before .start for FW transfer.
> > >  --
> > >  2.25.1
> > >
>
