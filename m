Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A441C4708D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 08:03:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 174E161355
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 08:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhE1IFT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 May 2021 04:05:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:30500 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235665AbhE1IFS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 May 2021 04:05:18 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14S82IlX002830;
        Fri, 28 May 2021 10:03:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dKw/3puYbjMGb5FGOG+6h+7xc8UGjhWBbSRNreyNYLU=;
 b=bRpTZaP7jf8JntQCTtDec8iwe9dmkLlJk9COfudvI/dpvf2tWocz9atRy6ngIWni1r1s
 WSBcluXberbohH5zwlCGWXV1Zei/YVcDEhPvDapEVc3f3UrLL+oY5294n75BPzdkcSl9
 v4dSWUfSWcyoxyBKMzAN/jydG7LdHtR7WWn4IDDezEm+Uqc39obdX/3nAQZBwsy5VUZz
 C++hesdooYKb1TQtY37Ly4M7h1XnLbXrQc8nwwFyrCnND/+TzAL5facd6W5n93/iFRbd
 06z4o0cuvg5kEqV0Esys9ZNuUTyNZhe6nA0VOsuJ405eKAppIN3CaosI+tg4Mv+LLCeT xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38t7k3ek3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 May 2021 10:03:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BC1B10002A;
        Fri, 28 May 2021 10:03:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88E1D21B51E;
        Fri, 28 May 2021 10:03:40 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 10:03:39 +0200
Subject: Re: [PATCH] remoteproc: stm32: fix mbox_send_message call
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210420091922.29429-1-arnaud.pouliquen@foss.st.com>
 <YLBi/JZ0u8394tI8@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b563f831-3876-1d5d-7268-ce1260363906@foss.st.com>
Date:   Fri, 28 May 2021 10:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YLBi/JZ0u8394tI8@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-28_04:2021-05-27,2021-05-28 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Bjorn,

On 5/28/21 5:26 AM, Bjorn Andersson wrote:
> On Tue 20 Apr 04:19 CDT 2021, Arnaud Pouliquen wrote:
> 
>> mbox_send_message is called by passing a local dummy message or
>> a function parameter. As the message is queued, it is dereferenced.
>> This works because the message field is not used by the stm32 ipcc
>> driver, but it is not clean.
>>
>> Fix by passing a constant string in all cases.
>>
>> The associated comments are removed because rproc should not have to
>> deal with the behavior of the mailbox frame.
>>
> 
> Didn't we conclude that the mailbox driver doesn't actually dereference
> the pointer being passed?

Right it can store the reference to queue the sent.

> 
> If so I would prefer that you just pass NULL, so that if you in the
> future need to pass some actual data it will be easy to distinguish the
> old and new case.

I can not use NULL pointer in stm32_rproc_attach and stm32_rproc_detach case.
The reason is that the tx_done callback is not called if the message is NULL.
(https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/mailbox.c#L106)

I could use NULL pointer in stm32_rproc_kick, but I would prefer to use the same way
of calling mbox_send_message for all use cases and not take into account the
mailbox internal behavior.

Thanks,
Arnaud


> 
> Regards,
> Bjorn
> 
>> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/stm32_rproc.c | 14 +++++---------
>>  1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 7353f9e7e7af..0e8203a432ab 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -474,14 +474,12 @@ static int stm32_rproc_attach(struct rproc *rproc)
>>  static int stm32_rproc_detach(struct rproc *rproc)
>>  {
>>  	struct stm32_rproc *ddata = rproc->priv;
>> -	int err, dummy_data, idx;
>> +	int err, idx;
>>  
>>  	/* Inform the remote processor of the detach */
>>  	idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_DETACH);
>>  	if (idx >= 0 && ddata->mb[idx].chan) {
>> -		/* A dummy data is sent to allow to block on transmit */
>> -		err = mbox_send_message(ddata->mb[idx].chan,
>> -					&dummy_data);
>> +		err = mbox_send_message(ddata->mb[idx].chan, "stop");
>>  		if (err < 0)
>>  			dev_warn(&rproc->dev, "warning: remote FW detach without ack\n");
>>  	}
>> @@ -493,15 +491,13 @@ static int stm32_rproc_detach(struct rproc *rproc)
>>  static int stm32_rproc_stop(struct rproc *rproc)
>>  {
>>  	struct stm32_rproc *ddata = rproc->priv;
>> -	int err, dummy_data, idx;
>> +	int err, idx;
>>  
>>  	/* request shutdown of the remote processor */
>>  	if (rproc->state != RPROC_OFFLINE) {
>>  		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
>>  		if (idx >= 0 && ddata->mb[idx].chan) {
>> -			/* a dummy data is sent to allow to block on transmit */
>> -			err = mbox_send_message(ddata->mb[idx].chan,
>> -						&dummy_data);
>> +			err = mbox_send_message(ddata->mb[idx].chan, "detach");
>>  			if (err < 0)
>>  				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
>>  		}
>> @@ -556,7 +552,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
>>  			continue;
>>  		if (!ddata->mb[i].chan)
>>  			return;
>> -		err = mbox_send_message(ddata->mb[i].chan, (void *)(long)vqid);
>> +		err = mbox_send_message(ddata->mb[i].chan, "kick");
>>  		if (err < 0)
>>  			dev_err(&rproc->dev, "%s: failed (%s, err:%d)\n",
>>  				__func__, ddata->mb[i].name, err);
>> -- 
>> 2.17.1
>>
