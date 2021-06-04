Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7A0C4708F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69D3B61405
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 06:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhFDGRI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:17:08 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35982 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhFDGRI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 02:17:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1546EwYB115747;
        Fri, 4 Jun 2021 01:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622787298;
        bh=4qEDJWt0SZhUJ71xYJKiN5cbwLyBfuhRa91+nNrSIOA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JzktDYkdU2BW41ab/6s30Vi/DIc0ORyIiYX+OXSi884Hx6+7hEuupyASe1fexiJ39
         ftyH6BaKJ0vtGmToqgSX0n59ZJOb5QcwA8CyFClIF0XiWgv6rtfFPwocQ40G0SK9em
         3nKrC1MmEHR9tt6Fzc7Hu5ABGXn8lEiJb8v/Pghk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1546Ew8q100327
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 4 Jun 2021 01:14:58 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 4 Jun
 2021 01:14:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 4 Jun 2021 01:14:57 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1546EuVS007115;
        Fri, 4 Jun 2021 01:14:56 -0500
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in
 binding
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210603144216.10327-1-s-anna@ti.com>
 <20210604065543.3d71ca53@monster.powergraphx.local>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <3eb7afb6-629e-bac9-9a5b-7626a3f2359b@ti.com>
Date:   Fri, 4 Jun 2021 01:14:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210604065543.3d71ca53@monster.powergraphx.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 6/3/21 11:55 PM, Wilken Gottwalt wrote:
> On Thu, 3 Jun 2021 09:42:16 -0500
> Suman Anna <s-anna@ti.com> wrote:
> 
>> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
>> $id and fails to compile the example due to undefined args specifier
>> values for clocks and resets. Fix both of these issues.
>>
>> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Wilken,
>>
>> This fixes the warnings for now on linux-next, but I think the example
>> should be including sun6i-a31-ccu.h files instead to be accurate, and
>> those files are missing the definitions for CLK_BUS_SPINLOCK and
>> RST_BUS_SPINLOCK. Feel free to send a newer version or do an incremental
>> patch on top.
>>
>> regards
>> Suman
> 
> Hi Suman,
> 
> thank you for fixing this. I would have fix it the same way for now, so it is
> fine for me. But I will keep an eye on it.

Thanks Will.

Bjorn,
Do ignore the RFC tag then, and you can pick up the patch.

regards
Suman


> 
> greetings,
> Will
> 
>>  .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml      | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
>> b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml index
>> 733c3d01e56c..10e5a53e447b 100644 ---
>> a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml +++
>> b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml @@ -1,7 +1,7 @@
>>  # SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
>>  %YAML 1.2
>>  ---
>> -$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-hwspinlock.yaml#
>> +$id: http://devicetree.org/schemas/hwlock/allwinner,sun6i-a31-hwspinlock.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>>  title: SUN6I hardware spinlock driver for Allwinner sun6i compatible SoCs
>> @@ -36,6 +36,9 @@ additionalProperties: false
>>  
>>  examples:
>>    - |
>> +    #include <dt-bindings/clock/sun8i-a23-a33-ccu.h>
>> +    #include <dt-bindings/reset/sun8i-a23-a33-ccu.h>
>> +
>>      hwlock@1c18000 {
>>          compatible = "allwinner,sun6i-a31-hwspinlock";
>>          reg = <0x01c18000 0x1000>;
> 

