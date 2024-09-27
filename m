Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A71BBBEF;
	Fri, 27 Sep 2024 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727431424; cv=none; b=WXlN+hC2v6n7w995z12Jo3LqP4SZTKsnUN7xct+c4mnhXtLVwRF5WXMA/T7G2RSvZE4QKUdsdef7LUWKvBz4Z+/ra9S+KwBiKpurFpOnHpfkzHsxdQvj+20MjkOxRtEJtbiOhklWimsOMUu2qQJoVClzsPmSa3H9psk1AspMzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727431424; c=relaxed/simple;
	bh=4+91uN+HsgS8y6/zcWcTatQFkDiR7QhlmSt1L9ELjOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ELWi8C0NGfqBQV8hGzfNJkB6YozS/sFjwXA9297xgKU0ru9lBdijiRu8yVbTAo52pmsb/ahMzyKigu8DJIHIhxHZBi67rhJpN2oOAJh8Nw0SeVoEgCGiC7BqJImjqVSe0TG2cI5D7S0ANhOV0I6O7+Z1zql522zoiPbZnRCnPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=VB2LG1jJ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="VB2LG1jJ"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R54m7C027365;
	Fri, 27 Sep 2024 12:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	X346+p5deRL6SEcB76ngn4tEJM5Pn2Gyvnk4kicZAzE=; b=VB2LG1jJRDC6w4qg
	Q+xG6L69XQ3NdKeh0+I0czuvIW4P9VPP1e+2nH9qGhRnqsFCM8J6lU8oU+Tbw5og
	qf9mNLtsyKTuD3yx+bOrRCSxaXUrTgeb+d1ytKe5+NNOcauOagrHjvVZh8SNitOX
	33UJvaGBWAhfWJqYpulOtTx6hlQ9wM1x6NQoTIjY+0xuX1L8v4HXS452qdm+XGiU
	kcNc+W8dhINW7Cv0UTHvAJ2JtkTR6zK4RE4rj7giAGbLwIyJ2dPwlzHz8wCenjSl
	f3/t1WzpoXeLC0lDpVZybn0clCelAV3Ti2YD7X8Y2tHpKgxHdbJOgerc+umbAuqs
	LRbz7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41snfyf32e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 12:03:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B09914002D;
	Fri, 27 Sep 2024 12:02:01 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 957E623AA6A;
	Fri, 27 Sep 2024 12:01:10 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 27 Sep
 2024 12:01:10 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 27 Sep
 2024 12:01:09 +0200
Message-ID: <b96cef62-950b-44f9-9cc4-b7d6cc3aad45@foss.st.com>
Date: Fri, 27 Sep 2024 12:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/7] remoteproc: core: Add TEE interface support for
 firmware release
To: Bjorn Andersson <andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
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
 <yvax326sikpqkaygfldunjpziwwlwccfzmi6r5ikaqoyvfvama@w7kifjv5yt47>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <yvax326sikpqkaygfldunjpziwwlwccfzmi6r5ikaqoyvfvama@w7kifjv5yt47>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Bjorn,

On 9/26/24 05:51, Bjorn Andersson wrote:
> On Fri, Aug 30, 2024 at 11:51:44AM GMT, Arnaud Pouliquen wrote:
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
> I don't like the idea of having op-tee specific calls made from the
> core. If the problem is that we need to unroll something we did at load,
> can we instead come up with a more generic mechanism to unload that? Or

As proposed in [1] an alternative could be to define a new rproc_ops->release_fw
operation that will be initialized to tee_rproc_release_fw in the platform driver.

> can we perhaps postpone the tee interaction until start() to avoid the
> gap?

In such a case, the management of the resource table should also be postponed
as the firmware has to be authenticated first.

The OP-TEE implementation authenticates the firmware during the load
(in-destination memory authentication), so the sequence is:
1) Load the firmware.
2) Get the resource table and initialize resources.
3) Start the firmware.

The tee_rproc_release_fw() is used if something goes wrong during step 2 an3.

From my perspective, this would result in an alternative boot sequence, as we
have today for "attach". I proposed this approach in my V3 [2]. But this add
complexity in remote proc core.


Please, could you align with Mathieu to define how we should move forward to
address your concerns?

[1]https://lkml.org/lkml/2024/9/18/612
[2]https://lore.kernel.org/lkml/8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com/T/

Thanks and Regards,
Arnaud

> 
> 
> PS. Most of the Qualcomm drivers are TEE-based...so the "tee_interface"
> boolean check here is not very nice.
> 
> Regards,
> Bjorn
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
>>  	rproc->table_ptr = rproc->cached_table;
>>  
>>  	return ret;
>> -- 
>> 2.25.1
>>
