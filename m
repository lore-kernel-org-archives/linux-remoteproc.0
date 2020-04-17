Return-Path: <michals@xilinx.com>
Return-Path: michal.simek@xilinx.com
Subject: Re: [PATCH v2 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
References: <1587074082-14836-1-git-send-email-ben.levinsky@xilinx.com>
 <1587074082-14836-6-git-send-email-ben.levinsky@xilinx.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <baaa1b13-6ea2-8ca5-6883-46fb9da4f7e8@xilinx.com>
Date: Fri, 17 Apr 2020 08:32:42 +0200
MIME-Version: 1.0
In-Reply-To: <1587074082-14836-6-git-send-email-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ben Levinsky <ben.levinsky@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, michal.simek@xilinx.com, jollys@xilinx.com, rajan.vaja@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy Liang <wendy.liang@xilinx.com>, Ed Mooring <ed.mooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 16. 04. 20 23:54, Ben Levinsky wrote:
> R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> remotproc driver, we can boot the R5 sub-system in different
> configurations.
> 
> Acked-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Acked-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Tested-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> Changes since v1:
> - remove domain struct as per review from Mathieu
> ---
>  drivers/remoteproc/Kconfig                |  10 +
>  drivers/remoteproc/Makefile               |   1 +
>  drivers/remoteproc/zynqmp_r5_remoteproc.c | 911 ++++++++++++++++++++++++++++++
>  3 files changed, 922 insertions(+)
>  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index fbaed07..f094c84 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -222,6 +222,16 @@ config ST_REMOTEPROC
>  	  processor framework.
>  	  This can be either built-in or a loadable module.
>  
> +config ZYNQMP_R5_REMOTEPROC
> +	tristate "ZynqMP_r5 remoteproc support"
> +	depends on ARM64 && PM && ARCH_ZYNQMP
> +	select RPMSG_VIRTIO
> +	select MAILBOX
> +	select ZYNQMP_IPI_MBOX
> +	help
> +	  Say y here to support ZynqMP R5 remote processors via the remote
> +	  processor framework.
> +
>  config ST_SLIM_REMOTEPROC
>  	tristate
>  
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 0effd38..806ac3f 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -27,5 +27,6 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
>  qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
>  obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
> +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> new file mode 100644
> index 0000000..2cfc6b6
> --- /dev/null
> +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> @@ -0,0 +1,911 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Zynq R5 Remote Processor driver
> + *
> + * Copyright (C) 2015 - 2018 Xilinx Inc.
> + * Copyright (C) 2015 Jason Wu <j.wu@xilinx.com>
> + *
> + * Based on origin OMAP and Zynq Remote Processor driver
> + *
> + * Copyright (C) 2012 Michal Simek <monstr@monstr.eu>
> + * Copyright (C) 2012 PetaLogix
> + * Copyright (C) 2011 Texas Instruments, Inc.
> + * Copyright (C) 2011 Google, Inc.
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/cpu.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/genalloc.h>
> +#include <linux/idr.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/zynqmp-ipi-message.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/pfn.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/skbuff.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory instance */
> +
> +#define DEFAULT_FIRMWARE_NAME	"rproc-rpu-fw"
> +
> +/* PM proc states */
> +#define PM_PROC_STATE_ACTIVE 1U
> +
> +/* IPI buffer MAX length */
> +#define IPI_BUF_LEN_MAX	32U
> +/* RX mailbox client buffer max length */
> +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> +				 sizeof(struct zynqmp_ipi_message))
> +
> +static bool autoboot __read_mostly;
> +
> +static const struct zynqmp_eemi_ops *eemi_ops;

Take a look at Jolly's series which she sent recently and use the same
style as was recommended by Greg.

Thanks,
Michal
