Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA02C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 18:52:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD92A64E31
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 18:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhBOSwG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 13:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhBOSwF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 13:52:05 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4084C0613D6
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Feb 2021 10:51:24 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id j12so4675229pfj.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Feb 2021 10:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BxlVvv0G95aC9gtYE7t2KR3BNqZMWK+GKLbcq8IyzJA=;
        b=WPbRJaKhxrtosxHfxEn3/7Iv8PpF3biurqMxEY5S4iJr1V3a8EyDte4ZyTzfMlCg4H
         HWoiJhyPNWqpD5qMoY/fntBWx9ghH+HQt347vYCv7gHSB77ss0klfPgUPZrkUjSXAetc
         SUCNWcohBJmAzGnA21EklH+eOLd7mlzgZRF9pgmNQA6HZhbWgttjUMutn6NJen1BvsjD
         EBiE1O0JkwHZJGsuPyoXcb13cgEvY7fbCqXdNdoQdCtIhQmdV0p2pCi4WRq/5nzJ3t+v
         tKrHJj2x6mBNJyFulGqac2Co7VaKXeZYxnrsTDzwDZOckO8rvIOD15svD7So8yZKpljQ
         epnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BxlVvv0G95aC9gtYE7t2KR3BNqZMWK+GKLbcq8IyzJA=;
        b=CocrWR50LrdHcqezNJNExSDcQAvpNmZjc6dODUhxB8cl40p9jXIozhskwiNf8QyHFx
         EZwsiKqJOpEnaTirBGyMXiNqtJ7bQ4uHx2EN4/gYFYfOizZEdvN79B4Qf2TF1z58t3qE
         z1IpxJnaw4zz9XFqIslWunayRECTFaUdvkfdcUbS8XntTwJoOWTIvDiJQc2J32LWogkG
         d7jrf5RgcfKO3k1Wpv4w+7tfnCfkyZLjKyhRnH/uhMV36lRiOpmZFhL6HTRnorMPLSjh
         arqC0VYdmdCjVCh2wevI/71nITKsKyMuCFYnKdjXKBbJsvJfx48nXxB4d9azeorrnjFt
         j8mA==
X-Gm-Message-State: AOAM531Kp2bsMbl6xEaDfTKXXIXuxJT9RmAWu4I6bng4XkBRKSNpwwSl
        nzRYRGG7BxXlwmD3/YJgB14BJQ==
X-Google-Smtp-Source: ABdhPJyKWEN/1DbkNtSaY8IyxlhWMrtH5+lOLFp6B2btAtp+nHezp1PB4iUc2cgK6/jp9s+FbVGlHQ==
X-Received: by 2002:a05:6a00:2286:b029:1ae:6c7f:31ce with SMTP id f6-20020a056a002286b02901ae6c7f31cemr16334015pfe.6.1613415083939;
        Mon, 15 Feb 2021 10:51:23 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id p15sm141979pja.21.2021.02.15.10.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 10:51:23 -0800 (PST)
Date:   Mon, 15 Feb 2021 11:51:21 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        michal.simek@xilinx.com
Subject: Re: [PATCH v25 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Message-ID: <20210215185121.GA2771622@xps15>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
 <20210111020250.6846-6-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111020250.6846-6-ben.levinsky@xilinx.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Good day,

I have started to review this set - as with previous revisions comments will
come over several days.

On Sun, Jan 10, 2021 at 06:02:50PM -0800, Ben Levinsky wrote:
> R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> remotproc driver, we can boot the R5 sub-system in two different
> configurations -
> 	* Split
> 	* Lockstep
> 
> The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> Platform Management Unit that handles the R5 configuration, memory access
> and R5 lifecycle management. The interface to this manager is done in this
> driver via zynqmp_pm_* function calls.
> 
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
> v25:
> - reword error message for rpu configuration
> - change char name[15] to 16 chars to have null terminated string
>   in parse_mem_regions()
> - reword comments in tcm_mem_alloc
> - call xilinx platform cleanup in parse_tcm_banks() case of failure
> - check value of mbox_send_message in all instances within this driver 
> - indentation in zynqmp_r5_remoteproc driver
> - update style of constructing carveouts to match convention in ST
>   remoteproc drivers. No longer iterate through memory-region property
>   using of_count_phandle_with_args. Instead use of_phandle_iterator
> - use rproc_of_resm_mem_entry_init for vdev0buffer carveout as per feedback
> - rework loop in zynqmp_r5_pm_request_sram as per feedback
> - fix comment and linebreak in tcm_mem_alloc description
> - add comments and remove extraneous devm_ioremap_wc call in tcm_mem_alloc
> - in parse_tcm_banks remove check for bank not being available
> - rework order of locals and remove else in zynqmp_r5_rproc_kick
> - document and update logic for zynqmp_r5_parse_fw
> - add dev_dbg output in event_notified_idr_cb if
>   rproc_vq_interrupt(rproc, id) == IRQ_NONE
> - add comment for handle_event_notified mbox_send_message function call
> - add comment for zynqmp_r5_mb_rx_cb
> - update zynqmp_r5_setup_mbox to match convention of mbox setup in ST
>   remoteproc drivers
> - change return in zynqmp_r5_setup_mbox to use PTR_ERR
> - add zynqmp_r5_cleanup_mbox
> - in zynqmp_r5_probe, reteurn zynqmp_r5_rproc instead of taking in as arg.
> - in zynqmp_r5_probe use return of PTR_ERR and use zynqmp_r5_cleanup_mbox
> - in zynqmp_r5_remoteproc_probe update use return value of zynqmp_r5_probe as
>   either zynqmp_r5_rproc* or PTR_ERR
> - update loop that cleans up cluster and mboxes in zynqmp_r5_remoteproc_probe
> - update loop that cleans up cluster and mboxes in zynqmp_r5_remoteproc_remove
> ---
>  drivers/remoteproc/Kconfig                |   8 +
>  drivers/remoteproc/Makefile               |   1 +
>  drivers/remoteproc/zynqmp_r5_remoteproc.c | 898 ++++++++++++++++++++++
>  3 files changed, 907 insertions(+)
>  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c6659dfea7c7..c2fe54b1d94f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
>  	  It's safe to say N here if you're not interested in utilizing
>  	  the DSP slave processors.
>  
> +config ZYNQMP_R5_REMOTEPROC
> +	tristate "ZynqMP R5 remoteproc support"
> +	depends on PM && ARCH_ZYNQMP
> +	select RPMSG_VIRTIO
> +	select ZYNQMP_IPI_MBOX
> +	help
> +	  Say y or m here to support ZynqMP R5 remote processors via the remote
> +	  processor framework.
>  endif # REMOTEPROC
>  
>  endmenu
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 3dfa28e6c701..ef1abff654c2 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
> +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
> diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> new file mode 100644
> index 000000000000..9e228c9ecd43
> --- /dev/null
> +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> @@ -0,0 +1,898 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Zynq R5 Remote Processor driver
> + *
> + * Based on origin OMAP and Zynq Remote Processor driver
> + *
> + */
> +
> +#include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/zynqmp-ipi-message.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/skbuff.h>
> +#include <linux/sysfs.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory instance */
> +
> +#define BANK_LIST_PROP	"sram"
> +#define DDR_LIST_PROP	"memory-region"
> +
> +/* IPI buffer MAX length */
> +#define IPI_BUF_LEN_MAX	32U
> +/* RX mailbox client buffer max length */
> +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> +				 sizeof(struct zynqmp_ipi_message))
> +
> +/*
> + * Map each Xilinx on-chip SRAM  Bank address to their own respective
> + * pm_node_id.
> + */
> +struct sram_addr_data {
> +	phys_addr_t addr;
> +	enum pm_node_id id;
> +};
> +
> +#define NUM_SRAMS 4U
> +static const struct sram_addr_data zynqmp_banks[NUM_SRAMS] = {
> +	{0xffe00000UL, NODE_TCM_0_A},
> +	{0xffe20000UL, NODE_TCM_0_B},
> +	{0xffe90000UL, NODE_TCM_1_A},
> +	{0xffeb0000UL, NODE_TCM_1_B},
> +};
> +
> +/**
> + * struct zynqmp_r5_rproc - ZynqMP R5 core structure
> + *
> + * @rx_mc_buf: rx mailbox client buffer to save the rx message
> + * @tx_mc: tx mailbox client
> + * @rx_mc: rx mailbox client
> + * @mbox_work: mbox_work for the RPU remoteproc
> + * @tx_mc_skbs: socket buffers for tx mailbox client
> + * @dev: device of RPU instance
> + * @rproc: rproc handle
> + * @tx_chan: tx mailbox channel
> + * @rx_chan: rx mailbox channel
> + * @pnode_id: RPU CPU power domain id
> + * @elem: linked list item
> + */
> +struct zynqmp_r5_rproc {
> +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> +	struct mbox_client tx_mc;
> +	struct mbox_client rx_mc;
> +	struct work_struct mbox_work;
> +	struct sk_buff_head tx_mc_skbs;
> +	struct device *dev;
> +	struct rproc *rproc;
> +	struct mbox_chan *tx_chan;
> +	struct mbox_chan *rx_chan;
> +	u32 pnode_id;
> +	struct list_head elem;
> +};
> +
> +/*
> + * r5_set_mode - set RPU operation mode
> + * @z_rproc: Remote processor private data
> + * @rpu_mode: mode specified by device tree to configure the RPU to
> + *
> + * set RPU operation mode
> + *
> + * Return: 0 for success, negative value for failure
> + */
> +static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
> +		       enum rpu_oper_mode rpu_mode)
> +{
> +	enum rpu_tcm_comb tcm_mode;
> +	enum rpu_oper_mode cur_rpu_mode;
> +	int ret;
> +
> +	ret = zynqmp_pm_get_rpu_mode(z_rproc->pnode_id, &cur_rpu_mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rpu_mode != cur_rpu_mode) {
> +		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id, rpu_mode);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
> +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> +	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
> +}
> +
> +/*
> + * zynqmp_r5_rproc_mem_release
> + * @rproc: single R5 core's corresponding rproc instance
> + * @mem: mem entry to unmap
> + *
> + * Unmap TCM banks when powering down R5 core.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
> +{
> +	u32 pnode_id = (u64)mem->priv;
> +
> +	iounmap(mem->va);
> +	return zynqmp_pm_release_node(pnode_id);
> +}
> +
> +/*
> + * zynqmp_r5_rproc_start
> + * @rproc: single R5 core's corresponding rproc instance
> + *
> + * Start R5 Core from designated boot address.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	enum rpu_boot_mem bootmem;
> +
> +	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
> +		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> +
> +	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
> +		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> +
> +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> +				      bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +}
> +
> +/*
> + * zynqmp_r5_rproc_stop
> + * @rproc: single R5 core's corresponding rproc instance
> + *
> + * Power down  R5 Core.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +
> +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
> +				      ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +}
> +
> +/*
> + * zynqmp_r5_rproc_mem_alloc
> + * @rproc: single R5 core's corresponding rproc instance
> + * @mem: mem entry to map
> + *
> + * Callback to map va for memory-region's carveout.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
> +				     struct rproc_mem_entry *mem)
> +{
> +	void *va;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va))
> +		return -ENOMEM;
> +
> +	mem->va = va;
> +
> +	return 0;
> +}
> +
> +/*
> + * zynqmp_r5_rproc_mem_release
> + * @rproc: single R5 core's corresponding rproc instance
> + * @mem: mem entry to unmap
> + *
> + * Unmap memory-region carveout
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> +				       struct rproc_mem_entry *mem)
> +{
> +	iounmap(mem->va);
> +	return 0;
> +}
> +
> +/*
> + * parse_mem_regions
> + * @rproc: single R5 core's corresponding rproc instance
> + *
> + * Construct rproc mem carveouts from carveout provided in
> + * memory-region property
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int parse_mem_regions(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device_node *np = z_rproc->dev->of_node;
> +	struct device *dev = &rproc->dev;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	int index = 0;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, DDR_LIST_PROP, NULL, 0);
> +	while (of_phandle_iterator_next(&it) == 0) {
> +		rmem = of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire %s\n", DDR_LIST_PROP);
> +			return -EINVAL;
> +		}
> +
> +		if (strstr(it.node->name, "vdev0buffer")) {
> +			mem = rproc_of_resm_mem_entry_init(dev, index,
> +							   rmem->size,
> +							   rmem->base,
> +							   "vdev0buffer");
> +		} else {
> +			/*
> +			 * The ensuing carveout is either for vring, which has
> +			 * device tree node name of length 15 characters, or
> +			 * firmware mem, where name is not used by remoteproc
> +			 *  core later on. So default to vring length of 15.
> +			 *
> +			 * Extra char for null-terminated string.
> +			 */
> +			char name[16];
> +
> +			if (strstr(it.node->name, "vdev0vring")) {
> +				int vring_id;
> +
> +				/*
> +				 * Expect "rpuXvdev0vringX" as documented
> +				 * in xilinx remoteproc device tree binding
> +				 */
> +				if (strlen(it.node->name) < 15) {
> +					dev_err(dev, "%pOF is less than 15 chars",
> +						it.node);
> +					return -EINVAL;
> +				}
> +
> +				/*
> +				 * can be 1 of multiple vring IDs per IPC channel
> +				 * e.g. 'vdev0vring0' and 'vdev0vring1'
> +				 *
> +				 * Here get vring ID from 15th char
> +				 */
> +				vring_id = it.node->name[14] - '0';
> +				snprintf(name, sizeof(name), "vdev0vring%d", vring_id);
> +			} else {
> +				strncpy(name, it.node->name, 16);
> +			}
> +
> +			mem = rproc_mem_entry_init(dev, NULL,
> +						   (dma_addr_t)rmem->base,
> +						   rmem->size, rmem->base,
> +						   zynqmp_r5_rproc_mem_alloc,
> +						   zynqmp_r5_rproc_mem_release,
> +						   name);
> +		}
> +
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * zynqmp_r5_pm_request_tcm
> + * @addr: base address of mem provided in R5 core's sram property.
> + *
> + * Given sram base address, determine its corresponding Xilinx
> + * Platform Management ID and then request access to this node
> + * so that it can be power up.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_pm_request_sram(phys_addr_t addr)
> +{
> +	int i;
> +
> +	for (i = 0; i < NUM_SRAMS; i++) {
> +		if (zynqmp_banks[i].addr != addr)
> +			continue;
> +
> +		return zynqmp_pm_request_node(zynqmp_banks[i].id,
> +					      ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +					      ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * tcm_mem_alloc
> + * @rproc: single R5 core's corresponding rproc instance
> + * @mem: mem entry to initialize the va and da fields of
> + *
> + * Given TCM bank entry, this callback will set device address for R5
> + * running on TCM and also setup virtual address for TCM bank
> + * remoteproc carveout.
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int tcm_mem_alloc(struct rproc *rproc,
> +			 struct rproc_mem_entry *mem)
> +{
> +	void *va;
> +	struct device *dev = rproc->dev.parent;
> +
> +	va = ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va))
> +		return -ENOMEM;
> +
> +	/* Update memory entry va */
> +	mem->va = va;
> +
> +	/*
> +	 * The R5s expect their TCM banks to be at address 0x0 and 0x2000,
> +	 * while on the Linux side they are at 0xffexxxxx.
> +	 *
> +	 * Zero out the high 12 bits of the address. This will give
> +	 * expected values for TCM Banks 0A and 0B (0x0 and 0x20000).
> +	 */
> +	mem->da &= 0x000fffff;
> +
> +	/*
> +	 * TCM Banks 1A and 1B still have to be translated.
> +	 *
> +	 * Below handle these two banks' absolute addresses (0xffe90000 and
> +	 * 0xffeb0000) and convert to the expected relative addresses
> +	 * (0x0 and 0x20000).
> +	 */
> +	if (mem->da == 0x90000 || mem->da == 0xB0000)
> +		mem->da -= 0x90000;
> +
> +	/* if translated TCM bank address is not valid report error */
> +	if (mem->da != 0x0 && mem->da != 0x20000) {
> +		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * parse_tcm_banks()
> + * @rproc: single R5 core's corresponding rproc instance
> + *
> + * Given R5 node in remoteproc instance
> + * allocate remoteproc carveout for TCM memory
> + * needed for firmware to be loaded
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int parse_tcm_banks(struct rproc *rproc)
> +{
> +	int i, num_banks;
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device *dev = &rproc->dev;
> +	struct device_node *r5_node = z_rproc->dev->of_node;
> +
> +	/* go through TCM banks for r5 node */
> +	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
> +	if (num_banks <= 0) {
> +		dev_err(dev, "need to specify TCM banks\n");
> +		return -EINVAL;
> +	}
> +	for (i = 0; i < num_banks; i++) {
> +		struct resource rsc;
> +		resource_size_t size;
> +		struct device_node *dt_node;
> +		struct rproc_mem_entry *mem;
> +		int ret;
> +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> +
> +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> +		if (!dt_node)
> +			return -EINVAL;
> +
> +		ret = of_address_to_resource(dt_node, 0, &rsc);
> +		if (ret < 0) {
> +			of_node_put(dt_node);
> +			return ret;
> +		}
> +		of_node_put(dt_node);
> +
> +		ret = zynqmp_r5_pm_request_sram(rsc.start);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* add carveout */
> +		size = resource_size(&rsc);
> +		mem = rproc_mem_entry_init(dev, NULL, rsc.start,
> +					   (size_t)size, rsc.start,
> +					   tcm_mem_alloc,
> +					   tcm_mem_release,
> +					   rsc.name);
> +		if (!mem) {
> +			ret = zynqmp_pm_release_node(pnode_id);
> +			if (ret)
> +				dev_warn(dev,
> +					 "fail to release node: %x ret: %x\n",
> +					 pnode_id, ret);
> +			return -ENOMEM;
> +		}
> +
> +		mem->priv = (void *)(u64)pnode_id;
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * zynqmp_r5_parse_fw()
> + * @rproc: single R5 core's corresponding rproc instance
> + * @fw: ptr to firmware to be loaded onto r5 core
> + *
> + * When loading firmware, ensure the necessary carveouts are in remoteproc
> + *
> + * return 0 on success, otherwise non-zero value on failure
> + */
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = parse_tcm_banks(rproc);
> +	if (ret)
> +		return ret;
> +
> +	ret = parse_mem_regions(rproc);
> +	if (ret)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret == -EINVAL) {
> +		/*
> +		 * resource table only required for IPC.
> +		 * if not present, this is not necessarily an error;
> +		 * for example, loading r5 hello world application
> +		 * so simply inform user and keep going.
> +		 */
> +		dev_info(&rproc->dev, "no resource table found.\n");
> +		ret = 0;
> +	}
> +	return ret;
> +}
> +
> +/*
> + * zynqmp_r5_rproc_kick() - kick a firmware if mbox is provided
> + * @rproc: r5 core's corresponding rproc structure
> + * @vqid: virtqueue ID
> + */
> +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> +	struct device *dev = rproc->dev.parent;
> +	struct zynqmp_ipi_message *mb_msg = NULL;
> +	unsigned int skb_len;
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	/* If vqid is negative, do not pass the vqid to
> +	 * mailbox as vqid is supposed to be 0 or positive.
> +	 * It also gives a way to just kick instead but
> +	 * not use the IPI buffer.
> +	 *
> +	 * For now use negative vqid to assume no message will be
> +	 * passed with IPI buffer, but just raise interrupt.
> +	 * This will be faster as it doesn't need to copy the
> +	 * message to the ZynqMP/Versal IPI message buffer.
> +	 */
> +	if (vqid >= 0) {
> +		skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> +		skb = alloc_skb(skb_len, GFP_KERNEL);
> +		if (!skb)
> +			return;
> +
> +		mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
> +		mb_msg->len = sizeof(vqid);
> +		memcpy(mb_msg->data, &vqid, sizeof(vqid));
> +
> +		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> +	}
> +
> +	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
> +	if (ret < 0) {
> +		dev_warn(dev, "Failed to kick remote.\n");
> +		if (mb_msg) {
> +			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> +			kfree_skb(skb);
> +		}
> +	}
> +}
> +
> +static struct rproc_ops zynqmp_r5_rproc_ops = {
> +	.start		= zynqmp_r5_rproc_start,
> +	.stop		= zynqmp_r5_rproc_stop,
> +	.load		= rproc_elf_load_segments,
> +	.parse_fw	= zynqmp_r5_parse_fw,
> +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	= rproc_elf_sanity_check,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.kick		= zynqmp_r5_rproc_kick,
> +};
> +

I have reviewed from the end of the file to here (see comments below) and aside
from minor comments, things look good.  I will review from here to the top
tomorrow.

Thanks,
Mathieu

> +/**
> + * event_notified_idr_cb() - event notified idr callback
> + * @id: idr id
> + * @ptr: pointer to idr private data
> + * @data: data passed to idr_for_each callback
> + *
> + * Pass notification to remoteproc virtio
> + *
> + * Return: 0. having return is to satisfy the idr_for_each() function
> + *          pointer input argument requirement.
> + **/
> +static int event_notified_idr_cb(int id, void *ptr, void *data)
> +{
> +	struct rproc *rproc = data;
> +
> +	if (rproc_vq_interrupt(rproc, id) == IRQ_NONE)
> +		dev_dbg(&rproc->dev, "no message was found in idr with id: %d\n", id);
> +	return 0;
> +}
> +
> +/**
> + * handle_event_notified() - remoteproc notification work function
> + * @work: pointer to the work structure
> + *
> + * It checks each registered remoteproc notify IDs.
> + */
> +static void handle_event_notified(struct work_struct *work)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct rproc *rproc;
> +
> +	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
> +	rproc = z_rproc->rproc;
> +
> +	/*
> +	 * This is to simply raise interrupt as ACK for remote.
> +	 *
> +	 * Xilinx mailbox, ATF and SoC specific IPI mapping will handle
> +	 * mapping to remote processor.
> +	 */
> +	if (mbox_send_message(z_rproc->rx_chan, NULL) < 0)
> +		dev_warn(rproc->dev.parent, "Failed to kick remote.\n");
> +
> +	/*
> +	 * We only use IPI for interrupt. The firmware side may or may
> +	 * not write the notifyid when it trigger IPI.
> +	 * And thus, we scan through all the registered notifyids.
> +	 */
> +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> +}
> +
> +/**
> + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> + * @cl: mailbox client
> + * @msg: message pointer
> + *
> + * It will schedule the R5 notification work.
> + */
> +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +
> +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> +	/*
> +	 * Notification can be received with message payload.
> +	 * To handle this, check for message contents.
> +	 * If there are contents, copy to ipi message buffer payload location.
> +	 *
> +	 * If message is empty, then that means that was simple raising
> +	 * of interrupt. no payload to process.
> +	 *
> +	 * Note: enqueue work regardless of msg as kick may imply that remote
> +	 * is waiting for ack.
> +	 */
> +	if (msg) {
> +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +		size_t len;
> +
> +		ipi_msg = (struct zynqmp_ipi_message *)msg;
> +		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> +		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
> +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> +		buf_msg->len = len;
> +		memcpy(buf_msg->data, ipi_msg->data, len);
> +	}
> +	schedule_work(&z_rproc->mbox_work);
> +}
> +
> +/**
> + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> + * @cl: mailbox client
> + * @msg: pointer to the message which has been sent
> + * @r: status of last TX - OK or error
> + *
> + * It will be called by the mailbox framework when the last TX has done.
> + */
> +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *msg, int r)
> +{
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct sk_buff *skb;
> +
> +	if (!msg)
> +		return;
> +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> +	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
> +	kfree_skb(skb);
> +}
> +
> +/**
> + * zynqmp_r5_setup_mbox() - Setup mailboxes
> + *			    this is used for each individual R5 core
> + *
> + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> + * @node: pointer of the device node
> + *
> + * Function to setup mailboxes to talk to RPU.
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> +				struct device_node *node)
> +{
> +	struct mbox_client *mclient;
> +
> +	/* Setup TX mailbox channel client */
> +	mclient			= &z_rproc->tx_mc;
> +	mclient->dev		= z_rproc->dev;
> +	mclient->tx_done	= zynqmp_r5_mb_tx_done;
> +	mclient->tx_block	= false;
> +	mclient->knows_txdone	= false;
> +	mclient->rx_callback	= NULL;
> +
> +	/* Setup RX mailbox channel client */
> +	mclient			= &z_rproc->rx_mc;
> +	mclient->dev		= z_rproc->dev;
> +	mclient->tx_done	= NULL;
> +	mclient->tx_block	= false;
> +	mclient->knows_txdone	= false;
> +	mclient->rx_callback	= zynqmp_r5_mb_rx_cb;
> +
> +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> +
> +	/* Request TX and RX channels */
> +	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc->tx_mc, "tx");
> +	if (IS_ERR(z_rproc->tx_chan)) {
> +		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
> +		return PTR_ERR(z_rproc->tx_chan);
> +	}
> +
> +	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc->rx_mc, "rx");
> +	if (IS_ERR(z_rproc->rx_chan)) {
> +		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
> +		return PTR_ERR(z_rproc->rx_chan);
> +	}
> +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> +
> +	return 0;
> +}
> +
> +static void zynqmp_r5_cleanup_mbox(struct zynqmp_r5_rproc *z_rproc)
> +{
> +	mbox_free_channel(z_rproc->tx_chan);
> +	mbox_free_channel(z_rproc->rx_chan);
> +}
> +
> +/**
> + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> + *		       this is called for each individual R5 core to
> + *		       set up mailbox, Xilinx platform manager unique ID,
> + *		       add to rproc core
> + *
> + * @pdev: domain platform device for current R5 core
> + * @node: pointer of the device node for current R5 core
> + * @rpu_mode: mode to configure RPU, split or lockstep
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static struct zynqmp_r5_rproc *zynqmp_r5_probe(struct platform_device *pdev,
> +					       struct device_node *node,
> +					       enum rpu_oper_mode rpu_mode)
> +{
> +	int ret;
> +	struct device *dev = &pdev->dev;
> +	struct rproc *rproc_ptr;
> +	struct zynqmp_r5_rproc *z_rproc;
> +
> +	/* Allocate remoteproc instance */
> +	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> +				     NULL, sizeof(struct zynqmp_r5_rproc));
> +	if (!rproc_ptr) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	rproc_ptr->auto_boot = false;
> +	z_rproc = rproc_ptr->priv;
> +	z_rproc->rproc = rproc_ptr;
> +	z_rproc->dev = dev;

Here z_rproc->dev is the same as z_rproc->rproc->dev->parent and as far as I can
tell z_rproc->rproc is available where z_rproc->dev is used.  As such
zynqmpq_r5_rproc::dev can likely be removed.

> +
> +	/* Set up DMA mask */
> +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto error;
> +
> +	/* Get R5 power domain node */
> +	ret = of_property_read_u32(node, "power-domain", &z_rproc->pnode_id);
> +	if (ret)
> +		goto error;
> +
> +	ret = r5_set_mode(z_rproc, rpu_mode);
> +	if (ret)
> +		goto error;
> +
> +	if (of_property_read_bool(node, "mboxes")) {
> +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	/* Add R5 remoteproc */
> +	ret = devm_rproc_add(dev, rproc_ptr);
> +	if (ret) {
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +		goto error;
> +	}
> +
> +	return z_rproc;
> +error:
> +	return ERR_PTR(ret);
> +}
> +
> +/*
> + * zynqmp_r5_remoteproc_probe()
> + *
> + * @pdev: domain platform device for R5 cluster
> + *
> + * called when driver is probed, for each R5 core specified in DT,
> + * setup as needed to do remoteproc-related operations
> + *
> + * Return: 0 for success, negative value for failure.
> + */
> +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> +{
> +	int ret, core_count;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *nc;
> +	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
> +	struct list_head *cluster; /* list to track each core's rproc */
> +	struct zynqmp_r5_rproc *z_rproc;
> +	struct platform_device *child_pdev;
> +	struct list_head *pos;
> +
> +	ret = of_property_read_u32(dev->of_node, "xlnx,cluster-mode", &rpu_mode);
> +	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
> +			rpu_mode != PM_RPU_MODE_SPLIT)) {
> +		dev_err(dev, "invalid cluster mode: ret %d mode %x\n",
> +			ret, rpu_mode);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "RPU configuration: %s\n",
> +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
> +
> +	/*
> +	 * if 2 RPUs provided but one is lockstep, then we have an
> +	 * invalid configuration.
> +	 */
> +
> +	core_count = of_get_available_child_count(dev->of_node);
> +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
> +	    core_count > MAX_RPROCS)
> +		return -EINVAL;
> +
> +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> +	if (!cluster)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(cluster);
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret) {
> +		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n",
> +			ret);

You can move the above "ret);" to the above line to avoid breaking it.  The 80
character per line rule was relaxed for cases like these.

> +		return ret;
> +	}
> +
> +	/* probe each individual r5 core's remoteproc-related info */
> +	for_each_available_child_of_node(dev->of_node, nc) {
> +		child_pdev = of_find_device_by_node(nc);
> +		if (!child_pdev) {
> +			dev_err(dev, "could not get R5 core platform device\n");
> +			ret = -ENODEV;
> +			goto out;
> +		}
> +
> +		z_rproc = zynqmp_r5_probe(child_pdev, nc, rpu_mode);
> +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> +			ret ? "Failed" : "Able",
> +			nc);

Staking - "nc);" could easily be on the previous line.

> +		if (IS_ERR(z_rproc)) {
> +			ret = PTR_ERR(z_rproc);
> +			goto out;
> +		}
> +		list_add_tail(&z_rproc->elem, cluster);
> +	}
> +	/* wire in so each core can be cleaned up at driver remove */
> +	platform_set_drvdata(pdev, cluster);
> +	return 0;
> +out:
> +	/*
> +	 * undo core0 upon any failures on core1 in split-mode
> +	 *
> +	 * in zynqmp_r5_probe z_rproc is set to null
> +	 * and ret to non-zero value if error

Not sure this comment applies anymore.

> +	 */
> +	list_for_each(pos, cluster) {
> +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +	}
> +	return ret;
> +}
> +
> +/*
> + * zynqmp_r5_remoteproc_remove()
> + *
> + * @pdev: domain platform device for R5 cluster
> + *
> + * When the driver is unloaded, clean up the mailboxes for each
> + * remoteproc that was initially probed.
> + */
> +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> +{
> +	struct list_head *pos, *temp, *cluster = (struct list_head *)
> +						 platform_get_drvdata(pdev);
> +	struct zynqmp_r5_rproc *z_rproc = NULL;
> +
> +	list_for_each_safe(pos, temp, cluster) {
> +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> +		zynqmp_r5_cleanup_mbox(z_rproc);
> +		list_del(pos);

In zynqmp_r5_remoteproc_probe() the element is not removed.  It doesn't make a
difference since the list isn't used for anything after this.  Regardless, pick
a heuristic and stick with it.

> +	}
> +	return 0;
> +}
> +
> +/* Match table for OF platform binding */
> +static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
> +	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
> +	{ /* end of list */ },
> +};
> +MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
> +
> +static struct platform_driver zynqmp_r5_remoteproc_driver = {
> +	.probe = zynqmp_r5_remoteproc_probe,
> +	.remove = zynqmp_r5_remoteproc_remove,
> +	.driver = {
> +		.name = "zynqmp_r5_remoteproc",
> +		.of_match_table = zynqmp_r5_remoteproc_match,
> +	},
> +};
> +module_platform_driver(zynqmp_r5_remoteproc_driver);
> +
> +MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
