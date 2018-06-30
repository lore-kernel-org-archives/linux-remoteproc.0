Return-Path: <woods.technical@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ce87a7dc-ecf6-f3fd-9121-bf99216f7412@ti.com>
References: <20180623210810.21232-1-david@lechnology.com> <20180623210810.21232-6-david@lechnology.com>
 <ce87a7dc-ecf6-f3fd-9121-bf99216f7412@ti.com>
From: Derald Woods <woods.technical@gmail.com>
Date: Sat, 30 Jun 2018 14:02:36 -0500
Message-ID: <CA+CtpRhQ07=3UytY7QrfnpWkY06UqHbNVq099Coez3C4H3U5yg@mail.gmail.com>
Subject: Re: [PATCH 5/8] remoteproc: new driver for TI PRU
Content-Type: multipart/alternative; boundary="000000000000fc33ed056fe09d19"
To: Roger Quadros <rogerq@ti.com>
Cc: David Lechner <david@lechnology.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, "Anna, Suman" <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

--000000000000fc33ed056fe09d19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 5:14 AM, Roger Quadros <rogerq@ti.com> wrote:

>
>
> On 24/06/18 00:08, David Lechner wrote:
> > This adds a new remoteproc driver for TI Programmable Realtime Units
> > (PRUs).
> >
> > This has been tested working on AM1808 (LEGO MINDSTORMS EV3) using the
> > sample rpmsg client driver.
> >
> > Signed-off-by: David Lechner <david@lechnology.com>
> > ---
> >  MAINTAINERS                       |   5 +
> >  drivers/remoteproc/Kconfig        |   7 +
> >  drivers/remoteproc/Makefile       |   1 +
> >  drivers/remoteproc/ti_pru_rproc.c | 660 ++++++++++++++++++++++++++++++
> >  4 files changed, 673 insertions(+)
> >  create mode 100644 drivers/remoteproc/ti_pru_rproc.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index edf3cf5ea691..06dea089d9ae 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14288,6 +14288,11 @@ L:   netdev@vger.kernel.org
> >  S:   Maintained
> >  F:   drivers/net/ethernet/ti/netcp*
> >
> > +TI PRU REMOTEPROC DRIVER
> > +R:   David Lechner <david@lechnology.com>
> > +F:   Documentation/devicetree/bindings/remoteproc/ti_pru_rproc.txt
> > +F:   drivers/remoteproc/ti_pru_rproc.c
> > +
> >  TI TAS571X FAMILY ASoC CODEC DRIVER
> >  M:   Kevin Cernekee <cernekee@chromium.org>
> >  L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > index cd1c168fd188..ae6e725e1755 100644
> > --- a/drivers/remoteproc/Kconfig
> > +++ b/drivers/remoteproc/Kconfig
> > @@ -158,6 +158,13 @@ config ST_REMOTEPROC
> >  config ST_SLIM_REMOTEPROC
> >       tristate
> >
> > +config TI_PRU_REMOTEPROC
> > +     tristate "TI Programmable Realtime Unit"
> > +     depends on ARCH_DAVINCI_DA8XX || SOC_AM33XX
> > +     help
> > +       Say y here to support TI Programmable Runtime Units (PRUs) via
> the
> > +       remote processor framework.
> > +
> >  endif # REMOTEPROC
> >
> >  endmenu
> > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > index 02627ede8d4a..451efee5c8d3 100644
> > --- a/drivers/remoteproc/Makefile
> > +++ b/drivers/remoteproc/Makefile
> > @@ -23,3 +23,4 @@ qcom_wcnss_pil-y                    +=3D qcom_wcnss.o
> >  qcom_wcnss_pil-y                     +=3D qcom_wcnss_iris.o
> >  obj-$(CONFIG_ST_REMOTEPROC)          +=3D st_remoteproc.o
> >  obj-$(CONFIG_ST_SLIM_REMOTEPROC)     +=3D st_slim_rproc.o
> > +obj-$(CONFIG_TI_PRU_REMOTEPROC)              +=3D ti_pru_rproc.o
> > diff --git a/drivers/remoteproc/ti_pru_rproc.c
> b/drivers/remoteproc/ti_pru_rproc.c
> > new file mode 100644
> > index 000000000000..cd8302c318c9
> > --- /dev/null
> > +++ b/drivers/remoteproc/ti_pru_rproc.c
> > @@ -0,0 +1,660 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2018 David Lechner <david@lechnology.com>
> > + *
> > + * Remoteproc driver for TI Programmable Realtime Unit
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_data/ti-pruss.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/remoteproc.h>
> > +#include <linux/regmap.h>
> > +#include <linux/sizes.h>
> > +#include <linux/types.h>
> > +
> > +#include "remoteproc_internal.h"
> > +
> > +#define SZ_12K 0x3000
> > +
> > +/* control/status registers */
> > +#define TI_PRU_CS_CONTROL    0x0
> > +#define TI_PRU_CS_STATUS     0x4
> > +#define TI_PRU_CS_WAKEUP     0x8
> > +#define TI_PRU_CS_CYCLECNT   0xc
> > +
> > +/* control register bits */
> > +#define TI_PRU_CONTROL_PCRESETVAL    GENMASK(31, 16)
> > +#define TI_PRU_CONTROL_RUNSTATE              BIT(15)
> > +#define TI_PRU_CONTROL_SINGLESTEP    BIT(8)
> > +#define TI_PRU_CONTROL_COUNTENABLE   BIT(3)
> > +#define TI_PRU_CONTROL_SLEEPING              BIT(2)
> > +#define TI_PRU_CONTROL_ENABLE                BIT(1)
> > +#define TI_PRU_CONTROL_SOFTRESET     BIT(0)
> > +
> > +/* status bits */
> > +#define TI_PRU_STATUS_PCOUNTER               GENMASK(15, 0)
> > +
> > +/* interrupt controller registers */
> > +#define TI_PRU_INTC_GLBLEN           0x10
> > +#define TI_PRU_INTC_STATIDXSET               0x20
> > +#define TI_PRU_INTC_STATIDXCLR               0x24
> > +#define TI_PRU_INTC_ENIDXSET         0x28
> > +#define TI_PRU_INTC_HSTINTENIDXSET   0x34
> > +#define TI_PRU_INTC_CHANMAP0         0x400
> > +#define TI_PRU_INTC_POLARITY0                0xd00
> > +#define TI_PRU_INTC_TYPE0            0xd80
> > +#define TI_PRU_INTC_HOSTMAP0         0x800
> > +
> > +/* config registers */
> > +#define TI_PRU_CFG_SYSCFG            0x4
> > +
> > +/* syscfg bits */
> > +#define TI_PRU_SYSCFG_SUB_MWAIT                      BIT(5)
> > +#define TI_PRU_SYSCFG_STANDBY_INIT           BIT(4)
> > +#define TI_PRU_SYSCFG_STANDBY_MODE_MASK              GENMASK(3, 2)
> > +#define TI_PRU_SYSCFG_STANDBY_MODE_SMART     (2 << 2)
> > +#define TI_PRU_SYSCFG_IDLE_MODE_MASK         GENMASK(1, 0)
> > +#define TI_PRU_SYSCFG_IDLE_MODE_SMART                (2 << 0)
> > +
> > +enum ti_pru {
> > +     TI_PRU0,
> > +     TI_PRU1,
> > +     NUM_TI_PRU
> > +};
> > +
> > +enum ti_pru_type {
> > +     TI_PRU_TYPE_AM18XX,
> > +     TI_PRU_TYPE_AM335X,
> > +     NUM_TI_PRU_TYPE
> > +};
> > +
> > +enum ti_pru_evtout {
> > +     TI_PRU_EVTOUT0,
> > +     TI_PRU_EVTOUT1,
> > +     TI_PRU_EVTOUT2,
> > +     TI_PRU_EVTOUT3,
> > +     TI_PRU_EVTOUT4,
> > +     TI_PRU_EVTOUT5,
> > +     TI_PRU_EVTOUT6,
> > +     TI_PRU_EVTOUT7,
> > +     NUM_TI_PRU_EVTOUT
> > +};
> > +
> > +struct ti_pru_mem_region {
> > +     off_t offset;
> > +     size_t size;
> > +};
> > +
> > +/**
> > + * ti_pru_shared_info - common init info for the PRUSS
> > + * @ram: shared RAM, if present
> > + * @intc: interrupt controller
> > + * @cfg: configuration registers, if present
> > + */
> > +struct ti_pru_shared_info {
> > +     struct ti_pru_mem_region ram;
> > +     struct ti_pru_mem_region intc;
> > +     struct ti_pru_mem_region cfg;
> > +};
> > +
> > +/**
> > + * ti_pru_info - init info each individual PRU
> > + * @ram: PRU RAM
> > + * @ctrl: PRU control/status registers
> > + * @dbg: PRU dbg registers
> > + * @inst: instruction RAM
> > + * @vq_arm_to_pru_event: The index of the PRU system event interrupt
> used
> > + *                       used by the ARM for kicking the PRU
> > + * @vq_pru_to_arm_event: The index of the PRU system event interrupt
> used
> > + *                       used by the PRU for kicking the ARM
> > + */
> > +struct ti_pru_info {
> > +     struct ti_pru_mem_region ram;
> > +     struct ti_pru_mem_region ctrl;
> > +     struct ti_pru_mem_region dbg;
> > +     struct ti_pru_mem_region inst;
> > +     int vq_arm_to_pru_event;
> > +     int vq_pru_to_arm_event;
> > +};
> > +
> > +struct ti_pru_device_info {
> > +     struct ti_pru_shared_info shared;
> > +     struct ti_pru_info pru[NUM_TI_PRU];
> > +};
> > +
> > +static const struct ti_pru_device_info ti_pru_devices[NUM_TI_PRU_TYPE]
> =3D {
> > +     [TI_PRU_TYPE_AM18XX] =3D {
> > +             .shared =3D {
> > +                     .intc   =3D { .offset =3D 0x4000,   .size =3D SZ_=
12K, },
> > +             },
> > +             .pru[TI_PRU0] =3D {
> > +                     .ram    =3D { .offset =3D 0x0000,   .size =3D SZ_=
512, },
> > +                     .ctrl   =3D { .offset =3D 0x7000,   .size =3D SZ_=
1K,  },
> > +                     .dbg    =3D { .offset =3D 0x7400,   .size =3D SZ_=
1K,  },
> > +                     .inst   =3D { .offset =3D 0x8000,   .size =3D SZ_=
4K,  },
> > +                     .vq_arm_to_pru_event =3D 32,
> > +                     .vq_pru_to_arm_event =3D 33,
> > +             },
> > +             .pru[TI_PRU1] =3D {
> > +                     .ram    =3D { .offset =3D 0x2000,   .size =3D SZ_=
512, },
> > +                     .ctrl   =3D { .offset =3D 0x7800,   .size =3D SZ_=
1K,  },
> > +                     .dbg    =3D { .offset =3D 0x7c00,   .size =3D SZ_=
1K,  },
> > +                     .inst   =3D { .offset =3D 0xc000,   .size =3D SZ_=
4K,  },
> > +                     .vq_arm_to_pru_event =3D 34,
> > +                     .vq_pru_to_arm_event =3D 35,
> > +             },
> > +     },
> > +     [TI_PRU_TYPE_AM335X] =3D {
> > +             .shared =3D {
> > +                     .ram    =3D { .offset =3D 0x10000,  .size =3D SZ_=
12K, },
> > +                     .intc   =3D { .offset =3D 0x20000,  .size =3D SZ_=
8K,  },
> > +                     .cfg    =3D { .offset =3D 0x26000,  .size =3D SZ_=
8K,  },
> > +             },
> > +             .pru[TI_PRU0] =3D {
> > +                     .ram    =3D { .offset =3D 0x00000,  .size =3D SZ_=
8K,  },
> > +                     .ctrl   =3D { .offset =3D 0x22000,  .size =3D SZ_=
1K,  },
> > +                     .dbg    =3D { .offset =3D 0x22400,  .size =3D SZ_=
1K,  },
> > +                     .inst   =3D { .offset =3D 0x34000,  .size =3D SZ_=
8K,  },
> > +                     .vq_arm_to_pru_event =3D 16,
> > +                     .vq_pru_to_arm_event =3D 17,
> > +             },
> > +             .pru[TI_PRU1] =3D {
> > +                     .ram    =3D { .offset =3D 0x02000,  .size =3D SZ_=
8K,  },
> > +                     .ctrl   =3D { .offset =3D 0x24000,  .size =3D SZ_=
1K,  },
> > +                     .dbg    =3D { .offset =3D 0x24400,  .size =3D SZ_=
1K,  },
> > +                     .inst   =3D { .offset =3D 0x38000,  .size =3D SZ_=
8K,  },
> > +                     .vq_arm_to_pru_event =3D 18,
> > +                     .vq_pru_to_arm_event =3D 19,
> > +             },
> > +     },
>
> All this information should really come from the DT.
>
> > +};
> > +
> > +/**
> > + * ti_pru_shared_data - private platform driver data
> > + * @info: init info common to both PRU cores
> > + * @dev: the platform device
> > + * @base: the mapped memory region of the PRUSS
> > + * @intc: regmap of the interrupt controller
> > + * @cfg: regmap of configuration registers
> > + * @pru: per-PRU core data
> > + */
> > +struct ti_pru_shared_data {
> > +     const struct ti_pru_shared_info *info;
> > +     struct device *dev;
> > +     void __iomem *base;
> > +     struct regmap *intc;
> > +     struct regmap *cfg;
> > +     struct rproc *pru[NUM_TI_PRU];
> > +};
> > +
> > +/**
> > + * ti_pru_data - private data for each PRU core
> > + * @info: static init info
> > + * @shared: pointer to the shared data struct
> > + * @ctrl: regmap of the PRU control/status register
> > + * @vq_irq: interrupt used for rpmsg
> > + */
> > +struct ti_pru_data {
> > +     const struct ti_pru_info *info;
> > +     struct ti_pru_shared_data *shared;
> > +     struct regmap *ctrl;
> > +     int vq_irq;
> > +};
> > +
> > +static int ti_pru_rproc_start(struct rproc *rproc)
> > +{
> > +     struct ti_pru_data *pru =3D rproc->priv;
> > +     u32 val;
> > +
> > +     val =3D (rproc->bootaddr >> 2) << (ffs(TI_PRU_CONTROL_PCRESETVAL)=
 -
> 1);
> > +     val |=3D TI_PRU_CONTROL_ENABLE;
> > +
> > +     return regmap_write(pru->ctrl, TI_PRU_CS_CONTROL, val);
> > +}
> > +
> > +static int ti_pru_rproc_stop(struct rproc *rproc)
> > +{
> > +     struct ti_pru_data *pru =3D rproc->priv;
> > +     u32 mask;
> > +
> > +     mask =3D TI_PRU_CONTROL_ENABLE;
> > +
> > +     return regmap_write_bits(pru->ctrl, TI_PRU_CS_CONTROL, mask, 0);
> > +}
> > +
> > +static void ti_pru_rproc_kick(struct rproc *rproc, int vqid)
> > +{
> > +     struct ti_pru_data *pru =3D rproc->priv;
> > +     struct ti_pru_shared_data *shared =3D pru->shared;
> > +     u32 val;
> > +
> > +     val =3D pru->info->vq_arm_to_pru_event;
> > +
> > +     regmap_write(shared->intc, TI_PRU_INTC_STATIDXSET, val);
> > +}
> > +
> > +static void *ti_pru_rproc_da_to_va(struct rproc *rproc, u64 da, int
> len, int map)
> > +{
> > +     struct ti_pru_data *pru =3D rproc->priv;
> > +     struct ti_pru_shared_data *shared =3D pru->shared;
> > +
> > +     if (map =3D=3D 0) {
> > +             if (da + len > pru->info->inst.size)
> > +                     return ERR_PTR(-EINVAL);
> > +
> > +             return shared->base + pru->info->inst.offset + da;
> > +     }
> > +
> > +     if (map =3D=3D 1) {
> > +             if (da + len > pru->info->ram.size)
> > +                     return ERR_PTR(-EINVAL);
> > +
> > +             return shared->base + pru->info->ram.offset + da;
> > +     }
> > +
> > +     return ERR_PTR(-EINVAL);
> > +}
> > +
> > +static const struct rproc_ops ti_pru_rproc_ops =3D {
> > +     .start =3D ti_pru_rproc_start,
> > +     .stop =3D ti_pru_rproc_stop,
> > +     .kick =3D ti_pru_rproc_kick,
> > +     .da_to_va =3D ti_pru_rproc_da_to_va,
> > +};
> > +
> > +static struct regmap_config ti_pru_ctrl_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x2c,
> > +};
> > +
> > +static struct regmap_config ti_pru_intc_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x1500,
> > +};
> > +
> > +static struct regmap_config ti_pru_cfg_regmap_config =3D {
> > +     .reg_bits =3D 32,
> > +     .val_bits =3D 32,
> > +     .reg_stride =3D 4,
> > +     .max_register =3D 0x40,
> > +};
> > +
> > +static const struct of_device_id ti_pru_rproc_of_match[] =3D {
> > +     {
> > +             .compatible =3D "ti,da850-pru-rproc",
> > +             .data =3D &ti_pru_devices[TI_PRU_TYPE_AM18XX]
> > +     },
> > +     {
> > +             .compatible =3D "ti,am3352-pru-rproc",
> > +             .data =3D &ti_pru_devices[TI_PRU_TYPE_AM335X]
> > +     },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, ti_pru_rproc_of_match);
> > +
> > +static irqreturn_t ti_pru_handle_vq_irq(int irq, void *p)
> > +{
> > +     struct rproc *rproc =3D p;
> > +     struct ti_pru_data *pru =3D rproc->priv;
> > +
> > +     regmap_write(pru->shared->intc, TI_PRU_INTC_STATIDXCLR,
> > +                  pru->info->vq_pru_to_arm_event);
> > +
> > +     return IRQ_WAKE_THREAD;
> > +}
> > +
> > +static irqreturn_t ti_pru_vq_irq_thread(int irq, void *p)
> > +{
> > +     struct rproc *rproc =3D p;
> > +
> > +     rproc_vq_interrupt(rproc, 0);
> > +     rproc_vq_interrupt(rproc, 1);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static void ti_pru_free_rproc(void *data)
> > +{
> > +     struct rproc *rproc =3D data;
> > +
> > +     rproc_free(rproc);
> > +}
> > +
> > +static struct rproc *ti_pru_init_one_rproc(struct ti_pru_shared_data
> *shared,
> > +                                        const struct ti_pru_info *info=
,
> > +                                        enum ti_pru id)
> > +{
> > +     struct device *dev =3D shared->dev;
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     const char *name;
> > +     char irq_name[16];
> > +     struct rproc *rproc;
> > +     struct ti_pru_data *pru;
> > +     int err;
> > +
> > +     name =3D devm_kasprintf(dev, GFP_KERNEL, "pru%u", id);
> > +     if (!name)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     rproc =3D rproc_alloc(dev, name, &ti_pru_rproc_ops, NULL,
> sizeof(*pru));
> > +     if (!rproc)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     devm_add_action(dev, ti_pru_free_rproc, rproc);
> > +
> > +     /* don't auto-boot for now - bad firmware can lock up the system =
*/
> > +     rproc->auto_boot =3D false;
> > +
> > +     pru =3D rproc->priv;
> > +     pru->info =3D info;
> > +     pru->shared =3D shared;
> > +
> > +     snprintf(irq_name, 16, "%s-vq", name);
> > +
> > +     pru->vq_irq =3D platform_get_irq_byname(pdev, irq_name);
> > +     if (pru->vq_irq < 0) {
> > +             dev_err(&rproc->dev, "failed to get vq IRQ\n");
> > +             return ERR_PTR(pru->vq_irq);
> > +     }
> > +
> > +     err =3D devm_request_threaded_irq(&rproc->dev, pru->vq_irq,
> > +                                     ti_pru_handle_vq_irq,
> > +                                     ti_pru_vq_irq_thread, 0, name,
> rproc);
> > +     if (err < 0) {
> > +             dev_err(&rproc->dev, "failed to request vq IRQ\n");
> > +             return ERR_PTR(err);
> > +     }
> > +
> > +     pru->ctrl =3D devm_regmap_init_mmio(&rproc->dev,
> > +                                       shared->base + info->ctrl.offse=
t,
> > +                                       &ti_pru_ctrl_regmap_config);
> > +     if (IS_ERR(pru->ctrl)) {
> > +             dev_err(&rproc->dev, "failed to init ctrl regmap\n");
> > +             return ERR_CAST(pru->ctrl);
> > +     }
> > +
> > +     return rproc;
> > +}
> > +
> > +/**
> > + * ti_pru_init_intc_polarity - configure polarity interrupt event
> > + * @intc: the interrtup controller regmap
> > + * @event: the source event
> > + */
> > +static void ti_pru_init_intc_polarity(struct regmap *intc, int event)
> > +{
> > +     int offset, shift, mask;
> > +
> > +     /* 32 events per register */
> > +     offset =3D event / 32 * 4;
> > +     shift =3D event % 32;
> > +     mask =3D 1 << shift;
> > +
> > +     /* polarity is always high (1) */
> > +     regmap_write_bits(intc, TI_PRU_INTC_POLARITY0 + offset, mask, ~0)=
;
> > +}
> > +
> > +/**
> > + * ti_pru_init_intc_type - configure type of interrupt event
> > + * @intc: the interrtup controller regmap
> > + * @event: the source event
> > + */
> > +static void ti_pru_init_intc_type(struct regmap *intc, int event)
> > +{
> > +     int offset, shift, mask;
> > +
> > +     /* 32 events per register */
> > +     offset =3D event / 32 * 4;
> > +     shift =3D event % 32;
> > +     mask =3D 1 << shift;
> > +
> > +     /* type is always pulse (0) */
> > +     regmap_write_bits(intc, TI_PRU_INTC_TYPE0 + offset, mask, 0);
> > +}
> > +
> > +/**
> > + * ti_pru_init_intc_channel_map - configure interrupt event to channel
> mapping
> > + * @intc: the interrtup controller regmap
> > + * @event: the source event
> > + * @ch: the channel to be assigned to the event
> > + */
> > +static void ti_pru_init_intc_channel_map(struct regmap *intc, int
> event, int ch)
> > +{
> > +     int offset, shift, mask, val;
> > +
> > +     /* 4 channels per 32-bit register */
> > +     offset =3D event / 4 * 4;
> > +     shift =3D event % 4 * 8;
> > +     mask =3D 0xff << shift;
> > +     val =3D ch << shift;
> > +
> > +     regmap_write_bits(intc, TI_PRU_INTC_CHANMAP0 + offset, mask, val)=
;
> > +}
> > +
> > +/**
> > + * ti_pru_init_intc_host_map - configure interrupt channel to host
> mapping
> > + * @intc: the interrtup controller regmap
> > + * @ch: the source channel
> > + * @host: the host interrupt to be assigned to the channel
> > + */
> > +static void ti_pru_init_intc_host_map(struct regmap *intc, int ch, int
> host)
> > +{
> > +     int offset, shift, mask, val;
> > +
> > +     /* 4 hosts per 32-bit register */
> > +     offset =3D ch / 4 * 4;
> > +     shift =3D ch % 4 * 8;
> > +     mask =3D 0xff << shift;
> > +     val =3D host << shift;
> > +
> > +     regmap_write_bits(intc, TI_PRU_INTC_HOSTMAP0 + offset, mask, val)=
;
> > +}
> > +
> > +static void ti_pru_init_intc(struct regmap *intc,
> > +                          const struct ti_pru_device_info *info)
> > +{
> > +     int arm_to_pru0 =3D info->pru[TI_PRU0].vq_arm_to_pru_event;
> > +     int arm_to_pru1 =3D info->pru[TI_PRU1].vq_arm_to_pru_event;
> > +     int pru0_to_arm =3D info->pru[TI_PRU0].vq_pru_to_arm_event;
> > +     int pru1_to_arm =3D info->pru[TI_PRU1].vq_pru_to_arm_event;
> > +
> > +     /* set polarity of system events */
> > +     ti_pru_init_intc_polarity(intc, arm_to_pru0);
> > +     ti_pru_init_intc_polarity(intc, arm_to_pru1);
> > +     ti_pru_init_intc_polarity(intc, pru0_to_arm);
> > +     ti_pru_init_intc_polarity(intc, pru1_to_arm);
> > +
> > +     /* set type of system events */
> > +     ti_pru_init_intc_type(intc, arm_to_pru0);
> > +     ti_pru_init_intc_type(intc, arm_to_pru1);
> > +     ti_pru_init_intc_type(intc, pru0_to_arm);
> > +     ti_pru_init_intc_type(intc, pru1_to_arm);
> > +
> > +     /* map system events to channels */
> > +     ti_pru_init_intc_channel_map(intc, arm_to_pru0, 0);
> > +     ti_pru_init_intc_channel_map(intc, arm_to_pru1, 1);
> > +     ti_pru_init_intc_channel_map(intc, pru0_to_arm, 2);
> > +     ti_pru_init_intc_channel_map(intc, pru1_to_arm, 3);
> > +
> > +     /* map channels to host interrupts */
> > +     ti_pru_init_intc_host_map(intc, 0, 0); /* ARM to PRU0 */
> > +     ti_pru_init_intc_host_map(intc, 1, 1); /* ARM to PRU1 */
> > +     ti_pru_init_intc_host_map(intc, 2, 2); /* PRU0 to ARM */
> > +     ti_pru_init_intc_host_map(intc, 3, 3); /* PRU1 to ARM */
> > +
> > +     /* clear system interrupts */
> > +     regmap_write(intc, TI_PRU_INTC_STATIDXCLR, arm_to_pru0);
> > +     regmap_write(intc, TI_PRU_INTC_STATIDXCLR, arm_to_pru1);
> > +     regmap_write(intc, TI_PRU_INTC_STATIDXCLR, pru0_to_arm);
> > +     regmap_write(intc, TI_PRU_INTC_STATIDXCLR, pru1_to_arm);
> > +
> > +     /* enable host interrupts for kicking */
> > +     regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 0); /* ARM to PRU0
> */
> > +     regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 1); /* ARM to PRU1
> */
> > +     regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 2); /* PRU0 to ARM
> */
> > +     regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 3); /* PRU1 to ARM
> */
> > +
> > +     /* enable system events for kicking */
> > +     regmap_write(intc, TI_PRU_INTC_ENIDXSET, arm_to_pru0);
> > +     regmap_write(intc, TI_PRU_INTC_ENIDXSET, arm_to_pru1);
> > +     regmap_write(intc, TI_PRU_INTC_ENIDXSET, pru0_to_arm);
> > +     regmap_write(intc, TI_PRU_INTC_ENIDXSET, pru1_to_arm);
> > +
> > +     /* enable all interrupts */
> > +     regmap_write_bits(intc, TI_PRU_INTC_GLBLEN, 1, 1);
> > +}
>
> We already have a working irq_chip implementation for INTC.
> https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/
> ti-linux-4.14.y/drivers/remoteproc/pruss_intc.c
>
> I think we can leverage directly from that.
>
> This way pru_rproc or client device nodes can easily specify a pruss_intc
> interrupt parent and the
> SYSEVENT number as the irq. Then device drivers can simply use
> request_irq().
>
> example usage here
> https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/
> ti-linux-4.14.y/arch/arm/boot/dts/am33xx.dtsi#line986
> https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/
> ti-linux-4.14.y/drivers/remoteproc/pru_rproc.c#line670




=E2=80=8BIs this PRU code on a path to be added to the mainline kernel?=E2=
=80=8B There is
an increase in the number of available systems which would benefit from
consistent PRU interfaces. If code is not mainlined, or on a mainline path,
some may think it is not usable or ready for production. Is this a
permanent "out-of-tree" and/or "TI-tree" development. Just wondering.

Derald




>
>
>
> > +
> > +static int ti_pru_rproc_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct ti_pruss_platform_data *pdata =3D dev_get_platdata(dev);
> > +     const struct of_device_id *of_id;
> > +     const struct ti_pru_device_info *info;
> > +     struct ti_pru_shared_data *shared;
> > +     struct resource *res;
> > +     int err;
> > +
> > +     of_id =3D of_match_device(ti_pru_rproc_of_match, dev);
> > +     if (!of_id || !of_id->data)
> > +             return -EINVAL;
> > +
> > +     info =3D of_id->data;
> > +
> > +     shared =3D devm_kzalloc(dev, sizeof(*shared), GFP_KERNEL);
> > +
> > +     platform_set_drvdata(pdev, shared);
> > +
> > +     shared->info =3D &info->shared;
> > +     shared->dev =3D dev;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     shared->base =3D devm_ioremap_resource(dev, res);
> > +     if (IS_ERR(shared->base)) {
> > +             dev_err(dev, "failed to ioremap resource\n");
> > +             return PTR_ERR(shared->base);
> > +     }
> > +
> > +     shared->intc =3D devm_regmap_init_mmio(dev,
> > +                             shared->base + shared->info->intc.offset,
> > +                             &ti_pru_intc_regmap_config);
> > +     if (IS_ERR(shared->intc)) {
> > +             dev_err(dev, "failed to init intc regmap\n");
> > +             return PTR_ERR(shared->intc);
> > +     }
> > +
> > +     if (shared->info->cfg.size) {
> > +             shared->cfg =3D devm_regmap_init_mmio(dev,
> > +                     shared->base + shared->info->cfg.offset,
> > +                     &ti_pru_cfg_regmap_config);
> > +             if (IS_ERR(shared->cfg)) {
> > +                     dev_err(dev, "failed to init cfg regmap\n");
> > +                     return PTR_ERR(shared->cfg);
> > +             }
> > +     }
> > +
> > +     shared->pru[TI_PRU0] =3D ti_pru_init_one_rproc(shared,
> &info->pru[TI_PRU0],
> > +                                                  TI_PRU0);
> > +     if (IS_ERR(shared->pru[TI_PRU0]))
> > +             return PTR_ERR(shared->pru[TI_PRU0]);
> > +
> > +     shared->pru[TI_PRU1] =3D ti_pru_init_one_rproc(shared,
> &info->pru[TI_PRU1],
> > +                                                  TI_PRU1);
> > +     if (IS_ERR(shared->pru[TI_PRU1]))
> > +             return PTR_ERR(shared->pru[TI_PRU1]);
> > +
> > +     pm_runtime_enable(dev);
> > +
> > +     err =3D pm_runtime_get_sync(dev);
> > +     if (err < 0)
> > +             goto err_pm_runtime_disable;
> > +
> > +     if (pdata) {
> > +             err =3D pdata->deassert_reset(pdev, pdata->reset_name);
> > +             if (err < 0) {
> > +                     dev_err(dev, "Failed to reset pruss\n");
> > +                     goto err_pm_runtime_put;
> > +             }
> > +     }
> > +
> > +     if (shared->cfg) {
> > +             int mask, val;
> > +
> > +             mask =3D TI_PRU_SYSCFG_IDLE_MODE_MASK |
> TI_PRU_SYSCFG_STANDBY_MODE_MASK;
> > +             val =3D TI_PRU_SYSCFG_IDLE_MODE_SMART |
> TI_PRU_SYSCFG_STANDBY_MODE_SMART;
> > +             regmap_write_bits(shared->cfg, TI_PRU_CFG_SYSCFG, mask,
> val);
> > +
> > +             mask =3D TI_PRU_SYSCFG_STANDBY_INIT;
> > +             val =3D 0;
> > +             regmap_write_bits(shared->cfg, TI_PRU_CFG_SYSCFG, mask,
> val);
> > +
> > +             err =3D regmap_read_poll_timeout(shared->cfg,
> TI_PRU_CFG_SYSCFG,
> > +                             val, !(val & TI_PRU_SYSCFG_SUB_MWAIT), 5,
> 50);
> > +             if (err < 0) {
> > +                     dev_err(dev, "timeout while enabling pruss\n");
> > +                     goto err_pm_runtime_put;
> > +             }
> > +     }
> > +
> > +     ti_pru_init_intc(shared->intc, info);
>
> This is using a static INTC map right?
> This limits our possibility to use application based INTC mapping.
> There needs to be a way to specify the INTC mapping in the DT and/or
> resource table.
>
> > +
> > +     err =3D rproc_add(shared->pru[TI_PRU0]);
> > +     if (err < 0)
> > +             goto err_assert_reset;
> > +
> > +     err =3D rproc_add(shared->pru[TI_PRU1]);
> > +     if (err < 0)
> > +             goto err_del_pru0;
> > +
> > +     return 0;
> > +
> > +err_del_pru0:
> > +     rproc_del(shared->pru[TI_PRU0]);
> > +err_assert_reset:
> > +     if (pdata)
> > +             pdata->assert_reset(pdev, pdata->reset_name);
> > +err_pm_runtime_put:
> > +     pm_runtime_put(dev);
> > +err_pm_runtime_disable:
> > +     pm_runtime_disable(dev);
> > +
> > +     return err;
> > +}
> > +
> > +static int ti_pru_rproc_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct ti_pruss_platform_data *pdata =3D dev_get_platdata(dev);
> > +     struct ti_pru_shared_data *shared =3D platform_get_drvdata(pdev);
> > +
> > +     rproc_del(shared->pru[TI_PRU1]);
> > +     rproc_del(shared->pru[TI_PRU0]);
> > +     if (pdata)
> > +             pdata->assert_reset(pdev, pdata->reset_name);
> > +     pm_runtime_put(dev);
> > +     pm_runtime_disable(dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver ti_pru_rproc_driver =3D {
> > +     .probe  =3D ti_pru_rproc_probe,
> > +     .remove =3D ti_pru_rproc_remove,
> > +     .driver =3D {
> > +             .name =3D "ti-pru-rproc",
> > +             .of_match_table =3D ti_pru_rproc_of_match,
> > +     },
> > +};
> > +module_platform_driver(ti_pru_rproc_driver);
> > +
> > +MODULE_AUTHOR("David Lechner <david@lechnology.com>");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("Remoteproc driver for TI PRU");
> >
>
> --
> cheers,
> -roger
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>

--000000000000fc33ed056fe09d19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace"><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Fri, Jun 29, 2018 at 5:14 AM, Roger Quadros <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rogerq@ti.com" target=3D"_blank">rogerq@ti.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div cl=
ass=3D"h5"><br>
<br>
On 24/06/18 00:08, David Lechner wrote:<br>
&gt; This adds a new remoteproc driver for TI Programmable Realtime Units<b=
r>
&gt; (PRUs).<br>
&gt; <br>
&gt; This has been tested working on AM1808 (LEGO MINDSTORMS EV3) using the=
<br>
&gt; sample rpmsg client driver.<br>
&gt; <br>
&gt; Signed-off-by: David Lechner &lt;<a href=3D"mailto:david@lechnology.co=
m">david@lechnology.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/remoteproc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A07 +<br>
&gt;=C2=A0 drivers/remoteproc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 drivers/remoteproc/ti_pru_<wbr>rproc.c | 660 +++++++++++++++++++=
+++++++++++<br>
&gt;=C2=A0 4 files changed, 673 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/remoteproc/ti_pru_<wbr>rproc.c<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index edf3cf5ea691..06dea089d9ae 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -14288,6 +14288,11 @@ L:=C2=A0 =C2=A0<a href=3D"mailto:netdev@vger.=
kernel.org">netdev@vger.kernel.org</a><br>
&gt;=C2=A0 S:=C2=A0 =C2=A0Maintained<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/net/ethernet/ti/netcp*<br>
&gt;=C2=A0 <br>
&gt; +TI PRU REMOTEPROC DRIVER<br>
&gt; +R:=C2=A0 =C2=A0David Lechner &lt;<a href=3D"mailto:david@lechnology.c=
om">david@lechnology.com</a>&gt;<br>
&gt; +F:=C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/remoteproc/ti_p=
ru_<wbr>rproc.txt<br>
&gt; +F:=C2=A0 =C2=A0drivers/remoteproc/ti_pru_<wbr>rproc.c<br>
&gt; +<br>
&gt;=C2=A0 TI TAS571X FAMILY ASoC CODEC DRIVER<br>
&gt;=C2=A0 M:=C2=A0 =C2=A0Kevin Cernekee &lt;<a href=3D"mailto:cernekee@chr=
omium.org">cernekee@chromium.org</a>&gt;<br>
&gt;=C2=A0 L:=C2=A0 =C2=A0<a href=3D"mailto:alsa-devel@alsa-project.org">al=
sa-devel@alsa-project.org</a> (moderated for non-subscribers)<br>
&gt; diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig<b=
r>
&gt; index cd1c168fd188..ae6e725e1755 100644<br>
&gt; --- a/drivers/remoteproc/Kconfig<br>
&gt; +++ b/drivers/remoteproc/Kconfig<br>
&gt; @@ -158,6 +158,13 @@ config ST_REMOTEPROC<br>
&gt;=C2=A0 config ST_SLIM_REMOTEPROC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate<br>
&gt;=C2=A0 <br>
&gt; +config TI_PRU_REMOTEPROC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;TI Programmable Realtime Unit&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_DAVINCI_DA8XX || SOC_AM33XX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say y here to support TI Programmable Runt=
ime Units (PRUs) via the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0remote processor framework.<br>
&gt; +<br>
&gt;=C2=A0 endif # REMOTEPROC<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 endmenu<br>
&gt; diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile=
<br>
&gt; index 02627ede8d4a..451efee5c8d3 100644<br>
&gt; --- a/drivers/remoteproc/Makefile<br>
&gt; +++ b/drivers/remoteproc/Makefile<br>
&gt; @@ -23,3 +23,4 @@ qcom_wcnss_pil-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D qcom_wcnss.o<br>
&gt;=C2=A0 qcom_wcnss_pil-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D qcom_wcnss_iris.o<br>
&gt;=C2=A0 obj-$(CONFIG_ST_REMOTEPROC)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D st_remoteproc.o<br>
&gt;=C2=A0 obj-$(CONFIG_ST_SLIM_<wbr>REMOTEPROC)=C2=A0 =C2=A0 =C2=A0+=3D st=
_slim_rproc.o<br>
&gt; +obj-$(CONFIG_TI_PRU_<wbr>REMOTEPROC)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D ti_pru_rproc.o<br>
&gt; diff --git a/drivers/remoteproc/ti_pru_<wbr>rproc.c b/drivers/remotepr=
oc/ti_pru_<wbr>rproc.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..cd8302c318c9<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/remoteproc/ti_pru_<wbr>rproc.c<br>
&gt; @@ -0,0 +1,660 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2018 David Lechner &lt;<a href=3D"mailto:david@lechn=
ology.com">david@lechnology.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Remoteproc driver for TI Programmable Realtime Unit<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/bitops.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/platform_data/ti-pruss.<wbr>h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; +#include &lt;linux/remoteproc.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/sizes.h&gt;<br>
&gt; +#include &lt;linux/types.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;remoteproc_internal.h&quot;<br>
&gt; +<br>
&gt; +#define SZ_12K 0x3000<br>
&gt; +<br>
&gt; +/* control/status registers */<br>
&gt; +#define TI_PRU_CS_CONTROL=C2=A0 =C2=A0 0x0<br>
&gt; +#define TI_PRU_CS_STATUS=C2=A0 =C2=A0 =C2=A00x4<br>
&gt; +#define TI_PRU_CS_WAKEUP=C2=A0 =C2=A0 =C2=A00x8<br>
&gt; +#define TI_PRU_CS_CYCLECNT=C2=A0 =C2=A00xc<br>
&gt; +<br>
&gt; +/* control register bits */<br>
&gt; +#define TI_PRU_CONTROL_PCRESETVAL=C2=A0 =C2=A0 GENMASK(31, 16)<br>
&gt; +#define TI_PRU_CONTROL_RUNSTATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(15)<br>
&gt; +#define TI_PRU_CONTROL_SINGLESTEP=C2=A0 =C2=A0 BIT(8)<br>
&gt; +#define TI_PRU_CONTROL_COUNTENABLE=C2=A0 =C2=A0BIT(3)<br>
&gt; +#define TI_PRU_CONTROL_SLEEPING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(2)<br>
&gt; +#define TI_PRU_CONTROL_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(1)<br>
&gt; +#define TI_PRU_CONTROL_SOFTRESET=C2=A0 =C2=A0 =C2=A0BIT(0)<br>
&gt; +<br>
&gt; +/* status bits */<br>
&gt; +#define TI_PRU_STATUS_PCOUNTER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GENMASK(15, 0)<br>
&gt; +<br>
&gt; +/* interrupt controller registers */<br>
&gt; +#define TI_PRU_INTC_GLBLEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
10<br>
&gt; +#define TI_PRU_INTC_STATIDXSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x20<br>
&gt; +#define TI_PRU_INTC_STATIDXCLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x24<br>
&gt; +#define TI_PRU_INTC_ENIDXSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x28<br=
>
&gt; +#define TI_PRU_INTC_HSTINTENIDXSET=C2=A0 =C2=A00x34<br>
&gt; +#define TI_PRU_INTC_CHANMAP0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x400<b=
r>
&gt; +#define TI_PRU_INTC_POLARITY0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0xd00<br>
&gt; +#define TI_PRU_INTC_TYPE0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
d80<br>
&gt; +#define TI_PRU_INTC_HOSTMAP0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x800<b=
r>
&gt; +<br>
&gt; +/* config registers */<br>
&gt; +#define TI_PRU_CFG_SYSCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
4<br>
&gt; +<br>
&gt; +/* syscfg bits */<br>
&gt; +#define TI_PRU_SYSCFG_SUB_MWAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(5)<br>
&gt; +#define TI_PRU_SYSCFG_STANDBY_INIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0BIT(4)<br>
&gt; +#define TI_PRU_SYSCFG_STANDBY_MODE_<wbr>MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 GENMASK(3, 2)<br>
&gt; +#define TI_PRU_SYSCFG_STANDBY_MODE_<wbr>SMART=C2=A0 =C2=A0 =C2=A0(2 &=
lt;&lt; 2)<br>
&gt; +#define TI_PRU_SYSCFG_IDLE_MODE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0GENMASK(1, 0)<br>
&gt; +#define TI_PRU_SYSCFG_IDLE_MODE_SMART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (2 &lt;&lt; 0)<br>
&gt; +<br>
&gt; +enum ti_pru {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NUM_TI_PRU<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum ti_pru_type {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_TYPE_AM18XX,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_TYPE_AM335X,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NUM_TI_PRU_TYPE<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum ti_pru_evtout {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT5,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0TI_PRU_EVTOUT7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NUM_TI_PRU_EVTOUT<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ti_pru_mem_region {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0off_t offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_shared_info - common init info for the PRUSS<br>
&gt; + * @ram: shared RAM, if present<br>
&gt; + * @intc: interrupt controller<br>
&gt; + * @cfg: configuration registers, if present<br>
&gt; + */<br>
&gt; +struct ti_pru_shared_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region ram;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region intc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region cfg;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_info - init info each individual PRU<br>
&gt; + * @ram: PRU RAM<br>
&gt; + * @ctrl: PRU control/status registers<br>
&gt; + * @dbg: PRU dbg registers<br>
&gt; + * @inst: instruction RAM<br>
&gt; + * @vq_arm_to_pru_event: The index of the PRU system event interrupt =
used<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0used by the ARM for kicking the PRU<br>
&gt; + * @vq_pru_to_arm_event: The index of the PRU system event interrupt =
used<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0used by the PRU for kicking the ARM<br>
&gt; + */<br>
&gt; +struct ti_pru_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region ram;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region dbg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_mem_region inst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int vq_arm_to_pru_event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int vq_pru_to_arm_event;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct ti_pru_device_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_info shared;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_info pru[NUM_TI_PRU];<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct ti_pru_device_info ti_pru_devices[NUM_TI_PRU_<wbr=
>TYPE] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[TI_PRU_TYPE_AM18XX] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.intc=C2=A0 =C2=A0=3D { .offset =3D 0x4000,=C2=A0 =C2=A0.size =3D SZ=
_12K, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pru[TI_PRU0] =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ram=C2=A0 =C2=A0 =3D { .offset =3D 0x0000,=C2=A0 =C2=A0.size =3D SZ=
_512, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ctrl=C2=A0 =C2=A0=3D { .offset =3D 0x7000,=C2=A0 =C2=A0.size =3D SZ=
_1K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.dbg=C2=A0 =C2=A0 =3D { .offset =3D 0x7400,=C2=A0 =C2=A0.size =3D SZ=
_1K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.inst=C2=A0 =C2=A0=3D { .offset =3D 0x8000,=C2=A0 =C2=A0.size =3D SZ=
_4K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_arm_to_pru_event =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_pru_to_arm_event =3D 33,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pru[TI_PRU1] =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ram=C2=A0 =C2=A0 =3D { .offset =3D 0x2000,=C2=A0 =C2=A0.size =3D SZ=
_512, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ctrl=C2=A0 =C2=A0=3D { .offset =3D 0x7800,=C2=A0 =C2=A0.size =3D SZ=
_1K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.dbg=C2=A0 =C2=A0 =3D { .offset =3D 0x7c00,=C2=A0 =C2=A0.size =3D SZ=
_1K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.inst=C2=A0 =C2=A0=3D { .offset =3D 0xc000,=C2=A0 =C2=A0.size =3D SZ=
_4K,=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_arm_to_pru_event =3D 34,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_pru_to_arm_event =3D 35,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[TI_PRU_TYPE_AM335X] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.shared =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ram=C2=A0 =C2=A0 =3D { .offset =3D 0x10000,=C2=A0 .size =3D SZ_12K,=
 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.intc=C2=A0 =C2=A0=3D { .offset =3D 0x20000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.cfg=C2=A0 =C2=A0 =3D { .offset =3D 0x26000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pru[TI_PRU0] =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ram=C2=A0 =C2=A0 =3D { .offset =3D 0x00000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ctrl=C2=A0 =C2=A0=3D { .offset =3D 0x22000,=C2=A0 .size =3D SZ_1K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.dbg=C2=A0 =C2=A0 =3D { .offset =3D 0x22400,=C2=A0 .size =3D SZ_1K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.inst=C2=A0 =C2=A0=3D { .offset =3D 0x34000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_arm_to_pru_event =3D 16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_pru_to_arm_event =3D 17,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pru[TI_PRU1] =3D {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ram=C2=A0 =C2=A0 =3D { .offset =3D 0x02000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.ctrl=C2=A0 =C2=A0=3D { .offset =3D 0x24000,=C2=A0 .size =3D SZ_1K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.dbg=C2=A0 =C2=A0 =3D { .offset =3D 0x24400,=C2=A0 .size =3D SZ_1K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.inst=C2=A0 =C2=A0=3D { .offset =3D 0x38000,=C2=A0 .size =3D SZ_8K,=
=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_arm_to_pru_event =3D 18,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.vq_pru_to_arm_event =3D 19,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
<br>
</div></div>All this information should really come from the DT.<br>
<div><div class=3D"h5"><br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_shared_data - private platform driver data<br>
&gt; + * @info: init info common to both PRU cores<br>
&gt; + * @dev: the platform device<br>
&gt; + * @base: the mapped memory region of the PRUSS<br>
&gt; + * @intc: regmap of the interrupt controller<br>
&gt; + * @cfg: regmap of configuration registers<br>
&gt; + * @pru: per-PRU core data<br>
&gt; + */<br>
&gt; +struct ti_pru_shared_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct ti_pru_shared_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *intc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *cfg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rproc *pru[NUM_TI_PRU];<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_data - private data for each PRU core<br>
&gt; + * @info: static init info<br>
&gt; + * @shared: pointer to the shared data struct<br>
&gt; + * @ctrl: regmap of the PRU control/status register<br>
&gt; + * @vq_irq: interrupt used for rpmsg<br>
&gt; + */<br>
&gt; +struct ti_pru_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct ti_pru_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_data *shared;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int vq_irq;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int ti_pru_rproc_start(struct rproc *rproc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru =3D rproc-&gt;priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D (rproc-&gt;bootaddr &gt;&gt; 2) &lt;&lt; =
(ffs(TI_PRU_CONTROL_<wbr>PCRESETVAL) - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val |=3D TI_PRU_CONTROL_ENABLE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_write(pru-&gt;ctrl, TI_PRU_CS_CONTR=
OL, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ti_pru_rproc_stop(struct rproc *rproc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru =3D rproc-&gt;priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D TI_PRU_CONTROL_ENABLE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_write_bits(pru-&gt;ctrl, TI_PRU_CS_=
CONTROL, mask, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ti_pru_rproc_kick(struct rproc *rproc, int vqid)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru =3D rproc-&gt;priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_data *shared =3D pru-&gt;sha=
red;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D pru-&gt;info-&gt;vq_arm_to_pru_<wbr>event=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(shared-&gt;intc, TI_PRU_INTC_STATIDX=
SET, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void *ti_pru_rproc_da_to_va(struct rproc *rproc, u64 da, int l=
en, int map)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru =3D rproc-&gt;priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_data *shared =3D pru-&gt;sha=
red;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (map =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (da + len &gt; pru=
-&gt;info-&gt;inst.size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return shared-&gt;bas=
e + pru-&gt;info-&gt;inst.offset + da;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (map =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (da + len &gt; pru=
-&gt;info-&gt;ram.size)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return shared-&gt;bas=
e + pru-&gt;info-&gt;ram.offset + da;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct rproc_ops ti_pru_rproc_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.start =3D ti_pru_rproc_start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.stop =3D ti_pru_rproc_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.kick =3D ti_pru_rproc_kick,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.da_to_va =3D ti_pru_rproc_da_to_va,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct regmap_config ti_pru_ctrl_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_stride =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_register =3D 0x2c,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct regmap_config ti_pru_intc_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_stride =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_register =3D 0x1500,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct regmap_config ti_pru_cfg_regmap_config =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.val_bits =3D 32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reg_stride =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.max_register =3D 0x40,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id ti_pru_rproc_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;ti,da850-pru-rproc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;ti_pru=
_devices[TI_PRU_TYPE_<wbr>AM18XX]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.compatible =3D &quot=
;ti,am3352-pru-rproc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D &amp;ti_pru=
_devices[TI_PRU_TYPE_<wbr>AM335X]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, ti_pru_rproc_of_match);<br>
&gt; +<br>
&gt; +static irqreturn_t ti_pru_handle_vq_irq(int irq, void *p)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rproc *rproc =3D p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru =3D rproc-&gt;priv;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(pru-&gt;shared-&gt;<wbr>intc, TI_PRU=
_INTC_STATIDXCLR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pru-&g=
t;info-&gt;vq_pru_to_arm_<wbr>event);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_WAKE_THREAD;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t ti_pru_vq_irq_thread(int irq, void *p)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rproc *rproc =3D p;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_vq_interrupt(rproc, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_vq_interrupt(rproc, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ti_pru_free_rproc(void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rproc *rproc =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_free(rproc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct rproc *ti_pru_init_one_rproc(struct ti_pru_shared_data =
*shared,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cons=
t struct ti_pru_info *info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum=
 ti_pru id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D shared-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char irq_name[16];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct rproc *rproc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_data *pru;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0name =3D devm_kasprintf(dev, GFP_KERNEL, &quot;pr=
u%u&quot;, id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc =3D rproc_alloc(dev, name, &amp;ti_pru_rpro=
c_ops, NULL, sizeof(*pru));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rproc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0devm_add_action(dev, ti_pru_free_rproc, rproc);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* don&#39;t auto-boot for now - bad firmware can=
 lock up the system */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc-&gt;auto_boot =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pru =3D rproc-&gt;priv;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pru-&gt;info =3D info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pru-&gt;shared =3D shared;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snprintf(irq_name, 16, &quot;%s-vq&quot;, name);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pru-&gt;vq_irq =3D platform_get_irq_byname(pdev, =
irq_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pru-&gt;vq_irq &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;rproc-&g=
t;dev, &quot;failed to get vq IRQ\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(pru-&g=
t;vq_irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D devm_request_threaded_irq(&amp;<wbr>rproc=
-&gt;dev, pru-&gt;vq_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ti_pru_handl=
e_vq_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ti_pru_vq_ir=
q_thread, 0, name, rproc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;rproc-&g=
t;dev, &quot;failed to request vq IRQ\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(err);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pru-&gt;ctrl =3D devm_regmap_init_mmio(&amp;rproc=
-&gt;<wbr>dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0share=
d-&gt;base + info-&gt;ctrl.offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
ti_pru_ctrl_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pru-&gt;ctrl)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;rproc-&g=
t;dev, &quot;failed to init ctrl regmap\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_CAST(pru-&=
gt;ctrl);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return rproc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_init_intc_polarity - configure polarity interrupt event<br>
&gt; + * @intc: the interrtup controller regmap<br>
&gt; + * @event: the source event<br>
&gt; + */<br>
&gt; +static void ti_pru_init_intc_polarity(<wbr>struct regmap *intc, int e=
vent)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int offset, shift, mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 32 events per register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D event / 32 * 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shift =3D event % 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D 1 &lt;&lt; shift;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* polarity is always high (1) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write_bits(intc, TI_PRU_INTC_POLARITY0 + o=
ffset, mask, ~0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_init_intc_type - configure type of interrupt event<br>
&gt; + * @intc: the interrtup controller regmap<br>
&gt; + * @event: the source event<br>
&gt; + */<br>
&gt; +static void ti_pru_init_intc_type(struct regmap *intc, int event)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int offset, shift, mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 32 events per register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D event / 32 * 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shift =3D event % 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D 1 &lt;&lt; shift;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* type is always pulse (0) */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write_bits(intc, TI_PRU_INTC_TYPE0 + offse=
t, mask, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_init_intc_channel_map - configure interrupt event to channe=
l mapping<br>
&gt; + * @intc: the interrtup controller regmap<br>
&gt; + * @event: the source event<br>
&gt; + * @ch: the channel to be assigned to the event<br>
&gt; + */<br>
&gt; +static void ti_pru_init_intc_channel_map(<wbr>struct regmap *intc, in=
t event, int ch)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int offset, shift, mask, val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 4 channels per 32-bit register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D event / 4 * 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shift =3D event % 4 * 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D 0xff &lt;&lt; shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D ch &lt;&lt; shift;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write_bits(intc, TI_PRU_INTC_CHANMAP0 + of=
fset, mask, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * ti_pru_init_intc_host_map - configure interrupt channel to host ma=
pping<br>
&gt; + * @intc: the interrtup controller regmap<br>
&gt; + * @ch: the source channel<br>
&gt; + * @host: the host interrupt to be assigned to the channel<br>
&gt; + */<br>
&gt; +static void ti_pru_init_intc_host_map(<wbr>struct regmap *intc, int c=
h, int host)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int offset, shift, mask, val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* 4 hosts per 32-bit register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D ch / 4 * 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shift =3D ch % 4 * 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mask =3D 0xff &lt;&lt; shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0val =3D host &lt;&lt; shift;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write_bits(intc, TI_PRU_INTC_HOSTMAP0 + of=
fset, mask, val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ti_pru_init_intc(struct regmap *intc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const struct ti_pru_device_info *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int arm_to_pru0 =3D info-&gt;pru[TI_PRU0].vq_arm_=
to_<wbr>pru_event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int arm_to_pru1 =3D info-&gt;pru[TI_PRU1].vq_arm_=
to_<wbr>pru_event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int pru0_to_arm =3D info-&gt;pru[TI_PRU0].vq_pru_=
to_<wbr>arm_event;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int pru1_to_arm =3D info-&gt;pru[TI_PRU1].vq_pru_=
to_<wbr>arm_event;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* set polarity of system events */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_polarity(<wbr>intc, arm_to_pru0)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_polarity(<wbr>intc, arm_to_pru1)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_polarity(<wbr>intc, pru0_to_arm)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_polarity(<wbr>intc, pru1_to_arm)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* set type of system events */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_type(intc, arm_to_pru0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_type(intc, arm_to_pru1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_type(intc, pru0_to_arm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_type(intc, pru1_to_arm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* map system events to channels */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_channel_map(<wbr>intc, arm_to_pr=
u0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_channel_map(<wbr>intc, arm_to_pr=
u1, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_channel_map(<wbr>intc, pru0_to_a=
rm, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_channel_map(<wbr>intc, pru1_to_a=
rm, 3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* map channels to host interrupts */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_host_map(<wbr>intc, 0, 0); /* AR=
M to PRU0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_host_map(<wbr>intc, 1, 1); /* AR=
M to PRU1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_host_map(<wbr>intc, 2, 2); /* PR=
U0 to ARM */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc_host_map(<wbr>intc, 3, 3); /* PR=
U1 to ARM */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* clear system interrupts */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_STATIDXCLR, arm_to=
_pru0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_STATIDXCLR, arm_to=
_pru1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_STATIDXCLR, pru0_t=
o_arm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_STATIDXCLR, pru1_t=
o_arm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable host interrupts for kicking */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 0)=
; /* ARM to PRU0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 1)=
; /* ARM to PRU1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 2)=
; /* PRU0 to ARM */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_HSTINTENIDXSET, 3)=
; /* PRU1 to ARM */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable system events for kicking */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_ENIDXSET, arm_to_p=
ru0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_ENIDXSET, arm_to_p=
ru1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_ENIDXSET, pru0_to_=
arm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write(intc, TI_PRU_INTC_ENIDXSET, pru1_to_=
arm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable all interrupts */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_write_bits(intc, TI_PRU_INTC_GLBLEN, 1, 1)=
;<br>
&gt; +}<br>
<br>
</div></div>We already have a working irq_chip implementation for INTC.<br>
<a href=3D"https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/ti-linu=
x-4.14.y/drivers/remoteproc/pruss_intc.c" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.ti.com/ti-linux-<wbr>kernel/ti-linux-kernel/blobs/<wbr>ti-l=
inux-4.14.y/drivers/<wbr>remoteproc/pruss_intc.c</a><br>
<br>
I think we can leverage directly from that.<br>
<br>
This way pru_rproc or client device nodes can easily specify a pruss_intc i=
nterrupt parent and the<br>
SYSEVENT number as the irq. Then device drivers can simply use request_irq(=
).<br>
<br>
example usage here<br>
<a href=3D"https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/ti-linu=
x-4.14.y/arch/arm/boot/dts/am33xx.dtsi#line986" rel=3D"noreferrer" target=
=3D"_blank">https://git.ti.com/ti-linux-<wbr>kernel/ti-linux-kernel/blobs/<=
wbr>ti-linux-4.14.y/arch/arm/boot/<wbr>dts/am33xx.dtsi#line986</a><br>
<a href=3D"https://git.ti.com/ti-linux-kernel/ti-linux-kernel/blobs/ti-linu=
x-4.14.y/drivers/remoteproc/pru_rproc.c#line670" rel=3D"noreferrer" target=
=3D"_blank">https://git.ti.com/ti-linux-<wbr>kernel/ti-linux-kernel/blobs/<=
wbr>ti-linux-4.14.y/drivers/<wbr>remoteproc/pru_rproc.c#line670</a></blockq=
uote><div><br></div><div><br></div><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-family:monospace,monospace">=E2=80=8BIs this PRU cod=
e on a path to be added to the mainline kernel?=E2=80=8B There is an increa=
se in the number of available systems which would benefit from consistent P=
RU interfaces. If code is not mainlined, or on a mainline path, some may th=
ink it is not usable or ready for production. Is this a permanent &quot;out=
-of-tree&quot; and/or &quot;TI-tree&quot; development. Just wondering.</div=
></div><div class=3D"gmail_default" style=3D"font-family:monospace,monospac=
e"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mo=
nospace">Derald</div><div class=3D"gmail_default" style=3D"font-family:mono=
space,monospace"><br></div><div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
<div><div class=3D"h5"><br>
<br>
&gt; +<br>
&gt; +static int ti_pru_rproc_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pruss_platform_data *pdata =3D dev_get_=
platdata(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct of_device_id *of_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct ti_pru_device_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_data *shared;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_id =3D of_match_device(ti_pru_rproc_<wbr>of_ma=
tch, dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!of_id || !of_id-&gt;data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info =3D of_id-&gt;data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared =3D devm_kzalloc(dev, sizeof(*shared), GFP=
_KERNEL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, shared);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;info =3D &amp;info-&gt;shared;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;dev =3D dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;base =3D devm_ioremap_resource(dev, re=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(shared-&gt;base)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to ioremap resource\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(shared=
-&gt;base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;intc =3D devm_regmap_init_mmio(dev,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared-&gt;base + shared-&gt;info-&gt;in=
tc.offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ti_pru_intc_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(shared-&gt;intc)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to init intc regmap\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(shared=
-&gt;intc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (shared-&gt;info-&gt;cfg.size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared-&gt;cfg =3D de=
vm_regmap_init_mmio(dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0shared-&gt;base + shared-&gt;info-&gt;cfg.offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&amp;ti_pru_cfg_regmap_config);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(shared-&gt=
;cfg)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;failed to init cfg regmap\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return PTR_ERR(shared-&gt;cfg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;pru[TI_PRU0] =3D ti_pru_init_one_rproc=
(shared, &amp;info-&gt;pru[TI_PRU0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TI_PRU0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(shared-&gt;pru[TI_PRU0]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(shared=
-&gt;pru[TI_PRU0]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0shared-&gt;pru[TI_PRU1] =3D ti_pru_init_one_rproc=
(shared, &amp;info-&gt;pru[TI_PRU1],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TI_PRU1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(shared-&gt;pru[TI_PRU1]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(shared=
-&gt;pru[TI_PRU1]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_enable(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D pm_runtime_get_sync(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_pm_runtime_d=
isable;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pdata) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D pdata-&gt;dea=
ssert_reset(pdev, pdata-&gt;reset_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;Failed to reset pruss\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_pm_runtime_put;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (shared-&gt;cfg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mask, val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D TI_PRU_SYSCF=
G_IDLE_MODE_MASK | TI_PRU_SYSCFG_STANDBY_MODE_<wbr>MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D TI_PRU_SYSCFG=
_IDLE_MODE_SMART | TI_PRU_SYSCFG_STANDBY_MODE_<wbr>SMART;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write_bits(sha=
red-&gt;cfg, TI_PRU_CFG_SYSCFG, mask, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask =3D TI_PRU_SYSCF=
G_STANDBY_INIT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write_bits(sha=
red-&gt;cfg, TI_PRU_CFG_SYSCFG, mask, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D regmap_read_p=
oll_timeout(<wbr>shared-&gt;cfg, TI_PRU_CFG_SYSCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val, !(val &amp; TI_PRU_SYSCFG_SUB_MWAIT=
), 5, 50);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(dev, &quot;timeout while enabling pruss\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto err_pm_runtime_put;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ti_pru_init_intc(shared-&gt;intc, info);<br>
<br>
</div></div>This is using a static INTC map right?<br>
This limits our possibility to use application based INTC mapping.<br>
There needs to be a way to specify the INTC mapping in the DT and/or resour=
ce table.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D rproc_add(shared-&gt;pru[TI_PRU0]<wbr>);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_assert_reset=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D rproc_add(shared-&gt;pru[TI_PRU1]<wbr>);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_del_pru0;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_del_pru0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_del(shared-&gt;pru[TI_PRU0]<wbr>);<br>
&gt; +err_assert_reset:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pdata)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;assert_rese=
t(pdev, pdata-&gt;reset_name);<br>
&gt; +err_pm_runtime_put:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put(dev);<br>
&gt; +err_pm_runtime_disable:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_disable(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return err;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int ti_pru_rproc_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pruss_platform_data *pdata =3D dev_get_=
platdata(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct ti_pru_shared_data *shared =3D platform_ge=
t_drvdata(pdev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_del(shared-&gt;pru[TI_PRU1]<wbr>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rproc_del(shared-&gt;pru[TI_PRU0]<wbr>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (pdata)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pdata-&gt;assert_rese=
t(pdev, pdata-&gt;reset_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_disable(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver ti_pru_rproc_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =3D ti_pru_rproc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D ti_pru_rproc_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;ti-pr=
u-rproc&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D t=
i_pru_rproc_of_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +module_platform_driver(ti_<wbr>pru_rproc_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;David Lechner &lt;<a href=3D"mailto:david@lechnol=
ogy.com">david@lechnology.com</a>&gt;&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;<wbr>Remoteproc driver for TI PRU&quot;);<br=
>
&gt; <br>
<br>
-- <br>
</div></div>cheers,<br>
-roger<br>
<br>
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.<br>
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki<br>
</blockquote></div><br></div></div>

--000000000000fc33ed056fe09d19--
