Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7AEC04A95
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Sep 2022 17:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiI1Ruk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbiI1Rui (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 13:50:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D683F32D
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:50:36 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z4so3699036lft.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Sep 2022 10:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=szYRUNTBzhtYD1dEwWP+61BLschhE4HnOh0yg58NYWc=;
        b=mC7G9bQo9HU0f6epli3GndKdWBSE8mKRNHsJbfkCwBZ7Ul8WpsecgIkm8+ZNy2E/dR
         0HrdfJS1VZjm0/7ynVDeqMsQDJoQ0ZAurec+DhV40EWxROgQOG8HPTt0UiF2d9aKQ0BM
         RwsL+gAlJ2kLN4JFQeKYkymK3z6xGwiVXeqOR84hVPaDIndoofLqwt3rOjJSl8pvKcJD
         1LdIdHyU9WzWpBu7lSWCaRpFh7TB+qx+LC+nG8sbqQ+tsDoGCqE0nfUk+up8twztsbjb
         hyKGsUKPSG37/aORpxP1YRncPExyozhskt2hNplrHLzoQpVJGBi4FDXYrClymntdLOCk
         mj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=szYRUNTBzhtYD1dEwWP+61BLschhE4HnOh0yg58NYWc=;
        b=3JmFvre0Dh1VN06WJ/ntGGLXQs7yMHFUMzJsotMY7Z1ExyLMfGvqr7+Mld1nvT7mdA
         2OS0h82rmAYoI+LiOblDICKCUEvbWfGFskx1Jch+xWRNEAod9blcMoYrAri7liocH4dx
         V4pPfUEKIhJUlBI0XC33WvgPeEY2oG5qMlZ8Gz3V4fINu0plGmOKzbHhY9GJyM/UVORE
         kCL1IYlR/GRgKtYWXRI49tYgb2bDEyh01/hNmcZNPw8h5Q1oCy1BtomNTTYfQSvPXcxi
         AVm4zmNYhRTop6hTmqphbmdFh0I6KNE36/Sql0I0rgIbMhJ03KVwPIG0lfht5AfviVnd
         NQCQ==
X-Gm-Message-State: ACrzQf1SRV3HDPV7+I86gWiyATJDCya5SQhdZmtOEgXCTcvi9yvzJq8I
        DDxMDbPP+AvY1lar4qXwlMJFmw==
X-Google-Smtp-Source: AMsMyM5rxIZDytENB8AHhahxxOtrIFCEJdUiYcgZbpXU+ZEkOnoiYOmcLtFg6ddHKwNiFLOfdB0k8A==
X-Received: by 2002:a05:6512:1056:b0:498:efaf:5bd1 with SMTP id c22-20020a056512105600b00498efaf5bd1mr13304252lfb.64.1664387434846;
        Wed, 28 Sep 2022 10:50:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x25-20020a056512131900b00498ebd60c35sm532566lfu.165.2022.09.28.10.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:50:34 -0700 (PDT)
Message-ID: <dfb09b81-43e0-2fec-47f8-f341dea15f04@linaro.org>
Date:   Wed, 28 Sep 2022 19:50:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 02/11] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Content-Language: en-US
To:     =?UTF-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= 
        <TingHan.Shen@mediatek.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>,
        "peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "andersson@kernel.org" <andersson@kernel.org>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Cc:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-3-tinghan.shen@mediatek.com>
 <08abade9-f6f5-77cf-b83d-739b0b81543a@oss.nxp.com>
 <d16002714baf1eccb9b0ef5a2ae60e9b25194701.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d16002714baf1eccb9b0ef5a2ae60e9b25194701.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 28/09/2022 11:17, TingHan Shen (沈廷翰) wrote:
> On Wed, 2022-09-28 at 15:01 +0800, Peng Fan wrote:
>>
>> On 9/27/2022 10:55 AM, Tinghan Shen wrote:
>>> The MT8195 SCP is a dual-core RISC-V MCU. Extend the yaml file
>>> to describe the 2nd core as a subnode of the boot core.
>>>
>>> The configuration register is shared by MT8195 SCP core 0
>>> and core 1. The core 1 can retrieve the information of configuration
>>> registers from parent node.
>>
>> I think the commit message would not convince people you put
>> scp 1 as subnode of scp 0.
>>
>> Regards,
>> Peng.
>>
> Hi Peng,
> 
> Thanks for your review. I should give the most reasonable explanation
> for why SCP 1 is a subnode.
> 
> Adding SCP 1 as a subnode helps to assure finish probing SCP 1
> before starting SCP 0 by using of_platform_populate. It's because
> that I want to probe SCP 1 as a remoteproc subdevice of SCP 0.
> such that when SCP 0 crashed, SCP 0 can reboot SCP 1.

As Peng noted, this is not proper description of hardware. The SCP 0/1
do not have parent-child relationship, so do not model it that way in
Devicetree.

Probe ordering is operating system specific, not related to bindings.

Best regards,
Krzysztof

