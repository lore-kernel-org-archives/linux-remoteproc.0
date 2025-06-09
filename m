Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D814B959
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Jun 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482254; cv=none; b=AsNpcy2ZpKQXhUUCoYRlSLEC9yIoDgV9yq7ilChW3SKfDVQvR8l9vlYFDnua/g91Lx3OA13qSFtPkM8VQ2iMD0/9MEkI8hONsjxn6mQ2SNj8l5kcUgU7PseRsi6jF0ASLLWlEZWuzVQLAh0M27+vqbI+PWFeOE45i2c7j91qNyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482254; c=relaxed/simple;
	bh=c5Gt0Vtn4kjwuSa2XkI8uVm8JcnmxhYa5s1PdMl9B50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz0mklwPXqckzFkTUjgWIo+Hjf29Dz3hwMRoBWe8sLo2LmW/BQRKQ7A/BW5s34Kizyq8p8LD6gbye7p3R4R7ftl7/QAjBJ66Keb9LhGEAjTkSNRWG9+C+x60hvSCuB1G+dWoGDnjIiUIC3GwGbnrSha05JP/LDl33hAnzbrsDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+w5GYlz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+w5GYlz"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so4687656b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Jun 2025 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749482251; x=1750087051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wgi4l9pB+k6eYqsObcJMKbBiV/az9m6d/4vGJ5hPSY=;
        b=p+w5GYlzHIH9qUO/oD/OFzmngf6WjdC5am0OeqED+pWy3Q1PzERK89WcWVscFdvNUk
         QyACu0RQDMP0N2wsBN9Kt8WM6RY5TZt37aOLXtyfRH2qrvq01gb0Cvcvv81d/VKBBGZM
         XuGv5lWEG+XolAHrrWaRIevGMOhY72GufbDTcg0hJyJSscgz5arAQC2VEhwmZeKsq8zo
         iNlA8DJNAP7ZVWxEQHcHpRL5oD5kqUKIbXe8UDnftnlBiT+nsrbRqb/uPvh+HwNmdZDv
         wneYEqvqjnf4gbjT6LkFah0+d05BLlN6fXw8D0YiI5Hbn9DN90j0XtF8bve5eSuCGPu9
         yvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482251; x=1750087051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wgi4l9pB+k6eYqsObcJMKbBiV/az9m6d/4vGJ5hPSY=;
        b=e9Ufjb4KJTMayCOb9Mu9RnCFNhQJTlBaKG9KdSNo9U1CkVyu4Cb9N/rze+943cYhha
         MI9ozhhlEUT3n98V7N+0bIDMJCcKCrHiAsVnJfhMu3g27j8Qpa3pKIaoksamf6NjcZfn
         WLZvebj8mcxDScna1lEJVA4qpVuWUTkOaPYdQrX+gZSnjdFFRK1skW11Ypx3SbmbZmJ6
         ZE5uf1KBYt+boWBbpUfdG7zEPz05cHcPCiY9K/MhN1We9YWLSX+bQAU8DhnhmE3GK0fa
         XHhPiQ+RF4RD1QzKSZ/X+uPJTeG3lSqaAiKywbZpXOqX66aRZjOp7NFNhO9dQd2vpRDe
         kH7g==
X-Forwarded-Encrypted: i=1; AJvYcCWDUPfkg6rHBLxHbAl2GcC5ufyB613RY55YOvDFfKzItBd3s1KvJniJtipq/kQd4ize6eeKYyxVJkBZ5NjjefuX@vger.kernel.org
X-Gm-Message-State: AOJu0YwruQuRkZgZoyHtSNHQ2XEli92qWkAvQWbktBHLxiFCY1itAnpy
	zi3i74YRnlhaGu4TCgwr1gLT230nvWC8noAYYJIXFvx9wS0URwNvDFuKr5eegiO5wXo=
X-Gm-Gg: ASbGncvezUsD0fC+nFJtMFUhanBDqqzv3aGVMtV3X+sM8xcePcvDEOb+83bbzwItVl8
	yq1CbHZCgLURCM8WnfB27DSJFkWwGK+J0aGgKzJo6OGjsV8tlZDLOUSMbqog+NbblMQJ4KHPfD/
	/gpZ3K90EhfQDCDcb6n2NZIlEtwq2Y50Lrn0JQRgd7fuOK3EjV5A7fcBhw2xkp+Z/S8bhbP7F8i
	8YNK4OaPDsvRHXNr4OB7oeB/2blxxk34z7yiJ64bP8CX5mNATuvUXGX1mnxPXG8AZoBLOYNvPhk
	R37+HW5xX1dKDPyb/1LOXi9nBOLkfDqXn2Uql5YRVaGCtxiFgf7muok=
X-Google-Smtp-Source: AGHT+IG+8DMWeioystMlYoPtUrhRgiquzNvnRe0fXwZg1slBlCk+KnQoms7/UocPVMMtvBlqNfImuw==
X-Received: by 2002:a05:6a21:8cca:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21f75c8fb52mr289826637.15.1749482251479;
        Mon, 09 Jun 2025 08:17:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1329:68ff:ffeb:cd9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38378sm6095758b3a.16.2025.06.09.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:17:30 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:17:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aEb7CCkr0unZppvn@p14s>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
 <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>

Good day,

On Fri, Jun 06, 2025 at 09:55:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
> 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 127 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   2 +
>  2 files changed, 127 insertions(+), 2 deletions(-)
> 

I will look at this patch when either Daniel or Iuliana have given their R-B.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..8fe3c76c9b30ed9e66d4e8c8e2e178a21f3b5bd2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>  
> @@ -115,6 +122,10 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				cpuid;
> +	u32				lmid;
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -393,6 +404,30 @@ static int imx_rproc_start(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +				return -EACCES;
> +
> +			ret = scmi_imx_lmm_reset_vector_set(priv->lmid, priv->cpuid, 0, 0);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +					priv->lmid, priv->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_BOOT, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, priv->lmid);
> +		} else {
> +			ret = scmi_imx_cpu_reset_vector_set(priv->cpuid, 0, true, false, false);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> +					priv->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_cpu_start(priv->cpuid, true);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -435,6 +470,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> +				ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +			else
> +				ret = -EACCES;
> +		} else {
> +			ret = scmi_imx_cpu_start(priv->cpuid, false);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -549,9 +594,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
>  	struct reserved_mem *rmem;
> +	int ret;
>  	u32 da;
>  
>  	/* Register associated reserved memory regions */
> @@ -592,6 +639,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>  
> +	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> +			break;
> +		/*
> +		 * Power on the Logical Machine to make sure TCM is available.
> +		 * Also serve as permission check. If in different Logical
> +		 * Machine, and linux has permission to handle the Logical
> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +		 */
> +		ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +		if (ret == 0) {
> +			dev_info(priv->dev, "lmm(%d) powered on\n", priv->lmid);
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		} else if (ret == -EACCES) {
> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", priv->lmid);
> +			/*
> +			 * If remote cores boots up, continue the rpmsg channel setup,
> +			 * else linux have no permission, so return -EACCES.
> +			 */
> +			if (priv->rproc->state != RPROC_DETACHED)
> +				return -EACCES;
> +		} else if (ret) {
> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, priv->lmid);
> +			return ret;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	};
> +
>  	return  0;
>  }
>  
> @@ -911,13 +990,53 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
>  	struct regmap *regmap;
>  	struct arm_smccc_res res;
> +	bool started = false;
>  	int ret;
>  	u32 val;
>  	u8 pt;
>  
>  	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		/* Get current Linux Logical Machine ID */
> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +		if (ret) {
> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32(dev->of_node, "fsl,cpu-id", &priv->cpuid);
> +		if (ret) {
> +			dev_err(dev, "No fsl,cpu-id property\n");
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32(dev->of_node, "fsl,lmm-id", &priv->lmid);
> +		if (ret) {
> +			dev_info(dev, "No fsl,lmm-id property\n");
> +			return ret;
> +		}
> +
> +		/*
> +		 * Check whether remote processor is in same Logical Machine as Linux.
> +		 * If no, need use Logical Machine API to manage remote processor, and
> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> +		 * If yes, use CPU protocol API to manage remote processor.
> +		 */
> +		if (priv->lmid != info.lmid) {
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> +			dev_info(dev, "Using LMM Protocol OPS\n");
> +		} else {
> +			dev_info(dev, "Using CPU Protocol OPS\n");
> +		}
> +
> +		scmi_imx_cpu_started(priv->cpuid, &started);
> +		if (started)
> +			priv->rproc->state = RPROC_DETACHED;
> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1029,8 +1148,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/*
> +	 * IMX_RPROC_NONE indicates not under control of Linux.
> +	 * System Manager(SM) firmware automatically configures clock,
> +	 * so bypass the clk settings for IMX_RPROC_SM.
> +	 */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..e3e851d88fb069a589531ea21a3790fd62fde57d 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -26,6 +26,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_SCU_API,
>  	/* Through Reset Controller API */
>  	IMX_RPROC_RESET_CONTROLLER,
> +	/* Through System Manager */
> +	IMX_RPROC_SM,
>  };
>  
>  /* dcfg flags */
> 
> -- 
> 2.37.1
> 
