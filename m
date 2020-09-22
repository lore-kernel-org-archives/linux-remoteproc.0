Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D25C2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:14:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D847208A9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ikwtlh5/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgIVWO5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:14:57 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37842 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgIVWO5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 18:14:57 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MKQAhe042415;
        Tue, 22 Sep 2020 15:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600806371;
        bh=kIqH1V5ealEVC5EO+6vAJW+B9sEXlZ5Fpg3hzaZaIWU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ikwtlh5/gSnu+ZQbloMTppJU2t6nrvxg1KhvJ1e0nSfoNQqfhIu/Hr110QSiZBe6t
         eYMkEIryEsfQoq5vl28jW+KI3qqAa249dMB1RhkHO3IL5ups+XxTSy0EZHAtuFXJ98
         NoUGWSPHHCovssPbAAvIXARf03NRXzPssZiTx/rk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08MKQAvA008719
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 15:26:10 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 15:26:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 15:26:10 -0500
Received: from [10.250.36.109] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MKQAJV061179;
        Tue, 22 Sep 2020 15:26:10 -0500
Subject: Re: [PATCH v4 0/4] TI K3 R5F remoteproc support
To:     Rob Herring <robh@kernel.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20200908174556.21277-1-s-anna@ti.com>
 <20200922194753.GA3105316@bogus>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <f5c8b7f1-1ac6-2134-89da-d1b91d4643bf@ti.com>
Date:   Tue, 22 Sep 2020 15:26:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922194753.GA3105316@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

On 9/22/20 2:47 PM, Rob Herring wrote:
> On Tue, Sep 08, 2020 at 12:45:52PM -0500, Suman Anna wrote:
>> Hi All,
>>
>> The following is v4 of the TI K3 R5F remoteproc driver series supporting all
>> the R5F processor clusters/subsystems on TI AM65x and J721E SoCs. Please
>> see the v1 cover-letter [1] for the features supported on these R5F processors.
>>
>> This series is a rebased version on top of the latest v5.9-rc baseline and
>> includes very minor fixes w.r.t v3. The previous K3 DSP dependencies are now
>> available in mainline kernel. Please see the individual patches for the delta
>> differences (Only patches 1 and 2 updated).
>>
>> Bjorn,
>> This series is only waiting on bindings ack and the conclusion on the bindings
>> discussion from v2 [4] on which I haven't seen any forward progress on this 
>> despite all the clarifications. I do not expect any changes even w.r.t System DT,
>> and we can't really have a common binding between TI and Xilinx R5Fs. 
>

First of all, thank you for reviewing this and your response.

> Why not? I'm pretty sure lockstep or not is a thing for both and TCMs 
> seem to be a common thing.

The cluster mode is a common theme, and if you have a preference for a common
property-name, both I and Ben can use that. The values though might vary between
different vendor SoCs.

I have given out all the differences and reasons on a v2 thread, the SoC and
clock and reset integration aspects make it look very different.
Please see the discussion here,
https://patchwork.kernel.org/comment/23560321/

There was only one open comment/question I had regarding Core identification
w.r.t my binding. Do you prefer a node-name index difference or a separate
core-id/cpu-id property identifying which is Core0 and Core1.

> 
> And I don't really think System DT will not impact it. Though it's not 
> well enough defined to say either way IMO.

Yeah agreed. But the current architecture in System DT does allow you to add
plugins to generate the proper compliant dts node.

In anycase, I doubt TI will ever be using it in general, because we do not have
a concept of DT on our firmwares. I have given all these inputs again on v2, but
haven't seen any responses on it. So, I do appreciate your feedback.

> 
> But if Bjorn wants to take this, fine. I'm not acking it though nor 
> worrying about it for any compatibility with system DT.

Any specific reasons? For the most part, I am using all standard properties.

regards
Suman
