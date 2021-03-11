Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C309AC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 09:15:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED6D64FB5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Mar 2021 09:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhCKJOy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Mar 2021 04:14:54 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:58670 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231834AbhCKJOd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:14:33 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12B9D9l2019056;
        Thu, 11 Mar 2021 10:14:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NLAxClV6LoRWqXIaz8yJbP1l3AT05LO6i1xarp6O0vM=;
 b=W78a3qheFvIwOR2Z/77injFR4Xslv41zIh2uEr3HA4Q153FaUqdQvZOe7ij07TYcyQLU
 vkUB6qMqm1WcVSdYCH7iOfqo08WIF588rxjfZYjSEir+wXZn2dM8c1zukB/PHgcd7p4S
 ziW/39zSJIEjP61RK0xbXzJDOEbcrb70uEjSsLMIjmyp5CYc9Kip+gm0uUbj/H2vTPm8
 gZbbfjpunepH1iY7Pw+WF6m9LUnTBUoLqfYhzqRpWCZv8q0vG0v4AvxHxMpn+nglwbRC
 cyq7LGKFLFWP/8IbEUgjZIf/a2Nr77ug68wzcVu5VsEc8Ib70HoOEc3ATuVX+T3lp2tK 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741gpwpn1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 10:14:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A6F210002A;
        Thu, 11 Mar 2021 10:14:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECBEA225A70;
        Thu, 11 Mar 2021 10:14:24 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar
 2021 10:14:23 +0100
Subject: Re: [PATCH v7 12/17] remoteproc: Properly deal with the resource
 table when stopping
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <ohad@wizery.com>, <arnaud.pouliquen@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
 <20210310211025.1084636-13-mathieu.poirier@linaro.org>
 <YElb4PITwZtMhpAw@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <0475be62-d08c-8844-f118-71755ba6cb0b@foss.st.com>
Date:   Thu, 11 Mar 2021 10:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YElb4PITwZtMhpAw@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_04:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3/11/21 12:53 AM, Bjorn Andersson wrote:
> On Wed 10 Mar 15:10 CST 2021, Mathieu Poirier wrote:
> 
>> When a remote processor that was attached to is stopped, special care
>> must be taken to make sure the shutdown process is similar to what
>> it would be had it been started by the remoteproc core.
>>
>> This patch takes care of that by making a copy of the resource
>> table currently used by the remote processor.  From that point on
>> the copy is used, as if the remote processor had been started by
>> the remoteproc core.
>>
>> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>> New for V7:
>>   New Patch, used to be part of 11/16 in V6.
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 53 +++++++++++++++++++++++++++-
>>  1 file changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index e9ea2558432d..c488b1aa6119 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1634,6 +1634,52 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>> +{
>> +	struct resource_table *table_ptr;
>> +
>> +	/* A resource table was never retrieved, nothing to do here */
>> +	if (!rproc->table_ptr)
>> +		return 0;
>> +
>> +	/*
>> +	 * If a cache table exists the remote processor was started by
>> +	 * the remoteproc core.  That cache table should be used for
>> +	 * the rest of the shutdown process.
>> +	 */
>> +	if (rproc->cached_table)
>> +		goto out;
>> +
>> +	/* Remember where the external entity installed the resource table */
>> +	table_ptr = rproc->table_ptr;
>> +
> 
> Afaict this is just a remnant from the detach case.
> 
> I think the series looks really good now, please let me know and I can
> drop the local "table_ptr" as I apply the patches.
> 

Just a minor comment on patch 11, then the series LGTM also,

For this one
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> Regards,
> Bjorn
> 
>> +	/*
>> +	 * If we made it here the remote processor was started by another
>> +	 * entity and a cache table doesn't exist.  As such make a copy of
>> +	 * the resource table currently used by the remote processor and
>> +	 * use that for the rest of the shutdown process.  The memory
>> +	 * allocated here is free'd in rproc_shutdown().
>> +	 */
>> +	rproc->cached_table = kmemdup(rproc->table_ptr,
>> +				      rproc->table_sz, GFP_KERNEL);
>> +	if (!rproc->cached_table)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * Since the remote processor is being switched off the clean table
>> +	 * won't be needed.  Allocated in rproc_set_rsc_table().
>> +	 */
>> +	kfree(rproc->clean_table);
>> +
>> +out:
>> +	/*
>> +	 * Use a copy of the resource table for the remainder of the
>> +	 * shutdown process.
>> +	 */
>> +	rproc->table_ptr = rproc->cached_table;
>> +	return 0;
>> +}
>> +
>>  /*
>>   * Attach to remote processor - similar to rproc_fw_boot() but without
>>   * the steps that deal with the firmware image.
>> @@ -1759,7 +1805,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
>>  	rproc_stop_subdevices(rproc, crashed);
>>  
>>  	/* the installed resource table is no longer accessible */
>> -	rproc->table_ptr = rproc->cached_table;
>> +	ret = rproc_reset_rsc_table_on_stop(rproc);
>> +	if (ret) {
>> +		dev_err(dev, "can't reset resource table: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  
>>  	/* power off the remote processor */
>>  	ret = rproc->ops->stop(rproc);
>> -- 
>> 2.25.1
>>
