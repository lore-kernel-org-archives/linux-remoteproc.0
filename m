Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE224C76195
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Mar 2023 08:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjC1I04 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Mar 2023 04:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjC1I04 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Mar 2023 04:26:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FD73C3B
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Mar 2023 01:26:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id c9so4325213lfb.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Mar 2023 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679992013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=na5dU8j4hUSz+LpMVxaZjUT0LscrMVekYoZzcEuim40=;
        b=hQXUQLS56F8ZLe+bGijxEYa0a9spAHLUQs9im3IBj4CBlv4vkmoJWcutK2iG6meywx
         2bU4stm8VOZoqid+CKszvznC1LoZn6dNlhGRqrqHYqQLmsb/jHGQgHWXYmHrYj7Nzl5D
         gmOVBjJkMBFIFAlLDQ1z9s3L5EB3a72hPJhIe5OTSSrjfTaCFlzLJrI6Bf3aR3Mcy7RI
         AAWa7Lf8uBfdGAKryJEc1cjfrAN8yoUYGWOEsBP0WioGi8oy2YYZS001TsdorLxgKv7r
         9LzLnPzFU+x5iYo8okVQHK9SXdYNFzLl+bYDkItBeQjXR838fRkDxbvI1d3f/FeHw9qy
         KfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=na5dU8j4hUSz+LpMVxaZjUT0LscrMVekYoZzcEuim40=;
        b=2NQAQWeTocuK3wL9P9f5ltTnGyiNcV7q3efv4/KHEACr6WZGxzbsGj6hogR5gfyJh9
         9rPnwPM9nFzj/y+Op4zf+Ub3cR9/NBco0uZaAC/M5Lf0RCwOhNEXRSwQW1U0+agU/Z5r
         BX5ETVP6l2smMv2WhUfyzNEcWutHHumfge4+E7bCPkfVNmXKhaqD7C57v30cFFuXH8wi
         uORO0Hm63hTtCHFL3zKrQCSgcrHcFoyP2GXCj51sNvwo2LdthclI7wl+8ojX8k3u8wAz
         YnFHpNtmIBT9zJiqJJ3goFe/lVj9MKD/4ezSqG+PXUmOuhAPzt6wGbQZo0K7iDqqePN1
         /4tw==
X-Gm-Message-State: AAQBX9c0YNvZv/ZwlUBLQqDUEk+lXyTO1K2kwYp++kjaie5P4ZWpCAwb
        rw0N4cstxa7krd92dA/jWh7IYw==
X-Google-Smtp-Source: AKy350bTbvRrCFBHeHCC8lXZAkKRffXvsoOFUgqkWKF2uDVfSEajVbD+IdiUn+Dn/totoL0zUVOYDg==
X-Received: by 2002:ac2:5551:0:b0:4dd:cef0:c27c with SMTP id l17-20020ac25551000000b004ddcef0c27cmr3908984lfk.33.1679992012939;
        Tue, 28 Mar 2023 01:26:52 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id d8-20020ac241c8000000b004cb14fa604csm4953863lfi.262.2023.03.28.01.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:26:52 -0700 (PDT)
Message-ID: <5a835e27-cc9e-d04c-a1ec-2756b0476d98@linaro.org>
Date:   Tue, 28 Mar 2023 10:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] remoteproc: qcom: pas: add SDM845 SLPI resource
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230327183736.496170-1-me@dylanvanassche.be>
 <20230327183736.496170-3-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230327183736.496170-3-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 27.03.2023 20:37, Dylan Van Assche wrote:
> Add SLPI resources for the SDM845 Qualcomm SoC to the Qualcomm
> remoteproc q6v5_pas driver to define the default firmware name
> and GLink edge name.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index c99a20542685..d82b6f4bced4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1028,6 +1028,22 @@ static const struct adsp_data slpi_resource_init = {
>  		.ssctl_id = 0x16,
>  };
>  
> +static const struct adsp_data sdm845_slpi_resource = {
> +		.crash_reason_smem = 424,
> +		.firmware_name = "slpi.mdt",
> +		.pas_id = 12,
> +		.auto_boot = true,
> +		.proxy_pd_names = (char*[]){
> +			"lcx",
> +			"lmx",
> +			NULL
> +		},
> +		.load_state = "slpi",
> +		.ssr_name = "dsps",
> +		.sysmon_name = "slpi",
> +		.ssctl_id = 0x16,
> +};
Not sure why you're adding this just to remove it in the next
patch. You can just assign a different one here and then clean
it up for all others.

Konrad
> +
>  static const struct adsp_data sm8150_slpi_resource = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
> @@ -1201,6 +1217,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
> +	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource},
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
