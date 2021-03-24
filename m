Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6475C433C1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Mar 2021 14:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACCB9619D5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Mar 2021 14:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbhCXOIj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Mar 2021 10:08:39 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:3450 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236006AbhCXOIK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Mar 2021 10:08:10 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12ODv9r8012701;
        Wed, 24 Mar 2021 15:07:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cV9LKgWfxFF9ci2IEbctDkOPPeBQ/ZS/7WrIOgBjVbQ=;
 b=ihCil4RxF9qG/c/M2jiz8HBZntzpdfDgB/ff4lJzeXegMFOq4GBs0Xxd9od1b6U2XpmJ
 xnhui3NsX5rS5YwUju64Yld1XqhNyRN4KwwFkX0tcVk4PZpG43pQtBVZC5DQ1c+2fjX6
 952qfoGx8ofCW/N0iWO8NE5POTSUWKg8z8R2rmOguSWZ+u2Uc/HaZJHuJfCuZKf+nUby
 s/JP8TUpvL/iHtQI0Slg6QfnLRXrwvKV6CpbOnSuOVoc33fHm4Ac9O3VHcsJoN5k8pN2
 UYhU7LzQdP0vw7FWgqfxDSkFoRcVwHxXM93Cgq1BVlRpJ5xfUqoFyw+Fm/mmGiBnRePx MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d72dxr6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 Mar 2021 15:07:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A38C10002A;
        Wed, 24 Mar 2021 15:07:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B07D025F3EC;
        Wed, 24 Mar 2021 15:07:57 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar
 2021 15:07:56 +0100
Subject: Re: [PATCH v2 2/2] remoteproc: stm32: add capability to detach
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210322092651.7381-1-arnaud.pouliquen@foss.st.com>
 <20210322092651.7381-3-arnaud.pouliquen@foss.st.com>
 <20210323211911.GA1714890@xps15>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ad74c7d6-59d0-c522-6d2c-0608c8e9c33e@foss.st.com>
Date:   Wed, 24 Mar 2021 15:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210323211911.GA1714890@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-24_10:2021-03-24,2021-03-24 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

On 3/23/21 10:19 PM, Mathieu Poirier wrote:
> Good day Arnaud,
> 
> On Mon, Mar 22, 2021 at 10:26:51AM +0100, Arnaud Pouliquen wrote:
>> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
>>
>> A mechanism similar to the shutdown mailbox signal is implemented to
>> detach a remote processor.
>>
>> Upon detachment, a signal is sent to the remote firmware, allowing it
>> to perform specific actions such as stopping RPMsg communication.
>>
>> The Cortex-M hold boot is also disabled to allow the remote processor
>> to restart in case of crash.
>>
>> Notice that for this feature to be supported, the remote firmware
>> resource table must be stored at the beginning of a 1kB section
>> (default size provided to the remoteproc core).
>>
>> This restriction should be lifted in the future by using a backup
>> register to store the actual size of the resource table.
> 
> I'm not sure the above two paragraphs add anything valuable to the changelog.
> At this time the size of 1kB is fixed and future enhancement are, well, in the
> future.  So for now this patch is working with the rest of the current
> environment and that is the important part.
> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
>> ---
>>  drivers/remoteproc/stm32_rproc.c | 38 ++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 3d45f51de4d0..298ef5b19e27 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -28,7 +28,7 @@
>>  #define RELEASE_BOOT		1
>>  
>>  #define MBOX_NB_VQ		2
>> -#define MBOX_NB_MBX		3
>> +#define MBOX_NB_MBX		4
>>  
>>  #define STM32_SMC_RCC		0x82001000
>>  #define STM32_SMC_REG_WRITE	0x1
>> @@ -38,6 +38,7 @@
>>  #define STM32_MBX_VQ1		"vq1"
>>  #define STM32_MBX_VQ1_ID	1
>>  #define STM32_MBX_SHUTDOWN	"shutdown"
>> +#define STM32_MBX_DETACH	"detach"
>>  
>>  #define RSC_TBL_SIZE		1024
>>  
>> @@ -336,6 +337,15 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>>  			.tx_done = NULL,
>>  			.tx_tout = 500, /* 500 ms time out */
>>  		},
>> +	},
>> +	{
>> +		.name = STM32_MBX_DETACH,
>> +		.vq_id = -1,
>> +		.client = {
>> +			.tx_block = true,
>> +			.tx_done = NULL,
>> +			.tx_tout = 200, /* 200 ms time out to detach should be fair enough */
>> +		},
>>  	}
>>  };
>>  
>> @@ -461,6 +471,25 @@ static int stm32_rproc_attach(struct rproc *rproc)
>>  	return stm32_rproc_set_hold_boot(rproc, true);
>>  }
>>  
>> +static int stm32_rproc_detach(struct rproc *rproc)
>> +{
>> +	struct stm32_rproc *ddata = rproc->priv;
>> +	int err, dummy_data, idx;
>> +
>> +	/* Inform the remote processor of the detach */
>> +	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
>> +	if (idx >= 0 && ddata->mb[idx].chan) {
>> +		/* A dummy data is sent to allow to block on transmit */
>> +		err = mbox_send_message(ddata->mb[idx].chan,
>> +					&dummy_data);
>> +		if (err < 0)
>> +			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
>> +	}
>> +
>> +	/* Allow remote processor to auto-reboot */
>> +	return stm32_rproc_set_hold_boot(rproc, false);
>> +}
>> +
>>  static int stm32_rproc_stop(struct rproc *rproc)
>>  {
>>  	struct stm32_rproc *ddata = rproc->priv;
>> @@ -597,7 +626,11 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>>  	}
>>  
>>  done:
>> -	/* Assuming the resource table fits in 1kB is fair */
>> +	/*
>> +	 * Assuming the resource table fits in 1kB is fair.
>> +	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
>> +	 * firmware for the resource table. A clean of this whole area is done on detach.
>> +	 */
> 
> Can you rework the last sentence?  I'm not sure if it means the M4 will clean
> the resource table or if that should be the application processor... I'm also
> not clear on what you mean by "clean".  Usually it means zero'ing out but in
> this case it means a re-initialisation of the original values.
This is done by the remoteproc core itself by overwriting the resource table
area with the rproc->clean_table backup.
i will rework the comment in this way.

Thanks,
Arnaud

> 
> 
>>  	*table_sz = RSC_TBL_SIZE;
>>  	return (struct resource_table *)ddata->rsc_va;
>>  }
>> @@ -607,6 +640,7 @@ static const struct rproc_ops st_rproc_ops = {
>>  	.start		= stm32_rproc_start,
>>  	.stop		= stm32_rproc_stop,
>>  	.attach		= stm32_rproc_attach,
>> +	.detach		= stm32_rproc_detach,
> 
> With the above:
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
>>  	.kick		= stm32_rproc_kick,
>>  	.load		= rproc_elf_load_segments,
>>  	.parse_fw	= stm32_rproc_parse_fw,
>> -- 
>> 2.17.1
>>
