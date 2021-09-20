Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23447C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 21:16:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 054BC61159
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Sep 2021 21:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbhITVSE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 17:18:04 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39088 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhITVQE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 17:16:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KLEU91124230;
        Mon, 20 Sep 2021 16:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632172470;
        bh=dc0vdpYZrdrZqs1wDGFW6RFX3Ev+Zts4gHAzBSwfteM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=siUsHRn/GNMLY/0e/qLscVmhS2R9lieNZ1K3Y6GsC81fa/mDxo6pijb9VTuZAUEZl
         oWNtsQWG4pcz0k3+ritwFjxD2qKkyC02nyC63ALzk79y/zsIs1EfHRTZCuEM2f1Jha
         U/saZZ9PNk7GkCpGCZbj8a/x456nAiIwydY3xOAU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KLEUsL066541
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Sep 2021 16:14:30 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 16:14:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 16:14:29 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KLETRd051683;
        Mon, 20 Sep 2021 16:14:29 -0500
Subject: Re: [PATCH] dt-bindings: hwlock: omap: Remove board-specific
 compatible from DT example
To:     Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@mistralsolutions.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sinthu Raja <sinthu.raja@ti.com>
References: <20210917094740.18891-1-sinthu.raja@ti.com>
 <20210917144455.nj6bc2enytlgqmzn@studied>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ba7e9eff-6cd1-2705-4c27-f3a700345ed2@ti.com>
Date:   Mon, 20 Sep 2021 16:14:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917144455.nj6bc2enytlgqmzn@studied>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 9/17/21 9:44 AM, Nishanth Menon wrote:
> On 15:17-20210917, Sinthu Raja wrote:
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> The example includes a board-specific compatible property, this is
>> wrong as the example should be board agnostic. Replace the same with a
>> generic soc node.
>>
>> Fixes: d8db9dc34871 ("dt-bindings: hwlock: omap: Convert binding to YAML")
>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> ---
>>
>> This patch was triggered by discussions in [1].
>>
>> When applying the patch, if you could provide an immutable tag for the
>> bindings, it would help line things up for new platforms to be added for
>> us. See [2] for the context
> 
> 
> Aah yes, thanks.. Bjorn.. once Rob acks ofcourse (since this is
> bindings).

Hmm, I don't think an immutable tag is needed for this patch. This is just
cleanup, what is your exact dependency here?

The relevant HwSpinlock dts nodes are all upstream on all applicable platforms
already.

regards
Suman


> 
> Reviewed-by: Nishanth Menon <nm@ti.com>
> 
> 
>>
>> [1] https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
>> [2] https://lore.kernel.org/linux-arm-kernel/20210125141642.4yybjnklk3qsqjdy@steersman/
>>
>>  .../devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml        | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> index ae1b37dbee75..d56dc1bebdc6 100644
>> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
>> @@ -47,10 +47,8 @@ examples:
>>      };
>>  
>>    - |
>> -    / {
>> +    soc {
>>          /* K3 AM65x SoCs */
>> -        model = "Texas Instruments K3 AM654 SoC";
>> -        compatible = "ti,am654-evm", "ti,am654";
>>          #address-cells = <2>;
>>          #size-cells = <2>;
>>  
>> -- 
>> 2.32.0
>>
> 

