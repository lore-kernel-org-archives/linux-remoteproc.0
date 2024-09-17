Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA1E17836B;
	Tue, 17 Sep 2024 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726592614; cv=none; b=S7gafMAKQr1taHkeanCMqUv4tGwptNi5kePZS8DDFUSK+C6X9dtYmF5cPu7TMFeydKQNBYH0Jw52YD/9ambemu5+rsTR25L8lkQ1CS6ADMKGsBi9kluMpT8WOI3LBnulC9d9TsBNcNXG17qTdljpLfOCj0PdHtwCS5/OylSnkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726592614; c=relaxed/simple;
	bh=3m0U70CdDL3o4rx16tNoA8i+D2Of1HZ/EePGyi/7K+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E9+43pPc5FAyNufA0iDTxUNV6vpgAZ3KeN0UfytLvOoulEpu7UnCt9Pi8RAHXHHM7m+TZUqyi9MH9xE9Y32W3mYOC377pY+G4NTbWDv48CPjXWwZTHTjzVbB8FJYo4VJsUciwA8HFfeBNddwMB9txN9a03Uf5Wr7tNRZprCGOno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nZfvVqYF; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nZfvVqYF"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HGCkNO028765;
	Tue, 17 Sep 2024 19:02:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	v6WoFkgqeR1AGKN1R5ouXLScPCv7cEh0urGeAL+o4kM=; b=nZfvVqYFfPtoviuU
	7tXINkM/eImoJ7mc8mJrnxk0jQzXCqgHWUvCduwJCCnNDi1DpU4FlXtFYYc1k3Yy
	FcFIkIGxJQXZD11WCMCLno5Kp49snJrU7sz2Iopqm8EaDb7iRPvkMtWMlZ+0Odpd
	6wpEsGeqdL1y0lx0vE3HktJRsMtSrPvjM+gfcMYEF4XIfGPyO7SEKluTr1Nq3yhA
	fs2Qycs8eNxbtoVYWrKYQdi2OLep0UFOerI1xh8crwW47v22cP+nx9boxRRAS/b5
	WR8dLBv6JN83H3dcFSoVH56Ik2mRra6Y7lESpCXpK+lakug0klb0II4NQvJteSqQ
	JZ3pMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41n4gcv8m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 19:02:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF26B40047;
	Tue, 17 Sep 2024 19:01:47 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C49F2263D1E;
	Tue, 17 Sep 2024 18:56:59 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Sep
 2024 18:56:59 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Sep
 2024 18:56:58 +0200
Message-ID: <fce2374e-384f-4005-b882-3e0d26897fb7@foss.st.com>
Date: Tue, 17 Sep 2024 18:56:58 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <ZuMIEp4cVrp1hWa7@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZuMIEp4cVrp1hWa7@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Mathieu,

On 9/12/24 17:26, Mathieu Poirier wrote:
> On Fri, Aug 30, 2024 at 11:51:44AM +0200, Arnaud Pouliquen wrote:
>> Add support for releasing remote processor firmware through
>> the Trusted Execution Environment (TEE) interface.
>>
>> The tee_rproc_release_fw() function is called in the following cases:
>>
>> - An error occurs in rproc_start() between the loading of the segments and
>>   the start of the remote processor.
>> - When rproc_release_fw is called on error or after stopping the remote
>>   processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7694817f25d4..32052dedc149 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -29,6 +29,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/rculist.h>
>>  #include <linux/remoteproc.h>
>> +#include <linux/remoteproc_tee.h>
>>  #include <linux/iommu.h>
>>  #include <linux/idr.h>
>>  #include <linux/elf.h>
>> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>  
>>  static void rproc_release_fw(struct rproc *rproc)
>>  {
>> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
>> +		tee_rproc_release_fw(rproc);
> 
> Function tee_rproc_release_fw() returns a value that is ignored.  I don't know
> how it passes the Sparse checker but I already see patches coming in my Inbox to
> deal with that.  In this case there is nothing else to do if there is an error
> releasing the firware.  As such I would put a (void) in front and add a comment
> about the return value being ignore on purpose.

Instead of ignoring the error, I wonder if we should panic in
tee_rproc_release_fw(). Indeed, we would be in an unexpected state without any
possible action to return to a normal state.

Regards,
Arnaud

> 
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  	if (ret) {
>>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>>  			rproc->name, ret);
>> -		goto reset_table_ptr;
>> +		goto release_fw;
>>  	}
>>  
>>  	/* power up the remote processor */
>> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  	rproc->ops->stop(rproc);
>>  unprepare_subdevices:
>>  	rproc_unprepare_subdevices(rproc);
>> -reset_table_ptr:
>> +release_fw:
>> +	if (rproc->tee_interface)
>> +		tee_rproc_release_fw(rproc);
> 
> Same here.
> 
>>  	rproc->table_ptr = rproc->cached_table;
>>  
>>  	return ret;
>> -- 
>> 2.25.1
>>
