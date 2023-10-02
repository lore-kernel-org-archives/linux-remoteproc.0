Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC86E784B0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 17:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbjJBRLk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238669AbjJBRLj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 13:11:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059C3D8
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Oct 2023 10:11:36 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-694ed847889so824153b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Oct 2023 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696266695; x=1696871495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RO8LmnAQAaGitSXUySpyKWLVPTjigR/N/h30MsqWtSs=;
        b=eZdx0mf3mbrk34OKA6Ou3OYpzol/noco+tpro3vOnwT7R4xKrKaT6NdMPxfxluKaIY
         I3B2zQWj3vIInVf6+cghWRLzh99+jXpOsUFj7grEey5OCRC2aRGNSFxmK6N6l1K17Ibe
         GNVd/nk8X7cCw2bK7wOGgmy2sm4XaxF0goPJAtnd2zmG40Sqp8O0VTEDWTgJJFZXMA64
         Zqy6ZtVtqqFu6//EnlGmTwSREixPjakmAGP2INEGt4PthRoThcffuLoS5DTZ5yaIaA8A
         49nw8IuRwMMUosxM6/qYu9FqnRexaNujYq2HPZUTU6JAubDe6dnIv2H4ssufO+yeVLRS
         APwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696266695; x=1696871495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO8LmnAQAaGitSXUySpyKWLVPTjigR/N/h30MsqWtSs=;
        b=v7TKrHcSgnp1BghRKkwVGckbak2tyn6ICFutMCk27cogousONtsrXdu5d8XAUcoexd
         dZc/etCSW+cRK5UEWzdf9ExalYdOATR+CY5fpiMiR+NDSZqMVQ18+9u8x7FjeijNVC7G
         gYaLTpBjKfFhNBYh837MnM2jvv7usN9Czay6IpUZQmKHVjEs1AuEPCocdyrO8XfYeUl9
         YVrTuDXMNaH1uMA9phlfLPRF3M1bjrbbf5c5pHycLKK7U9pYBxGr40sj3qjdFwJbFVOQ
         oNwdYnJTaOBRNkPgKO448qb4fZW//FtsC60s5/IG3WwnozLBArpKiVPsxg8y4IK/Bx2h
         +STg==
X-Gm-Message-State: AOJu0YyU4S/iNO7lMo7QK3BTFlInb2aXGTiyco8k396eHaiV2E4yOvcE
        /fDHF0bE8n4I4dcqQACyQ1ai+w==
X-Google-Smtp-Source: AGHT+IF1FZLmlAaibekVfNPfOP8jIXo5x7QhPxzko11+4JiGyUuhCz3pCTLhKVh8fga2WKh0RYfltw==
X-Received: by 2002:a05:6a20:8410:b0:154:6480:83b4 with SMTP id c16-20020a056a20841000b00154648083b4mr12437393pzd.14.1696266695325;
        Mon, 02 Oct 2023 10:11:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fa62:edba:ab23:c762])
        by smtp.gmail.com with ESMTPSA id f24-20020aa782d8000000b0069309cbc220sm11386769pfn.121.2023.10.02.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:11:34 -0700 (PDT)
Date:   Mon, 2 Oct 2023 11:11:32 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/4] remoteproc: zynqmp: add pm domains support
Message-ID: <ZRr5xI1w4Pd3/8+S@p14s>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-4-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928155900.3987103-4-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 28, 2023 at 08:58:59AM -0700, Tanmay Shah wrote:
> Use TCM pm domains extracted from device-tree
> to power on/off TCM using general pm domain framework
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 224 ++++++++++++++++++++++--
>  1 file changed, 205 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 4395edea9a64..27ed2c070ebb 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/pm_domain.h>
>  
>  #include "remoteproc_internal.h"
>  
> @@ -102,6 +103,12 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>   * @rproc: rproc handle
>   * @pm_domain_id: RPU CPU power domain id
>   * @ipi: pointer to mailbox information
> + * @num_pm_dev: number of tcm pm domain devices for this core
> + * @pm_dev1: pm domain virtual devices for power domain framework
> + * @pm_dev_link1: pm domain device links after registration
> + * @pm_dev2: used only in lockstep mode. second core's pm domain virtual devices
> + * @pm_dev_link2: used only in lockstep mode. second core's pm device links after
> + * registration
>   */
>  struct zynqmp_r5_core {
>  	struct device *dev;
> @@ -111,6 +118,11 @@ struct zynqmp_r5_core {
>  	struct rproc *rproc;
>  	u32 pm_domain_id;
>  	struct mbox_info *ipi;
> +	int num_pm_dev;
> +	struct device **pm_dev1;
> +	struct device_link **pm_dev_link1;
> +	struct device **pm_dev2;
> +	struct device_link **pm_dev_link2;
>  };
>  
>  /**
> @@ -575,12 +587,21 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
>  		bank_size = r5_core->tcm_banks[i]->size;
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>  
> -		ret = zynqmp_pm_request_node(pm_domain_id,
> -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> -			goto release_tcm_split;
> +		/*
> +		 * If TCM information is available in device-tree then
> +		 * in that case, pm domain framework will power on/off TCM.
> +		 * In that case pm_domain_id is set to 0. If hardcode
> +		 * bindings from driver is used, then only this driver will
> +		 * use pm_domain_id.
> +		 */
> +		if (pm_domain_id) {
> +			ret = zynqmp_pm_request_node(pm_domain_id,
> +						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +			if (ret < 0) {
> +				dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> +				goto release_tcm_split;
> +			}
>  		}
>  
>  		dev_dbg(dev, "TCM carveout split mode %s addr=%llx, da=0x%x, size=0x%lx",
> @@ -646,13 +667,16 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  	for (i = 0; i < num_banks; i++) {
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>  
> -		/* Turn on each TCM bank individually */
> -		ret = zynqmp_pm_request_node(pm_domain_id,
> -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to turn on TCM 0x%x", pm_domain_id);
> -			goto release_tcm_lockstep;
> +		if (pm_domain_id) {
> +			/* Turn on each TCM bank individually */
> +			ret = zynqmp_pm_request_node(pm_domain_id,
> +						     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +						     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +			if (ret < 0) {
> +				dev_err(dev, "failed to turn on TCM 0x%x",
> +					pm_domain_id);
> +				goto release_tcm_lockstep;
> +			}
>  		}
>  
>  		bank_size = r5_core->tcm_banks[i]->size;
> @@ -687,8 +711,10 @@ static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
>  	/* If failed, Turn off all TCM banks turned on before */
>  	for (i--; i >= 0; i--) {
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> -		zynqmp_pm_release_node(pm_domain_id);
> +		if (pm_domain_id)
> +			zynqmp_pm_release_node(pm_domain_id);
>  	}
> +

Spurious change

>  	return ret;
>  }
>  
> @@ -758,6 +784,153 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  	return ret;
>  }
>  
> +static void zynqmp_r5_remove_pm_domains(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct device *dev = r5_core->dev;
> +	struct zynqmp_r5_cluster *cluster;
> +	int i;
> +
> +	cluster = platform_get_drvdata(to_platform_device(dev->parent));
> +
> +	for (i = 0; i < r5_core->num_pm_dev; i++) {
> +		if (r5_core->pm_dev_link1 && r5_core->pm_dev_link1[i])
> +			device_link_del(r5_core->pm_dev_link1[i]);
> +		if (r5_core->pm_dev1 && !IS_ERR_OR_NULL(r5_core->pm_dev1[i]))
> +			dev_pm_domain_detach(r5_core->pm_dev1[i], false);
> +	}
> +

A global function such as this one should not have to deal with error
conditions.  Those should be dealt with in the allocation function where cleanup
is done on error conditions.  See my comment below in
zynqmp_r5_add_pm_domains().

> +	kfree(r5_core->pm_dev1);
> +	r5_core->pm_dev1 = NULL;
> +	kfree(r5_core->pm_dev_link1);
> +	r5_core->pm_dev_link1 = NULL;
> +
> +	if (cluster->mode == SPLIT_MODE) {
> +		r5_core->num_pm_dev = 0;
> +		return;
> +	}
> +
> +	for (i = 0; i < r5_core->num_pm_dev; i++) {
> +		if (r5_core->pm_dev_link2 && r5_core->pm_dev_link2[i])
> +			device_link_del(r5_core->pm_dev_link2[i]);
> +		if (r5_core->pm_dev2 && !IS_ERR_OR_NULL(r5_core->pm_dev2[i]))
> +			dev_pm_domain_detach(r5_core->pm_dev2[i], false);
> +	}
> +
> +	kfree(r5_core->pm_dev2);
> +	r5_core->pm_dev2 = NULL;
> +	kfree(r5_core->pm_dev_link2);
> +	r5_core->pm_dev_link2 = NULL;
> +	r5_core->num_pm_dev = 0;
> +}
> +
> +static int zynqmp_r5_add_pm_domains(struct rproc *rproc)
> +{
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct device *dev = r5_core->dev, *dev2;
> +	struct zynqmp_r5_cluster *cluster;
> +	struct platform_device *pdev;
> +	struct device_node *np;
> +	int i, num_pm_dev, ret;

I'm not sure 'ret' is needed - see below.

> +
> +	cluster = platform_get_drvdata(to_platform_device(dev->parent));

Why not use dev_get_drvdata() as it is done elsewhere in this driver?

> +
> +	/* get number of power-domains */
> +	num_pm_dev = of_count_phandle_with_args(r5_core->np, "power-domains",
> +						"#power-domain-cells");
> +
> +	if (num_pm_dev <= 0)
> +		return -EINVAL;
> +
> +	r5_core->pm_dev1 = kcalloc(num_pm_dev,
> +				   sizeof(struct device *),
> +				   GFP_KERNEL);
> +	if (!r5_core->pm_dev1)
> +		ret = -ENOMEM;

What's the goal of the assignment?  Did you mean to return an error instead?

> +
> +	r5_core->pm_dev_link1 = kcalloc(num_pm_dev,
> +					sizeof(struct device_link *),
> +					GFP_KERNEL);
> +	if (!r5_core->pm_dev_link1)
> +		return -ENOMEM;

In case of error, always cleanup the work done in the current function.  That
way cleanup functions such as zynqmp_r5_remove_pm_domains() are simple and easy
to read.

> +
> +	r5_core->num_pm_dev = num_pm_dev;
> +
> +	/* for zynqmp we only add TCM power domains and not core's power domain */
> +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> +		r5_core->pm_dev1[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(r5_core->pm_dev1[i])) {
> +			dev_dbg(dev, "failed to attach pm domain %d\n", i);
> +			return PTR_ERR(r5_core->pm_dev1[i]);
> +		}
> +		if (!r5_core->pm_dev1[i]) {
> +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> +			return -EINVAL;
> +		}
> +
> +		r5_core->pm_dev_link1[i] = device_link_add(dev, r5_core->pm_dev1[i],
> +							   DL_FLAG_STATELESS |
> +							   DL_FLAG_RPM_ACTIVE |
> +							   DL_FLAG_PM_RUNTIME);
> +		if (!r5_core->pm_dev_link1[i]) {
> +			dev_pm_domain_detach(r5_core->pm_dev1[i], true);
> +			r5_core->pm_dev1[i] = NULL;
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (cluster->mode == SPLIT_MODE)
> +		return 0;
> +
> +	r5_core->pm_dev2 = kcalloc(num_pm_dev,
> +				   sizeof(struct device *),
> +				   GFP_KERNEL);
> +	if (!r5_core->pm_dev2)
> +		return -ENOMEM;
> +
> +	r5_core->pm_dev_link2 = kcalloc(num_pm_dev,
> +					sizeof(struct device_link *),
> +					GFP_KERNEL);
> +	if (!r5_core->pm_dev_link2)
> +		return -ENOMEM;
> +
> +	/* get second core's device to detach its power-domains */
> +	np = of_get_next_child(cluster->dev->of_node, of_node_get(dev->of_node));
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev) {
> +		dev_err(cluster->dev, "core1 platform device not available\n");
> +		return -EINVAL;
> +	}
> +
> +	dev2 = &pdev->dev;
> +
> +	/* for zynqmp we only add TCM power domains and not core's power domain */
> +	for (i = 1; i < r5_core->num_pm_dev; i++) {
> +		r5_core->pm_dev2[i] = dev_pm_domain_attach_by_id(dev2, i);
> +		if (IS_ERR(r5_core->pm_dev2[i])) {
> +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> +			return PTR_ERR(r5_core->pm_dev2[i]);
> +		}
> +		if (!r5_core->pm_dev2[i]) {
> +			dev_dbg(dev, "can't attach to pm domain %d\n", i);
> +			return -EINVAL;
> +		}
> +
> +		r5_core->pm_dev_link2[i] = device_link_add(dev, r5_core->pm_dev2[i],
> +							   DL_FLAG_STATELESS |
> +							   DL_FLAG_RPM_ACTIVE |
> +							   DL_FLAG_PM_RUNTIME);
> +		if (!r5_core->pm_dev_link2[i]) {
> +			dev_pm_domain_detach(r5_core->pm_dev2[i], true);
> +			r5_core->pm_dev2[i] = NULL;
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * zynqmp_r5_rproc_prepare()
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -770,19 +943,30 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>  {
>  	int ret;
>  
> +	ret = zynqmp_r5_add_pm_domains(rproc);
> +	if (ret) {
> +		dev_err(&rproc->dev, "failed to add pm domains\n");
> +		goto fail_prepare;
> +	}
> +
>  	ret = add_tcm_banks(rproc);
>  	if (ret) {
>  		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
> -		return ret;
> +		goto fail_prepare;
>  	}
>  
>  	ret = add_mem_regions_carveout(rproc);
>  	if (ret) {
>  		dev_err(&rproc->dev, "failed to get reserve mem regions %d\n", ret);
> -		return ret;
> +		goto fail_prepare;
>  	}
>  
>  	return 0;
> +
> +fail_prepare:
> +	zynqmp_r5_remove_pm_domains(rproc);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -801,11 +985,13 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>  
>  	r5_core = rproc->priv;
>  
> +	zynqmp_r5_remove_pm_domains(rproc);
> +
>  	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> -		if (zynqmp_pm_release_node(pm_domain_id))
> -			dev_warn(r5_core->dev,
> -				 "can't turn off TCM bank 0x%x", pm_domain_id);
> +		if (pm_domain_id && zynqmp_pm_release_node(pm_domain_id))
> +			dev_dbg(r5_core->dev,
> +				"can't turn off TCM bank 0x%x", pm_domain_id);
>  	}
>  
>  	return 0;
> -- 
> 2.25.1
> 
