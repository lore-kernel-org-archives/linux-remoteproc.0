Return-Path: <SRS0=BBTQ=BH=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA048C433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 05:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8308320658
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Jul 2020 05:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUQ733KD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgG1Fvl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Jul 2020 01:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgG1Fvl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jul 2020 01:51:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6454C0619D2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2020 22:51:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w126so10144577pfw.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2020 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SD7cowK7TBSEUtyyJCNTowcFkGoyJguvCPEnc3FJ+lw=;
        b=BUQ733KDte9V4I1wuEjDmpQAL78CHplNS5xBfdjivfTxgYio/yh9ZahIVVz0tj+944
         tro8SgS/Y07CZNrQn9ePhojanc/poWSdkQ5HSh087Vk7lPnDlnfuYF1SzZX6l4bICec2
         9rwI9HY6KeOuJ3/9v8jl9Ui/xy3LvIen/cDgCaEaJg5dRqPxcdQQY+lsiO3zwE3JK1xA
         ggdfjdT2Y6FED8kx1ukJDTC4DZaoFM8HbEyE8soKg6e4ehsInwcj2vZ95aT63sKUQqmZ
         0S+ff+0vVT8zM1I3YL8ZAs03R7ionhv8URbzadKFd6Any6F5j13PG9sDcFmywiVyD9FL
         k32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SD7cowK7TBSEUtyyJCNTowcFkGoyJguvCPEnc3FJ+lw=;
        b=CaiNTNz29g/o4xzEaunV3HU3TRNvYQbr6F23OHmLGhKiuLKaGag1XGWYLUl3xijVTS
         7rciW7+bSz3xk2OU+ZLK4kRMuE24Q2OFm0qphUTCuxkA6wtKYSnh9vJgytm7+li4STKm
         Kq1SNZXWglbMs0w0IjKtV5063wrhOTJ8af0X9n4WrYMjTpOJNc0DSUHIv2bwO6CgUvhT
         kW+jtConLRJpVsbrafVK3xIiUsRxV3uN7O3jvV1hKEmth1R5bByqNup38BEmMzkpEf1u
         VUw6yTiGwYM5vVRMf3T6SAI6iHQcfCOkR12c5zT+r4GFo5a+zs+dcGej7Vmqrc30N4vj
         +UwA==
X-Gm-Message-State: AOAM531wdCed6firQNCZzRdeWeTfHe+J4JkiPsfq+UMWQw24AzHIDAVQ
        0YjfI1VvJv2UAEc4wfghpy//PA==
X-Google-Smtp-Source: ABdhPJyfDoCt9GGT45S2vobwjULA9QToD4YzkQHTWN/B1LXTpUKR2LsupxTxxayaY4a+p6d4GN8K9A==
X-Received: by 2002:a63:4b44:: with SMTP id k4mr17418132pgl.305.1595915500274;
        Mon, 27 Jul 2020 22:51:40 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 199sm17855934pgc.79.2020.07.27.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 22:51:39 -0700 (PDT)
Date:   Mon, 27 Jul 2020 22:48:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com
Subject: Re: [PATCH v3 3/3] remoteproc: qcom_q6v5_mss: Add modem debug policy
 support
Message-ID: <20200728054807.GB349841@builder.lan>
References: <20200722201047.12975-1-sibis@codeaurora.org>
 <20200722201047.12975-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722201047.12975-4-sibis@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 22 Jul 13:10 PDT 2020, Sibi Sankar wrote:

> Add modem debug policy support which will enable coredumps and live
> debug support when the msadp firmware is present on secure devices.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> v3:
>  * Fix dp_fw leak and create a separate func for dp load [Bjorn]
>  * Reset dp_size on mba_reclaim
> 
> v2:
>  * Use request_firmware_direct [Bjorn]
>  * Use Bjorn's template to show if debug policy is present
>  * Add size check to prevent memcpy out of bounds [Bjorn]
> 
>  drivers/remoteproc/qcom_q6v5_mss.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index f4aa61ba220dc..da99c8504a346 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -191,6 +191,7 @@ struct q6v5 {
>  	phys_addr_t mba_phys;
>  	void *mba_region;
>  	size_t mba_size;
> +	size_t dp_size;
>  
>  	phys_addr_t mpss_phys;
>  	phys_addr_t mpss_reloc;
> @@ -408,6 +409,21 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  				   current_perm, next, perms);
>  }
>  
> +static void q6v5_debug_policy_load(struct q6v5 *qproc)
> +{
> +	const struct firmware *dp_fw;
> +
> +	if (request_firmware_direct(&dp_fw, "msadp", qproc->dev))
> +		return;
> +
> +	if (SZ_1M + dp_fw->size <= qproc->mba_size) {
> +		memcpy(qproc->mba_region + SZ_1M, dp_fw->data, dp_fw->size);
> +		qproc->dp_size = dp_fw->size;
> +	}
> +
> +	release_firmware(dp_fw);
> +}
> +
>  static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct q6v5 *qproc = rproc->priv;
> @@ -419,6 +435,7 @@ static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
>  	}
>  
>  	memcpy(qproc->mba_region, fw->data, fw->size);
> +	q6v5_debug_policy_load(qproc);
>  
>  	return 0;
>  }
> @@ -928,6 +945,10 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  	}
>  
>  	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
> +	if (qproc->dp_size) {
> +		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
> +		writel(qproc->dp_size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
> +	}
>  
>  	ret = q6v5proc_reset(qproc);
>  	if (ret)
> @@ -996,6 +1017,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>  	u32 val;
>  
>  	qproc->dump_mba_loaded = false;
> +	qproc->dp_size = 0;
>  
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>  	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
> @@ -1290,7 +1312,8 @@ static int q6v5_start(struct rproc *rproc)
>  	if (ret)
>  		return ret;
>  
> -	dev_info(qproc->dev, "MBA booted, loading mpss\n");
> +	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
> +		 qproc->dp_size ? "" : "out");
>  
>  	ret = q6v5_mpss_load(qproc);
>  	if (ret)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
