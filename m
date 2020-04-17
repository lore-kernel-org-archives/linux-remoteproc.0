Return-Path: <nikita.shubin@maquefel.me>
Date: Fri, 17 Apr 2020 18:46:52 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
Message-ID: <20200417184652.00002590@maquefel.me>
In-Reply-To: <CANLsYkxeL+a43eDzwJjXyFBFSwRVXjiYd4TcTbEcuuj+wgEZdw@mail.gmail.com>
References: <20200304142628.8471-1-NShubin@topcon.com>
	<20200406113310.3041-1-nikita.shubin@maquefel.me>
	<20200406113310.3041-2-nikita.shubin@maquefel.me>
	<20200414164519.GA24061@xps15>
	<20200417151132.00005f8c@maquefel.me>
	<CANLsYkxeL+a43eDzwJjXyFBFSwRVXjiYd4TcTbEcuuj+wgEZdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 17 Apr 2020 09:37:42 -0600
Mathieu Poirier <mathieu.poirier@linaro.org> wrote:

> On Fri, 17 Apr 2020 at 06:12, Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >
> > On Tue, 14 Apr 2020 10:45:19 -0600
> > Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
> >
> > > Hi Nikita,
> > >
> > > On Mon, Apr 06, 2020 at 02:33:08PM +0300,
> > > nikita.shubin@maquefel.me wrote:
> > > > In case elf file interrupt vector is not supposed to be at
> > > > OCRAM_S, it is needed to write elf entry point to OCRAM_S +
> > > > 0x4, to boot M4 firmware.
> > > >
> > > > Otherwise firmware located anywhere besides OCRAM_S won't boot.
> > > >
> > > > The firmware must set stack poiner as first instruction:
> > > >
> > > > Reset_Handler:
> > > >     ldr   sp, = __stack      /* set stack pointer */
> > > >
> > > > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > >
> > > The address in the SoB has to match what is found in the "From:"
> > > field of the email header.  Checkpatch is complaining about that,
> > > something I would have expected to be fixed before sending this
> > > set out.
> > >
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
> > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > b/drivers/remoteproc/imx_rproc.c index
> > > > 3e72b6f38d4b..bebc58d0f711 100644 ---
> > > > a/drivers/remoteproc/imx_rproc.c +++
> > > > b/drivers/remoteproc/imx_rproc.c @@ -45,6 +45,8 @@
> > > >
> > > >  #define IMX7D_RPROC_MEM_MAX                8
> > > >
> > > > +#define IMX_BOOT_PC                        0x4
> > > > +
> > > >  /**
> > > >   * struct imx_rproc_mem - slim internal memory structure
> > > >   * @cpu_addr: MPU virtual address of the memory region
> > > > @@ -85,6 +87,7 @@ struct imx_rproc {
> > > >     const struct imx_rproc_dcfg     *dcfg;
> > > >     struct imx_rproc_mem
> > > > mem[IMX7D_RPROC_MEM_MAX]; struct clk
> > > > *clk;
> > > > +   void __iomem                    *bootreg;
> > > >  };
> > > >
> > > >  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> > > > @@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc
> > > > *rproc) struct device *dev = priv->dev;
> > > >     int ret;
> > > >
> > > > +   /* write entry point to program counter */
> > > > +   writel(rproc->bootaddr, priv->bootreg);
> > >
> > > What happens on all the other IMX systems where this fix is not
> > > needed?  Will they continue to work properly?
> >
> > Mathieu you are totally correct imx6/imx7 use different addresses
> > they boot.
> >
> > For imx7:
> > | On i.MX 7Dual/7Solo, the boot vector for the Cortex-M4 core is
> > located | at the start of the OCRAM_S (On Chip RAM - Secure) whose
> > address is | 0x0018_0000 from Cortex-A7.
> >
> > For imx6:
> > | The Boot vector for the Cortex-M4 core is located at the start of
> > the | TCM_L whose address is 0x007F_8000 from the Cortex-A9. This
> > is a | different location than on the i.MX 7Dual/7Solo
> >
> > But on imx7 0x0 is translated to 0x0018_0000 by imx_rproc_da_to_va,
> > and on imx7 0x0 is translated to 0x007F_8000, using
> > imx_rproc_att_imx7d and imx_rproc_att_imx6sx respectively.
> 
> My point here is that before your patch, this driver was running on
> IMX platforms.  How does your work impact existing platforms that are
> booting properly?

Well it wasn't i am pretty sure it wasn't used at all or questions
about boot process should have to be raised earlier.

If we look into the first patch introduced by Oleksij Rempel
https://lore.kernel.org/patchwork/cover/799614/
we can that the program he used is located at 0x0018_0000 so he didn't
have any problems with Entry Point and stack pointer being at
0x0018_0000 and 0x0018_0004 respectively.

But as i am trying to emphasize, IF elf is not supposed to be located
starting at 0x0018_0000 it won't boot at all.

Citing Oleksij:

| no, currently my priority is to provide basic functionality with easy 
| understandable target code and dependencies.

Moreover it seems not tested on IMX6 by anyone. 

I can limit functionality only to IMX7, until i lay hands on IMX6
with m4 co-proc - is this is what desired ?

> 
> >
> > I have no information about IMX8 (i have found none available
> > publicity), but should be the same as Cortex-M boots from 0x0.
> >
> > >
> > > > +
> > > >     ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > > >                              dcfg->src_mask, dcfg->src_start);
> > > >     if (ret)
> > > >             dev_err(dev, "Failed to enable M4!\n");
> > > >
> > > > +   dev_info(&rproc->dev, "Started from 0x%x\n",
> > > > rproc->bootaddr); +
> > > >     return ret;
> > > >  }
> > > >
> > > > @@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc
> > > > *rproc) if (ret)
> > > >             dev_err(dev, "Failed to stop M4!\n");
> > > >
> > > > +   /* clear entry points */
> > > > +   writel(0, priv->bootreg);
> > > > +
> > > >     return ret;
> > > >  }
> > > >
> > > > @@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc
> > > > *rproc, u64 da, int len) static const struct rproc_ops
> > > > imx_rproc_ops = { .start            = imx_rproc_start,
> > > >     .stop           = imx_rproc_stop,
> > > > -   .da_to_va       = imx_rproc_da_to_va,
> > > > +   .da_to_va       = imx_rproc_da_to_va,
> > > > +   .get_boot_addr  = rproc_elf_get_boot_addr,
> > >
> > > How is this useful?  Sure it will set rproc->bootaddr in
> > > rproc_fw_boot() but what good does that do when it is invariably
> > > set again in imx_rproc_start() ?
> > >
> > > >  };
> > > >
> > > >  static int imx_rproc_addr_init(struct imx_rproc *priv,
> > > > @@ -360,6 +372,8 @@ static int imx_rproc_probe(struct
> > > > platform_device *pdev) goto err_put_rproc;
> > > >     }
> > > >
> > > > +   priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC,
> > > > sizeof(u32)); +
> > > >     /*
> > > >      * clk for M4 block including memory. Should be
> > > >      * enabled before .start for FW transfer.
> > > > --
> > > > 2.25.1
> > > >
> >
