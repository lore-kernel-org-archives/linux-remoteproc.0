Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07931C04FF3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 May 2021 15:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDDA861376
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 May 2021 15:49:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbhEXPum (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 May 2021 11:50:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:32780 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234359AbhEXPtE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 May 2021 11:49:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OFlVEV053864;
        Mon, 24 May 2021 10:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621871251;
        bh=IxzFLmrt4I56bToXBwyHHbCuQpHYXV4NOn/Wx15upW4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ICVkjOG4JwCvExRHK/IWwDuOkr1MtYDy9sVc6q+Vj2ymDGSlvRBdi3H8JoawgurD/
         NgvaT4V4rnvSXe0AwtehL35jUUyJEPbwk5XnebQ++pw+ZazRjCJ2bu5M4JayuptooO
         SdUDD4z/T3ai72hhoSX8LCFay6nPm5k+l83L7n74=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OFlVo7059859
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 May 2021 10:47:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 10:47:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 10:47:31 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OFlUDi035763;
        Mon, 24 May 2021 10:47:30 -0500
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: k3-r5f: Update bindings
 for AM64x SoCs
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210327143117.1840-1-s-anna@ti.com>
 <20210327143117.1840-2-s-anna@ti.com>
 <8948a30c-1a2f-1fb0-05bb-37be9c02c5d5@ti.com>
 <ff8edffb-d926-9641-740b-2c292139aa07@ti.com>
 <20210521204053.GA1011163@xps15>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <911bfb1d-8e66-298a-83ba-998040f5596d@ti.com>
Date:   Mon, 24 May 2021 10:47:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521204053.GA1011163@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/21/21 3:40 PM, Mathieu Poirier wrote:
> Hi suman,
> 
> On Wed, May 12, 2021 at 09:47:44PM -0500, Suman Anna wrote:
>> Hi Rob,
>>
>> On 4/19/21 8:55 AM, Suman Anna wrote:
>>> Hi Rob,
>>>
>>> On 3/27/21 9:31 AM, Suman Anna wrote:
>>>> The K3 AM64x SoCs have two dual-core Arm R5F clusters/subsystems, with
>>>> 2 R5F cores each, both in the MAIN voltage domain.
>>>>
>>>> These clusters are a revised IP version compared to those present on
>>>> J721E and J7200 SoCs, and supports a new "Single-CPU" mode instead of
>>>> LockStep mode. Update the K3 R5F remoteproc bindings with the compatible
>>>> info relevant to these R5F clusters/subsystems on K3 AM64x SoCs.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> ---
>>>> v2: No changes
>>>>
>>>>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 31 ++++++++++++++++---
>>>
>>> Looks like this patch has fallen through the cracks, can you please review and
>>> give your ack for this patch so that Bjorn can pick up the series for 5.13?
>>
>> Gentle reminder, do you have any comments on this patch. Appreciate your ack so
>> that we can get this in for 5.14?
> 
> If memory serves me well Rob indicated that he would not review or comment on
> bindings related to multi-core remote processors.  On the flip side he also
> mentioned that he would not object to their presence.  And since this is an
> increment to an existing binding rather than a new one, I think it is fair for
> us to pick it up.  
> 
> Rob - please intervene if my recollections are not accurate and accept my honest
> apologies.  Otherwise: 
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> 
> 

Thank you Mathieu.

Bjorn,
Is it possible for you to give an immutable branch with just this bindings so we
can add the R5F nodes as well and avoid any checkpatch warnings on Nishanth's
tree with our K3 dts patches?

regards
Suman

>>
>> regards
>> Suman
>>
>>>
>>> regards
>>> Suman
>>>
>>>>  1 file changed, 26 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> index d905d614502b..130fbaacc4b1 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
>>>> @@ -14,8 +14,12 @@ description: |
>>>>    processor subsystems/clusters (R5FSS). The dual core cluster can be used
>>>>    either in a LockStep mode providing safety/fault tolerance features or in a
>>>>    Split mode providing two individual compute cores for doubling the compute
>>>> -  capacity. These are used together with other processors present on the SoC
>>>> -  to achieve various system level goals.
>>>> +  capacity on most SoCs. These are used together with other processors present
>>>> +  on the SoC to achieve various system level goals.
>>>> +
>>>> +  AM64x SoCs do not support LockStep mode, but rather a new non-safety mode
>>>> +  called "Single-CPU" mode, where only Core0 is used, but with ability to use
>>>> +  Core1's TCMs as well.
>>>>  
>>>>    Each Dual-Core R5F sub-system is represented as a single DTS node
>>>>    representing the cluster, with a pair of child DT nodes representing
>>>> @@ -33,6 +37,7 @@ properties:
>>>>        - ti,am654-r5fss
>>>>        - ti,j721e-r5fss
>>>>        - ti,j7200-r5fss
>>>> +      - ti,am64-r5fss
>>>>  
>>>>    power-domains:
>>>>      description: |
>>>> @@ -56,11 +61,12 @@ properties:
>>>>  
>>>>    ti,cluster-mode:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>> -    enum: [0, 1]
>>>>      description: |
>>>>        Configuration Mode for the Dual R5F cores within the R5F cluster.
>>>> -      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
>>>> -      default is LockStep mode if omitted.
>>>> +      Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
>>>> +      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
>>>> +      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
>>>> +      on AM64x SoCs, default is Split mode if omitted.
>>>>  
>>>>  # R5F Processor Child Nodes:
>>>>  # ==========================
>>>> @@ -97,6 +103,7 @@ patternProperties:
>>>>            - ti,am654-r5f
>>>>            - ti,j721e-r5f
>>>>            - ti,j7200-r5f
>>>> +          - ti,am64-r5f
>>>>  
>>>>        reg:
>>>>          items:
>>>> @@ -198,6 +205,20 @@ patternProperties:
>>>>  
>>>>      unevaluatedProperties: false
>>>>  
>>>> +if:
>>>> +  properties:
>>>> +    compatible:
>>>> +      enum:
>>>> +        - ti,am64-r5fss
>>>> +then:
>>>> +  properties:
>>>> +    ti,cluster-mode:
>>>> +      enum: [0, 2]
>>>> +else:
>>>> +  properties:
>>>> +    ti,cluster-mode:
>>>> +      enum: [0, 1]
>>>> +
>>>>  required:
>>>>    - compatible
>>>>    - power-domains
>>>>
>>>
>>

