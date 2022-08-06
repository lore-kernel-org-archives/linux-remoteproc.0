Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59701C3F6B0
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Aug 2022 20:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbiHFU5F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Aug 2022 16:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbiHFU5E (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Aug 2022 16:57:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E836411805
        for <linux-remoteproc@vger.kernel.org>; Sat,  6 Aug 2022 13:57:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bq11so7777172lfb.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 06 Aug 2022 13:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+uP/G8pUlcnlOuRWgNx4UrZhwmsQF+f6tSwLwCsnVUY=;
        b=GL2IOBbZQUuBa6AuZkN6AZTAq/G+kLxYJTHyIMV5CaePKtKNcfQqQp9N3m9oHJ4e4A
         eEi9q0DLHLQOaQp4H1im/EGKJcKfIuWsRdGSKUxeC2EBnl/9ODLnZ5P5je15SHYeIcmo
         b083p9tY0C0WO1XxVTV8Hw+ZffoY8X7gC/OqLt9vxXFXHyEkXaqBBo0CfD6wgavk+EIT
         3Uh4f9X5/T112+dfTN5ePerG4DVnhkWzAIOn13a5Tr1shKSGl42Ttdqw5q3fY6fHC7sD
         oYpi9guj4egqk8O028RwJIRp7UjwdE3uVYqLHLwgI2+8a1YCQ1EA0g4C4LVn3KrsdIWn
         lapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+uP/G8pUlcnlOuRWgNx4UrZhwmsQF+f6tSwLwCsnVUY=;
        b=fLc+gj33/y6DjrbWtlURrbiw4+3ZezBzIAJ0pypbfV/CbrM94tBTu2CNN8gQCN3GNI
         DWLObY5tXAaD973AmIbF8LOzzYDxfO54w4PvfEEW8v/apvDcFE81bHXkNh6r4IfShRlo
         NdI6U6Ert2NUcT3M8IJnsmC/Xl23OnVZcbgYtwXE5hICt5/73dEp8qW2DJaaNHMXvRLV
         d9gLndCU30nslpjoKek5MRxUVE/gryDd4OtXzfrXu2/lH9Yksx9BO1pYXz50B5KT0NNa
         SltfIGW4t7/Ecxd2m0yFRO4vIpXhpO1bsdNNLRzxA+N24wXOaedtjPP/fA0MqWwdvlSk
         pY2Q==
X-Gm-Message-State: ACgBeo0yLB85t+l/eFdmmFjUgYfRf7PowC7oDyDGwyYn2B4wR9helWbt
        9kcG4Tl2SmlA5XSV0FoZj30muQ==
X-Google-Smtp-Source: AA6agR6B3HqqBKVlr5mYx8WAbe6Wd609r4Y5sMmlKKH3pGnKyeP91pTfUAioXwGzKmOC4+/3H79sPg==
X-Received: by 2002:a05:6512:159e:b0:48b:239e:c9 with SMTP id bp30-20020a056512159e00b0048b239e00c9mr3805721lfb.621.1659819421275;
        Sat, 06 Aug 2022 13:57:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25f65000000b0048b572e721asm518527lfc.107.2022.08.06.13.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 13:57:00 -0700 (PDT)
Message-ID: <6327ba5b-f3a9-7390-0456-67ba5ffde0b6@linaro.org>
Date:   Sat, 6 Aug 2022 23:57:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/8] remoteproc: qcom: Add compatible name for SC7280 ADSP
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
 <1659536480-5176-4-git-send-email-quic_srivasam@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659536480-5176-4-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 03/08/2022 17:21, Srinivasa Rao Mandadapu wrote:
> Update adsp pil data and compatible name for loading ADSP
> binary on SC7280 based platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   drivers/remoteproc/qcom_q6v5_adsp.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 2f3b9f5..bb4494c 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -697,6 +697,24 @@ static const struct adsp_pil_data adsp_resource_init = {
>   	},
>   };
>   
> +static const struct adsp_pil_data adsp_sc7280_resource_init = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mbn",
> +	.load_state = "adsp",
> +	.ssr_name = "lpass",
> +	.sysmon_name = "adsp",
> +	.ssctl_id = 0x14,
> +	.is_wpss = false,
> +	.auto_boot = true,
> +	.clk_ids = (const char*[]) {
> +		"gcc_cfg_noc_lpass", NULL

The clock is not mentioned in dt bindings.

> +	},
> +	.num_clks = 1,
> +	.proxy_pd_names = (const char*[]) {
> +		NULL
> +	},

Is the empty array necessary?

> +};
> +
>   static const struct adsp_pil_data cdsp_resource_init = {
>   	.crash_reason_smem = 601,
>   	.firmware_name = "cdsp.mdt",
> @@ -737,6 +755,7 @@ static const struct of_device_id adsp_of_match[] = {
>   	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
>   	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
>   	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
> +	{ .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, adsp_of_match);


-- 
With best wishes
Dmitry
