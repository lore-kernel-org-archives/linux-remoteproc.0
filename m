Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFAF1581EB
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Aug 2024 07:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003672; cv=none; b=gckfSmN0PbIcGN5sJUhhTTWilhGZqUu2LS2XYGzRxIlFKP9lV1ynK3ehXK3Rjj4XLNVNsQLf626daTn+w6NRR16YDbeX3Xn708oHUA/qs5QEymSljIZLQj6sg4/jeaLz8xkf7I0m1Xn0iiOqMM4hMBfYI+VphmhCVuTnPEWHvUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003672; c=relaxed/simple;
	bh=GigODE0Fs0KZ0/oaP54PNRgnX7yCczDBeb1o+MqxtJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwPcldyGbPUrofE0aWFbCwSFwaq43L4H51TtqCL1mHte1jupZXpML/WqmNsdW1PC8NowyS70bCCj7v71JmX0AE/zxPznzuWHBSgrUxnKjfXSd1DG+4ROVcZjtTTXjXOMLgQuWh1rZxEcYwQMKSfx8wiSiXUYWqX6Ce+UYI/9nzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TyHcFpB3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TyHcFpB3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5353d0b7463so2747908e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Aug 2024 00:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725003668; x=1725608468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=krIqlg71Ix2gscKVWTZKo8Kwf6hgG34UWWvca/N+P8I=;
        b=TyHcFpB3GfqaQEcoI3m0TEGJk13C+gZqlMx0K468D/HY5k6Z3byabCKv/1nKsgQZZw
         t1h6Wn2VMXdoDjbVeDecjAbT4HI1cN+R7mp5y3xY57ToMNo6R4BfzDTQ2EPdD6gWwgcd
         zGLoa8abRGOTFHfhnawNlSnG6Hw/WHQq+ur5nmfSmxs7wa89U+mPsOG9qCERa8DRnX2i
         bTBq6nVdhz7eWloFg5opqH4t7HvIa44+xFfcnSn2fuOP9y9nkAL1tOseJ1VShshY4Vo/
         joiIfvEqTlZUNMBz30ICJpDEIbVGFRVYo1vMCw4zAfigIYcd3A2N/wczTpC/iRR/nJWO
         NjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003668; x=1725608468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krIqlg71Ix2gscKVWTZKo8Kwf6hgG34UWWvca/N+P8I=;
        b=sz9cxXRzOP9HMkPFYjr0XEvseOfMUc87YA8yB6ZN38PGsMAhRDa/e42Ce5XwnZY7mv
         RePq3QahSNsaJ6F4kO3ZGcenUS66K6u94y0nieplRVGdRFBSg55ZLoExyYgQBPct73h+
         olDZtgQhc8784sSPOpHnKta8buaI56qmOwuduP3XykP8DwYAMMuglRk9FvEN6pEuAz1/
         aQT8LYgsqAX4/rpOZjoYAevLpvXNCU5gFCEcJ/PxkxghlHee3R3DabfA2pBR+GL3SZKZ
         hx224oXAOXlNyI0iDiq/oG16uqR3UALkzqz5BGk4RLO3jcB65xDVHYs9Az1KhYAdz1Pq
         6Ddg==
X-Forwarded-Encrypted: i=1; AJvYcCUIrxJrsnJD8NIW8qEOFMgxtb8o2M7h/LcZL3tsEMamzvkKROrwKO38esODhGO8ljEKGZEsDA81a3xAQk0FoynZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn/Wt+d1k6M0kzVjcjEKxvXIAlHsxW34KE1KOmNNfSJFpGs5K5
	YmdsSsQG7qsEwOZ6FWdYHoejeDlYtR0EvsPskp8vom4aEU2juXDT4gzbs14ARRE=
X-Google-Smtp-Source: AGHT+IG3F17zzTiZgQ0sM2ANlZst5nwfe4vBQcKB867Cs5J0JtrKJht2KhZEuRNKJtD9xjXBHXtNTw==
X-Received: by 2002:a05:6512:b1d:b0:52f:d17e:46b with SMTP id 2adb3069b0e04-53546bfc7f6mr984444e87.54.1725003667095;
        Fri, 30 Aug 2024 00:41:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084dcbdsm470733e87.263.2024.08.30.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:41:06 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:41:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com, quic_mmanikan@quicinc.com, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com, quic_gokulsri@quiconc.com
Subject: Re: [PATCH V2 2/4] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <4x5z4zj6dwesb3fu3xkti4qygiuseegqmxp3lu4vfwrfmyrrpk@dlj4vbmp7pt6>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829134021.1452711-3-quic_gokulsri@quicinc.com>

On Thu, Aug 29, 2024 at 07:10:19PM GMT, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Add support to bring up hexagon based WCSS secure PIL remoteproc.
> IPQ5332, IPQ9574 supports secure PIL remoteproc.

Could you please clarify, why this can't be handled by the qcom_q6v5_pas
driver.

> 
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
> changes since v1: Addressed comments by Krzysztof
> 	- moved of_node_put( ) before return value check to avoid
> 	  leaking refcount.
> 	- simplified if/else for error handling.
> 	- implemented 'devm_clk_get_enabled' instead of using
> 	  'devm_clk_get' and 'clk_prepare_enable' conscutively.
> 	- implemented 'dev_err_probe' for error handling.
> 
>  drivers/remoteproc/Kconfig              |  22 ++
>  drivers/remoteproc/Makefile             |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss_sec.c | 354 ++++++++++++++++++++++++
>  3 files changed, 377 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_q6v5_wcss_sec.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0f0862e20a93..3e7c6fc62ca1 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -255,6 +255,28 @@ config QCOM_Q6V5_WCSS
>  	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
>  	  a non-TrustZone wireless subsystem.
>  
> +config QCOM_Q6V5_WCSS_SEC
> +	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
> +	depends on OF && ARCH_QCOM
> +	depends on QCOM_SMEM
> +	depends on RPMSG_QCOM_SMD || RPMSG_QCOM_SMD=n
> +	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
> +	depends on QCOM_SYSMON || QCOM_SYSMON=n
> +	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
> +	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
> +	select QCOM_MDT_LOADER
> +	select QCOM_PIL_INFO
> +	select QCOM_Q6V5_COMMON
> +	select QCOM_RPROC_COMMON
> +	select QCOM_SCM
> +	help
> +	  Say y here to support the Qualcomm Secure Peripheral Image Loader
> +	  for the Hexagon based remote processors on e.g. IPQ5332.
> +
> +	  This is TrustZone wireless subsystem. The firmware is
> +	  verified and booted with the help of the Peripheral Authentication
> +	  System (PAS) in TrustZone.
> +
>  config QCOM_SYSMON
>  	tristate "Qualcomm sysmon driver"
>  	depends on RPMSG
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index 5ff4e2fee4ab..d4971b672812 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
> +obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> new file mode 100644
> index 000000000000..3c8bb2639567
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016-2018 Linaro Ltd.
> + * Copyright (C) 2014 Sony Mobile Communications AB
> + * Copyright (c) 2012-2018, 2024 The Linux Foundation. All rights reserved.
> + */
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
> +#include <linux/soc/qcom/smem_state.h>
> +#include "qcom_common.h"
> +#include "qcom_q6v5.h"
> +
> +#include "remoteproc_internal.h"
> +
> +#define WCSS_CRASH_REASON		421
> +
> +#define WCSS_PAS_ID			0x6
> +#define MPD_WCSS_PAS_ID			0xD
> +
> +struct wcss_sec {
> +	struct device *dev;
> +	struct qcom_rproc_glink glink_subdev;
> +	struct qcom_rproc_ssr ssr_subdev;
> +	struct qcom_q6v5 q6;
> +	phys_addr_t mem_phys;
> +	phys_addr_t mem_reloc;
> +	void *mem_region;
> +	size_t mem_size;
> +	const struct wcss_data *desc;
> +	const char *fw_name;
> +
> +	struct clk *sleep_clk;
> +};
> +
> +struct wcss_data {
> +	u32 pasid;
> +	const struct rproc_ops *ops;
> +	bool need_auto_boot;

This isn't set anywere, drop it

> +	u8 bootargs_version;

Not used, drop it

> +	int (*init_clk)(struct wcss_sec *wcss);
> +};
> +
> +static int wcss_sec_start(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	int ret;
> +
> +	qcom_q6v5_prepare(&wcss->q6);
> +
> +	ret = qcom_scm_pas_auth_and_reset(desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "wcss_reset failed\n");
> +		return ret;
> +	}
> +
> +	ret = qcom_q6v5_wait_for_start(&wcss->q6, 5 * HZ);
> +	if (ret == -ETIMEDOUT)
> +		dev_err(dev, "start timed out\n");
> +
> +	return ret;
> +}
> +
> +static int wcss_sec_stop(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +	int ret;
> +
> +	ret = qcom_scm_pas_shutdown(desc->pasid);
> +	if (ret) {
> +		dev_err(dev, "not able to shutdown\n");
> +		return ret;
> +	}
> +	qcom_q6v5_unprepare(&wcss->q6);
> +
> +	return 0;
> +}
> +
> +static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
> +			       bool *is_iomem)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	int offset;
> +
> +	offset = da - wcss->mem_reloc;
> +	if (offset < 0 || offset + len > wcss->mem_size)
> +		return NULL;
> +
> +	return wcss->mem_region + offset;
> +}
> +
> +static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	const struct wcss_data *desc = of_device_get_match_data(dev);
> +
> +	return qcom_mdt_load(dev, fw, rproc->firmware, desc->pasid,
> +			     wcss->mem_region, wcss->mem_phys, wcss->mem_size,
> +			     &wcss->mem_reloc);

No qcom_pil_info_store() ?

> +}
> +
> +static unsigned long wcss_sec_panic(struct rproc *rproc)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	return qcom_q6v5_panic(&wcss->q6);
> +}
> +
> +static void wcss_sec_copy_segment(struct rproc *rproc,
> +				  struct rproc_dump_segment *segment,
> +				  void *dest, size_t offset, size_t size)
> +{
> +	struct wcss_sec *wcss = rproc->priv;
> +	struct device *dev = wcss->dev;
> +	void *ptr;
> +
> +	ptr = devm_ioremap_wc(dev, segment->da, segment->size);

Please don't use devm_ioremap if you are going to unmap it several lines
below. There is no need to burden devres with it.

> +	if (!ptr) {
> +		dev_err(dev, "Failed to ioremap segment %pad size %zx\n",
> +			&segment->da, segment->size);
> +		return;
> +	}
> +
> +	if (size <= segment->size - offset)
> +		memcpy(dest, ptr + offset, size);
> +	else
> +		dev_err(dev, "Copy size greater than segment size. Skipping\n");
> +	devm_iounmap(dev, ptr);
> +}
> +
> +static int wcss_sec_dump_segments(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	struct device *dev = rproc->dev.parent;
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	int num_segs, index = 0;
> +	int ret;
> +
> +	/* Parse through additional reserved memory regions for the rproc
> +	 * and add them to the coredump segments
> +	 */
> +	num_segs = of_count_phandle_with_args(dev->of_node,
> +					      "memory-region", NULL);
> +	while (index < num_segs) {
> +		node = of_parse_phandle(dev->of_node,
> +					"memory-region", index);
> +		if (!node)
> +			return -EINVAL;
> +
> +		rmem = of_reserved_mem_lookup(node);
> +		of_node_put(node);
> +		if (!rmem) {
> +			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
> +				index, num_segs);
> +			return -EINVAL;
> +		}
> +
> +		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
> +			&rmem->base, &rmem->size);
> +		ret = rproc_coredump_add_custom_segment(rproc,
> +							rmem->base,
> +							rmem->size,
> +							wcss_sec_copy_segment,
> +							NULL);
> +		if (ret)
> +			return ret;
> +
> +		index++;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct rproc_ops wcss_sec_ops = {
> +	.start = wcss_sec_start,
> +	.stop = wcss_sec_stop,
> +	.da_to_va = wcss_sec_da_to_va,
> +	.load = wcss_sec_load,
> +	.get_boot_addr = rproc_elf_get_boot_addr,
> +	.panic = wcss_sec_panic,
> +	.parse_fw = wcss_sec_dump_segments,
> +};
> +
> +static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
> +{
> +	struct reserved_mem *rmem = NULL;
> +	struct device_node *node;
> +	struct device *dev = wcss->dev;
> +
> +	node = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (!node) {
> +		dev_err(dev, "can't find phandle memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	of_node_put(node);
> +
> +	if (!rmem) {
> +		dev_err(dev, "unable to acquire memory-region\n");
> +		return -EINVAL;
> +	}
> +
> +	wcss->mem_phys = rmem->base;
> +	wcss->mem_reloc = rmem->base;
> +	wcss->mem_size = rmem->size;
> +	wcss->mem_region = devm_ioremap_wc(dev, wcss->mem_phys, wcss->mem_size);
> +	if (!wcss->mem_region) {
> +		dev_err(dev, "unable to map memory region: %pa+%pa\n",
> +			&rmem->base, &rmem->size);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcss_sec_probe(struct platform_device *pdev)
> +{
> +	struct wcss_sec *wcss;
> +	struct rproc *rproc;
> +	const char *fw_name = NULL;
> +	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
> +	int ret;
> +
> +	if (!desc)
> +		return -EINVAL;
> +
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0)
> +		return ret;
> +
> +	rproc = rproc_alloc(&pdev->dev, pdev->name, desc->ops, fw_name,
> +			    sizeof(*wcss));
> +	if (!rproc) {
> +		dev_err(&pdev->dev, "failed to allocate rproc\n");
> +		return -ENOMEM;
> +	}
> +
> +	wcss = rproc->priv;
> +	wcss->dev = &pdev->dev;
> +	wcss->desc = desc;
> +	wcss->fw_name = fw_name;
> +
> +	ret = wcss_sec_alloc_memory_region(wcss);
> +	if (ret)
> +		goto free_rproc;
> +
> +	if (desc->init_clk) {

Just use devm_clk_get_optional_enabled() instead of an optional
callback.

> +		ret = desc->init_clk(wcss);
> +		if (ret)
> +			goto free_rproc;
> +	}
> +
> +	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
> +			     WCSS_CRASH_REASON, NULL, NULL);
> +	if (ret)
> +		goto free_rproc;
> +
> +	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
> +	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, pdev->name);
> +
> +	rproc->auto_boot = desc->need_auto_boot;
> +	rproc->dump_conf = RPROC_COREDUMP_INLINE;
> +	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
> +
> +	ret = rproc_add(rproc);
> +	if (ret)
> +		goto free_rproc;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	return 0;
> +
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static void wcss_sec_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct wcss_sec *wcss = rproc->priv;
> +
> +	qcom_q6v5_deinit(&wcss->q6);
> +
> +	rproc_del(rproc);
> +	rproc_free(rproc);
> +}
> +
> +static int wcss_sec_ipq5332_init_clk(struct wcss_sec *wcss)
> +{
> +	int ret;
> +	struct device *dev = wcss->dev;
> +
> +	wcss->sleep_clk = devm_clk_get_enabled(dev, "sleep");
> +	if (IS_ERR(wcss->sleep_clk)) {
> +		return dev_err_probe(dev, PTR_ERR(wcss->sleep_clk),
> +				     "Could not get sleep clock\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct wcss_data wcss_sec_ipq5332_res_init = {
> +	.pasid = MPD_WCSS_PAS_ID,
> +	.ops = &wcss_sec_ops,
> +	.bootargs_version = 2,
> +	.init_clk = wcss_sec_ipq5332_init_clk,
> +};
> +
> +static const struct wcss_data wcss_sec_ipq9574_res_init = {
> +	.pasid = WCSS_PAS_ID,
> +	.ops = &wcss_sec_ops,
> +};
> +
> +static const struct of_device_id wcss_sec_of_match[] = {
> +	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
> +	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
> +
> +static struct platform_driver wcss_sec_driver = {
> +	.probe = wcss_sec_probe,
> +	.remove = wcss_sec_remove,
> +	.driver = {
> +		.name = "qcom-wcss-secure-pil",
> +		.of_match_table = wcss_sec_of_match,
> +	},
> +};
> +module_platform_driver(wcss_sec_driver);
> +
> +MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
