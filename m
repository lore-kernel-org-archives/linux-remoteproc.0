Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D48EE74901
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Oct 2023 17:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjJBRjp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjJBRjp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Oct 2023 13:39:45 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9086D94
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Oct 2023 10:39:41 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c62d61dc96so559305ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Oct 2023 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696268381; x=1696873181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZNTSehxjITuhkQRTwrb8eQONMtbuUB30cNWiClHfvA=;
        b=BTqY5zkAGmTtykoB6SS9SOHSzyRiGLaRrj8T1sgyIlCeubXkz55g1XcxVTXzoGp97m
         YJPszIeU7MweKLN0CmRm17t+ORUY8EjTxKisTPk6Y125s2yFP6+GeFBAc7QXVMUAwRzB
         hk5fzIUurSUDhc4TfJlrNgvPj/ArG5eicqhQyS8bEpV45wtUDC7obc1NRoGJSHABYLRG
         9o/RZIT3oVVS1gSov6DcvLNCVzwtbDYhHBRWOLPuU8A4MjF2QOvOi6cD6HFCgnsSKCrr
         fZ1odJ1gSOSYVdTAyP/TAOch6l6wWumsWhvEpMj5aMWKIs880/mIBEUp9241ZF6mUwN+
         3oKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696268381; x=1696873181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZNTSehxjITuhkQRTwrb8eQONMtbuUB30cNWiClHfvA=;
        b=PhwfwoZECZU01GsL1cfq7LwhCYrwmrtJqH/T/wdqe+G45E+AcUVOBe1NJP+ZA22dyu
         V0B6QRRtqXWzjXENuXoL0AUTXD6dLn1tystyrsfOIq0Hbvb6pBni4/M6Vp9ghQQb06WC
         zX+9Z10O7e+F9RA1Vqmts8qo9aF/Wf1jdebPy0uCDiaU+vRtTDK6OBZcGfbpjZPtOnou
         i3/a/k1bAItuiRVwHT2GimzK2XjYyqb/j4ECypVX2r7El81uPnnjyoLTwZaMN7AXE/s0
         mq1o7x2/TOmLCh7Ggt1o/TJuDJ2b7dMFsl0phsoKwhgo+sckh37++WIB3SeTKX5FgwsY
         mdYw==
X-Gm-Message-State: AOJu0YzbaKl03NtXJqE92UWyddW45sZUZ9yXi2TOubVq9jh19T5nbuxo
        c7+gxnNwRS1R6lgYa03yNDkmag==
X-Google-Smtp-Source: AGHT+IF4kFEVOXMqu0GUPWxMsg3dRaiH+WTACsdoB+nXDNfYPQTGTxsMDtCnlP0WYVQCBT4PoSdYbA==
X-Received: by 2002:a17:90a:e283:b0:279:23a:9e70 with SMTP id d3-20020a17090ae28300b00279023a9e70mr9756290pjz.2.1696268380960;
        Mon, 02 Oct 2023 10:39:40 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fa62:edba:ab23:c762])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm7132960pje.21.2023.10.02.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:39:40 -0700 (PDT)
Date:   Mon, 2 Oct 2023 11:39:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Tanmay Shah <tanmay.shah@amd.com>
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        radhey.shyam.pandey@amd.com, ben.levinsky@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] remoteproc: zynqmp: parse TCM from device tree
Message-ID: <ZRsAWodXRJr7TT3B@p14s>
References: <20230928155900.3987103-1-tanmay.shah@amd.com>
 <20230928155900.3987103-5-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928155900.3987103-5-tanmay.shah@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 28, 2023 at 08:59:00AM -0700, Tanmay Shah wrote:
> ZynqMP TCM information is fixed in driver. Now ZynqMP TCM information
> is available in device-tree. Parse TCM information in driver
> as per new bindings

Missing '.' at the end of the sentence.

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 122 ++++++++++++++++++++++--
>  1 file changed, 114 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 27ed2c070ebb..749e9da68906 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -75,8 +75,8 @@ struct mbox_info {
>  };
>  
>  /*
> - * Hardcoded TCM bank values. This will be removed once TCM bindings are
> - * accepted for system-dt specifications and upstreamed in linux kernel
> + * Hardcoded TCM bank values. This will stay in driver to maintain backward
> + * compatibility with device-tree that does not have TCM information.
>   */
>  static const struct mem_bank_data zynqmp_tcm_banks_split[] = {
>  	{0xffe00000UL, 0x0, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each */
> @@ -613,7 +613,8 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
>  						 bank_name);
>  		if (!rproc_mem) {
>  			ret = -ENOMEM;
> -			zynqmp_pm_release_node(pm_domain_id);
> +			if (pm_domain_id)
> +				zynqmp_pm_release_node(pm_domain_id);
>  			goto release_tcm_split;
>  		}
>  
> @@ -626,7 +627,8 @@ static int add_tcm_carveout_split_mode(struct rproc *rproc)
>  	/* If failed, Turn off all TCM banks turned on before */
>  	for (i--; i >= 0; i--) {
>  		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
> -		zynqmp_pm_release_node(pm_domain_id);
> +		if (pm_domain_id)
> +			zynqmp_pm_release_node(pm_domain_id);
>  	}
>  	return ret;
>  }
> @@ -1064,6 +1066,107 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	return ERR_PTR(ret);
>  }
>  
> +static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
> +{
> +	int i, j, tcm_bank_count, ret = -EINVAL;

> +	struct platform_device *cpdev;
> +	struct resource *res = NULL;
> +	u64 abs_addr = 0, size = 0;
> +	struct mem_bank_data *tcm;
> +	struct device_node *np;
> +	struct device *dev;

As far as I can tell, none of the above initialization is needed.  I have
commented on that before.

> +
> +	for (i = 0; i < cluster->core_count; i++) {
> +		r5_core = cluster->r5_cores[i];
> +		dev = r5_core->dev;
> +		np = dev_of_node(dev);
> +
> +		/* we have address cell 2 and size cell as 2 */
> +		ret = of_property_count_elems_of_size(np, "reg",
> +						      4 * sizeof(u32));
> +		if (ret == 0) {
> +			ret = -EINVAL;
> +			goto fail_tcm;
> +		}
> +		if (ret < 0)
> +			goto fail_tcm;

                if (ret <= 0) {
                        ret = -EINVAL;
                        goto fail_tcm;
                }

> +
> +		tcm_bank_count = ret;
> +
> +		r5_core->tcm_banks = devm_kcalloc(dev, tcm_bank_count,
> +						  sizeof(struct mem_bank_data *),
> +						  GFP_KERNEL);
> +		if (!r5_core->tcm_banks) {
> +			ret = -ENOMEM;
> +			goto fail_tcm;
> +		}
> +
> +		r5_core->tcm_bank_count = tcm_bank_count;
> +		for (j = 0; j < tcm_bank_count; j++) {
> +			tcm = devm_kzalloc(dev, sizeof(struct mem_bank_data *),
> +					   GFP_KERNEL);
> +			if (!tcm) {
> +				ret = -ENOMEM;
> +				goto fail_tcm;
> +			}
> +
> +			r5_core->tcm_banks[j] = tcm;
> +
> +			/* get tcm address without translation */
> +			ret = of_property_read_reg(np, j, &abs_addr, &size);
> +			if (ret) {
> +				dev_err(dev, "failed to get reg property\n");
> +				goto fail_tcm;
> +			}
> +
> +			/*
> +			 * remote processor can address only 32 bits
> +			 * so convert 64-bits into 32-bits. This will discard
> +			 * any unwanted upper 32-bits.
> +			 */
> +			tcm->da = (u32)abs_addr;
> +			tcm->size = (u32)size;
> +
> +			cpdev = to_platform_device(dev);
> +			res = platform_get_resource(cpdev, IORESOURCE_MEM, j);
> +			if (!res) {
> +				dev_err(dev, "failed to get tcm resource\n");
> +				ret = -EINVAL;
> +				goto fail_tcm;
> +			}
> +
> +			tcm->addr = (u32)res->start;
> +			tcm->bank_name = (char *)res->name;
> +			res = devm_request_mem_region(dev, tcm->addr, tcm->size,
> +						      tcm->bank_name);
> +			if (!res) {
> +				dev_err(dev, "failed to request tcm resource\n");
> +				ret = -EINVAL;
> +				goto fail_tcm;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +fail_tcm:
> +	while (i >= 0) {
> +		r5_core = cluster->r5_cores[i];
> +		for (j = 0; j < r5_core->tcm_bank_count; j++) {
> +			if (!r5_core->tcm_banks || !r5_core->tcm_banks[j])
> +				continue;
> +			tcm = r5_core->tcm_banks[j];
> +			devm_kfree(r5_core->dev, tcm);
> +		}
> +		devm_kfree(r5_core->dev, r5_core->tcm_banks);
> +		r5_core->tcm_banks = NULL;
> +		i--;
> +	}

Given the devm_xyz() API used in this function, is the above needed?

Thanks, 
Mathieu

> +
> +	return ret;
> +}
> +
>  /**
>   * zynqmp_r5_get_tcm_node()
>   * Ideally this function should parse tcm node and store information
> @@ -1142,10 +1245,13 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  	struct zynqmp_r5_core *r5_core;
>  	int ret, i;
>  
> -	ret = zynqmp_r5_get_tcm_node(cluster);
> -	if (ret < 0) {
> -		dev_err(dev, "can't get tcm node, err %d\n", ret);
> -		return ret;
> +	ret = zynqmp_r5_get_tcm_node_from_dt(cluster);
> +	if (ret) {
> +		ret = zynqmp_r5_get_tcm_node(cluster);
> +		if (ret < 0) {
> +			dev_err(dev, "can't get tcm node, err %d\n", ret);
> +			return ret;
> +		}
>  	}
>  
>  	for (i = 0; i < cluster->core_count; i++) {
> -- 
> 2.25.1
> 
