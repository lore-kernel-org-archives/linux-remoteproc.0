Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF38AC77B75
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 17:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjEEREC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 May 2023 13:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjEEREB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 May 2023 13:04:01 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8DC15680
        for <linux-remoteproc@vger.kernel.org>; Fri,  5 May 2023 10:03:58 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1aae46e62e9so14425125ad.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 May 2023 10:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683306238; x=1685898238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JMDVesgAKasFsor4GeKqlCagXQ7DH3+AoXUlf3OElm8=;
        b=bR6gi0lcTDkNWyn7wz8u78OloJBPQ6KfsiLCSKJtSrf/mwTyj4RnLq3ZZsQz1dPnbt
         YK9sctpzPhvjPa52msOKNb71MrX9QuGHxcjpZuU8MGICBCkBa6eWB9EHqDkaXzxExAeW
         FPSm1Tea8e42GTKd966cAYYcdLDWPu6xE/hQeQUEo8fWlHBrOmBhtHxUicyfTT6TJWZj
         gdLsXFigde8hbfEGXnwwZxx8j5oUZBhL4nJhOrzEA9MpP5f51RJbStN4VgCurhtsSYua
         lGPxMvVeQXhWZLel1UYlHTqXLmtDeCWCBZJiBnr6VZn0Ox3VVAsNLkc8agKkEFCtkjTl
         ZLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683306238; x=1685898238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMDVesgAKasFsor4GeKqlCagXQ7DH3+AoXUlf3OElm8=;
        b=VcS0GmvNL8EpCfJAsX0oNGBxTBcNZ6tQDaEpKSipdi6+I7qYjB/OfRlhZWpk3fL6rd
         SakcnlF7AcPBFqlS7KIQpq361B28jt+krQSiODX8QFmPsUXMsHCSEPEtXdI5ose2wujS
         o31OMSqEo6UMTBG2/om8oOF0KUP7zEZNdxwZs7g11cnBvHLu7rAH7j3jZ5JSU9efwtrC
         i7fNfVeeQvG7jg8ahhmDyNIxGg805FMsDrP5aAHYCBFmUxv1M+9l+ycu7wYMEViMLPr7
         Gqzpt0eni7OHN4DtQv8wNAoLlzcPPj2irrWF8AXe35N93ZouqILctwNoAL8HQ40cajti
         b5HA==
X-Gm-Message-State: AC+VfDwdO9kliC28k6IVkdleiUCi1WjG788eCyFP71CPSzBLfH+YJ15b
        voXXkCQBCg6C2sJSgsiPt3bogw==
X-Google-Smtp-Source: ACHHUZ6UMaUB3IhahmbRyxKYzoTmEg9HFyUQpdd2o5G9PGG44utHoVF+53YsCBC0g19omuVtmiHoaw==
X-Received: by 2002:a17:902:6901:b0:1a1:956e:5417 with SMTP id j1-20020a170902690100b001a1956e5417mr1763516plk.22.1683306237785;
        Fri, 05 May 2023 10:03:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fd16:b4b6:ee7c:e4e5])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001994fc55998sm2013388plg.217.2023.05.05.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 10:03:57 -0700 (PDT)
Date:   Fri, 5 May 2023 11:03:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] remoteproc: stm32: Allow hold boot management by
 the SCMI reset controller
Message-ID: <ZFU2+ni/tKOIIHbq@p14s>
References: <20230504094641.870378-1-arnaud.pouliquen@foss.st.com>
 <20230504094641.870378-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504094641.870378-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

On Thu, May 04, 2023 at 11:46:39AM +0200, Arnaud Pouliquen wrote:
> The hold boot can be managed by the SCMI controller as a reset.
> If the "hold_boot" reset is defined in the device tree, use it.
> Else use the syscon controller directly to access to the register.
> The support of the SMC call is deprecated but kept for legacy support.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Updates vs previous version
> - keep support of the "st,syscfg-tz" property for legacy compatibility
> - rename secured_soc in hold_boot_smc for readability
> - add comments to explain hold boot management.
> - update commit message
> ---
>  drivers/remoteproc/stm32_rproc.c | 78 +++++++++++++++++++++++---------
>  1 file changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7d782ed9e589..e9cf24274345 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -79,6 +79,7 @@ struct stm32_mbox {
>  
>  struct stm32_rproc {
>  	struct reset_control *rst;
> +	struct reset_control *hold_boot_rst;
>  	struct stm32_syscon hold_boot;
>  	struct stm32_syscon pdds;
>  	struct stm32_syscon m4_state;
> @@ -88,7 +89,7 @@ struct stm32_rproc {
>  	struct stm32_rproc_mem *rmems;
>  	struct stm32_mbox mb[MBOX_NB_MBX];
>  	struct workqueue_struct *workqueue;
> -	bool secured_soc;
> +	bool hold_boot_smc;
>  	void __iomem *rsc_va;
>  };
>  
> @@ -401,13 +402,28 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  	struct arm_smccc_res smc_res;
>  	int val, err;
>  
> +	/*
> +	 * Three ways to manage the hold boot
> +	 * - using SCMI: the hold boot is managed as a reset,
> +	 * - using Linux(no SCMI): the hold boot is managed as a syscon register
> +	 * - using SMC call (deprecated): use SMC reset interface
> +	 */
> +
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
> +	if (ddata->hold_boot_rst) {
> +		/* Use the SCMI reset controller */
> +		if (!hold)
> +			err = reset_control_deassert(ddata->hold_boot_rst);
> +		else
> +			err =  reset_control_assert(ddata->hold_boot_rst);
> +	} else if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->hold_boot_smc) {
> +		/* Use the SMC call */
>  		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
>  			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
>  		err = smc_res.a0;
>  	} else {
> +		/* Use syscon */
>  		err = regmap_update_bits(hold_boot.map, hold_boot.reg,
>  					 hold_boot.mask, val);
>  	}
> @@ -705,34 +721,54 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  		dev_info(dev, "wdg irq registered\n");
>  	}
>  
> -	ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +	ddata->rst = devm_reset_control_get_optional(dev, "mcu_rst");
> +	if (!ddata->rst) {
> +		/* Try legacy fallback method: get it by index */
> +		ddata->rst = devm_reset_control_get_by_index(dev, 0);
> +	}
>  	if (IS_ERR(ddata->rst))
>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
>  				     "failed to get mcu_reset\n");
>  
>  	/*
> -	 * if platform is secured the hold boot bit must be written by
> -	 * smc call and read normally.
> -	 * if not secure the hold boot bit could be read/write normally
> +	 * Three ways to manage the hold boot
> +	 * - using SCMI: the hold boot is managed as a reset
> +	 *    The DT "reset-mames" property should be defined with 2 items:
> +	 *        reset-names = "mcu_rst", "hold_boot";
> +	 * - using SMC call (deprecated): use SMC reset interface
> +	 *    The DT "reset-mames" property is optional, "st,syscfg-tz" is required
> +	 * - default(no SCMI, no SMC): the hold boot is managed as a syscon register
> +	 *    The DT "reset-mames" property is optional, "st,syscfg-holdboot" is required
>  	 */
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
> -	if (err) {
> -		dev_err(dev, "failed to get tz syscfg\n");
> -		return err;
> -	}
>  
> -	err = regmap_read(tz.map, tz.reg, &tzen);
> -	if (err) {
> -		dev_err(dev, "failed to read tzen\n");
> -		return err;
> +	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
> +	if (IS_ERR(ddata->hold_boot_rst)) {
> +		if (PTR_ERR(ddata->hold_boot_rst) == -EPROBE_DEFER)
> +			return PTR_ERR(ddata->hold_boot_rst);

Here we know that devm_reset_control_get_optional() has returned an error that is
not -EPROBE_DEFER and as such, I think we should return that error instead of
continuing on with the probing.  Calling dev_err_probe() should be just fine. 

Otherwise I'm good with this set.  Many thanks for the enhanced explanation.

Mathieu

> +		ddata->hold_boot_rst = NULL;
> +	}
> +
> +	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
> +		/* Manage the MCU_BOOT using SMC call */
> +		err = stm32_rproc_get_syscon(np, "st,syscfg-tz", &tz);
> +		if (!err) {
> +			err = regmap_read(tz.map, tz.reg, &tzen);
> +			if (err) {
> +				dev_err(dev, "failed to read tzen\n");
> +				return err;
> +			}
> +			ddata->hold_boot_smc = tzen & tz.mask;
> +		}
>  	}
> -	ddata->secured_soc = tzen & tz.mask;
>  
> -	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> -				     &ddata->hold_boot);
> -	if (err) {
> -		dev_err(dev, "failed to get hold boot\n");
> -		return err;
> +	if (!ddata->hold_boot_rst && !ddata->hold_boot_smc) {
> +		/* Default: hold boot manage it through the syscon controller */
> +		err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> +					     &ddata->hold_boot);
> +		if (err) {
> +			dev_err(dev, "failed to get hold boot\n");
> +			return err;
> +		}
>  	}
>  
>  	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
> -- 
> 2.25.1
> 
