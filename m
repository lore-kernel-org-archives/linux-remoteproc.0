Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D42F1FD9;
	Mon, 15 Sep 2025 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757927684; cv=none; b=HBFm+XDo1TuWXoCiRSKsQqjFAXTxYwE45/RwnIIvXe0rng7ODCYe50l/EADxSMjP/7Gti32SsOF344Dv3qd4iSsIntx7SHWL/leD8AqPcjBsURA1ztLMC819lIcnC88v6vrin51Sl9ph+TZrHjrcemYXEBIE4yuovp0ewW/eIuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757927684; c=relaxed/simple;
	bh=IOM3XLs9yKT6+Wylqj+IqDd/RU7qaekPa/dNI4I7+ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCmb6f+4qoT+/V08qxyhEhVdUfqfVpyItnsfHrMkmOrWpjQfeN2lQXNwYWeuSyhJI+meUpGQ06qy2dbhpHM2n1OLij9pM4SqPQOPaOAByjF8vjY1piRUfDY0GNmj505TbDyJAhBtpMYSiUk0/FnQZSBdDyXUjADT07106We7bkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SmPar0oU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SmPar0oU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757927678;
	bh=IOM3XLs9yKT6+Wylqj+IqDd/RU7qaekPa/dNI4I7+ss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SmPar0oU+UiRFGBCVOxwpJj0TURR9kezfTGq5T6Vx1b8mdjcP9HznJX9sijZpXQRg
	 4Xi2d4sYHw6GQcfFkTnDCkWe2xfgwxncEWntYEOA1egMveTVrBDtHkfQnF6K4Q0gvO
	 ShPMFx51H84c1EjIKbE0zVHzNH79FTqj5ct+mNpK1K3umRbyyXPkaUZ1yV/hQCnnqM
	 CDjlkqxuBIhdK6494SSgXkbx9L8d/RyxVMmIvZpuxm39qWcQ1Ch/QHBU4KM/LCUS9Y
	 RJVe+TRm86qs8uF/qqXFVVfJfzCrvqSL7BWAl8ZZp4FViuwmn4+q3TChv+xClkXe4J
	 YUzn3OZM5/p2g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 680A417E0C21;
	Mon, 15 Sep 2025 11:14:38 +0200 (CEST)
Message-ID: <cee95a19-fd01-40e5-b2df-2e2e0d4ff760@collabora.com>
Date: Mon, 15 Sep 2025 11:14:37 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] remoterpoc: mediatek: vcp: Add vcp remoteproc
 driver
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jjian Zhou <Jjian.Zhou@mediatek.com>,
 Hailong Fan <Hailong.Fan@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-3-xiangzhi.tang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914122943.10412-3-xiangzhi.tang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/09/25 14:29, Xiangzhi Tang ha scritto:
> Add host driver to control the mediatek Risc-V coprocessor
> 
> 1.Support rproc mechanism to load vcm firmware from filesystem
> 2.Support SMC services to request ATF to setting vcp boot sequence
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>   drivers/remoteproc/Kconfig                |  10 +
>   drivers/remoteproc/Makefile               |   3 +
>   drivers/remoteproc/mtk_vcp_common.c       | 677 ++++++++++++++++++++++
>   drivers/remoteproc/mtk_vcp_common.h       | 225 +++++++
>   drivers/remoteproc/mtk_vcp_rproc.c        | 326 +++++++++++
>   drivers/remoteproc/mtk_vcp_rproc.h        |  71 +++
>   include/linux/remoteproc/mtk_vcp_public.h |  78 +++
>   include/linux/soc/mediatek/mtk_sip_svc.h  |   3 +
>   8 files changed, 1393 insertions(+)
>   create mode 100644 drivers/remoteproc/mtk_vcp_common.c
>   create mode 100644 drivers/remoteproc/mtk_vcp_common.h
>   create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
>   create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
>   create mode 100644 include/linux/remoteproc/mtk_vcp_public.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed0..1a9bb49a8a28 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -64,6 +64,16 @@ config MTK_SCP
>   
>   	  It's safe to say N here.
>   
> +config MTK_VCP_RPROC
> +	tristate "MediaTek VCP support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on ARCH_DMA_ADDR_T_64BIT
> +	help
> +	  Say y here to support MediaTek's Video Companion Processor (VCP) via
> +	  the remote processor framework.
> +
> +	  It's safe to say N here.
> +
>   config OMAP_REMOTEPROC
>   	tristate "OMAP remoteproc support"
>   	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 1c7598b8475d..ad48d85c5019 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -15,6 +15,9 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>   obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
>   obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>   obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
> +obj-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp.o
> +mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_rproc.o
> +mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_common.o
>   obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>   obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>   obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
> diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
> new file mode 100644
> index 000000000000..d53e311c4981
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_vcp_common.c
> @@ -0,0 +1,677 @@
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
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/slab.h>
> +#include <uapi/linux/dma-heap.h>
> +
> +#include "mtk_vcp_common.h"
> +#include "mtk_vcp_rproc.h"
> +
> +struct vcp_feature_tb feature_table[NUM_FEATURE_ID] = {

I really don't like seeing those two global variables. This will backfire one day,
especially because this is multicore hardware.

> +	{
> +		.feature    = RTOS_FEATURE_ID,
> +		.core_id    = VCP_CORE_TOTAL,
> +	},
> +	{
> +		.feature    = VDEC_FEATURE_ID,
> +		.core_id    = VCP_ID,
> +	},
> +	{
> +		.feature    = VENC_FEATURE_ID,
> +		.core_id    = VCP_ID,
> +	},
> +	{
> +		.feature    = MMDVFS_MMUP_FEATURE_ID,
> +		.core_id    = MMUP_ID,
> +	},
> +	{
> +		.feature    = MMDVFS_VCP_FEATURE_ID,
> +		.core_id    = VCP_ID,
> +	},
> +	{
> +		.feature    = MMDEBUG_FEATURE_ID,
> +		.core_id    = MMUP_ID,
> +	},
> +	{
> +		.feature    = VMM_FEATURE_ID,
> +		.core_id    = MMUP_ID,
> +	},
> +	{
> +		.feature    = VDISP_FEATURE_ID,
> +		.core_id    = MMUP_ID,
> +	},
> +	{
> +		.feature    = MMQOS_FEATURE_ID,
> +		.core_id    = VCP_ID,
> +	},
> +};
> +
> +static struct vcp_reserve_mblock vcp_reserve_mblock[] = {

(same here)

> +	{
> +		.num = VCP_RTOS_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +	{
> +		.num = VDEC_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +	{
> +		.num = VENC_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +	{
> +		.num = MMDVFS_VCP_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +	{
> +		.num = MMDVFS_MMUP_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +	{
> +		.num = MMQOS_MEM_ID,
> +		.start_phys = 0x0,
> +		.start_iova = 0x0,
> +		.start_virt = 0x0,
> +		.size = 0x0,
> +	},
> +};
> +
> +phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id)

Functions that you're exporting *shall* be documented.

That's also because I'm not sure that this is the best way of doing whatever you're
trying to do here (and besides, I'm not sure what this function is used for).

> +{
> +	if (id >= 0 && id < NUMS_MEM_ID)
> +		return vcp_reserve_mblock[id].start_phys;
> +
> +	return 0;
> +}
> +
> +dma_addr_t vcp_get_reserve_mem_iova(enum vcp_reserve_mem_id_t id)
> +{
> +	if (id >= 0 && id < NUMS_MEM_ID)
> +		return vcp_reserve_mblock[id].start_iova;
> +
> +	return 0;
> +}
> +
> +void __iomem *vcp_get_reserve_mem_virt(enum vcp_reserve_mem_id_t id)
> +{
> +	if (id >= 0 && id < NUMS_MEM_ID)
> +		return vcp_reserve_mblock[id].start_virt;
> +
> +	return NULL;
> +}
> +
> +u32 vcp_get_reserve_mem_size(enum vcp_reserve_mem_id_t id)
> +{
> +	if (id >= 0 && id < NUMS_MEM_ID)
> +		return vcp_reserve_mblock[id].size;
> +
> +	return 0;
> +}
> +
> +void __iomem *vcp_get_internal_sram_virt(struct mtk_vcp_device *vcp)
> +{
> +	return vcp->vcp_cluster->sram_base;
> +}
> +
> +int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp)
> +{
> +#define MEMORY_TBL_ELEM_NUM (2)
> +	u32 num = (u32)(sizeof(vcp_reserve_mblock)
> +			/ sizeof(vcp_reserve_mblock[0]));
> +	enum vcp_reserve_mem_id_t id;
> +	u32 vcp_mem_num;
> +	u32 i, m_idx, m_size;
> +	u32 offset;
> +	struct device_node *rmem_node;
> +	struct resource res;
> +	struct iommu_domain *domain;
> +	void __iomem *share_memory_virt;
> +	phys_addr_t mblock_start_phys;
> +	dma_addr_t share_memory_iova;
> +	size_t share_memory_size;
> +	int ret;
> +
> +	if (num != NUMS_MEM_ID) {
> +		dev_err(vcp->dev, "actual memory num(%u) is not match mem ID table (%u)\n",
> +			num, NUMS_MEM_ID);
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	rmem_node = of_parse_phandle(vcp->dev->of_node, "memory-region", 0);
> +	if (!rmem_node) {
> +		dev_err(vcp->dev, "No reserved memory region found.\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(rmem_node, 0, &res);
> +	if (ret) {
> +		dev_err(vcp->dev, "failed to parse reserved memory: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mblock_start_phys = (phys_addr_t)res.start;
> +
> +	/* Set reserved memory table */
> +	vcp_mem_num = of_property_count_u32_elems(vcp->dev->of_node, "vcp-mem-tbl")

First of all, vendor properties must have a vendor prefix (mediatek,vcp-mem-tbl).

But then... is this memory table static, or is it dynamic?

If it's static -> read it from the firmware!
If it's dynamic -> dynamically calculate it in the driver perhaps?

> +		      / MEMORY_TBL_ELEM_NUM;
> +	if (vcp_mem_num <= 0) {
> +		dev_warn(vcp->dev, "vcp-mem-tbl not found\n");
> +		vcp_mem_num = 0;
> +	}
> +
> +	for (i = 0; i < vcp_mem_num; i++) {
> +		ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
> +						 i * MEMORY_TBL_ELEM_NUM, &m_idx);
> +		if (ret) {
> +			dev_err(vcp->dev, "cannot get memory index(%d)\n", i);
> +			return -EINVAL;
> +		}
> +
> +		ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
> +						 (i * MEMORY_TBL_ELEM_NUM) + 1, &m_size);
> +		if (ret) {
> +			dev_err(vcp->dev, "Cannot get memory size(%d)(%d)\n", i, m_idx);
> +			return -EINVAL;
> +		}
> +
> +		if (m_idx >= NUMS_MEM_ID) {
> +			dev_warn(vcp->dev, "skip unexpected index, %d\n", m_idx);
> +			continue;
> +		}
> +
> +		vcp_reserve_mblock[m_idx].size = m_size;
> +	}
> +
> +	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys = mblock_start_phys;
> +	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_virt = devm_ioremap(vcp->dev,
> +				vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
> +				vcp_reserve_mblock[VCP_RTOS_MEM_ID].size);
> +	domain = iommu_get_domain_for_dev(vcp->dev);
> +	ret = iommu_map(domain, vcp->platdata->rtos_static_iova,
> +			vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
> +			vcp_reserve_mblock[VCP_RTOS_MEM_ID].size,
> +			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(vcp->dev, "%s iommu map fail, ret:%d.\n", __func__, ret);
> +		return ret;
> +	}
> +	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_iova = vcp->platdata->rtos_static_iova;
> +
> +	share_memory_size = 0;
> +	for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++) {
> +		if (vcp_reserve_mblock[id].size == 0)
> +			continue;
> +		share_memory_size += vcp_reserve_mblock[id].size;
> +	}
> +
> +	ret = dma_set_mask_and_coherent(vcp->dev, DMA_BIT_MASK(DMA_MAX_MASK_BIT));
> +	if (ret) {
> +		dev_err(vcp->dev, "64-bit DMA enable failed\n");
> +		return ret;
> +	}
> +
> +	if (!vcp->dev->dma_parms) {
> +		vcp->dev->dma_parms = devm_kzalloc(vcp->dev,
> +						   sizeof(*vcp->dev->dma_parms),
> +						   GFP_KERNEL);
> +		if (vcp->dev->dma_parms) {
> +			dma_set_max_seg_size(vcp->dev, (u32)DMA_BIT_MASK(33));
> +		} else {
> +			dev_err(vcp->dev, "Failed to set DMA parms\n");
> +			return -EINVAL;
> +		}
> +	}
> +	share_memory_virt = dma_alloc_coherent(vcp->dev,
> +					       share_memory_size,
> +					       &share_memory_iova,
> +					       GFP_KERNEL);
> +	if (!share_memory_virt)
> +		return -ENOMEM;
> +	offset = 0;
> +	for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++)  {
> +		if (vcp_reserve_mblock[id].size == 0)
> +			continue;
> +
> +		vcp_reserve_mblock[id].start_phys = vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys +
> +						    vcp_reserve_mblock[VCP_RTOS_MEM_ID].size +
> +						    offset;
> +		vcp_reserve_mblock[id].start_iova = share_memory_iova + offset;
> +		vcp_reserve_mblock[id].start_virt = share_memory_virt + offset;
> +		offset += (u32)vcp_reserve_mblock[id].size;
> +	}
> +
> +	vcp->vcp_cluster->share_mem_iova = share_memory_iova;
> +	vcp->vcp_cluster->share_mem_size = share_memory_size;
> +
> +	return 0;
> +}
> +
> +static bool is_vcp_ready_by_coreid(enum vcp_core_id core_id)

static bool vcp_is_core_ready(enum vcp_core_id core_id)

this name looks better imo.

> +{
> +	struct device *dev;
> +	struct mtk_vcp_device *vcp;
> +
> +	dev = feature_table[RTOS_FEATURE_ID].priv;

I'd have some comments for this, but the most important one is that the
feature_table should really not be a global variable - so it's useless
for me to add comments here, because this function will probably change
quite a bit after that.

> +	if (!dev)
> +		return false;
> +	vcp = platform_get_drvdata(to_platform_device(dev));
> +	if (!vcp)
> +		return false;
> +
> +	switch (core_id) {
> +	case VCP_ID:
> +		return vcp->vcp_cluster->vcp_ready[VCP_ID];
> +	case MMUP_ID:
> +		return vcp->vcp_cluster->vcp_ready[MMUP_ID];
> +	case VCP_CORE_TOTAL:
> +	default:
> +		return vcp->vcp_cluster->vcp_ready[VCP_ID] &
> +		       vcp->vcp_cluster->vcp_ready[MMUP_ID];
> +	}
> +}
> +
> +u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
> +			    enum vcp_core_id core_id)
> +{
> +	u32 retry;
> +	bool twohart_support;
> +	u32 core_hart0;
> +	u32 core_hart1;

Not sure why you're not using readl_poll_timeout() or readx_poll_timeout().

You really should.

> +
> +	twohart_support = vcp->vcp_cluster->twohart[core_id];
> +
> +	for (retry = VCP_AWAKE_TIMEOUT; retry > 0; retry--) {
> +		switch (core_id) {
> +		case VCP_ID:
> +			core_hart0 = readl(vcp->vcp_cluster->cfg + VCP_C0_GPR5_H0_REBOOT);
> +			if (twohart_support)
> +				core_hart1 = readl(vcp->vcp_cluster->cfg + VCP_C0_GPR6_H1_REBOOT);
> +			break;
> +		case MMUP_ID:
> +			core_hart0 = readl(vcp->vcp_cluster->cfg + VCP_C1_GPR5_H0_REBOOT);
> +			if (twohart_support)
> +				core_hart1 = readl(vcp->vcp_cluster->cfg + VCP_C1_GPR6_H1_REBOOT);
> +			break;
> +		case VCP_CORE_TOTAL:
> +		default:
> +			break;
> +		}
> +
> +		if (twohart_support) {
> +			if (core_hart0 == CORE_RDY_TO_REBOOT &&
> +			    core_hart1 == CORE_RDY_TO_REBOOT)
> +				break;
> +		} else {
> +			if (core_hart0 == CORE_RDY_TO_REBOOT)
> +				break;
> +		}
> +		usleep_range(USDELAY_RANGE_MIN, USDELAY_RANGE_MAX);
> +	}
> +
> +	return retry;
> +}
> +

static void vcp_set_carveouts(struct mtk_vcp_of_cluster *vcp_cluster,
			      u32 gpr1_offset, u32 gpr2_offset)
{
	/* Write VCP reserved memory address/size to GPR1/GPR2 to setup VCP MPU */
	writel((u32)VCP_PACK_IOVA(vcp_cluster->share_mem_iova), vcp_cluster->cfg + 
gpr1_offset);
	writel((u32)vcp_cluster->share_mem_size, vcp_cluster->cfg + gpr2_offset);
}

static int reset_vcp(struct mtk_vcp_device *vcp)
{
	if (vcp->cluster->core_nums >= MMUP_ID) {
		vcp_set_carveouts(vcp->cluster, VCP_C1_GPR1_DRAM_RESV_ADDR,
				  VCP_C2_GPR2_DRAM_RESV_SIZE);
		arm_smccc_smc(.....)
	}

	vcp_set_carveouts(....)
	arm_smccc_smc(....)

	return 0;
}

looks better, but that's only for readability - not everyone likes that anyway
so you're free to do it like that or just cleanup the commits in your own version
of reset_vcp().

> +static int reset_vcp(struct mtk_vcp_device *vcp)
> +{
> +	struct arm_smccc_res res;
> +
> +	if (vcp->vcp_cluster->core_nums >= MMUP_ID) {
> +		/* write vcp reserved memory address/size to GRP1/GRP2
> +		 * to let vcp setup MPU
> +		 */
> +		writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
> +		       vcp->vcp_cluster->cfg + VCP_C1_GPR1_DRAM_RESV_ADDR);
> +		writel((u32)vcp->vcp_cluster->share_mem_size,
> +		       vcp->vcp_cluster->cfg + VCP_C1_GPR2_DRAM_RESV_SIZE);
> +
> +		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +			      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
> +			      1, 0, 0, 0, 0, 0, &res);
> +	}
> +
> +	/* write vcp reserved memory address/size to GRP1/GRP2
> +	 * to let vcp setup MPU
> +	 */
> +	writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
> +	       vcp->vcp_cluster->cfg + VCP_C0_GPR1_DRAM_RESV_ADDR);
> +	writel((u32)vcp->vcp_cluster->share_mem_size,
> +	       vcp->vcp_cluster->cfg + VCP_C0_GPR2_DRAM_RESV_SIZE);
> +
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
> +		      1, 0, 0, 0, 0, 0, &res);
> +	return 0;
> +}
> +
> +static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
> +{
> +	mutex_lock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +	if (vcp->vcp_cluster->pwclkcnt == 0) {
> +		if (!is_vcp_ready_by_coreid(VCP_CORE_TOTAL)) {
> +			if (reset_vcp(vcp)) {
> +				mutex_unlock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +	vcp->vcp_cluster->pwclkcnt++;
> +	mutex_unlock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +
> +	return 0;
> +}
> +
> +static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
> +{
> +	mutex_lock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +	vcp->vcp_cluster->pwclkcnt--;
> +	if (vcp->vcp_cluster->pwclkcnt < 0) {
> +		for (u32 i = 0; i < NUM_FEATURE_ID; i++)
> +			dev_warn(vcp->dev, "%s Check feature id %d enable cnt %d\n",
> +				 __func__, feature_table[i].feature, feature_table[i].enable);
> +		vcp->vcp_cluster->pwclkcnt = 0;
> +		return -EINVAL;
> +	}
> +	mutex_unlock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +
> +	return 0;
> +}
> +
> +int vcp_A_register_feature(struct mtk_vcp_device *vcp, enum feature_id id)
> +{
> +	int ret;
> +
> +	if (id >= NUM_FEATURE_ID) {
> +		dev_err(vcp->dev, "%s unsupported feature id %d\n",
> +			__func__, id);
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
> +	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
> +		if (feature_table[i].feature == id)
> +			feature_table[i].enable++;
> +		if (id == RTOS_FEATURE_ID)
> +			feature_table[i].priv = vcp->dev;
> +	}
> +	ret = vcp_enable_pm_clk(vcp, id);
> +	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
> +
> +	return ret;
> +}
> +
> +int vcp_A_deregister_feature(struct mtk_vcp_device *vcp, enum feature_id id)
> +{
> +	int ret;
> +
> +	if (id >= NUM_FEATURE_ID) {
> +		dev_warn(vcp->dev, "%s unsupported feature id %d\n",
> +			 __func__, id);
> +		return -EINVAL;
> +	}
> +	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
> +	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {

if (id != feature_table[i].feature)
	continue;

if (feature_table[i].enable == 0) {
	dev_warn .... etc etc
}

feature_table[i].enable--;

> +		if (feature_table[i].feature == id) {
> +			if (feature_table[i].enable == 0) {
> +				dev_warn(vcp->dev, "%s unbalanced feature id %d enable cnt %d\n",
> +					 __func__, id, feature_table[i].enable);
> +				mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
> +				return -EINVAL;
> +			}
> +			feature_table[i].enable--;
> +		}
> +	}
> +	ret = vcp_disable_pm_clk(vcp, id);
> +	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
> +
> +	return ret;
> +}
> +
> +static size_t load_part_binary(void __iomem *image_buf,
> +			       const u8 *fw_src,
> +			       size_t size,
> +			       const char *part_bin_name)
> +{
> +	const u8 *fw_ptr = fw_src;
> +	u32 offset;
> +	u32 align_size;
> +	const struct mkimg_hdr *img_hdr_info;
> +
> +	if (!fw_src || !image_buf || size < VCP_IMAGE_HEADER_SIZE)
> +		return 0;
> +
> +	offset = 0;
> +	while (offset < size) {
> +		img_hdr_info = (const struct mkimg_hdr *)(fw_ptr + offset);
> +		align_size = round_up(img_hdr_info->dsz, ALIGN_16);
> +		offset += VCP_IMAGE_HEADER_SIZE;
> +		if (img_hdr_info->magic != VCM_IMAGE_MAGIC ||
> +		    strncmp(img_hdr_info->name, part_bin_name, VCM_IMAGE_NAME_MAXSZ - 1)) {
> +			offset += align_size;
> +		} else {
> +			memcpy_toio(image_buf, fw_ptr + offset, img_hdr_info->dsz);
> +			offset += align_size;
> +			return img_hdr_info->dsz;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int load_vcp_bin(const u8 *fw_src,

load_vcp_bin() and load_mmup_bin() have got a lot of code in common, I think you
can reduce the amount of code a bit here by writing a function that commonizes
the loading process.

I can see a pattern, at least - and looks like being the same one between the two.

> +			size_t size,
> +			void __iomem *img_buf_va,
> +			phys_addr_t img_buf_pa,
> +			dma_addr_t img_buf_iova,
> +			struct mtk_vcp_device *vcp)
> +{
> +	u32 fw_size;
> +	u32 dram_img_size;
> +	u32 dram_backup_img_offset;
> +	struct vcp_region_info_st vcp_region_info = {};
> +	struct arm_smccc_res res;
> +
> +	fw_size = load_part_binary(vcp->vcp_cluster->sram_base +
> +				   vcp->vcp_cluster->sram_offset[VCP_ID],
> +				   fw_src, size, VCP_HFRP_PART_NAME);
> +	if (!fw_size) {
> +		dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_PART_NAME);
> +		return -EINVAL;
> +	}
> +
> +	dram_img_size = load_part_binary(img_buf_va + VCP_DRAM_IMG_OFFSET,
> +					 fw_src, size, VCP_HFRP_DRAM_PART_NAME);
> +	if (!dram_img_size) {
> +		dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_DRAM_PART_NAME);
> +		return -EINVAL;
> +	}
> +
> +	vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
> +
> +	dram_backup_img_offset = VCP_DRAM_IMG_OFFSET + round_up(dram_img_size, ALIGN_1024);
> +
> +	vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + VCP_DRAM_IMG_OFFSET);
> +	vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
> +	vcp_region_info.ap_dram_size = dram_img_size;
> +
> +	vcp_region_info.l2tcm_offset = vcp->vcp_cluster->sram_offset[MMUP_ID];
> +
> +	memcpy_toio(vcp->vcp_cluster->sram_base +
> +		    vcp->vcp_cluster->sram_offset[VCP_ID] + REGION_OFFSET,
> +		    &vcp_region_info, sizeof(vcp_region_info));
> +
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_MMUP_KERNEL_OP_SET_L2TCM_OFFSET,
> +		      vcp->vcp_cluster->sram_offset[MMUP_ID],
> +		      0, 0, 0, 0, 0, &res);
> +
> +	return 0;
> +}
> +
> +static int load_mmup_bin(const u8 *fw_src,
> +			 size_t size,
> +			 void __iomem *img_buf_va,
> +			 phys_addr_t img_buf_pa,
> +			 dma_addr_t img_buf_iova,
> +			 struct mtk_vcp_device *vcp)
> +{
> +	u32 fw_size;
> +	u32 dram_img_size;
> +	u32 dram_backup_img_offset;
> +	struct vcp_region_info_st vcp_region_info = {};
> +	struct arm_smccc_res res;
> +
> +	fw_size = load_part_binary(vcp->vcp_cluster->sram_base +
> +				   vcp->vcp_cluster->sram_offset[MMUP_ID],
> +				   fw_src, size, VCP_MMUP_PART_NAME);
> +	if (!fw_size) {
> +		dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_PART_NAME);
> +		return -EINVAL;
> +	}
> +
> +	dram_img_size = load_part_binary(img_buf_va + MMUP_DRAM_IMG_OFFSET, fw_src, size,
> +					 VCP_MMUP_DRAM_PART_NAME);
> +	if (!dram_img_size) {
> +		dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_DRAM_PART_NAME);
> +		return -EINVAL;
> +	}
> +
> +	vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
> +
> +	dram_backup_img_offset = MMUP_DRAM_IMG_OFFSET + round_up(dram_img_size, ALIGN_1024);
> +	vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + MMUP_DRAM_IMG_OFFSET);
> +	vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
> +	vcp_region_info.ap_dram_size = dram_img_size;
> +
> +	memcpy_toio(vcp->vcp_cluster->sram_base +
> +		    vcp->vcp_cluster->sram_offset[MMUP_ID] + REGION_OFFSET,
> +		    &vcp_region_info, sizeof(vcp_region_info));
> +
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_MMUP_KERNEL_OP_SET_FW_SIZE,
> +		      fw_size, 0, 0, 0, 0, 0, &res);
> +
> +	return 0;
> +}
> +
> +int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct arm_smccc_res res;
> +	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
> +	dma_addr_t img_buf_iova;
> +	phys_addr_t img_buf_phys;
> +	void __iomem *img_buf_va;
> +	int ret;
> +
> +	if (!vcp) {
> +		dev_err(vcp->dev, "vcp device is no exist!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (fw->size < VCP_IMAGE_HEADER_SIZE ||
> +	    fw->size > vcp->ops->vcp_get_mem_size(VCP_RTOS_MEM_ID)) {
> +		dev_err(vcp->dev, "firmware is oversize/undersize\n");
> +		return -EINVAL;
> +	}
> +
> +	writel(0x1, vcp->vcp_cluster->cfg_core + VCP_R_CORE0_SW_RSTN_SET);
> +	writel(0x1, vcp->vcp_cluster->cfg_core + VCP_R_CORE1_SW_RSTN_SET);
> +
> +	memset_io(vcp->vcp_cluster->sram_base, 0, vcp->vcp_cluster->sram_size);
> +
> +	img_buf_iova = vcp->ops->vcp_get_mem_iova(VCP_RTOS_MEM_ID);
> +	img_buf_phys = vcp->ops->vcp_get_mem_phys(VCP_RTOS_MEM_ID);
> +	img_buf_va = vcp->ops->vcp_get_mem_virt(VCP_RTOS_MEM_ID);
> +
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_VCP_KERNEL_OP_COLD_BOOT_VCP,
> +		      0, 0, 0, 0, 0, 0, &res);
> +
> +	ret = load_vcp_bin(fw->data, fw->size,
> +			   img_buf_va, img_buf_phys,
> +			   img_buf_iova, vcp);
> +	if (ret) {
> +		dev_err(vcp->dev, "load vcp bin failed\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = load_mmup_bin(fw->data, fw->size,
> +			    img_buf_va, img_buf_phys,
> +			    img_buf_iova, vcp);
> +	if (ret) {
> +		dev_err(vcp->dev, "load mmup bin failed\n");
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static irqreturn_t vcp_irq_handler(int irq, void *priv)
> +{
> +	u32 reg0, reg1;
> +	struct mtk_vcp_device *vcp = priv;
> +
> +	disable_irq_nosync(irq);

You're disabling the irq here, but I don't see where you re-enable it?

> +
> +	reg0 = readl(vcp->vcp_cluster->cfg_core + R_CORE0_WDT_IRQ);
> +	reg1 = vcp->vcp_cluster->core_nums > VCP_ID ?
> +	       readl(vcp->vcp_cluster->cfg_core + R_CORE1_WDT_IRQ) : 0;
> +
> +	if (reg0)
> +		writel(B_WDT_IRQ, vcp->vcp_cluster->cfg_core + R_CORE0_WDT_IRQ);
> +	if (reg1)
> +		writel(B_WDT_IRQ, vcp->vcp_cluster->cfg_core + R_CORE1_WDT_IRQ);
> +
> +	if (reg0 || reg1)
> +		return IRQ_HANDLED;
> +
> +	return IRQ_NONE;
> +}
> +
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
> diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
> new file mode 100644
> index 000000000000..8340f0bd4fdc
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_vcp_common.h
> @@ -0,0 +1,225 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_VCP_COMMON_H
> +#define __MTK_VCP_COMMON_H
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/bitops.h>
> +#include <linux/firmware.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +
> +/* vcp timeout definition */
> +#define VCP_AWAKE_TIMEOUT 1000
> +#define USDELAY_RANGE_MIN 1000
> +#define USDELAY_RANGE_MAX 2000
> +
> +/* vcp platform define */
> +#define DMA_MAX_MASK_BIT 33
> +
> +/* vcp load image define */
> +#define VCM_IMAGE_MAGIC             (0x58881688)

You don't need to enclose those in ().

> +#define VCM_IMAGE_NAME_MAXSZ        (32)
> +#define VCP_IMAGE_HEADER_SIZE       (0x200)
> +
> +#define VCP_DRAM_IMG_OFFSET         (0x200000)
> +#define MMUP_DRAM_IMG_OFFSET        (0x1200000)
> +
> +#define REGION_OFFSET               (0x4)
> +#define ALIGN_1024                  (1024)
> +#define ALIGN_16                    (16)
> +#define VCP_HFRP_PART_NAME          "tinysys-vcp-RV55_A"
> +#define VCP_MMUP_PART_NAME          "tinysys-mmup-RV33_A"
> +#define VCP_HFRP_DRAM_PART_NAME     "tinysys-vcp-RV55_A_dram"
> +#define VCP_MMUP_DRAM_PART_NAME     "tinysys-mmup-RV33_A_dram"
> +
> +/* vcp memory iove pack convert define */
> +#define VCP_PACK_IOVA(addr)     ((uint32_t)((addr) | (((uint64_t)(addr) >> 32) & 0xF)))



> +#define VCP_UNPACK_IOVA(addr)   \
> +	((uint64_t)(addr & 0xFFFFFFF0) | (((uint64_t)(addr) & 0xF) << 32))
> +
> +/* vcp register define */
> +#define VCP_R_CORE0_SW_RSTN_SET         (0x0004)
> +#define VCP_R_CORE1_SW_RSTN_SET         (0x000C)

lower case hex please.

> +#define R_GIPC_IN_SET                   (0x0028)
> +#define R_GIPC_IN_CLR                   (0x002C)
> +#define GIPC_MMUP_SHUT                  (BIT(10))
> +#define GIPC_VCP_HART0_SHUT             (BIT(14))
> +#define B_GIPC4_SETCLR_3                (BIT(19))
> +#define R_CORE0_WDT_IRQ                 (0x0050)
> +#define R_CORE1_WDT_IRQ                 (0x0054)
> +#define B_WDT_IRQ                       (BIT(0))
> +#define AP_R_GPR2                       (0x0068)
> +#define B_CORE0_SUSPEND                 (BIT(0))
> +#define B_CORE0_RESUME                  (BIT(1))
> +#define AP_R_GPR3                       (0x006C)
> +#define B_CORE1_SUSPEND                 (BIT(0))
> +#define B_CORE1_RESUME                  (BIT(1))
> +
> +#define R_CORE0_STATUS                  (0x6070)
> +#define B_CORE_GATED                    (BIT(0))
> +#define B_HART0_HALT                    (BIT(1))
> +#define B_HART1_HALT                    (BIT(2))
> +#define B_CORE_AXIS_BUSY                (BIT(4))
> +#define R_CORE1_STATUS                  (0x9070)
> +#define VCP_C0_GPR0_SUSPEND_RESUME_FLAG (0x6040)
> +#define VCP_C0_GPR1_DRAM_RESV_ADDR      (0x6044)
> +#define VCP_C0_GPR2_DRAM_RESV_SIZE      (0x6048)
> +#define VCP_C0_GPR3_DRAM_RESV_LOGGER    (0x604C)
> +#define VCP_C0_GPR5_H0_REBOOT           (0x6054)
> +#define CORE_RDY_TO_REBOOT              (0x0034)
> +#define VCP_C0_GPR6_H1_REBOOT           (0x6058)
> +#define VCP_C1_GPR0_SUSPEND_RESUME_FLAG (0x9040)
> +#define VCP_C1_GPR1_DRAM_RESV_ADDR      (0x9044)
> +#define VCP_C1_GPR2_DRAM_RESV_SIZE      (0x9048)
> +#define VCP_C1_GPR3_DRAM_RESV_LOGGER    (0x904C)
> +#define VCP_C1_GPR5_H0_REBOOT           (0x9054)
> +#define VCP_C1_GPR6_H1_REBOOT           (0x9058)
> +
> +/* sec GPR */
> +#define R_GPR2_SEC                      (0x0008)
> +#define MMUP_AP_SUSPEND                 (BIT(0))
> +#define R_GPR3_SEC                      (0x000C)
> +#define VCP_AP_SUSPEND                  (BIT(0))
> +
> +/* vcp rdy */
> +#define VLP_AO_RSVD7                    (0x0000)
> +#define READY_BIT                       (BIT(1))
> +
> +/* vcp Core ID definition */

This comment doesn't add any valuable information to this enum: either write
something that adds it, or just remove the comment.

> +enum vcp_core_id {
> +	VCP_ID          = 0,
> +	MMUP_ID         = 1,
> +	VCP_CORE_TOTAL  = 2,
> +};
> +
> +/* vcp kernel smc server id */
> +enum mtk_tinysys_vcp_kernel_op {
> +	MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET = 0,
> +	MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
> +	MTK_TINYSYS_VCP_KERNEL_OP_COLD_BOOT_VCP,
> +	MTK_TINYSYS_MMUP_KERNEL_OP_RESET_SET,
> +	MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
> +	MTK_TINYSYS_MMUP_KERNEL_OP_SET_L2TCM_OFFSET,
> +	MTK_TINYSYS_MMUP_KERNEL_OP_SET_FW_SIZE,
> +	MTK_TINYSYS_MMUP_KERNEL_OP_COLD_BOOT_MMUP,
> +	MTK_TINYSYS_VCP_KERNEL_OP_NUM,
> +};
> +
> +/**
> + * struct mkimg_hdr - mtk image header format.
> + *
> + * @magic: mtk vcp image magic id
> + * @dsz: mtk vcp image part binary size
> + * @name: mtk vcp image part binary parttion name
> + */
> +struct mkimg_hdr {

struct mtk_vcp_img_header {

> +	u32 magic;
> +	u32 dsz;
> +	char name[VCM_IMAGE_NAME_MAXSZ];
> +};
> +
> +/**
> + * struct vcp_feature_tb - feature table structure definition.
> + *
> + * @feature: feature id
> + * @core_id: feature using vcp core id
> + * @enable: whether the feature is enabled or not

priv must also be documented.

> + */
> +struct vcp_feature_tb {
> +	enum vcp_core_id core_id;
> +	u32 feature;
> +	u32 enable;
> +	void *priv;
> +};
> +
> +/**
> + * struct vcp_reserve_mblock - vcp reserved memory structure.
> + *
> + * @vcp_reserve_mem_id_t: reserved memory id
> + * @start_phys: reserved memory phy addr
> + * @start_iova: reserved memory dma map addr
> + * @start_virt: reserved memory CPU virt addr
> + * @size: reserved memory size
> + */
> +struct vcp_reserve_mblock {
> +	enum vcp_reserve_mem_id_t num;
> +	phys_addr_t start_phys;
> +	dma_addr_t start_iova;
> +	void __iomem *start_virt;
> +	size_t size;
> +};
> +
> +/**
> + * struct vcp_region_info_st - config vcp image info sync to vcp bootloader.
> + *
> + * @ap_loader_start: (optional) - config vcp bootloader to copy loader start addr
> + * @ap_loader_size: (optional) - config vcp bootloader to copy loader size
> + * @ap_firmware_start: (optional) - config vcp bootloader to copy firmware start addr
> + * @ap_firmware_size: (optional) - config vcp bootloader to copy firmware size
> + * @ap_dram_start: config vcp run dram binary start addr
> + * @ap_dram_size: config vcp run dram binary size
> + * @ap_dram_backup_start: config vcp backup dram binary start addr
> + * @struct_size: vcp image region info structure size
> + * @l2tcm_offset: vcp two core using l2sram layout
> + * @TaskContext_ptr: (optional) - vcp task context ptr for debug
> + * @vcpctl:  (optional) - vcp control info
> + * @regdump_start: (optional) - regdump start addr for debug
> + * @regdump_size: (optional) - regdump size for debug
> + * @ap_params_start: (optional) - params start addr
> + * @sramlog_buf_offset: (optional) - sramlog_buf_offset for debug
> + * @sramlog_end_idx_offset: (optional) - sramlog_end_idx_offset for debug
> + * @sramlog_buf_maxlen: (optional) - sramlog_buf_maxlen for debug
> + * @ap_loader_start_pa: (optional) - config vcp bootloader for loader start pa
> + * @coredump_offset: (optional) - coredump_offset offset for debug
> + * @coredump_dram_offset: (optional) - coredump_dram_offset offset for debug
> + */
> +struct vcp_region_info_st {
> +	u32 ap_loader_start;
> +	u32 ap_loader_size;
> +	u32 ap_firmware_start;
> +	u32 ap_firmware_size;
> +	u32 ap_dram_start;
> +	u32 ap_dram_size;
> +	u32 ap_dram_backup_start;
> +	u32 struct_size;
> +	u32 l2tcm_offset;
> +	u32 TaskContext_ptr;

Lowercase please.

> +	u32 vcpctl;
> +	u32 regdump_start;
> +	u32 regdump_size;
> +	u32 ap_params_start;
> +	u32 sramlog_buf_offset;
> +	u32 sramlog_end_idx_offset;
> +	u32 sramlog_buf_maxlen;
> +	u32 ap_loader_start_pa;
> +	u32 coredump_offset;
> +	u32 coredump_dram_offset;
> +};
> +
> +/* vcp common reserved memory APIs */
> +int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp);
> +phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id);
> +dma_addr_t vcp_get_reserve_mem_iova(enum vcp_reserve_mem_id_t id);
> +void __iomem *vcp_get_reserve_mem_virt(enum vcp_reserve_mem_id_t id);
> +void __iomem *vcp_get_internal_sram_virt(struct mtk_vcp_device *vcp);
> +u32 vcp_get_reserve_mem_size(enum vcp_reserve_mem_id_t id);
> +
> +/* vcp common load image API */
> +int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw);
> +
> +/* vcp common wdt irq init API */
> +int vcp_wdt_irq_init(struct mtk_vcp_device *vcp);
> +
> +/* vcp common feature register/deregister APIs */
> +int vcp_A_register_feature(struct mtk_vcp_device *vcp,
> +			   enum feature_id id);
> +int vcp_A_deregister_feature(struct mtk_vcp_device *vcp,
> +			     enum feature_id id);
> +
> +/* vcp common core hart shutdown API */
> +u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
> +#endif
> diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
> new file mode 100644
> index 000000000000..bf4736ce6795
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_vcp_rproc.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +
> +#include "mtk_vcp_common.h"
> +#include "mtk_vcp_rproc.h"
> +#include "remoteproc_internal.h"
> +
> +/**
> + * vcp_get() - get a reference to VCP.
> + *
> + * @pdev: the platform device of the module requesting VCP platform
> + *        device for using VCP API.
> + *
> + * Return: Return NULL if failed.  otherwise reference to VCP.
> + **/
> +struct mtk_vcp_device *vcp_get(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *vcp_node;
> +	struct platform_device *vcp_pdev;
> +
> +	vcp_node = of_parse_phandle(dev->of_node, "mediatek,vcp", 0);
> +	if (!vcp_node) {
> +		dev_err(dev, "can't get VCP node\n");
> +		return NULL;
> +	}
> +
> +	vcp_pdev = of_find_device_by_node(vcp_node);
> +	of_node_put(vcp_node);
> +
> +	if (WARN_ON(!vcp_pdev)) {
> +		dev_err(dev, "VCP pdev failed\n");
> +		return NULL;
> +	}
> +
> +	return platform_get_drvdata(vcp_pdev);
> +}
> +EXPORT_SYMBOL_GPL(vcp_get);
> +
> +/**
> + * vcp_put() - "free" the VCP
> + *
> + * @vcp: mtk_vcp_device structure from vcp_get().
> + *
> + **/
> +void vcp_put(struct mtk_vcp_device *vcp)
> +{
> +	put_device(vcp->dev);
> +}
> +EXPORT_SYMBOL_GPL(vcp_put);
> +
> +static int mtk_vcp_start(struct rproc *rproc)
> +{
> +	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
> +	struct arm_smccc_res res;
> +
> +	/* core 0 */
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET,
> +		      1, 0, 0, 0, 0, 0, &res);
> +
> +	/* core 1 */
> +	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
> +		      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_SET,
> +		      1, 0, 0, 0, 0, 0, &res);
> +
> +	if (vcp_A_register_feature(vcp, RTOS_FEATURE_ID) < 0) {
> +		dev_err(vcp->dev, "bootup fail\n");

If there's an error, you should really return an error here.

> +		vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
> +	} else {
> +		dev_info(vcp->dev, "bootup successfully\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_vcp_stop(struct rproc *rproc)
> +{
> +	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
> +
> +	vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops mtk_vcp_ops = {
> +	.load		= mtk_vcp_load,
> +	.start		= mtk_vcp_start,
> +	.stop		= mtk_vcp_stop,
> +};
> +
> +static int vcp_multi_core_init(struct platform_device *pdev,
> +			       struct mtk_vcp_of_cluster *vcp_cluster,
> +			       enum vcp_core_id core_id)
> +{
> +	int ret;
> +
> +	ret = of_property_read_u32(pdev->dev.of_node, "mtk,vcp-core-twohart",

Apparently, twohart is present:
  1. If the HW is multi-core; and
  2. If this is the first core of the multi-core cluster.

This means that you don't need a devicetree property for that; you can either
hardcode this logic, or you can use per-SoC platform data.

> +				   &vcp_cluster->twohart[core_id]);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to twohart property\n");
> +		return ret;
> +	}
> +	ret = of_property_read_u32(pdev->dev.of_node, "mtk,core-sram-offset",
> +				   &vcp_cluster->sram_offset[core_id]);

As I said in the bindings review, you don't need this property.

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to sram-offset property\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
> +					     struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev_of_node(dev);
> +	struct device_node *child;
> +	struct platform_device *cpdev;
> +	struct mtk_vcp_device *vcp;
> +	struct rproc *rproc;
> +	const struct mtk_vcp_of_data *vcp_of_data;
> +	u32 core_id;
> +	int ret;
> +
> +	vcp_of_data = of_device_get_match_data(dev);
> +	rproc = devm_rproc_alloc(dev, np->name, &mtk_vcp_ops,
> +				 vcp_of_data->platdata.fw_name,
> +				 sizeof(struct mtk_vcp_device));
> +	if (!rproc) {
> +		dev_err(dev, "unable to allocate remoteproc\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	vcp  = rproc->priv;
> +	vcp->rproc = rproc;
> +	vcp->pdev = pdev;
> +	vcp->dev = dev;
> +	vcp->ops = &vcp_of_data->ops;
> +	vcp->platdata = &vcp_of_data->platdata;
> +	vcp->vcp_cluster = vcp_cluster;
> +
> +	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
> +	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
> +	mutex_init(&vcp->vcp_cluster->vcp_feature_mutex);
> +	mutex_init(&vcp->vcp_cluster->vcp_pw_clk_mutex);
> +	platform_set_drvdata(pdev, vcp);
> +
> +	ret = vcp_reserve_memory_ioremap(vcp);
> +	if (ret) {
> +		dev_err(dev, "vcp_reserve_memory_ioremap failed ret = %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	core_id = 0;
> +	for_each_available_child_of_node(np, child) {
> +		if (of_device_is_compatible(child, "mediatek,vcp-core")) {
> +			cpdev = of_find_device_by_node(child);
> +			if (!cpdev) {
> +				ret = -ENODEV;
> +				dev_err(dev, "Not found platform device for core\n");
> +				return ERR_PTR(ret);
> +			}
> +			ret = vcp_multi_core_init(cpdev, vcp_cluster, core_id);
> +			core_id++;
> +		}
> +	}
> +	vcp->vcp_cluster->core_nums = core_id;
> +
> +	ret = vcp_wdt_irq_init(vcp);
> +	if (ret) {
> +		dev_err(dev, "vcp_wdt_irq_init failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	pm_runtime_get_sync(dev);
> +
> +	return vcp;
> +}
> +
> +static int vcp_cluster_init(struct platform_device *pdev,
> +			    struct mtk_vcp_of_cluster *vcp_cluster)
> +{
> +	struct mtk_vcp_device *vcp;
> +	int ret;
> +
> +	vcp = vcp_rproc_init(pdev, vcp_cluster);
> +	if (IS_ERR(vcp))
> +		return PTR_ERR(vcp);
> +
> +	ret = rproc_add(vcp->rproc);
> +	if (ret) {
> +		dev_err(vcp->dev, "Failed to add rproc\n");
> +		rproc_del(vcp->rproc);
> +	}
> +
> +	return ret;
> +}
> +
> +static int vcp_device_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct device *dev = &pdev->dev;
> +	struct mtk_vcp_of_cluster *vcp_cluster;
> +	int ret;
> +
> +	pm_runtime_enable(dev);

devm_pm_runtime_enable()

> +
> +	vcp_cluster = devm_kzalloc(dev, sizeof(*vcp_cluster), GFP_KERNEL);
> +	if (!vcp_cluster)
> +		return -ENOMEM;
> +
> +	vcp_cluster->cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");

You can apply the resource index-vs-name restriction in the devicetree bindings,
which is something that you have already done, even.

So, since you have that in bindings, you can do...

enum vcp_resources {
	VCP_CFG,
	VCP_CFG_SEC,
	....
	VCP_RESOURCES_MAX
};

enum vcp_resources i;

for (i = 0; i < VCP_RESOURCES_MAX; i++) {
	vcp_cluster->mmio[i] = devm_platform_ioremap_resource(pdev, i);
	if (IS_ERR(vcp_cluster->mmio[i]))
		return dev_err_probe ....
}

If you really want to keep probing them by name (it's slower, but it's okay), you
could add them to an array and still do the same.



> +	if (IS_ERR(vcp_cluster->cfg))
> +		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg),
> +				     "Failed to parse and map cfg memory\n");
> +
> +	vcp_cluster->cfg_sec = devm_platform_ioremap_resource_byname(pdev, "cfg_sec");
> +	if (IS_ERR(vcp_cluster->cfg_sec))
> +		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg_sec),
> +				     "Failed to parse and map cfg_sec memory\n");
> +
> +	vcp_cluster->cfg_core = devm_platform_ioremap_resource_byname(pdev, "cfg_core");
> +	if (IS_ERR(vcp_cluster->cfg_core))
> +		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg_core),
> +				     "Failed to parse and map cfg_core memory\n");
> +
> +	vcp_cluster->vcp_rdy = devm_platform_ioremap_resource_byname(pdev, "vcp_vlp_ao_rsvd7");
> +	if (IS_ERR(vcp_cluster->vcp_rdy))
> +		return dev_err_probe(dev, PTR_ERR(vcp_cluster->vcp_rdy),
> +				     "Failed to parse and map vcp_rdy memory\n");
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> +	vcp_cluster->sram_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(vcp_cluster->sram_base))
> +		return dev_err_probe(dev, PTR_ERR(vcp_cluster->sram_base),
> +				     "Failed to parse and map sram memory\n");
> +	vcp_cluster->sram_size = (u32)resource_size(res);
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
> +
> +	ret = vcp_cluster_init(pdev, vcp_cluster);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void vcp_device_remove(struct platform_device *pdev)
> +{
> +	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	rproc_del(vcp->rproc);
> +}
> +
> +static void vcp_device_shutdown(struct platform_device *pdev)
> +{
> +	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
> +	u32 ret;
> +
> +	writel(GIPC_VCP_HART0_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);

if (vcp->cluster->core_nums <= VCP_ID)
	return;

(change wait_core_hart_shutdown to return error number for error, or 0 for success)

ret = wait_core_hart_shutdown(...)
if (ret) {
	dev_err(...)
	return;
}

writel(GIPC_MMUP_SHUT ....)


> +	if (vcp->vcp_cluster->core_nums > VCP_ID) {
> +		ret = wait_core_hart_shutdown(vcp, VCP_ID);
> +		if (!ret)
> +			dev_err(&pdev->dev,
> +				"wait VCP_ID core hart shutdown timeout\n");
> +		else
> +			writel(GIPC_MMUP_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
> +	}
> +}
> +
> +static const struct mtk_vcp_of_data mt8196_of_data = {
> +	.ops = {
> +		.vcp_register_feature = vcp_A_register_feature,
> +		.vcp_deregister_feature = vcp_A_deregister_feature,

please, lowercase 'A'.

> +		.vcp_get_mem_phys = vcp_get_reserve_mem_phys,
> +		.vcp_get_mem_iova = vcp_get_reserve_mem_iova,
> +		.vcp_get_mem_virt = vcp_get_reserve_mem_virt,
> +		.vcp_get_mem_size = vcp_get_reserve_mem_size,
> +		.vcp_get_sram_virt = vcp_get_internal_sram_virt,
> +	},
> +	.platdata = {
> +		.auto_boot = true,
> +		.sysfs_read_only = true,
> +		.rtos_static_iova = 0x180600000,

Can this parameter be read from the VCP firmware file instead?
It's static....

> +		.fw_name = "mediatek/mt8196/vcp.img",
> +	},
> +};
> +
> +static const struct of_device_id mtk_vcp_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_vcp_of_match);
> +
> +static struct platform_driver mtk_vcp_device = {
> +	.probe = vcp_device_probe,
> +	.remove_new = vcp_device_remove,
> +	.shutdown = vcp_device_shutdown,
> +	.driver = {
> +		.name = "mtk-vcp",
> +		.of_match_table = mtk_vcp_of_match,
> +	},
> +};
> +
> +module_platform_driver(mtk_vcp_device);
> +
> +MODULE_AUTHOR("Xiangzhi Tang <xiangzhi.tang@mediatek.com>");
> +MODULE_DESCRIPTION("MTK VCP Controller");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
> new file mode 100644
> index 000000000000..6c7a99bf919b
> --- /dev/null
> +++ b/drivers/remoteproc/mtk_vcp_rproc.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_VCP_RPROC_H__
> +#define __MTK_VCP_RPROC_H__
> +
> +#include <linux/remoteproc/mtk_vcp_public.h>
> +
> +/*

Oops, you missed a * in /**

> + * struct mtk_vcp_of_cluster - vcp cluster priv data.
> + *
> + * @sram_base: sram_base get from dtb
> + * @cfg: cfg register get from dtb
> + * @cfg_sec: cfg_sec register get from dtb
> + * @cfg_core: cfg_core register get from dtb
> + * @vcp_rdy: vlp vcp_rdy register get from dtb
> + * @sram_size: total sram size get from dtb
> + * @core_nums: total core numbers get from dtb
> + * @twohart: core weo hart support flag
> + * @sram_offset: core sram memory layout
> + * @pwclkcnt: power and clock config count data
> + * @share_mem_iova: shared memory iova base
> + * @share_mem_size: shared memory size
> + * @vcp_feature_mutex: vcp feature register mutex structure
> + * @vcp_pw_clk_mutex: vcp feature lock pw_clk mutex structure
> + */
> +struct mtk_vcp_of_cluster {
> +	void __iomem *sram_base;
> +	void __iomem *cfg;
> +	void __iomem *cfg_sec;
> +	void __iomem *cfg_core;
> +	void __iomem *vcp_rdy;
> +	u32 sram_size;
> +	u32 core_nums;
> +	u32 twohart[VCP_CORE_TOTAL];
> +	u32 sram_offset[VCP_CORE_TOTAL];
> +	int pwclkcnt;
> +	dma_addr_t share_mem_iova;
> +	size_t share_mem_size;
> +	struct mutex vcp_feature_mutex;
> +	struct mutex vcp_pw_clk_mutex;
> +};
> +
> +/**
> + * struct mtk_vcp_platdata - vcp platform priv data.
> + *
> + * @auto_boot: rproc auto_boot flag
> + * @sysfs_read_only: rproc sysfs_read_only flag
> + * @rtos_static_iova: vcp dram binary static map iova
> + * @fw_name: vcp image name and path
> + */
> +struct mtk_vcp_platdata {
> +	bool auto_boot;
> +	bool sysfs_read_only;
> +	dma_addr_t rtos_static_iova;
> +	char *fw_name;
> +};
> +
> +/**
> + * struct mtk_vcp_of_data - const vcp device data.
> + *
> + * @mtk_vcp_ops: mtk_vcp_ops structure
> + * @mtk_vcp_platdata: mtk_vcp_platdata structure
> + */
> +struct mtk_vcp_of_data {
> +	const struct mtk_vcp_ops ops;
> +	const struct mtk_vcp_platdata platdata;
> +};
> +#endif
> diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
> new file mode 100644
> index 000000000000..b4de5e5d63d8
> --- /dev/null
> +++ b/include/linux/remoteproc/mtk_vcp_public.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_VCP_PUBLIC_H__
> +#define __MTK_VCP_PUBLIC_H__
> +
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +
> +/* vcp reserve memory ID definition */
> +enum vcp_reserve_mem_id_t {
> +	VCP_RTOS_MEM_ID,
> +	VDEC_MEM_ID,
> +	VENC_MEM_ID,
> +	MMDVFS_VCP_MEM_ID,
> +	MMDVFS_MMUP_MEM_ID,
> +	MMQOS_MEM_ID,
> +	NUMS_MEM_ID,
> +};
> +
> +/* vcp feature ID list */
> +enum feature_id {

enum mtk_vcp_feature_id ?

> +	RTOS_FEATURE_ID,

FEATURE_ID_RTOS,
FEATURE_ID_VDEC,
     .....


Regards,
Angelo


