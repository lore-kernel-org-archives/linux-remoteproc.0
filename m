Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07B6C7619A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Mar 2023 10:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjC0Kxe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 06:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjC0Kxd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 06:53:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3AE10FF
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 03:53:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i13so10801260lfe.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679914409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WnzOjHdVfvoCMG3pjVqA605yGhXEuWWs9v71lH5Wbo=;
        b=Xm77A2gZGJkkJRtH7/hFJbceaoRhHoVaOSxcCKITYDDDP4yT2vupGTRCWt74OJ+uen
         KpfmZs5f/A++PJKPsZoJ6OjGV1chdMTpQIT9W34thZ+h4J+1HBG5uQf/ULfnLqhSEhAR
         0z2ytp0tax/KYyx3JEkAfBBO2lIHsftrPRqBA0YLEYkSMMT15/0t3CAd6SrcqN+1g47q
         jtkLfIFkq1wFK11UujS6j+bkWaqUZk227f5/1D2vBf3KRUDoEd5LbNqToHxKTLKtfdwf
         J+kVvbDFHlA86Mza2ojvGiC3UT4ARSxK1gD8jkyOI8I6qp3idVgIagCeWYrDvpCAtJqL
         J5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WnzOjHdVfvoCMG3pjVqA605yGhXEuWWs9v71lH5Wbo=;
        b=JbQ2qiSi+Mh7ZU7lScAtKDKvoy3+0XtIyS/CfQxNvrjmkYi/IYq8rU/Pv7wxtj/yca
         ygVIotKu34BcdyHDh+rR1g++reJytQ8d39pe5iPnayNS/bgXFy0uzGTsh6rIoGukWqiS
         LXvkS0tW6PjwZR/ryQWRKrjSqooVuUtLhM6ceX7vXRTaMSO42FISRqKS5M5TbOwrcrsG
         /+fuW+XXgF8I9WAYdVLSDD4NyML9Ftddeai3POAUyGiFQHwTIyHEHMievW4/4i/P9ozD
         8b62X8hpei7gdLWki91+Ge7mj7pfH9KLkzyGoKQI3UzsnBifdWvVintIbb6UIkl4tgiN
         XBaQ==
X-Gm-Message-State: AAQBX9caFm18M/+shti+LjJHX0ZaN5fY/FDhsn58yxruaqxW4b+46KB3
        mwj+iCA8iqYPGVu1t99canZvnw==
X-Google-Smtp-Source: AKy350aYInrCK0ZXczOvivBLQCQFlcg1lhhCSj4cNtly1U8Jiy5o34ej8P5uE+5wVjEIyQgO5SUasw==
X-Received: by 2002:ac2:5541:0:b0:4e0:2455:3ade with SMTP id l1-20020ac25541000000b004e024553ademr2952253lfk.60.1679914409515;
        Mon, 27 Mar 2023 03:53:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id y28-20020ac2447c000000b004eafa141a12sm2075784lfl.9.2023.03.27.03.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:53:29 -0700 (PDT)
Message-ID: <d8ff650c-fd6a-bec4-354b-eb7b27b6394e@linaro.org>
Date:   Mon, 27 Mar 2023 12:53:27 +0200
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
 <a27e7e67-a3e8-01ec-1f0d-717d705af117@linaro.org>
 <91875b7f6f77d6bc846e2da6d009b44c89cbafab.camel@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <91875b7f6f77d6bc846e2da6d009b44c89cbafab.camel@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 27.03.2023 11:34, Dylan Van Assche wrote:
> Hi Konrad,
> 
> On Mon, 2023-03-27 at 10:44 +0200, Konrad Dybcio wrote:
>>
>>
>> On 25.03.2023 14:21, Dylan Van Assche wrote:
>>> Add SLPI resources for the SDM845 Qualcomm SoC to the Qualcomm
>>> remoteproc q6v5_pas driver to define the default firmware name
>>> and GLink edge name.
>>>
>>> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
>>> ---
>>>  drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
>>> b/drivers/remoteproc/qcom_q6v5_pas.c
>>> index c99a20542685..d82b6f4bced4 100644
>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>> @@ -1028,6 +1028,22 @@ static const struct adsp_data
>>> slpi_resource_init = {
>>>                 .ssctl_id = 0x16,
>>>  };
>>>  
>>> +static const struct adsp_data sdm845_slpi_resource = {
>>> +               .crash_reason_smem = 424,
>>> +               .firmware_name = "slpi.mdt",
>>> +               .pas_id = 12,
>>> +               .auto_boot = true,
>>> +               .proxy_pd_names = (char*[]){
>>> +                       "lcx",
>>> +                       "lmx",
>>> +                       NULL
>>> +               },
>>> +               .load_state = "slpi",
>>> +               .ssr_name = "dsps",
>>> +               .sysmon_name = "slpi",
>>> +               .ssctl_id = 0x16,
>> Isn't this identical to sm8150_slpi_resource?
>>
>> Konrad
> 
> Yes it is. I added a new entry because for SM8150, SM8250, and SM8350
> they are duplicated as well. The SDM845's struct is indentical to
> SM8150/SM8250/SM8350's structs.
Well, you just found a quick improvement to make then! :D

Konrad
> 
> Kind regards,
> Dylan Van Assche
> 
>>> +};
>>> +
>>>  static const struct adsp_data sm8150_slpi_resource = {
>>>                 .crash_reason_smem = 424,
>>>                 .firmware_name = "slpi.mdt",
>>> @@ -1201,6 +1217,7 @@ static const struct of_device_id
>>> adsp_of_match[] = {
>>>         { .compatible = "qcom,sdm660-adsp-pas", .data =
>>> &adsp_resource_init},
>>>         { .compatible = "qcom,sdm845-adsp-pas", .data =
>>> &sdm845_adsp_resource_init},
>>>         { .compatible = "qcom,sdm845-cdsp-pas", .data =
>>> &sdm845_cdsp_resource_init},
>>> +       { .compatible = "qcom,sdm845-slpi-pas", .data =
>>> &sdm845_slpi_resource},
>>>         { .compatible = "qcom,sdx55-mpss-pas", .data =
>>> &sdx55_mpss_resource},
>>>         { .compatible = "qcom,sm6115-adsp-pas", .data =
>>> &adsp_resource_init},
>>>         { .compatible = "qcom,sm6115-cdsp-pas", .data =
>>> &cdsp_resource_init},
> 
