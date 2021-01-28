Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5F9C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Jan 2021 22:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6900464DE8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Jan 2021 22:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhA1W6F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Jan 2021 17:58:05 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53084 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhA1W5f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Jan 2021 17:57:35 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10SMt95U097208;
        Thu, 28 Jan 2021 16:55:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1611874510;
        bh=jonMZv526fvLfzZM6MKHRBQrNWc4O0SRB31532W4+KU=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=xUhqGDFTyCN3lfJIhQ+XBxnZZ2SrDFbAvF5aHn2SW7RO6f+2d/qXXFR6z12fqGNLM
         N+uwpJ7etWS13zGb0aqCvS18Vzq0PZUe6+5baqHU9vIqwz3DvVzleAOnaExKgav1ax
         5be3EmHpe0st499SsQwLKO/qru3ZttPh1WA2Dhs4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10SMt9j5015626
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 Jan 2021 16:55:09 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 Jan 2021 16:55:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 Jan 2021 16:55:09 -0600
Received: from [10.250.35.71] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10SMt9KI010966;
        Thu, 28 Jan 2021 16:55:09 -0600
Subject: Re: [PATCH] remoteproc: pru: future-proof PRU ID matching
From:   Suman Anna <s-anna@ti.com>
To:     David Lechner <david@lechnology.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        <linux-kernel@vger.kernel.org>
References: <20210104211816.420602-1-david@lechnology.com>
 <ccc1ee4b-ed73-f7c8-ca1e-f15eedeeb84b@ti.com>
Message-ID: <e2a0a40d-f720-8139-29f3-39a473c69119@ti.com>
Date:   Thu, 28 Jan 2021 16:55:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ccc1ee4b-ed73-f7c8-ca1e-f15eedeeb84b@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi David,

On 1/15/21 6:53 PM, Suman Anna wrote:
> On 1/4/21 3:18 PM, David Lechner wrote:
>> Currently, to determine the ID (0 or 1) of a PRU core, the last 19 bits
>> of the physical address of the cores IRAM are compared to known values.
>> However, the PRUs on TI AM18XX have IRAM at 0x01c38000 and 0x01c3c000
>> respectively. The former conflicts with PRU1_IRAM_ADDR_MASK which could
>> cause PRU0 to be detected as PRU1. (The latter also conflicts with
>> TX_PRU1_IRAM_ADDR_MASK but it would still be correctly detected as
>> PRU1.)
>>
>> This fixes the problem by moving the address matching offset values to
>> the device-specific data. This way the compatible string does half of
>> the work of narrowing down the addresses to two possibilities instead
>> of checking the address against all possible PRU types. This also lets
>> us narrow down the scope of the match from 19 bits to 16 bits for all
>> PRU types.
>>
>> After this, the TI AM18XX PRUs will be able to be added without running
>> into the problems stated above.
>>
>> We can also drop the local ret variable while touching this code.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
> 
> Will test this patch on Mon/Tue on various platforms.
> 
> Bjorn,
> Please wait for my Ack on this before you pick this up.
> 
> regards
> Suman
> 
>> ---
>>  drivers/remoteproc/pru_rproc.c | 49 ++++++++++++++--------------------
>>  1 file changed, 20 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
>> index 2667919d76b3..94ce48df2f48 100644
>> --- a/drivers/remoteproc/pru_rproc.c
>> +++ b/drivers/remoteproc/pru_rproc.c
>> @@ -46,15 +46,6 @@
>>  #define PRU_DEBUG_GPREG(x)	(0x0000 + (x) * 4)
>>  #define PRU_DEBUG_CT_REG(x)	(0x0080 + (x) * 4)
>>  
>> -/* PRU/RTU/Tx_PRU Core IRAM address masks */
>> -#define PRU_IRAM_ADDR_MASK	0x3ffff
>> -#define PRU0_IRAM_ADDR_MASK	0x34000
>> -#define PRU1_IRAM_ADDR_MASK	0x38000
>> -#define RTU0_IRAM_ADDR_MASK	0x4000
>> -#define RTU1_IRAM_ADDR_MASK	0x6000
>> -#define TX_PRU0_IRAM_ADDR_MASK	0xa000
>> -#define TX_PRU1_IRAM_ADDR_MASK	0xc000
>> -
>>  /* PRU device addresses for various type of PRU RAMs */
>>  #define PRU_IRAM_DA	0	/* Instruction RAM */
>>  #define PRU_PDRAM_DA	0	/* Primary Data RAM */
>> @@ -96,10 +87,14 @@ enum pru_type {
>>  /**
>>   * struct pru_private_data - device data for a PRU core
>>   * @type: type of the PRU core (PRU, RTU, Tx_PRU)
>> + * @pru0_iram_offset: used to identify PRU core 0
>> + * @pru1_iram_offset: used to identify PRU core 1
>>   * @is_k3: flag used to identify the need for special load handling
>>   */
>>  struct pru_private_data {
>>  	enum pru_type type;
>> +	u16 pru0_iram_offset;
>> +	u16 pru1_iram_offset;
>>  	unsigned int is_k3 : 1;
>>  };
>>  
>> @@ -693,33 +688,21 @@ static int pru_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>>  }
>>  
>>  /*
>> - * Compute PRU id based on the IRAM addresses. The PRU IRAMs are
>> + * Compute PRU id based on the last 16 bits of IRAM addresses. The PRU IRAMs are
>>   * always at a particular offset within the PRUSS address space.
>>   */
>>  static int pru_rproc_set_id(struct pru_rproc *pru)
>>  {
>> -	int ret = 0;
>> -
>> -	switch (pru->mem_regions[PRU_IOMEM_IRAM].pa & PRU_IRAM_ADDR_MASK) {
>> -	case TX_PRU0_IRAM_ADDR_MASK:
>> -		fallthrough;
>> -	case RTU0_IRAM_ADDR_MASK:
>> -		fallthrough;
>> -	case PRU0_IRAM_ADDR_MASK:
>> +	u16 offset = pru->mem_regions[PRU_IOMEM_IRAM].pa;
>> +
>> +	if (offset == pru->data->pru0_iram_offset)
>>  		pru->id = 0;
>> -		break;
>> -	case TX_PRU1_IRAM_ADDR_MASK:
>> -		fallthrough;
>> -	case RTU1_IRAM_ADDR_MASK:
>> -		fallthrough;
>> -	case PRU1_IRAM_ADDR_MASK:
>> +	else if (offset == pru->data->pru1_iram_offset)
>>  		pru->id = 1;
>> -		break;
>> -	default:
>> -		ret = -EINVAL;
>> -	}
>> +	else
>> +		return -EINVAL;
>>  
>> -	return ret;
>> +	return 0;

While this logic does work, it is a bit convoluted IMO for any one reading the
code. The offset here is kind of a misnomer, this logic is relying on only the
least 16-bits of the address.

I have actually used a different logic in our downstream code, and we chose the
current approach to minimize the static data.

https://git.ti.com/gitweb?p=rpmsg/remoteproc.git;a=blob;f=drivers/remoteproc/pru_rproc.c;h=cbcd8a6e420e61d60218a01ea0e76f0c9989a337;hb=refs/heads/rproc-linux-5.4.y#l1135

>>  }
>>  
>>  static int pru_rproc_probe(struct platform_device *pdev)
>> @@ -825,20 +808,28 @@ static int pru_rproc_remove(struct platform_device *pdev)
>>  
>>  static const struct pru_private_data pru_data = {
>>  	.type = PRU_TYPE_PRU,
>> +	.pru0_iram_offset = 0x4000,
>> +	.pru1_iram_offset = 0x8000,

The offsets for the PRU cores are actually 0x34000 and 0x38000 respectively from
the base of the PRUSS on non-Davinci SoCs.

If we were to use this static data approach, then we might as well continue to
use the current address masking logic with the appropriate masks for Davinci
(0x38000 and 0x3C000, not true offsets but as masks they would work). Davinci
PRUSS is the only one with its differences being the first PRUSS IP, and I would
prefer to keep the logic aligned to the IPs on all the recent SoCs on 3
different TI SoC families (OMAP, Keystone 2 and K3).

Let me know what you think.

regards
Suman

>>  };
>>  
>>  static const struct pru_private_data k3_pru_data = {
>>  	.type = PRU_TYPE_PRU,
>> +	.pru0_iram_offset = 0x4000,
>> +	.pru1_iram_offset = 0x8000,
>>  	.is_k3 = 1,
>>  };
>>  
>>  static const struct pru_private_data k3_rtu_data = {
>>  	.type = PRU_TYPE_RTU,
>> +	.pru0_iram_offset = 0x4000,
>> +	.pru1_iram_offset = 0x6000,
>>  	.is_k3 = 1,
>>  };
>>  
>>  static const struct pru_private_data k3_tx_pru_data = {
>>  	.type = PRU_TYPE_TX_PRU,
>> +	.pru0_iram_offset = 0xa000,
>> +	.pru1_iram_offset = 0xc000,
>>  	.is_k3 = 1,
>>  };
>>  
>>
> 

