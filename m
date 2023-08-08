Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD5FC001DB
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Aug 2023 18:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbjHHSXb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235675AbjHHSXF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:23:05 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE64E2270B
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Aug 2023 10:34:44 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe4f5290daso9237295e87.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Aug 2023 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691516083; x=1692120883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUWWJpKA/6zwXJWGtCMuvBG3TRDaWAJxATaidUtAgac=;
        b=fs1tXew4tQYoXEecvNHb4SKP8wmTaUc5W/FJDfY/IWC8AXboz+R8CZJalO1VTR0zAZ
         t3XI+20BLuYut8ZKin7WoJQmCuQYUeiOY/Y0usXdORyXsGTDetkTN6YTWtShTeHV1LPA
         pTH7LkANrZwqGzELS7sL1fOUchv4cw2j+p7fhwHHjXc1foK3XljrjE0A0//N8DZOCihL
         2cek4apXMNvEsPHq4LMyK8CzdUyMgqAHQIf31+KZbaYTirOcaf/y2K4My/2vtawZmiiD
         icE6KscN31Hw6iLRCgW4gLjwlQVmUAzOD7I73Ok1j8DrdhL+QU0K2GzYz6X/oe825uBh
         Wf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691516083; x=1692120883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUWWJpKA/6zwXJWGtCMuvBG3TRDaWAJxATaidUtAgac=;
        b=dG/hbK5XtqbtvsvTjCy6+eA62grJjDJ4VJtT7inZMsThv4svzC40fmSTWsIQWnwu+w
         YTDgdy6GOV0f7bDAiKGjgRiY7K9h+kG3NXbSahjK4ilBbMCT9uLFVSavNoRzRCtPZd4f
         a64CkW/bFSmP+TtAFOYnZ2kahdwWrpFIfZ9R0jKKwcVWx2n+UGOnvW0I7VqrEv9h9KQG
         XQ2gp718YSl9pWgk3bN5cca8nJ7mVBFpSAkIq+Ljr37tnp+WIz+rxnx0K6jGZk1emcQZ
         G0DrnY59MuMMO1kMXPLaizaz9PhF0v/1ER7Cm9z7HbbaQEk8zuTZJ2I7ndBEUeHMX6l8
         L3CQ==
X-Gm-Message-State: AOJu0YwrjJJWJ9QGphvPc6ooO6CKVU7nQaNr22MAvU8UlZ9A3+iZYrI2
        cLCeFYpE3DzyYl4qjfI4ERe7MHIJKf8IIeliegM=
X-Google-Smtp-Source: AGHT+IESMg7JzrGFpGM30sigc77/m28bfDkUOPdPqGf70edI8KNzvVpGtPkhRGubKlKkdCSwOam6hg==
X-Received: by 2002:adf:ef42:0:b0:314:54f0:df35 with SMTP id c2-20020adfef42000000b0031454f0df35mr8529088wrp.16.1691489895173;
        Tue, 08 Aug 2023 03:18:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d5192000000b003143b7449ffsm13177574wrv.25.2023.08.08.03.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:18:14 -0700 (PDT)
Message-ID: <1ade44f5-b3d1-dcde-6819-9e944f3b115d@linaro.org>
Date:   Tue, 8 Aug 2023 12:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: remoteproc: pru: Add Interrupt property
Content-Language: en-US
To:     Md Danish Anwar <a0501179@ti.com>, Conor Dooley <conor@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com,
        nm@ti.com
References: <20230807110836.2612730-1-danishanwar@ti.com>
 <20230807-euphemism-trailing-ef4130dc7437@spud>
 <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/08/2023 11:44, Md Danish Anwar wrote:
>>>    properties:
>>>      compatible:
>>> @@ -171,6 +181,9 @@ examples:
>>>                <0x22400 0x100>;
>>>          reg-names = "iram", "control", "debug";
>>>          firmware-name = "am65x-pru0_0-fw";
>>> +        interrupt-parent = <&icssg0_intc>;
>>> +        interrupts = <16 2 2>;
>>> +        interrupt-names = "vring";
>>>        };
>>
>> These examples would probably be more helpful if they used the
>> appropriate defines, no?
>>
> 
> PRUSS Interrupt controller doesn't have any appropriate defines. This doesn't
> use GIC so defines from arm-gic.h can not be used here. These are specific to
> PRUSS INTC.
> 
> I think these example are OK. Please let me know if this is OK to you.

But isn't "2" type of the interrupt?

Best regards,
Krzysztof

