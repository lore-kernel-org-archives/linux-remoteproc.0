Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FD0C7619A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Mar 2023 23:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbjC3XDl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Mar 2023 19:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjC3XDl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Mar 2023 19:03:41 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA191114B
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Mar 2023 16:03:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c9so16185720lfb.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Mar 2023 16:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680217411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZn4tyYY9BCk7s1Po6/aemP10gDlKI2Kq9xH5VdIvl8=;
        b=aKcdq2Z5swALULKu0fcI6Tg/BGE3/u0bz80ty7vwu0t4w9Vmt+kLbOGEpgw2lGj1T7
         6JmOB94VEVARY30TRkoquGGMi0Zt2u8p6wbwebhBBNgcQII9v+cRRgiQNBcCXQ/nRcGa
         MZh8yedvaUtp1mOlMrv/6+aq8fUTh9oF1nPoY0dVOx7Eby+VoUIvmtaHHcOjjhOcCHM5
         mcwWEk/TrmO5b9wJIMx2C0FmVWJisimMbl65cKCyniTFets+GwE9FOAMpFHlgFMIY0dZ
         Yhja6m1+RuERXKcEO+8qIO3STt9QVXuF35zOl8K0Kkyf7DtbVTqe58RM4q0MmJG/U3jg
         Sw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680217411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZn4tyYY9BCk7s1Po6/aemP10gDlKI2Kq9xH5VdIvl8=;
        b=k0aDmNX0gZzv05WDT5a85S7IuOfWfycGpC3Kya493+rfTxBYhWW2M7qXyga903yAtV
         xCJoky0v/wFF5rRbwoQ76ZMMf80FfG9IBWrQoSZUtnT44UtwiCOZQekmQwpgJIcZVWQC
         Pt69Lyt0mzIy2zKVaxvjBzdsgieRnfMsalwTB18wU1CXhaQ+MV3F40mr/9Uecmz+8+SS
         pUjL9u7bWbsEFlbUs/nMzw4NQz7c22h19kmCKO9ZqHLaTb3rjp1Q9h+V8cU6LexocIqa
         zAQHrll1gCekrnngn4/XT/yn3FlaLxJjHgA9UFoy1G7HwQ96qfWrX3sMXOrX4MEyh2kW
         Ezcw==
X-Gm-Message-State: AAQBX9fZR5tKTnS4Uh9rz4h0Gaf7HS6xfw2GVtOq1bCDZ5xFdAOsS410
        i/7fTVsfTts6NcW4DzRtiZlVLg==
X-Google-Smtp-Source: AKy350YRKh/QIHzo45/fUtf7azJj4YT7oA/lSCOramU1kvawSFT12Tm6ZdnXLF+sBh2OXuUdGLIErA==
X-Received: by 2002:a19:ae17:0:b0:4eb:2529:cbb2 with SMTP id f23-20020a19ae17000000b004eb2529cbb2mr1958614lfc.49.1680217411529;
        Thu, 30 Mar 2023 16:03:31 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id s5-20020a19ad45000000b004e845b49d81sm122275lfd.140.2023.03.30.16.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 16:03:31 -0700 (PDT)
Message-ID: <39058df7-6080-b38a-f4a8-0a4015982ca6@linaro.org>
Date:   Fri, 31 Mar 2023 01:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] remoteproc: qcom: pas: add SDM845 SLPI compatible
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
References: <20230330164633.117335-1-me@dylanvanassche.be>
 <20230330164633.117335-4-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330164633.117335-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 30.03.2023 18:46, Dylan Van Assche wrote:
> Add a compatible for the SDM845 SLPI to the Qualcomm remoteproc q6v5_pas
> driver. The SLPI is the same as in SM8150, SM8250, SM8350, and SM8450,
> so use the same resource in the driver.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b96020c93e58..f3a7ae503bd1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1169,6 +1169,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
> +	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
>  	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
>  	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
