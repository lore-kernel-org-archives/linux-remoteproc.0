Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECB21B86F;
	Fri, 25 Oct 2024 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729888873; cv=none; b=pyD8m3ivfcpRBtIAkd3h8BZMZalze+okvp/jFaHlFX/iHQihqpW4b8bBztXXyEuPkQwTs7tKGKeB0PKtcZydHj2CUFzhBvG/i2uWm3xEHqKen33WIntuWDO2jziiWV1zjP+3jeaIKMd9J6UQCt6ZvmPkr+Y7keR/xuRNkVuL+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729888873; c=relaxed/simple;
	bh=37pHMme/eA+cwWgStWjnLTJBrA/6jf8f3LxJCLG/Z9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rvHY2TGYjRyTpBuDLPMijpi6yreKQJZAiPABd6H3DjXERnSOK/5bkzKK1tBfeiM25XY5qvCczFPHgBTSqWpJTSZsbxRW0knySo4VeOeMIqt05pY/vVAB8kiAzXsSunTylEitVzpRFtg9zSklT3k7NGDcQkxuffMim0ozGJnlUvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m8Hgo1Sp; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m8Hgo1Sp"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJKt0c032047;
	Fri, 25 Oct 2024 22:40:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	cBn+C5y6NRQQzDtpDKzFDt3ls8RVqF24UE75aofdF90=; b=m8Hgo1Sp45KcQsF3
	cHgqhTKRwIawoV4ibOYYThQ/fTIO1+qk3rH7YgFcG0tvBgX2WVlZrPxbPZbIb4CJ
	2p5hBQz4iE3RMrWkUcywbeT5fMRJmZzR59cSgir37+q56JcXRAiBiltjN1mdEcJ1
	rBnmGBEDvSQt1e48fLoe5nA6XwqRAiQ6SDSgnTiw9S9zF+gjWK/1OgK93KUZW2oD
	04oxtCA64jqExDQI4Mj9wMQPi49hAsLcgi0teyAagKOr1O23BPIxC4SB1VXpdpHx
	J7eOhYJBh4Ha8Nz40WIDGBEOctZy+6QtsKHN2HAyCCCdfD7PzG6dm1Jw0PWA2dwQ
	jinizg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4dyj02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 22:40:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 785A64002D;
	Fri, 25 Oct 2024 22:39:32 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C163A229A72;
	Fri, 25 Oct 2024 22:38:54 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:38:54 +0200
Received: from [10.252.3.121] (10.252.3.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:38:53 +0200
Message-ID: <75427b09-6823-426e-b0dc-66caf97abbea@foss.st.com>
Date: Fri, 25 Oct 2024 22:38:51 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] remoteproc: core: Add support for predefined
 notifyids
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Daniel Baluta
	<daniel.baluta@nxp.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <iuliana.prodan@nxp.com>, <peng.fan@nxp.com>,
        Alexandru Lastur
	<alexandru.lastur@nxp.com>
References: <20241018110929.1646410-1-daniel.baluta@nxp.com>
 <ZxkW9SUr91PyH9c/@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZxkW9SUr91PyH9c/@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

hello

On 10/23/24 17:32, Mathieu Poirier wrote:
> Hello Daniel,
> 
> On Fri, Oct 18, 2024 at 02:09:29PM +0300, Daniel Baluta wrote:
>> Currently we generate notifyids in the linux kernel and override
>> those found in rsc_table.
>>
>> This doesn't play well with users expecting to use the exact ids
>> from rsc_table.
>>
>> So, use predefined notifyids found in rsc_table if any. Otherwise,
>> let Linux generate the ids as before.
>>
>> Keypoint is we also define an invalid notifid as 0xFFFFFFFFU. This
>> should be placed as notifids if users want Linux to generate the ids.
>>
>> Signed-off-by: Alexandru Lastur <alexandru.lastur@nxp.com>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
>>  include/linux/remoteproc.h           |  1 +
>>  2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f276956f2c5c..9f00fe16da38 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -332,6 +332,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>  	int ret, notifyid;
>>  	struct rproc_mem_entry *mem;
>>  	size_t size;
>> +	int start, end;
>>  
>>  	/* actual size of vring (in bytes) */
>>  	size = PAGE_ALIGN(vring_size(rvring->num, rvring->align));
>> @@ -363,9 +364,18 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>  	/*
>>  	 * Assign an rproc-wide unique index for this vring
>>  	 * TODO: assign a notifyid for rvdev updates as well
>> -	 * TODO: support predefined notifyids (via resource table)
>>  	 */
>> -	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
>> +
>> +	start = 0;
>> +	end = 0;
>> +
>> +	/* use id if specified in rsc table */
>> +	if (rsc->vring[i].notifyid != RSC_INVALID_NOTIFYID) {
>> +		start = rsc->vring[i].notifyid;
>> +		end = start + 1;
>> +	}
> 
> This will likely introduce a backward compatibility issue where anyone that
> has more than one vring and set their notifyids to anything else than 0xFFFFFFFF
> in the resource table will see a boot failure.
> 
> A while back the openAMP group started discussions on using the configuration
> space of a virtio device to enhance device discovery, with exactly this kind of
> use case in mind.  I think it is the only way to move forward with this
> feature, though it is a big job that requires a lot of community interactions.
> 
FYI a PR exists in OpenAMP to use this configuration space to customize the
size of the buffers [2].

This probably means we need something scalable for the configuration space.

I guess your objective is to match the vring ID with the mailbox channel ID, right?
We have a similar issue with the STM32MP1/2. It is hard-coded in the stm32_rproc
driver[1], which is far from perfect because it is not simple to add a new vdev
instance.

I would have two other alternatives to highlight

- An alternative could be to have a vendor resource in the resource table and
use rproc_handle_rsc operations. This resource would define the match between the
vrings IDs and the mailbox IDs.
However, if several vendors are facing the same issue, perhaps better to find a
generic solution.

- another alternative already discussed several times in openAMP group would be
to define a new version of the resource table.

[1]https://elixir.bootlin.com/linux/v6.11/source/drivers/remoteproc/stm32_rproc.c#L328
[2] https://github.com/OpenAMP/open-amp/pull/155

Regards
Arnaud

> Regards,
> Mathieu
> 
>> +
>> +	ret = idr_alloc(&rproc->notifyids, rvring, start, end, GFP_KERNEL);
>>  	if (ret < 0) {
>>  		dev_err(dev, "idr_alloc failed: %d\n", ret);
>>  		return ret;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index b4795698d8c2..98c3e181086e 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -238,6 +238,7 @@ struct fw_rsc_trace {
>>  	u8 name[32];
>>  } __packed;
>>  
>> +#define RSC_INVALID_NOTIFYID 0xFFFFFFFFU
>>  /**
>>   * struct fw_rsc_vdev_vring - vring descriptor entry
>>   * @da: device address
>> -- 
>> 2.43.0
>>
> 
