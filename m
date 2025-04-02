Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F802AEE9;
	Wed,  2 Apr 2025 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592591; cv=none; b=I1AVy6/hj+XBHxns1Km0on5XYUSrN+3cZ/B/vTFArLtU86+gpMHBrYNn+xQw12PuTNCpg6naXra4fuuCcAMJEVrOLiq34nvQTzGHNEaukKCyUR+TU9qvwaI0v3278hWdBzTJGjQ7XcuZNypRrKgRxXO6F8TpMfBgp/KToLQENgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592591; c=relaxed/simple;
	bh=aa/nGXeKGBrTAJuSQvZsuZn5qbkOIP4xJbyuZwTXaho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYobJ+enKiaBIDDFkJjOF088HNqtUOIEmVxKVxRLh0qKXJ7qaUQpHK53tO0Rdaah9oPQMeohcQWNSl8FQ1IbZ6eqRqVFYHCbOK72qdS3ihfeWZLkYPub3oEkNF0m4QigbtSfHqGPzhTHGaw3jy5PwbRR3QD0eSV9s79dsdjPAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiuJe+pI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiuJe+pI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F380C4CEDD;
	Wed,  2 Apr 2025 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743592590;
	bh=aa/nGXeKGBrTAJuSQvZsuZn5qbkOIP4xJbyuZwTXaho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iiuJe+pI82+1UWJnEI7sIfPlrH67k0Bq5CU0kYZUKFrM32OTNaaoHhx0uB52T3xOx
	 OeH58EraILXDvWttZrsyUiSjTJA5pB2sp4+9f2CAo5RFzk2Sw/tbLxQuwTenembbpG
	 DYjuo0f0TmudV4q3QSQO7tSAyrno7xwsf6M327A6SJYp3RSvaNiGLAdsCMaWMxEcMR
	 2/jSshy+r7JERV+KFgrtZ2Vs6XPS/r1sra4QN8VYv5FZ0I7eFQd7zn49sQR20Oqdjr
	 yJe6QTP9l7AbuwdkVvnwgxf7H+QZMxNLFmErE3f8hNXlNeg37hHDOHXLjYEUEfX6fD
	 UBoROEuObUX9g==
Message-ID: <aa757d1f-4c5a-4a66-aa96-9d611a8e6bae@kernel.org>
Date: Wed, 2 Apr 2025 13:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoterpoc: mediatek: vcp: Add vcp remoteproc driver
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jjian.zhou@mediatek.com,
 hailong.fan@mediatek.com
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
 <20250402092134.12293-3-xiangzhi.tang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250402092134.12293-3-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 11:19, Xiangzhi Tang wrote:
> Add host driver to control the mediatek Risc-V coprocessor
> 
> 1.Support rproc mechanism to load vcm firmware from filesystem
> 2.Support SMC services to request ATF to setting vcp boot sequence
> 3.Host communicated with VCP depends on VCP IPC interfaces
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  drivers/remoteproc/Kconfig                |  12 +
>  drivers/remoteproc/Makefile               |   4 +
>  drivers/remoteproc/mtk_vcp_common.c       | 982 ++++++++++++++++++++++
>  drivers/remoteproc/mtk_vcp_common.h       | 251 ++++++
>  drivers/remoteproc/mtk_vcp_rproc.c        | 724 ++++++++++++++++
>  drivers/remoteproc/mtk_vcp_rproc.h        | 107 +++
>  include/linux/remoteproc/mtk_vcp_public.h | 138 +++
>  include/linux/soc/mediatek/mtk_sip_svc.h  |   3 +
>  8 files changed, 2221 insertions(+)
>  create mode 100644 drivers/remoteproc/mtk_vcp_common.c
>  create mode 100644 drivers/remoteproc/mtk_vcp_common.h
>  create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
>  create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
>  create mode 100644 include/linux/remoteproc/mtk_vcp_public.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 83962a114dc9..28e71c6c6dd3 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -64,6 +64,18 @@ config MTK_SCP
>  
>  	  It's safe to say N here.
>  
> +config MTK_VCP_RPROC
> +	tristate "MediaTek VCP support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_DMA_ADDR_T_64BIT
> +	select MTK_VCP_IPC
> +	select MTK_VCP_MBOX
> +	help
> +	  Say y here to support MediaTek's Video Companion Processor (VCP) via
> +	  the remote processor framework.
> +
> +	  It's safe to say N here.
> +
>  config OMAP_REMOTEPROC
>  	tristate "OMAP remoteproc support"
>  	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 5ff4e2fee4ab..327043b31b37 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -15,6 +15,10 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>  obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>  obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> +obj-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp.o
> +mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_rproc.o
> +mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_irq.o
> +mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_loader.o
>  obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>  obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
> diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
> new file mode 100644
> index 000000000000..e02c6e61b990
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_vcp_common.c
> @@ -0,0 +1,982 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/fs.h>
> +#include <linux/interrupt.h>
> +#include <linux/iommu.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/poll.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/timer.h>
> +#include <uapi/linux/dma-heap.h>
> +
> +#include "mtk_vcp_common.h"
> +#include "mtk_vcp_rproc.h"
> +
> +static bool vcp_ready[VCP_CORE_TOTAL];
> +/* vcp ready status for notify */
> +static DEFINE_MUTEX(vcp_ready_mutex);
> +static DEFINE_MUTEX(vcp_pw_clk_mutex);
> +static DEFINE_MUTEX(vcp_A_notify_mutex);
> +static DEFINE_MUTEX(vcp_feature_mutex);

Way too many global variables and mutexes.  Why is all this designed as
singleton?


...

> +int vcp_wdt_irq_init(struct mtk_vcp_device *vcp)
> +{
> +	int ret;
> +
> +	ret = devm_request_irq(vcp->dev, platform_get_irq(vcp->pdev, 0),
> +			       vcp_irq_handler, IRQF_ONESHOT,
> +			       vcp->pdev->name, vcp);
> +	if (ret)
> +		dev_err(vcp->dev, "failed to request wdt irq\n");
> +
> +	return ret;
> +}
> +
> +MODULE_AUTHOR("Xiangzhi Tang <xiangzhi.tang@mediatek.com>");
> +MODULE_DESCRIPTION("MTK VCP Controller");
> +MODULE_LICENSE("GPL");

How many drivers do you have? I think I saw only one in Makefile.


...

> +static const struct rproc_ops mtk_vcp_ops = {
> +	.load		= mtk_vcp_load,
> +	.start		= mtk_vcp_start,
> +	.stop		= mtk_vcp_stop,
> +};
> +
> +
> +struct mtk_mbox_send_table send_data[] = {

Why not static? Not const?

> +	{ .msg_size = 18, .ipi_id =  0, .mbox_id = 0 },
> +
> +	{ .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
> +	{ .msg_size = 18, .ipi_id = 16, .mbox_id = 1 },
> +	{ .msg_size =  2, .ipi_id =  9, .mbox_id = 1 },
> +
> +	{ .msg_size = 18, .ipi_id = 11, .mbox_id = 2 },
> +	{ .msg_size =  2, .ipi_id =  2, .mbox_id = 2 },
> +	{ .msg_size =  3, .ipi_id =  3, .mbox_id = 2 },
> +	{ .msg_size =  2, .ipi_id = 32, .mbox_id = 2 },
> +
> +	{ .msg_size =  2, .ipi_id = 33, .mbox_id = 3 },
> +	{ .msg_size =  2, .ipi_id = 13, .mbox_id = 3 },
> +	{ .msg_size =  2, .ipi_id = 35, .mbox_id = 3 },
> +
> +	{ .msg_size =  2, .ipi_id = 20, .mbox_id = 4 },
> +	{ .msg_size =  3, .ipi_id = 21, .mbox_id = 4 },
> +	{ .msg_size =  2, .ipi_id = 23, .mbox_id = 4 }
> +};
> +
> +struct mtk_mbox_recv_table recv_data[] = {
> +	{ .recv_opt = 0, .msg_size = 18, .ipi_id =  1, .mbox_id = 0 },
> +
> +	{ .recv_opt = 1, .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
> +	{ .recv_opt = 0, .msg_size = 18, .ipi_id = 17, .mbox_id = 1 },
> +	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 10, .mbox_id = 1 },
> +
> +	{ .recv_opt = 0, .msg_size = 18, .ipi_id = 12, .mbox_id = 2 },
> +	{ .recv_opt = 0, .msg_size =  1, .ipi_id =  5, .mbox_id = 2 },
> +	{ .recv_opt = 1, .msg_size =  1, .ipi_id =  2, .mbox_id = 2 },
> +
> +	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 34, .mbox_id = 3 },
> +	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 14, .mbox_id = 3 },
> +
> +	{ .recv_opt = 0, .msg_size =  1, .ipi_id = 26, .mbox_id = 4 },
> +	{ .recv_opt = 1, .msg_size =  1, .ipi_id = 20, .mbox_id = 4 }
> +};
> +
> +struct mtk_mbox_table ipc_table = {
> +	.send_table = {
> +		{ .msg_size = 18, .ipi_id =  0, .mbox_id = 0 },
> +
> +		{ .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
> +		{ .msg_size = 18, .ipi_id = 16, .mbox_id = 1 },
> +		{ .msg_size =  2, .ipi_id =  9, .mbox_id = 1 },
> +
> +		{ .msg_size = 18, .ipi_id = 11, .mbox_id = 2 },
> +		{ .msg_size =  2, .ipi_id =  2, .mbox_id = 2 },
> +		{ .msg_size =  3, .ipi_id =  3, .mbox_id = 2 },
> +		{ .msg_size =  2, .ipi_id = 32, .mbox_id = 2 },
> +
> +		{ .msg_size =  2, .ipi_id = 33, .mbox_id = 3 },
> +		{ .msg_size =  2, .ipi_id = 13, .mbox_id = 3 },
> +		{ .msg_size =  2, .ipi_id = 35, .mbox_id = 3 },
> +
> +		{ .msg_size =  2, .ipi_id = 20, .mbox_id = 4 },
> +		{ .msg_size =  3, .ipi_id = 21, .mbox_id = 4 },
> +		{ .msg_size =  2, .ipi_id = 23, .mbox_id = 4 }
> +	},
> +	.recv_table = {
> +		{ .recv_opt = 0, .msg_size = 18, .ipi_id =  1, .mbox_id = 0 },
> +
> +		{ .recv_opt = 1, .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
> +		{ .recv_opt = 0, .msg_size = 18, .ipi_id = 17, .mbox_id = 1 },
> +		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 10, .mbox_id = 1 },
> +
> +		{ .recv_opt = 0, .msg_size = 18, .ipi_id = 12, .mbox_id = 2 },
> +		{ .recv_opt = 0, .msg_size =  1, .ipi_id =  5, .mbox_id = 2 },
> +		{ .recv_opt = 1, .msg_size =  1, .ipi_id =  2, .mbox_id = 2 },
> +
> +		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 34, .mbox_id = 3 },
> +		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 14, .mbox_id = 3 },
> +
> +		{ .recv_opt = 0, .msg_size =  1, .ipi_id = 26, .mbox_id = 4 },
> +		{ .recv_opt = 1, .msg_size =  1, .ipi_id = 20, .mbox_id = 4 }
> +	},
> +	.recv_count = ARRAY_SIZE(recv_data),
> +	.send_count = ARRAY_SIZE(send_data),
> +};
> +
> +static int vcp_ipi_mbox_init(struct mtk_vcp_device *vcp)
> +{
> +	struct mtk_vcp_ipc *vcp_ipc;
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	pdev = platform_device_register_data(vcp->dev, "mtk-vcp-ipc",
> +					     PLATFORM_DEVID_NONE, &ipc_table,
> +					     sizeof(ipc_table));
> +	if (IS_ERR(pdev)) {
> +		ret = PTR_ERR(pdev);
> +		dev_err(vcp->dev, "failed to create mtk-vcp-ipc device\n");
> +		return ret;
> +	}
> +
> +	vcp_ipc = dev_get_drvdata(&pdev->dev);
> +	if (!vcp_ipc) {
> +		ret = -EPROBE_DEFER;
> +		dev_err(vcp->dev, "failed to get drvdata\n");
> +		return ret;
> +	}
> +
> +	ret = mtk_vcp_ipc_device_register(vcp->ipi_dev, VCP_IPI_COUNT, vcp_ipc);
> +	if (ret) {
> +		dev_err(vcp->dev, "ipi_dev_register failed, ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int vcp_multi_core_init(struct platform_device *pdev,
> +			       struct mtk_vcp_of_cluster *vcp_cluster,
> +			       enum vcp_core_id core_id)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "twohart",
> +				   &vcp_cluster->twohart[core_id]);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to twohart property\n");
> +		return ret;
> +	}
> +	ret = of_property_read_u32(pdev->dev.of_node, "sram-offset",
> +				   &vcp_cluster->sram_offset[core_id]);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to sram-offset property\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static bool vcp_is_single_core(struct platform_device *pdev,
> +			       struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +	u32 num_cores = 0;
> +
> +	for_each_available_child_of_node(np, child)
> +		num_cores++;
> +	vcp_cluster->core_nums = num_cores;
> +
> +	return num_cores < VCP_CORE_TOTAL ? true : false;
> +}
> +
> +static int vcp_add_single_core(struct platform_device *pdev,
> +			       struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	return 0;
> +}
> +
> +static int vcp_add_multi_core(struct platform_device *pdev,
> +			      struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +	struct platform_device *cpdev;
> +	struct mtk_vcp_device *vcp;
> +	struct rproc *rproc;
> +	const struct mtk_vcp_of_data *vcp_of_data;
> +	int ret = 0;
> +
> +	vcp_of_data = of_device_get_match_data(dev);
> +	rproc = devm_rproc_alloc(dev, np->name, &mtk_vcp_ops,
> +				 vcp_of_data->platdata.fw_name,
> +				 sizeof(struct mtk_vcp_device));
> +	if (!rproc)
> +		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");

This does not look right. Allocation failures should not result in printks.


...

> +
> +	for_each_available_child_of_node(np, child) {
> +		if (of_device_is_compatible(child, "mediatek,vcp-core")) {
> +			cpdev = of_find_device_by_node(child);
> +			if (!cpdev) {
> +				ret = -ENODEV;
> +				dev_err(dev, "Not found platform device for core\n");

You leak np, use scoped.

> +				return ret;
> +			}
> +			ret = vcp_multi_core_init(cpdev, vcp_cluster, VCP_ID);
> +		} else if (of_device_is_compatible(child, "mediatek,mmup-core")) {
> +			cpdev = of_find_device_by_node(child);
> +			if (!cpdev) {
> +				ret = -ENODEV;
> +				dev_err(dev, "Not found platform device for core\n");
> +				return ret;

Same problems.

> +			}
> +			ret = vcp_multi_core_init(cpdev, vcp_cluster, MMUP_ID);
> +		}
> +	}


..


> +static struct platform_driver mtk_vcp_device = {
> +	.probe = vcp_device_probe,
> +	.remove = vcp_device_remove,
> +	.shutdown = vcp_device_shutdown,
> +	.driver = {
> +		.name = "mtk-vcp",
> +		.owner = THIS_MODULE,

Clean your driver from all 10-yo code, before you upstream... Or just
start from recent driver so you won't repeat the same mistakes/issues we
already fixed.

> +		.of_match_table = of_match_ptr(vcp_of_ids),

Same, drop of_match_ptr.


Best regards,
Krzysztof
