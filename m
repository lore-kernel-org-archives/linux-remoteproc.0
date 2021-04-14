Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2383DC433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 07:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0411B613A9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 07:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348655AbhDNHYg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Apr 2021 03:24:36 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51954 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1349682AbhDNHYe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Apr 2021 03:24:34 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13E7LXIg019119;
        Wed, 14 Apr 2021 09:23:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8wbsOAtAk4dWLQD8JrixYF2vqun9d772shGjdF98z5Q=;
 b=6kS9seuxTwwYEDvVW8qsvKoyTBNYPUM67LT6K/SFaw9KMCB+rcyIpocYutVLtwxM3o+X
 BVT/SbMohJCivJMabRvf4BNwlg5AKxAlExSpeEBa7cAcKk0EuYPcHCJJIJMax64mrAe/
 OYg6qQS70MM3VF2D80vmOoUxhpJHd1oI7ZpsodBmi6JarXHFMfizVF5pjBRO1RxYaNs5
 J5ogrtbLaa8jmWsWjJA1aNGpnz8MisNBok5R8c/OWb4HNqzyammZa5CcZ/Izd9/ptK3Z
 yQIlkiMsQvtAswS6O5rt+LL+TsquNUti7T7aQCC9oohz/Sk42n8RNlM6q0DTCAue3Mf7 RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37wr0xs8j8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Apr 2021 09:23:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6422110002A;
        Wed, 14 Apr 2021 09:23:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4166121CA61;
        Wed, 14 Apr 2021 09:23:57 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Apr
 2021 09:23:56 +0200
Subject: Re: [PATCH v4 2/2] remoteproc: stm32: add capability to detach
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
 <20210331073347.8293-3-arnaud.pouliquen@foss.st.com>
 <YHYOd/vqeZCiqkpJ@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <3df5317b-d28a-9362-6876-99442fdb8ef5@foss.st.com>
Date:   Wed, 14 Apr 2021 09:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YHYOd/vqeZCiqkpJ@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-14_03:2021-04-14,2021-04-14 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Bjorn

On 4/13/21 11:34 PM, Bjorn Andersson wrote:
> On Wed 31 Mar 02:33 CDT 2021, Arnaud Pouliquen wrote:
> 
>> A mechanism similar to the shutdown mailbox signal is implemented to
>> detach a remote processor.
>>
>> Upon detachment, a signal is sent to the remote firmware, allowing it
>> to perform specific actions such as stopping rpmsg communication.
>>
>> The Cortex-M hold boot is also disabled to allow the remote processor
>> to restart in case of crash.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/remoteproc/stm32_rproc.c | 39 ++++++++++++++++++++++++++++++--
>>  1 file changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 3d45f51de4d0..7353f9e7e7af 100644
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
> 
> Seems I posted my comment on v1, rather than this latest version. Please
> let me know if we should do anything about this dummy_data.

Thanks for pointing this out, you are right, the mailbox driver is stm32_ipcc
and it only sends a signal to the remote processor.

As message can be queued by the mailbox framework using a local variable seems
not a good option. As this code is a copy/past of the kick and stop?
I propose to get this one and I will send a new patch to fix the usage in the
whole driver.

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
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
>> @@ -597,7 +626,12 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>>  	}
>>  
>>  done:
>> -	/* Assuming the resource table fits in 1kB is fair */
>> +	/*
>> +	 * Assuming the resource table fits in 1kB is fair.
>> +	 * Notice for the detach, that this 1 kB memory area has to be reserved in the coprocessor
>> +	 * firmware for the resource table. On detach, the remoteproc core re-initializes this
>> +	 * entire area by overwriting it with the initial values stored in rproc->clean_table.
>> +	 */
>>  	*table_sz = RSC_TBL_SIZE;
>>  	return (struct resource_table *)ddata->rsc_va;
>>  }
>> @@ -607,6 +641,7 @@ static const struct rproc_ops st_rproc_ops = {
>>  	.start		= stm32_rproc_start,
>>  	.stop		= stm32_rproc_stop,
>>  	.attach		= stm32_rproc_attach,
>> +	.detach		= stm32_rproc_detach,
>>  	.kick		= stm32_rproc_kick,
>>  	.load		= rproc_elf_load_segments,
>>  	.parse_fw	= stm32_rproc_parse_fw,
>> -- 
>> 2.17.1
>>
