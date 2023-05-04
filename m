Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B590C7EE26
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 12:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjEDMgq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 08:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjEDMgp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 08:36:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAAA6199
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 05:36:43 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso789440a12.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683203802; x=1685795802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8fhO9f4/3QMxyB39Gth5phqAprNLUMtKiWtdq2EDmY=;
        b=zqy7x41oYxHtB4FPo4QvbEkLbekpnOuhNqC+C2+U4OeMKOcYoBy1rXCduDsbM4xOLb
         GRaCmKfqYNsiF0CctP9vLAybQBjmSOjBJItt1bk5tA8rYvbz1WmONUu8HYPm7YoIyyWT
         wz7QMxOhMkKsKkkxdGfpmC0Xtp5IDrVoGbVPlReigGgMp2+oc3c719tm5qZpu4pyPCFj
         ZdTvAEESVZlkTfrIG+vClZDF6M5enb664SX/WaKld4Wo6QPvV5OS8ciGsaUAHQIcbyWf
         ejkoie5lnhYlZuaibb2axTrvl12UAy+ieCgP+Veto6gvfPVk2qw5YRtX8IGqd0q1XR/5
         ZcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683203802; x=1685795802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8fhO9f4/3QMxyB39Gth5phqAprNLUMtKiWtdq2EDmY=;
        b=LAqyFc2irpE7ZruGJ8jeyuUtM+gDchvTeqcBRvn3rwkGbLl2HCejTeliJUIUMb1FvN
         wAO6dIxKSPbYDjRVslnITiFvVNaRi2HuBgvDEgpLqaQKgVfmkwG8H7kIV8PpeMnV9sur
         /3jnr/wzUlTPFQlOCssqOzVOHkr1yxhRBe9xQHY34l1ilhXgIgTmCeL8gl3fPNNvm66H
         7PllMAyhKDVbMnPnHKUHNX56zNNwPyWI0zYkpJtXqrTf82L883lCYBkU+wPrrLK/BXg2
         +BtOEuIw02rkbJIrWWzcs8+6OEt2eACJsq9HMUYklH1ZTMimbn6lwNyjaD9rWjQO5p9C
         Dn9g==
X-Gm-Message-State: AC+VfDyJPhafI6YUJ7BLvI8ABksMJvmc3kE6d6stMc79llvCh7+RXlU2
        xWkBENXyoYeil2C1kPPHnQ627Q==
X-Google-Smtp-Source: ACHHUZ4TgHr5uaxaFriyo68W2I/lTAseWQIQdQvWxYGrr6CF7hqo+PlqPbDD5a12w2V0MfNr/S0GPw==
X-Received: by 2002:a17:907:3ea1:b0:952:b51d:5086 with SMTP id hs33-20020a1709073ea100b00952b51d5086mr7127949ejc.57.1683203802006;
        Thu, 04 May 2023 05:36:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id jx14-20020a170907760e00b009655eb8be26sm2121765ejc.73.2023.05.04.05.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 05:36:41 -0700 (PDT)
Message-ID: <1a4f4b55-6284-6149-4c7b-7b45fa1de291@linaro.org>
Date:   Thu, 4 May 2023 14:36:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 02/18] remoteproc: qcom: Move minidump specific data to
 qcom_minidump.h
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-3-git-send-email-quic_mojha@quicinc.com>
 <fe94ed5c-c444-436d-720a-c96538c1026d@linaro.org>
 <e69862cc-4185-a7a2-07b2-15e331c4678a@quicinc.com>
 <659a9637-f82c-054b-99a8-dc25416c8e13@linaro.org>
 <33ea7c3b-4317-5aff-5e6a-af6e093d45a0@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <33ea7c3b-4317-5aff-5e6a-af6e093d45a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/05/2023 14:26, Mukesh Ojha wrote:
> 
> 
> On 5/4/2023 5:33 PM, Krzysztof Kozlowski wrote:
>> On 04/05/2023 13:58, Mukesh Ojha wrote:
>>>
>>>
>>> On 5/4/2023 5:08 PM, Krzysztof Kozlowski wrote:
>>>> On 03/05/2023 19:02, Mukesh Ojha wrote:
>>>>> Move minidump specific data types and macros to a separate internal
>>>>> header(qcom_minidump.h) so that it can be shared among different
>>>>> Qualcomm drivers.
>>>>
>>>> No, this is not internal header. You moved it to global header.
>>>>
>>>> There is no reason driver internals should be exposed to other unrelated
>>>> subsystems.
>>>>
>>>>>
>>>>> There is no change in functional behavior after this.
>>>>
>>>> It is. You made all these internal symbols available to others.
>>>>
>>>>>
>>>>
>>>> This comes without justification why other drivers needs to access
>>>> private and internal data. It does not look correct design. NAK.
>>>
>>> Thanks for catching outdated commit text, will fix the commit with
>>> more descriptive reasoning.
>>>
>>> It has to be global so that co-processor minidump and apss minidump can
>>> share data structure and they are lying in different directory.
>>>
>>
>> Then you should not share all the internals of memory layout but only
>> few pieces necessary to talk with minidump driver. The minidump driver
>> should organize everything how it wants.
> 
> These are core data structure which is shared with boot firmware and the
> one's are moved here all are required by minidump driver .

I am not sure if I understand correctly. If they are all required by
minidump driver, then this must not be in include, but stay with
minidump. Remoteproc then should not touch it.

I don't understand why internals of minidump should be important for
remoteproc. If they are, means you broken encapsulation.

> 
> If you follow here[1], i raised by concern to make this particular one's
> as private and later to avoid confusion went with single header.
> But if others agree, I will keep the one that get shared with minidump
> as separate one or if relative path of headers are allowed that can make
> it private between these drivers(which i don't think, will be allowed or
> recommended).

Let's be specific: why MD_REGION_VALID must be available for remoteproc
or any other driver after introducing qcom minidump driver?


Best regards,
Krzysztof

