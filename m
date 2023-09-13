Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF3DEDEC42
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 11:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240054AbjIMLP5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 07:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240052AbjIMLPp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 07:15:45 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1360E3C24
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:14:25 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-401b0d97850so73571935e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694603663; x=1695208463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4j22lmDBEdz68x3qUhl5gJ0drA+YexofLKRZQjwWfs=;
        b=MsJTl3hH4aJNrK5tFeLAxICWDzLg91wl3pT/mKCW+Vb19en/I/7/yG0MEMIoEwBxTG
         7j7n6R1q3u/vNeitp7ccZoqRIUlBvyzPL1Sm3EKawQBtuNKeew02N48cyZo/wYOKCOzu
         WboobLHLEpW95M5poDU+qbwX39v5xJwzlLwdAj3+7ujFDnrguB6DhcAMXy7OWzIwZUXp
         v0cPajGP40D1TFXYhNlutjrJF7Siaes0SHtPWicV2i5ott0XXCr5MD+3O9ggspqfh8Ul
         qXHlbeB2xzpT7xviOxeQ24af1ulbvqpm4lYlYLiMPqhNA1lh/oVrvOVDd5qculDqH48D
         JDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694603663; x=1695208463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4j22lmDBEdz68x3qUhl5gJ0drA+YexofLKRZQjwWfs=;
        b=YL3/pWN0UtClvfMrpcXDr/300VbG8/FMEHGzIJkVuJyHKCSo46Z/B1upvrjB+8dpVb
         R0QqRFpycNgwvLaipY/17e3d5NbIFbS1Nqq2tphpvgVJZG6iZGFe8NE0IroaBqJ0EDgm
         ZY3P22Hd+cNCilrFc2hXhG6Jk84QL7tab6tb23NGeRnCzFoSPMeqUWklw7uIEdRZK/G0
         xesxa9d275jTCTJ6P7QieLw1+7aPLyWua76frABMOLAYQY779+rqJ/W4ASXov5UBBRXN
         NQZ8o7wjMAvqOULt9QE5dapRN1TVnrm6tpgytMtRfAy0r83e6lNEM9vGRzc8rlsUd7pA
         eEMg==
X-Gm-Message-State: AOJu0YxeeMWp5AV4T0bCJuBUQkARAA5wFSg4r4JgquC4Vzz92yu27ofY
        rnyoYHAIiB7vf3viRkhkjBzxzA==
X-Google-Smtp-Source: AGHT+IFJlSnmnVty++JAQlMdedVZw+ig39ydIHFfYUarwozinwRjAGGXz3bvVLJ7KKgGWK++b7J6OQ==
X-Received: by 2002:a5d:4a09:0:b0:317:70da:abdd with SMTP id m9-20020a5d4a09000000b0031770daabddmr1727674wrq.59.1694603663440;
        Wed, 13 Sep 2023 04:14:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe585000000b0031759e6b43fsm15246555wrm.39.2023.09.13.04.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 04:14:22 -0700 (PDT)
Message-ID: <30bb6068-6bb8-9a2c-af19-b989960d0be9@linaro.org>
Date:   Wed, 13 Sep 2023 13:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 01/14] arm64: dts: qcom: msm8916: Drop RPM bus clocks
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
 <20230721-topic-rpm_clk_cleanup-v2-1-1e506593b1bd@linaro.org>
 <bd11d1b1-efe5-4f96-43e7-163fca5d3278@linaro.org>
 <ac501bcc-80a1-4b65-ba24-272152d1c95c@linaro.org>
 <7b500bba-3091-f425-a60d-e58a3d9e4c1a@linaro.org>
 <9a0ab5a9-d4d8-41b8-94b0-9c62bd686254@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9a0ab5a9-d4d8-41b8-94b0-9c62bd686254@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/09/2023 12:48, Konrad Dybcio wrote:
> On 13.09.2023 10:53, Krzysztof Kozlowski wrote:
>> On 13/09/2023 10:47, Konrad Dybcio wrote:
>>> On 13.09.2023 09:07, Krzysztof Kozlowski wrote:
>>>> On 12/09/2023 15:31, Konrad Dybcio wrote:
>>>>> These clocks are now handled from within the icc framework and are
>>>>
>>>> That's a driver behavior, not hardware.
>>> I believe we've been over this already..
>>>
>>> The rationale behind this change is: that hardware, which falls
>>> under the "interconnect" class, was previously misrepresented as
>>> a bunch of clocks. There are clocks underneath, but accessing them
>>> directly would be equivalent to e.g. circumventing the PHY subsystem
>>> and initializing your UFS PHY from within the UFS device.
>>
>> And every time one write such commit msg, how should we remember there
>> is some exception and actually it is about clock representation not CCF
>> or ICC framework.
> So is your reply essentially "fine, but please make it clear in
> each commit message"?

I am fine with this change. If commit msg had such statement, I would
not have doubts :/

Best regards,
Krzysztof

