Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E5C71156
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:49:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0300C20725
	for <linux-remoteproc@archiver.kernel.org>; Mon, 30 Nov 2020 15:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Lw8sSrNZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgK3Psu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:48:50 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46220 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgK3Pst (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 30 Nov 2020 10:48:49 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUFlqWu040544;
        Mon, 30 Nov 2020 09:47:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606751272;
        bh=jaqodItvDJOrrUHC+0GGevIUvHl4mGUiSAaqLWeN99E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Lw8sSrNZxm1B9CEG8+KK0/gk/CsHMzvg233vymtiyROqDaTzwim/j3SuzbP6lF2Yj
         w2JkmXY4yUO9OcCYOCVJ44U/UNcQlIbmHDICvtZ69SeTQ328rthyEndQoIyPIbijNW
         Cvgsx1px7m325DRIT3cTHtUeyYRw7ojMHWlxMCeU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUFlqlN035480
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Nov 2020 09:47:52 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 09:47:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 09:47:52 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUFlqlL071712;
        Mon, 30 Nov 2020 09:47:52 -0600
Subject: Re: [PATCH 3/3] remoteproc: k3-r5: Adjust TCM sizes in Split-mode on
 J7200 SoCs
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201119010531.21083-1-s-anna@ti.com>
 <20201119010531.21083-4-s-anna@ti.com> <20201123235129.GA529235@xps15>
 <CANLsYkwztm1hwXMGO-7025YdaEk=ttLMVmM2A8hRYyyrWpR7fQ@mail.gmail.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <823f82d5-f100-23ed-8f29-73ec8b19ffd7@ti.com>
Date:   Mon, 30 Nov 2020 09:47:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkwztm1hwXMGO-7025YdaEk=ttLMVmM2A8hRYyyrWpR7fQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11/23/20 6:55 PM, Mathieu Poirier wrote:
> On Mon, 23 Nov 2020 at 16:51, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
>>
>> Good afternoon Suman,
>>
>> On Wed, Nov 18, 2020 at 07:05:31PM -0600, Suman Anna wrote:
>>> The J7200 SoCs have a revised R5FSS IP that adds a unique feature w.r.t
>>> TCM sizing. Each R5F core in a cluster typically has 32 KB each of ATCM
>>> and BTCM, with only the Core0 TCMs usable in LockStep mode. This revised
>>> IP however doubles the total available TCM in LockStep mode by making the
>>> Core1 TCM visible immediately after the corresponding Core0 TCM.
>>>
>>> The R5F DT nodes on the J7200 SoCs define double (64 KB) the normal TCM
>>> size (32 KB) for R5F Core0 for each of ATCM and BTCM to represent the
>>> above. This increased TCM memory is only usable in LockStep-mode, and
>>> has to be adjusted to the normal 32 KB size in Split mode. Enhance the
>>> TI K3 R5F remoteproc for this logic through a new function. The adjustment
>>> is a no-op on prior SoCs and relies on the correct DTS node sizes in
>>> LockStep-mode on applicable SoCs.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 43 ++++++++++++++++++++++++
>>>  1 file changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> index 66a32dcdd7d0..62b5a4c29456 100644
>>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>>> @@ -71,9 +71,11 @@ enum cluster_mode {
>>>
>>>  /**
>>>   * struct k3_r5_soc_data - match data to handle SoC variations
>>> + * @tcm_is_double: flag to denote the larger unified TCMs in certain modes
>>>   * @tcm_ecc_autoinit: flag to denote the auto-initialization of TCMs for ECC
>>>   */
>>>  struct k3_r5_soc_data {
>>> +     bool tcm_is_double;
>>>       bool tcm_ecc_autoinit;
>>>  };
>>>
>>> @@ -886,6 +888,43 @@ static void k3_r5_reserved_mem_exit(struct k3_r5_rproc *kproc)
>>>       of_reserved_mem_device_release(kproc->dev);
>>>  }
>>>
>>> +/*
>>> + * Each R5F core within a typical R5FSS instance has a total of 64 KB of TCMs,
>>> + * split equally into two 32 KB banks between ATCM and BTCM. The TCMs from both
>>> + * cores are usable in Split-mode, but only the Core0 TCMs can be used in
>>> + * LockStep-mode. The newer revisions of the R5FSS IP maximizes these TCMs by
>>> + * leveraging the Core1 TCMs as well in certain modes where they would have
>>> + * otherwise been unusable (Eg: LockStep-mode on J7200 SoCs). This is done by
>>> + * making a Core1 TCM visible immediately after the corresponding Core0 TCM.
>>> + * The SoC memory map uses the larger 64 KB sizes for the Core0 TCMs, and the
>>> + * dts representation reflects this increased size on supported SoCs. The Core0
>>> + * TCM sizes therefore have to be adjusted to only half the original size in
>>> + * Split mode.
>>> + */
>>> +static void k3_r5_adjust_tcm_sizes(struct k3_r5_rproc *kproc)
>>> +{
>>> +     struct k3_r5_cluster *cluster = kproc->cluster;
>>> +     struct k3_r5_core *core = kproc->core;
>>> +     struct device *cdev = core->dev;
>>> +     struct k3_r5_core *core0;
>>> +
>>> +     if (cluster->mode == CLUSTER_MODE_LOCKSTEP ||
>>> +         !cluster->soc_data->tcm_is_double)
>>> +             return;
>>
>> Shouldn't this be:
>>
>>         if (cluster->mode == CLUSTER_MODE_SPLIT ||
>>             !cluster->soc_data->tcm_is_double)
>>                 return;
>>
>> If am wrong then I'm pretty sure other people will be confused and a comment is
>> warranted.
>>
> 
> Forget the above, I misread the context.  The memories are already set
> to 64KB so there is nothing to do if in lockstep mode.

Yep, thanks for the review. The comments above the function has all the details.

regards
Suman

> 
>>> +
>>> +     core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
>>> +     if (core == core0) {
>>> +             WARN_ON(core->mem[0].size != SZ_64K);
>>> +             WARN_ON(core->mem[1].size != SZ_64K);
>>> +
>>> +             core->mem[0].size /= 2;
>>> +             core->mem[1].size /= 2;
>>> +
>>> +             dev_dbg(cdev, "adjusted TCM sizes, ATCM = 0x%zx BTCM = 0x%zx\n",
>>> +                     core->mem[0].size, core->mem[1].size);
>>> +     }
>>> +}
>>> +
>>>  static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>  {
>>>       struct k3_r5_cluster *cluster = platform_get_drvdata(pdev);
>>> @@ -933,6 +972,8 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
>>>                       goto err_config;
>>>               }
>>>
>>> +             k3_r5_adjust_tcm_sizes(kproc);
>>> +
>>>               ret = k3_r5_reserved_mem_init(kproc);
>>>               if (ret) {
>>>                       dev_err(dev, "reserved memory init failed, ret = %d\n",
>>> @@ -1407,10 +1448,12 @@ static int k3_r5_probe(struct platform_device *pdev)
>>>  }
>>>
>>>  static const struct k3_r5_soc_data am65_j721e_soc_data = {
>>> +     .tcm_is_double = false,
>>>       .tcm_ecc_autoinit = false,
>>>  };
>>>
>>>  static const struct k3_r5_soc_data j7200_soc_data = {
>>> +     .tcm_is_double = true,
>>>       .tcm_ecc_autoinit = true,
>>
>> With the above and for the set:
>>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>
>>>  };
>>>
>>> --
>>> 2.28.0
>>>

