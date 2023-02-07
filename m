Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE24C636D4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Feb 2023 09:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjBGJiY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Feb 2023 04:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjBGJiX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 04:38:23 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFB444BE
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 01:38:21 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h3so5067123wrp.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 01:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuiSYsVuJ6KWzk0VqpXNXr3qlVlb53sqmaalgh7FtNo=;
        b=zz4eEUXyXp2H0aRViuE3mXijAiJdHAQZPmILz7T5CcSxHWbeEN/KdjnpBnfCSJAPnO
         ARP4tk24qTN/IkYxwpbJI2CYJrPFvFQMBs4CVUva59+MDYzq3ErAw0n84vzo9qtJxG9J
         YOYmzIdzTszM9zyNLAbIpXF+EUym4/nWtyy5uDDgCf+dYZ4SeC2hIvaIMfuNn/e21Yx8
         iHeLh6Gtlqo0VffA6rdxDLoIKpeMg8YMtMRHX7g4P60r2Oc2nHC8tL/Q8+HW1V0p6twY
         oQXQyotVp9kFIkX55XyGzz0GPTtDQf4uwVmAWaG4hvudfTy//KQ8K1eN5KnUnnSSuPsi
         ph+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuiSYsVuJ6KWzk0VqpXNXr3qlVlb53sqmaalgh7FtNo=;
        b=R4mh+5GuvVLnWy3aZrg0DTbFjJ2OuZ/eO8cwDC9KvepBLnfWkkIgg222WX8R7M8PTa
         h0PV4XEUUoPnvKoacDM7/wSjKDiA/OT6c/Z2npuu7DFUEWKYCP4W7IWj3OCLjsjVUW+V
         5nyMXs8LdhWnGsNiBS2grzmGCxUfQFcjfhDxGZob8dOSVJo7d5d5JIt4oWrPIoV+r+TG
         B18iHDfHDRFMk+bT44HYDoJYitp88hVTUUBY+dfSPrNU/BR0cawrnqFTIE2+Q7j3mdDW
         tobX4rtmHhMvQGsErrQL/VMiEdhE7FMLJEjwdYl6T3Syxjm/1ASyl+eOxbWcodk/FkZg
         NhDQ==
X-Gm-Message-State: AO0yUKX3URpH+5m5JOSErNQ2XHlEeg0eyWvbb5cGBQyGUXPZqjZbTfjr
        IbL/IAdnzEVjI+sv7FXT4hhhkA==
X-Google-Smtp-Source: AK7set8Vv+Qef99D6UkExXk5sgQoTlpukBbFOSpXzD72N8Kf0GOUFW6Vea7iLLB1oG40yRytg0FGgg==
X-Received: by 2002:adf:ed11:0:b0:2bd:e8b2:4da8 with SMTP id a17-20020adfed11000000b002bde8b24da8mr2014119wro.35.1675762700152;
        Tue, 07 Feb 2023 01:38:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3? ([2a01:e0a:982:cbb0:c58c:fc5c:67d6:e5f3])
        by smtp.gmail.com with ESMTPSA id l4-20020adff484000000b002c3ed120cf8sm3453169wro.61.2023.02.07.01.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:38:19 -0800 (PST)
Message-ID: <fadf8933-21a7-012a-6f0f-4941a59f5e67@linaro.org>
Date:   Tue, 7 Feb 2023 10:38:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: correct power
 domains
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
 <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/02/2023 20:36, Krzysztof Kozlowski wrote:
> On 06/02/2023 20:33, Krzysztof Kozlowski wrote:
>> Correct CDSP and MPSS power domains to match what is used in DTS and the
>> Linux driver:
>>
>>    sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc', 'nsp'] is too long
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> And probably:
> 
> Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
> 
> Best regards,
> Krzysztof
> 

You were to fast, I'm preparing a serie fixing all checks on sm8550, including this one.

Since it's the same fix, with Fixes tag:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil
