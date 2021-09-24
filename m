Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF165C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 17:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC29E61261
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 17:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345266AbhIXR4o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Sep 2021 13:56:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46330 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345184AbhIXR4n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Sep 2021 13:56:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18OHt0bd008169;
        Fri, 24 Sep 2021 12:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632506100;
        bh=yQOiPS81YD35u7khcbtBmPFF6WtnAm8YrOhmRg/vpAo=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=GlfUJ0B+iyiovxK1opHm+cavW2tYCSy7tOBvDD0ROJ9IW4/OMujHvkpBkOJXRKg8j
         qaV4jx0OC/jQF63VshCnAbP4uVPrw7oOSVYNmygR+xDU73vcCG395kcunsibVfdNZ9
         C/cqCFmJ0t6X0qvSlRwbe3J7rkmOFFil8XCtlxdg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18OHt0Kd073031
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Sep 2021 12:55:00 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 24
 Sep 2021 12:54:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 24 Sep 2021 12:55:00 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18OHsxxQ053417;
        Fri, 24 Sep 2021 12:54:59 -0500
Subject: Re: [PATCH V3 2/2] dt-bindings: remoteproc: k3-dsp: Remove
 board-specific compatible from DT example
From:   Suman Anna <s-anna@ti.com>
To:     Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@mistralsolutions.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>,
        Sinthu Raja <sinthu.raja@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-3-sinthu.raja@ti.com>
 <4d43e927-3998-e9a9-87a6-6036b769a975@ti.com>
 <20210924162920.mvnzcibfm7s265us@boxing>
 <dcb0b95f-92a9-a5f5-ee91-1b1d7123bd8d@ti.com>
Message-ID: <6a6a0d3a-522c-d01c-d3b8-a13488d0c736@ti.com>
Date:   Fri, 24 Sep 2021 12:54:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dcb0b95f-92a9-a5f5-ee91-1b1d7123bd8d@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Sinthu,

On 9/24/21 12:25 PM, Suman Anna wrote:
> On 9/24/21 11:29 AM, Nishanth Menon wrote:
>> On 11:10-20210924, Suman Anna wrote:
>>> Hi Sinthu,
>>>
>>> On 9/17/21 4:54 AM, Sinthu Raja wrote:
>>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>>
>>>> The example includes a board-specific compatible property, this is
>>>> wrong as the example should be board agnostic and gets in the way of
>>>> additions for newer platforms. Replace the same with a generic soc
>>>> node.
>>>
>>> What board specific property? This description looks wrong.

Can you please repost dropping the Fixes line, and modifying the patch
description as follows:

dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT example

The K3 DSP binding example used the root-node with a SoC compatible
property originally to address the dt_binding_check warnings resulting
from using a value of 2 for #address-cells and #size-cells as per most
common usage on K3 SoCs. Clean this up and replace it with a generic soc
node to keep it agnostic of the SoC or board compatibles that are outside
the scope of this binding.

With that,
Acked-by: Suman Anna <s-anna@ti.com>

Please update the R5F binding patch as well similarly. You can retain the
already received Acks.

regards
Suman


>>
>> See https://lore.kernel.org/all/1631794913.472895.1119414.nullmailer@robh.at.kernel.org/
>>
> 
> Yes, I understand you are now trying to add/scale for a board compatible and
> your patch is what triggered the warnings.
> 
> I see "ti,j721e" as an SoC compatible not board-specific.
> 
>>>
>>>>
>>>> Fixes: 2a2180206ab6 ("dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs")
>>>
>>> What error are you trying to fix exactly? The example used below is actually how
>>> it exactly appears in the J721E dts files, and there are no errors with
>>> dt_binding_check.
>>
>> The rproc binding should have nothing to do with j721e SoC node
>> description. it should describe the rproc node that is described in
>> binding.
> 
> You can go back and look at my original dt-binding submissions and the reasons
> for me to add a root-cell. They are to suppress the warnings seen with using two
> address-cells in the DSP example nodes which use the actual node definitions
> from the J721E SoC.
> 
> v1:
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20200325201839.15896-2-s-anna@ti.com/
> v2:
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20200521001006.2725-3-s-anna@ti.com/
> v3:
> https://patchwork.kernel.org/project/linux-remoteproc/patch/20200612224914.7634-5-s-anna@ti.com/
> 
>>
>>>
>>> This is more a cleanup than a fix.  You can look through the original binding
>>> submission patches to see why it is done like this.
>>
>> This is blocking any updates we would want to do in k3.yaml.
> 
> One other way would have been to just add the new enforced compatible (since you
> are actually changing the k3.yaml binding and diverging from what was there
> before) here along with your updates, if you didn't want to add it in the
> previous compatible way.
> 
> FWIW, there are no dt_binding_check errors on this binding before your
> modifications, that's why I am asking what is the "Fixes" with the original patch.
> 
>>>
>>> If this is triggered by the changes you are making to k3.yaml file as part of
>>> the J721E EAIK changes, then you probably may want to look at how you are doing
>>
>>> that again. Looks like the k3.yaml file is being modified now to enforce
>>> "board-compatible", "soc-compatible" which may have triggered an error in this file.
>>>
>>> Please evaluate if you need to modify it to support just the "soc-compatible" as
>>> one of the items.
>>
>> See above link. This is not to do with eaik / sk. I am trying to
>> standardize the board definitions in yaml for k3 and this binding
>> specifically is getting in the way.
> 
> Yeah finally. I remember I had asked you about why we are doing it differently
> between AM65x and J721E/J7200. +1 for the direction.
> 
>>
>>
>> I still don't understand what your contention is here. Are you arguing
>> that the binding example is correct and should be tied to a platform?
> 
> I am not saying it should be tied to a platform, but I have used the example as
> it appears on J721E SoCs. I am commenting that it is not a "Fixes:" and the
> patch description needs updates.
> 
>>
>>
>> Yes, I know I can introduce oneOf and a little more intricate solution,
>> 	but besides that, i disagree that a rproc binding should even
>> 	have SoC specific top level node description in it.
> 
> Please see the reasoning in the original submissions. I could not use 2
> address-cells and size-cells without the top-level node additions, and I didn't
> want to use bogus examples.
> 
> Yes, the intricate solution would not have triggered the warning in this
> example, but your current change is also breaking your previous compatibility. I
> understand that the reality is always actually a "board-compatible",
> "soc-compatible", but as per your previous k3.yaml definition, all one needed
> was just a "ti,j721e" compatible in their dts files. Changing it now and calling
> the usage in this example "wrong" is not right either IMO.
> 
> 
>> a) rproc.yaml does'nt even describe the SoC. soc.yaml does.
>> b) The node property examples are supposed to be examples not tied to a
>>    specific SoC.
> 
> I would rather not use a completely bogus example since it is not very useful
> for customers trying to understand the binding. My philosophy has always been to
> define an example as it appears on an actual SoC so that it is easier for
> customers to comprehend the binding and example while comparing it to actual dts
> nodes.
> 
> regards
> Suman
> 
>>
>>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>>> ---
>>>>
>>>> Changes since V2:
>>>> * review comment updates, including simplifying the changes, commit
>>>>   message and $subject updates.
>>>>
>>>> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
>>>> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
>>>>
>>>>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
>>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
>>>> index 6070456a7b67..5ec6505ac408 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
>>>> @@ -133,9 +133,7 @@ unevaluatedProperties: false
>>>>  
>>>>  examples:
>>>>    - |
>>>> -    / {
>>>> -        model = "Texas Instruments K3 J721E SoC";
>>>> -        compatible = "ti,j721e";
>>>> +    soc {
>>>
>>> While this may be resolving the dt_bindings_check you might be seeing with the
>>> modified k3.yaml, note that "soc" property is not used on K3 dts files, you
>>> might be creating confusion for people who look at this example and the actual
>>> usage.
>>
>>
>> It is a common usage model. NOTE: these are example nodes and NOT meant
>> as SoC representation. I dont see the confusion.
>>
> 
> 
> 
> 

