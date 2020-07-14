Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D70AC433E4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 16:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B15632082F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 16:17:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="qHG5lrI8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgGNQRB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 12:17:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:9908 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgGNQRB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 12:17:01 -0400
X-Greylist: delayed 536 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jul 2020 12:16:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594743418;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Spezz/C6//ge5H/J9Y8FNwVYQDRFbPkYkD8EuMVrEEA=;
        b=qHG5lrI8YM2xLoKn9omoGzG4KdBOzZkXUlq1KIXeFj7Zn5fwb/1eegbxxM9t1QEnBJ
        nC4QzKDpquByzGliIXTwd8snlQBljDX/qVLjQiExTkDuUkMSVgOVEgzdUv1D+e2uO/bA
        I9vKO4s3P3keXqMWOC2w/xJJO5qc3bqi53R5r+18pXnYxM3VNmGdIRLWbQoCZhpVCA9F
        SXAF8Yg0Fh73gtZDC6F5BBg8IzG7xRonTXgCyguRWLvlVGV5VRsrbNdZ7ijHgIITPD75
        pxgTzNWELiKKIvdILsBFOavU/s9Mq5u8/viuU+ZdYrplqSXUJgS4MYUahDdAWlXGmiLK
        OI7g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6EG4t8mh
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 14 Jul 2020 18:04:55 +0200 (CEST)
Date:   Tue, 14 Jul 2020 18:04:45 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200714160445.GA3848@gerhold.net>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-4-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075956.171058-4-bjorn.andersson@linaro.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

On Mon, Jun 22, 2020 at 12:59:55AM -0700, Bjorn Andersson wrote:
> In modern Qualcomm platforms the mutex region of the TCSR is forked off
> into its own block, all with a offset of 0 and stride of 4096, and in
> some of these platforms no other registers in this region is accessed
> from Linux.
> 
> So add support for directly memory mapping this register space, to avoid
> the need to represent this block using a syscon.
> 
> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Use devm_platform_ioremap_resource()
> 
>  drivers/hwspinlock/qcom_hwspinlock.c | 70 +++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
> index f0da544b14d2..364710966665 100644
> --- a/drivers/hwspinlock/qcom_hwspinlock.c
> +++ b/drivers/hwspinlock/qcom_hwspinlock.c
> @@ -70,41 +70,79 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
>  
> -static int qcom_hwspinlock_probe(struct platform_device *pdev)
> +static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
> +						   u32 *base, u32 *stride)
>  {
> -	struct hwspinlock_device *bank;
>  	struct device_node *syscon;
> -	struct reg_field field;
>  	struct regmap *regmap;
> -	size_t array_size;
> -	u32 stride;
> -	u32 base;
>  	int ret;
> -	int i;
>  
>  	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
> -	if (!syscon) {
> -		dev_err(&pdev->dev, "no syscon property\n");
> -		return -ENODEV;
> -	}
> +	if (!syscon)
> +		return ERR_PTR(-ENODEV);
>  
>  	regmap = syscon_node_to_regmap(syscon);
>  	of_node_put(syscon);
>  	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> +		return regmap;
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "no offset in syscon\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
> +	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "no stride syscon\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
> +	return regmap;
> +}
> +
> +static const struct regmap_config tcsr_mutex_config = {
> +	.reg_bits		= 32,
> +	.reg_stride		= 4,
> +	.val_bits		= 32,
> +	.max_register		= 0x40000,

Where does the 0x40000 come from?

It seems like this driver has QCOM_MUTEX_NUM_LOCKS = 32 hardcoded.
With a stride of 4096 = 0x1000 you get 0x1000 * 32 = 0x20000.

This is also the reg size used in msm8996.dtsi and msm8916.dtsi for
example, while sdm845.dtsi and sm8250.dtsi specify 0x40000.
Are you not exposing all available locks on the newer SoCs?

I'm not sure how important max_register is... But I guess it should be
either correct for all SoCs or not specified at all (since it's
optional)?

(That is assuming the hwlock can be also used directly via MMIO on
 MSM8996 and MSM8916. It looks to me like it has its own register
 space there as well...)

Thanks,
Stephan
