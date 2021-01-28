Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB99BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Jan 2021 23:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98DB064DE6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Jan 2021 23:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhA1Xjs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Jan 2021 18:39:48 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34816 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhA1Xjq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Jan 2021 18:39:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10SNbRjW112815;
        Thu, 28 Jan 2021 17:37:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611877047;
        bh=/MrmXZnJhILLVxTLG9TIOQfLEmcFnf1oQVNpPlc4Ma8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dIWpzg/e4uiI9K9VIWGoFFB26UJIE8BZWdUiV1wuASwXvCzYPWTbpoSaoQv5A5gId
         4+VmVxAyx5uGN3WLbhp1Z+gddjgT0d1LxG3E/Qf44sRZ7EOHmCciQ6LOiNv2v1UoqQ
         poh0UOy975bzSvO0WaFns9hdkRRxEv8v7j866c1k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10SNbRvL081986
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 Jan 2021 17:37:27 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 Jan 2021 17:37:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 Jan 2021 17:37:26 -0600
Received: from [10.250.35.71] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10SNbQYB079173;
        Thu, 28 Jan 2021 17:37:26 -0600
Subject: Re: [PATCH] remoteproc: pru: future-proof PRU ID matching
To:     David Lechner <david@lechnology.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <linux-kernel@vger.kernel.org>
References: <20210104211816.420602-1-david@lechnology.com>
 <ccc1ee4b-ed73-f7c8-ca1e-f15eedeeb84b@ti.com>
 <e2a0a40d-f720-8139-29f3-39a473c69119@ti.com>
 <5fed434e-1569-ab9f-b1a4-475aa820ef47@lechnology.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <ecc74a7c-8d79-709d-cf77-8f1fabf11f39@ti.com>
Date:   Thu, 28 Jan 2021 17:37:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fed434e-1569-ab9f-b1a4-475aa820ef47@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 1/28/21 5:21 PM, David Lechner wrote:
> On 1/28/21 4:55 PM, Suman Anna wrote:
>> Hi David,
>>
>> On 1/15/21 6:53 PM, Suman Anna wrote:
>>> On 1/4/21 3:18 PM, David Lechner wrote:
>>>>   static int pru_rproc_probe(struct platform_device *pdev)
>>>> @@ -825,20 +808,28 @@ static int pru_rproc_remove(struct platform_device *pdev)
>>>>     static const struct pru_private_data pru_data = {
>>>>       .type = PRU_TYPE_PRU,
>>>> +    .pru0_iram_offset = 0x4000,
>>>> +    .pru1_iram_offset = 0x8000,
>>
>> The offsets for the PRU cores are actually 0x34000 and 0x38000 respectively from
>> the base of the PRUSS on non-Davinci SoCs.
>>
>> If we were to use this static data approach, then we might as well continue to
>> use the current address masking logic with the appropriate masks for Davinci
>> (0x38000 and 0x3C000, not true offsets but as masks they would work). Davinci
>> PRUSS is the only one with its differences being the first PRUSS IP, and I would
>> prefer to keep the logic aligned to the IPs on all the recent SoCs on 3
>> different TI SoC families (OMAP, Keystone 2 and K3).
>>
>> Let me know what you think.
> 
> I'm not too picky as long as it works. :-)
> 
> If keeping the static data to a minimum is really important, I suppose we could
> introduce a new type = PRU_TYPE_PRU_V1 for these PRUSSs instead. It sounds like
> this information might be useful elsewhere anyway.

Yeah, let me look into this further and see if there is any other way possible
as well. I had some patches for DA850 lying around on some older kernels, and I
know that I definitely needed to introduce a variable to distinguish the
programmability of certain CONST registers (C26 and C27 are fixed on Davinci
IIRC). Will need that variable with the current PRU consumer series. Perhaps,
the same PRU type variable can be used for that as well.

regards
Suman
