Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F88C25B0C
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Aug 2022 20:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiHFU0b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Aug 2022 16:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbiHFU03 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Aug 2022 16:26:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A2DFD03
        for <linux-remoteproc@vger.kernel.org>; Sat,  6 Aug 2022 13:26:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d14so7644895lfl.13
        for <linux-remoteproc@vger.kernel.org>; Sat, 06 Aug 2022 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ROYvf8g259PGwFxDxBtSZpunTSjof4WFaayVaRYHt6s=;
        b=YyIiRHEiDcm4t8olsQ7JXPjWvimPvxqSO4a0uMonk2AWyV0py44U4CnfElvXQ+dsWf
         Em9yY3ngkfhhXLSFEFkE+GAb3bcMKdbZVqgGit+fb/YKczs95IEbJkUOjVs2gF2M0xJh
         gH13ghOjyYKk19oGjQfDyVbncJKgReavpB6espV1Z9R59+jRh6jRykH5iMps4QfDeJ8I
         IE0Qi/Lj/bnstyoLUEsqeEeONd+sm0Xi0qHw96QQIWINbb6D5V6TAcglKgO2rwKbYqWT
         bQig78PJjdibXCv1lIOL3FhmudO0ztA/+RMXAcDepVhluosKKHvQvqSJMxo+usSv2lYO
         YcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ROYvf8g259PGwFxDxBtSZpunTSjof4WFaayVaRYHt6s=;
        b=6y7jauLmS6HGjGmfYfSwBBLNqniDZ362XUoxqldlRUekA2hIiFBNfun8keiTEe1vbb
         vn8LNFHvHI3pDAvgE8NyuHsnqJtg37QDlzlIqNSPWj4gPo/XvfFLyE57QA2EG2Arc3ic
         jD8Ye07fkQctLwUNElx6/QetrzBtpaHWG5tN7Y7lHBHSzCqkguvbtMygX3pIUXVGILb6
         pY88NKHyvCpNI+ZgXLk1x82c4IDG9+NOueOJRB2cLxpPTUlC3Bis4BfePopmk7NoA5KK
         JkTd0TPub8wPAfgGFSKtoHliC3W1xatj9Ar0h/8hG9Gtd7ajLkWA6CKXjc1hMGvOFFRH
         fGyg==
X-Gm-Message-State: ACgBeo2kJn3jSxUReYN/+EOiBKPtH8n7gh6EmflxNaueDLxER1hh+avj
        2cw4FengwimNh8WDEeI5wNMlNw==
X-Google-Smtp-Source: AA6agR5jirJciuwIXYIOI2zYJj3CGahbCPgxcpB0S3yRhZMr/rkIxUNwZe9S3GiZP/CRKwuxAJbpng==
X-Received: by 2002:ac2:4e15:0:b0:48b:7a5f:923c with SMTP id e21-20020ac24e15000000b0048b7a5f923cmr2132926lfr.134.1659817586613;
        Sat, 06 Aug 2022 13:26:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf40-20020a056512282800b0047f84ecae2esm862310lfb.236.2022.08.06.13.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 13:26:26 -0700 (PDT)
Message-ID: <0ed40651-1638-3701-f310-cd50102ae763@linaro.org>
Date:   Sat, 6 Aug 2022 23:26:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] remoteproc: qcom: Add efuse evb selection control
Content-Language: en-GB
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        devicetree@vger.kernel.org
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
 <1659536480-5176-6-git-send-email-quic_srivasam@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659536480-5176-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/08/2022 17:21, Srinivasa Rao Mandadapu wrote:
> Add efuse evb selection control and enable it for starting ADSP.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>

Is the lpass_efuse region used solely by the ADSP or is it shared with 
anybody else (e.g. other sound-related devices)? If the latter is true, 
then please use syscon for the lpass_efuse region.

> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index a9fcb5c..201cc21 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -56,6 +56,7 @@
>   
>   #define LPASS_BOOT_CORE_START	BIT(0)
>   #define LPASS_BOOT_CMD_START	BIT(0)
> +#define LPASS_EFUSE_Q6SS_EVB_SEL 0x0
>   
>   struct adsp_pil_data {
>   	int crash_reason_smem;
> @@ -85,6 +86,7 @@ struct qcom_adsp {
>   	struct clk_bulk_data *clks;
>   
>   	void __iomem *qdsp6ss_base;
> +	void __iomem *lpass_efuse;
>   
>   	struct reset_control *pdc_sync_reset;
>   	struct reset_control *restart;
> @@ -366,6 +368,9 @@ static int adsp_start(struct rproc *rproc)
>   	/* Program boot address */
>   	writel(adsp->mem_phys >> 4, adsp->qdsp6ss_base + RST_EVB_REG);
>   
> +	if (adsp->lpass_efuse)
> +		writel(LPASS_EFUSE_Q6SS_EVB_SEL, adsp->lpass_efuse);
> +
>   	/* De-assert QDSP6 stop core. QDSP6 will execute after out of reset */
>   	writel(LPASS_BOOT_CORE_START, adsp->qdsp6ss_base + CORE_START_REG);
>   
> @@ -520,6 +525,11 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>   		return PTR_ERR(adsp->qdsp6ss_base);
>   	}
>   
> +	adsp->lpass_efuse =  devm_platform_ioremap_resource_byname(pdev, "lpass_efuse");
> +	if (IS_ERR(adsp->lpass_efuse)) {
> +		adsp->lpass_efuse = NULL;
> +		dev_dbg(adsp->dev, "failed to map LPASS efuse registers\n");
> +	}
>   	syscon = of_parse_phandle(pdev->dev.of_node, "qcom,halt-regs", 0);
>   	if (!syscon) {
>   		dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");


-- 
With best wishes
Dmitry
