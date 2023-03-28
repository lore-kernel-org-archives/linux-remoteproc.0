Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEECC76195
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Mar 2023 06:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjC1Glp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 28 Mar 2023 02:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjC1Glo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Mar 2023 02:41:44 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1666119C
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 23:41:43 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id ew6so45292372edb.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 23:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2UMFTWca/M4TfbxdaHTyPRF/E0gtPVYYx17k3K8duDE=;
        b=JJkLReoST2Q3icBs2qAHTocchCLDerf72iuRTzvIujcByswPvr+9Huqf1f4XQKzUjc
         UFmUHrN2dmU5B55feCGfLfAHaNPMmJmSu5drfoFGkF+lcx82ciHh2DKfU9bW3QMY7vNr
         H5PdJWSPLNqeAsieeOQve+27fp9Hl8LbucD0KIaFqR54M9gBrm8VOHl8JaoCMsPiYyDo
         bX73xL6nJPpw9sCHAXwNrOGWqTxUXbBV7XdmqTA7XOlgI1MUeadKruqadu+0PojwIwl1
         XvjRer2VJQDJJsj57MbJeV184Hs/HbrGfnQOGsydg+qLRSn7kGp6DLwSwPlGDJ7StN9s
         lVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UMFTWca/M4TfbxdaHTyPRF/E0gtPVYYx17k3K8duDE=;
        b=xeFzd9Kd5BdlhMWNXgjs6CCnddlNqp6LrcIzYX4oZ6nv+2QxI8MHA1YdGy7RYX+aw/
         x3OD4Btp4IOySA3iRobQvdMyavQhtbOFtjCaxwCugZGkUSy+WocUWCc6T+hul5q8Yp1P
         R7RWoZF0Ka+CLWuJRS4u0EhUTUiay643z/XiFhhmCdGihtCsfXebGnVoaU2Tf2n9/DQl
         Byr489HOZC9S44jFf8C91IghQ6FWh6qAQc7KUj9W2/6Yiut0Ih98ny6K1bprHhAKZ0ni
         9+sE/PpHvCeO6z9CdKAg8obnSA1RY1+kkHNFAYByYAfSda26SXH/5t7/Gk+n/VZhZRA9
         vc6Q==
X-Gm-Message-State: AAQBX9dTQiGXf+vc655QuBd3sDNxEcLxThXW9grZgN8A258kLMrEOrT/
        Jze1g979oQSCs/q2HC+FItDjUw==
X-Google-Smtp-Source: AKy350avzqpXscfNCWpuTFSUuTSNauS3G1P6gOqJBw8ScLYMj7p780/YMnXFYzv16OOKVftX64fYHg==
X-Received: by 2002:a17:906:5a81:b0:92e:fcc9:aa22 with SMTP id l1-20020a1709065a8100b0092efcc9aa22mr13950371ejq.37.1679985701551;
        Mon, 27 Mar 2023 23:41:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id qq24-20020a17090720d800b008df7d2e122dsm14865849ejb.45.2023.03.27.23.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:41:41 -0700 (PDT)
Message-ID: <953453b0-efb6-e208-786e-160d6c0f4efa@linaro.org>
Date:   Tue, 28 Mar 2023 08:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: refactor SLPI remoteproc
 init
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230327183736.496170-1-me@dylanvanassche.be>
 <20230327183736.496170-4-me@dylanvanassche.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327183736.496170-4-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 27/03/2023 20:37, Dylan Van Assche wrote:
> SLPI remoteproc initialization is the same for SDM845, SM8150, SM8250,
> SM8350 but is duplicated for each compatible. Refactor initialization
> structs for these 4 compatibles as a single struct.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 66 ++++--------------------------
>  1 file changed, 9 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index d82b6f4bced4..d1c7baec4aca 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1014,7 +1014,7 @@ static const struct adsp_data sc8180x_mpss_resource = {
>  	.ssctl_id = 0x12,
>  };
>  
> -static const struct adsp_data slpi_resource_init = {
> +static const struct adsp_data msm_slpi_resource_init = {
>  		.crash_reason_smem = 424,
>  		.firmware_name = "slpi.mdt",
>  		.pas_id = 12,
> @@ -1028,7 +1028,7 @@ static const struct adsp_data slpi_resource_init = {
>  		.ssctl_id = 0x16,
>  };
>  
> -static const struct adsp_data sdm845_slpi_resource = {
> +static const struct adsp_data sm_slpi_resource_init = {

You just added this and further lines. First refactor, then add new
device support.


Best regards,
Krzysztof

