Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30243C761A6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Mar 2023 08:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbjC0Isv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 04:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjC0Is3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:48:29 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F9F6A42
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 01:45:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id br6so10272750lfb.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679906671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLrKAr+c7u8+WkfYnvdsqKkhxaW/xmaQn97MpcR7do8=;
        b=rdogzM223NHg8iJx7iIN2LHYZn7tUjiFtUG9eoMoJTXpUK32coL01Ru11TIQbmWWOP
         VKCBJBjnt0SQEZ3jeNQWQSALELd1RJCWRVgVn5znTCUioLfpT5I0pAyE8nVsXnrhvKmr
         XXgxpsb4MRhJh5W7tj4qpUxPjzCwZVvDNePFeope9K0zHDiXNlVpl737EvCassslHUg/
         4W369SCxed9tNg11GGBDRgExuMDsWuUwhXXkhzt5n/M81kMTIY/z7xfX0UClA/VP5+Nc
         /Ju/SXpvGo/WX1n7Lqu9BfXvCK8EGnvBX5HwtyTr5/ygFq0ofey+MgrlvL3bDLKUud6y
         d8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLrKAr+c7u8+WkfYnvdsqKkhxaW/xmaQn97MpcR7do8=;
        b=pGBmh/YFmr02oFYIt0dIISwylMKvNmvmnyLw41kzf59rToCdm5CVUjK90N7seoUxah
         Y+NjfQ8MJCnizuYCSUjduYRDPyEZOQCVCbw7LG+QGTpEBmmNKLjK4qD8j2wiGibddes4
         BqwdyknIay1EUQoD28WAy07Mn0L2obCMewmihm67QAtr64OgjerHfXmATpmN6jkcLMxj
         xNXG28VebLHRwBmo15rYFNme9eOsAqbjjy+Kbx+waltRE6wHWAqMisJBSKo0CXFJMsvW
         56kKQ6N9XQWhxkBdy2K2EqfW/a8LFIVRHJgjAyljCpUtUzA+k2CFTlsIVwuR7SAsg52S
         +oaw==
X-Gm-Message-State: AAQBX9dogt27yMSqYwRdQcJWrcsBZfRmPvybcDYYXsalmhmccG0D/ypX
        roiXj24N4RRXhEA2N12IxTGiPA==
X-Google-Smtp-Source: AKy350ZGT9cY4UQC0D9IPOa/NyJ/hHznWUNEoPQIk9+IaHao2iitH0e524xsgtLK7ODG9AmvF+W5MA==
X-Received: by 2002:ac2:46f9:0:b0:4e9:d719:3603 with SMTP id q25-20020ac246f9000000b004e9d7193603mr3463966lfo.55.1679906671138;
        Mon, 27 Mar 2023 01:44:31 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id r10-20020a19ac4a000000b004b5979f9ba8sm4591731lfc.210.2023.03.27.01.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:44:30 -0700 (PDT)
Message-ID: <a27e7e67-a3e8-01ec-1f0d-717d705af117@linaro.org>
Date:   Mon, 27 Mar 2023 10:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: add SDM845 SLPI resource
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230325132117.19733-1-me@dylanvanassche.be>
 <20230325132117.19733-3-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230325132117.19733-3-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 25.03.2023 14:21, Dylan Van Assche wrote:
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
Isn't this identical to sm8150_slpi_resource?

Konrad
> +};
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
