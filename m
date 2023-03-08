Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB65C678D5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Mar 2023 08:42:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjCHIl7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Mar 2023 03:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjCHIlt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Mar 2023 03:41:49 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965649B980
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Mar 2023 00:41:26 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id cy23so62430346edb.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Mar 2023 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCs89pw+P8cjJtlM4LSB8KM5CQ8T7G/wA0iscV42Tco=;
        b=SL7reMSUkGlsENR8kCgNcPCg7nHJpfnx9oMWVKmZ0pSUbgl26d80MUc+7jKfxRQlyo
         bR9//nqwlB0Me/3eFfF7biVwAbihU/L06wx0Mx2sterw4D4Ie7kVGYsZm2yjgsVAEvFj
         HYWNJfYdIU+gjS8YC8Ju1bkIWmEkkPhy2/BI4LptpqMkZ4p/c3Z760VaW4qKyjHG0PAB
         Ci5kU+6HOXFBIdohJCHeH/ek9/KIBrXzw1/GPEn54Dc8X/FnO5LasEyccoTWuK2FKxWw
         U3dolQ5QdzD6gnzddTkFgKQZl0Ac6iBILTHqYex9UlN4GV9xZt5uoT7bNDLjQCVk+lCX
         kcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCs89pw+P8cjJtlM4LSB8KM5CQ8T7G/wA0iscV42Tco=;
        b=z7hDYT+owewrkDcCQfuj3tZVTJwaEy9YqHkPVbZdiYAMM3Jy7mh7uF1VVuzoBEy0eu
         ydCMAIim2XLOA7yBkKqIZADvfP6s8sqr/9XEAujiedC9Cr9QdoEklLNoSu2f95ernGvi
         RcbX/GU/EyY5UG5kc8Dh6DJ9UomRIZU3adknVx2Y2ooMfHEnkWwFwescxzOVX5MzfHu6
         xTWSBHj0lxvxslPU2JOgn/bgyFh97TbxGqF6nuPbdqVZrdqgaMQxyzkcLJ3UG6w9civy
         91uzpHVvlIYadu9/ix2+xkUfIl1n5O5U8mCfM9dDA58qVBugW5AumqMjza4eYfX3TuHC
         2Mgg==
X-Gm-Message-State: AO0yUKWedkFsHTbWLF/QP/A8Abxav/A2UVXcVmHkUjNCxMJbbpLbrT28
        d56dkyzXbItgsPqBihAq78epfA==
X-Google-Smtp-Source: AK7set/3Dx0duu8l2Mp+JzTJRoeH9ueDFnjoOGADwh+ZziLDmOYI+MMkObsdQ2ouyppnyRRqhx/Onw==
X-Received: by 2002:a17:906:7b8b:b0:885:8f79:d6d7 with SMTP id s11-20020a1709067b8b00b008858f79d6d7mr16265293ejo.61.1678264884549;
        Wed, 08 Mar 2023 00:41:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id bs13-20020a170906d1cd00b008e204a57e70sm7156164ejb.214.2023.03.08.00.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:41:24 -0800 (PST)
Message-ID: <15374680-b9bc-a7a2-2723-570294456d24@linaro.org>
Date:   Wed, 8 Mar 2023 09:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: k3-m4f: Add bindings for
 K3 AM64x SoCs
Content-Language: en-US
To:     Martyn Welch <martyn.welch@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hari Nagalla <hnagalla@ti.com>
Cc:     kernel@collabora.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230302171450.1598576-1-martyn.welch@collabora.com>
 <20230302171450.1598576-2-martyn.welch@collabora.com>
 <5c9130de-5092-9446-6e00-d86de7dcd6b4@linaro.org>
 <c2bebcbf9d463d656ae69d489e0e5a88f2540c2e.camel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c2bebcbf9d463d656ae69d489e0e5a88f2540c2e.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/03/2023 19:26, Martyn Welch wrote:
> On Fri, 2023-03-03 at 09:06 +0100, Krzysztof Kozlowski wrote:
>> On 02/03/2023 18:14, Martyn Welch wrote:
>>
>>> +
>>> +  mboxes:
>>> +    description: |
>>> +      OMAP Mailbox specifier denoting the sub-mailbox, to be used
>>> for
>>
>> OMAP?
>>
> 
> This device uses a mailbox compatible with the OMAP Mailbox, as defined
> in Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml.
> 
> I note that documents title reads "TI OMAP2+ and K3 Mailbox devices".
> I'll drop the "OMAP" here.
> 
>>> +      communication with the remote processor. This property
>>> should match
>>> +      with the sub-mailbox node used in the firmware image.
>>> +    maxItems: 1
>>> +
>>> +  memory-region:
>>> +    description: |
>>> +      phandle to the reserved memory nodes to be associated with
>>> the
>>> +      remoteproc device. There should be at least two reserved
>>> memory nodes
>>> +      defined. 
>>
>> Don't repeat constraints in free form text.
>>
>>> The reserved memory nodes should be carveout nodes, and
>>> +      should be defined with a "no-map" property as per the
>>> bindings in
>>> +      Documentation/devicetree/bindings/reserved-memory/reserved-
>>> memory.yaml
>>> +    minItems: 2
>>> +    maxItems: 8
>>> +    items:
>>> +      - description: region used for dynamic DMA allocations like
>>> vrings and
>>> +                     vring buffers
>>> +      - description: region reserved for firmware image sections
>>> +    additionalItems: true
>>
>> And what is the purpose of the rest of reserved nodes?
>>
> 
> Up to 8 regions can be specified with their purpose determined by the
> firmware running on the M4F core. The suggestion (and the
> implementation in the example firmware) is to use the first 2 regions
> as defined above for remoteproc with the others available to be used
> for other purposes if necessary. The address translation module used
> can cope with up to 8 regions.

Then mention the rest is just dedicated to the firmware and it's purpose
depends on the firmware.

Best regards,
Krzysztof

