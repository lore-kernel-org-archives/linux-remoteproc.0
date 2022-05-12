Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C9C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 May 2022 14:37:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355413AbiELOhG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 May 2022 10:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355417AbiELOhF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 May 2022 10:37:05 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF8E4F9F8
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 07:37:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so3154140wmn.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 May 2022 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=398I+siT7kQxb7ToNmEqTjbhjJR5QW8v3WeVYoiUi18=;
        b=LjM9msCI8O9qV0jOlCLZIr4ytuS+FR/3n43jLMsVo6PsQfVwpZsbw3B2V8ZpJ47Nic
         Eacg4BKu6Wa1rXQD1r3Mc97pOu3Ti1D0yEO/6Px7fTkJgvkB9gAi0/KpU+GA712t3QQJ
         ZBBb38aG1PSrTDrNxFJz+O9ms82rglnLBRI+GIiTawGOvMdqbhI9dORb+nopzg6YFzFi
         MLNtWkx3pefZSGxM0KOTvwUZfUNIIDuh5WCCCOCFmzS9eAj5ay2IjoVUY1prDQh+kJFl
         Y6oGRfYJ4L9c1+S8SIEySVeE80AEDd/YIV7UNAtSg8Xw0mqk41LKzbfvtKH+xKavsaO0
         t1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=398I+siT7kQxb7ToNmEqTjbhjJR5QW8v3WeVYoiUi18=;
        b=BYY5oBcr+5R8sG5YelhQxLXyA02hD9CfHzwbIrsOyISQmw5mMutGrUAET0fk6tUTt/
         cxj74/i5ahpqpSh4XIHR9C9ibkpZz5CMDnq+WPeJYfQsfq/Fuc7e2F5+3cmePfAfnSGc
         FM6HHd2HIfJRS3fcTHaMB/giEantTxDn7dMhB9k11fMI5otqNdqajhuiNGTwjRbAdKhw
         2b0lXhd8WWMvPS2fXt+YnYGQywcvJNX04wEfndOrgEso7eRzw0dYCds3ME2/L17kEuea
         X3fDA2PGew9QdFKCz5fzzc+tEC0Dfu7WUJnDsufWA+b1j9o2Vbz0g+5YBP9ML6IadtFs
         9rUA==
X-Gm-Message-State: AOAM530NMTyYZ0Dv+K9+x/A/2WHsIAPJFrupb8dyTrEzydpA+lNJ5F0H
        8K5rKdzfBxZBzuSBWHe5NVb7NA==
X-Google-Smtp-Source: ABdhPJyUyJvCmAGVIMf+AcMLEvqljsZojjnbmhouIwgq3Hc8CFxYnzi0slqW3aVLUOyCHPslUzwg6w==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id c11-20020a05600c0a4b00b0037bea2b5583mr10654441wmq.139.1652366222624;
        Thu, 12 May 2022 07:37:02 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b11-20020adff24b000000b0020adc114136sm5525903wrp.0.2022.05.12.07.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:37:02 -0700 (PDT)
Message-ID: <4c35f605-4fa0-13d0-db09-229f718c5c7c@linaro.org>
Date:   Thu, 12 May 2022 16:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 9/9] arm64: dts: qcom: msm8953: Add remote processor nodes
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-remoteproc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220511161602.117772-1-sireeshkodali1@gmail.com>
 <20220511161602.117772-10-sireeshkodali1@gmail.com>
 <2d68e610-e8ae-9e08-257a-3c94c3697334@linaro.org>
 <CJXO6ZMZ454X.M3N9HDKNA5HB@skynet-linux>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CJXO6ZMZ454X.M3N9HDKNA5HB@skynet-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/05/2022 11:19, Sireesh Kodali wrote:
> On Wed May 11, 2022 at 11:25 PM IST, Krzysztof Kozlowski wrote:
>> On 11/05/2022 18:16, Sireesh Kodali wrote:
>>> This commit adds the modem (q6v5_mss), WiFi (wcnss-pil) and audio DSP
>>> (q6v5_pas) remote processor nodes for the MSM8953 platform. It also adds
>>> the coresponding SMP2P, SMSM and pinctrl nodes that are needed by these
>>> remote processors.
>>>
>>> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
>>> +			};
>>> +
>>> +			wcnss_sleep: wcnss-sleep-pins {
>>> +				wcss_wlan2 {
>>
>> No underscores in node names, unless something needs it?
>>
> 
> wcnss_sleep is used by the pronto node defined below

wcnss_sleep is not a node name and it is not in the line where I commented.

Best regards,
Krzysztof
