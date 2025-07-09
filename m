Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959628FFE2;
	Wed,  9 Jul 2025 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059554; cv=none; b=KUVRbIMIon6dJdBW98gWb4paNy80M8ouPc+aT9Rd37YxdopXSOkEUMdpC3CQ++mqfHTtU0vL1X/3QKVhfe7MG9pl1kxEFhaKvkd1HsozmMdowaxJPoPLKaWXtoaEeMTrR4eno+2YUkZmCnjCPhfhyJji7BeWsXO8NYUZPnqKms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059554; c=relaxed/simple;
	bh=FpyirzTdaLgtCuAJF9iScqlLK+AL6PktYVBjK68z4E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OVg7ouopfjpL8b5ZqHOCnBioSmFh1OkkTH9+spzgfCt4vQt8JfJgGr+5zPiEq5ri8TuoY8pa9qGwsBEYP3N8iTXIaKGy7kOG1tdwIl/C1eMghChPGU4Y9GDcbfJlCpNLR51Udg6v9MF/GuUySuME0uYmCi7f/rc6b9WdMmvedTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LTnspz95; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LTnspz95"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 569BCSE51457937;
	Wed, 9 Jul 2025 06:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752059548;
	bh=EMf7dV5tYQz1nYxC1/9jcvjOLej6ZUrwzT/jNq3/gUg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LTnspz95Ntn8ZzJsgBFxx2bzj2BXZu2fPOEBvNVN9YIkY7qdlsEvxZdOWwpEKJOQr
	 fq4aWxN6nXDXYHmedkN+P/l86UOoWPjC6z+ffd6UfFp3ut5a4NCoUwPRimoyGKUFkl
	 LcdBKU3omBzqSAFr4jailWiVo+Or8APYkqhpgPtc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 569BCSxr3293994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 9 Jul 2025 06:12:28 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 9
 Jul 2025 06:12:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 9 Jul 2025 06:12:27 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 569BCOEp3833403;
	Wed, 9 Jul 2025 06:12:25 -0500
Message-ID: <d8847732-2254-4719-8941-fdfd896b265b@ti.com>
Date: Wed, 9 Jul 2025 16:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] remoteproc: k3-dsp: Fix an error handling path in
 k3_dsp_rproc_probe()
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, <afd@ti.com>,
        <hnagalla@ti.com>
CC: Bjorn Andersson <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <f96befca61e7a819c0e955e4ebe40dc8a481619d.1751060507.git.christophe.jaillet@wanadoo.fr>
 <aGavap5k0qir9x0f@p14s>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <aGavap5k0qir9x0f@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 03/07/25 21:57, Mathieu Poirier wrote:
> Andrew, Hari and Beleswar - please test this on your side and get back to me
> with the results.
>
> Thanks,
> Mathieu
>
> On Fri, Jun 27, 2025 at 11:42:33PM +0200, Christophe JAILLET wrote:
>> IF an error occurs after a successful k3_rproc_request_mbox() call,
>> mbox_free_channel() should be called to avoid a leak.
>>
>> Such a call is missing in the error handing path of k3_dsp_rproc_probe().
>> It is also missing both in the error handling path of k3_m4_rproc_probe()
>> and in (in-existent) corresponding remove function.
>>
>> Switch to managed resources to avoid these leaks and simplify the code.
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


The subject line seems to be calling out changes only in dsp driver,
however patch takes care of all DSP/M4/R5 drivers. Maybe
something to update.

With above addressed,

Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Beleswar Padhi <b-padhi@ti.com>

Tested IPC with Normal boot/Late Attach and in various core
configurations: Lockstep/Split/Single CPU etc.

Thanks,
Beleswar

>> ---
>> Compile tested only.
>>
>> This is an update of [1].
>> The code has been heavily refactored recently with things moved to
>> ti_k3_common.c
>>
>> This new version also fixes a leak in k3_m4_rproc_probe(). In this file,
>> mbox_free_channel() was missing.
>>
>> Being very different from the v3, I've removed the previous review tags.
>>
>> [1]: https://lore.kernel.org/all/591e219df99da6f02c9d402f7854bc3ab23e76f9.1726328417.git.christophe.jaillet@wanadoo.fr/
>> ---
>>  drivers/remoteproc/ti_k3_common.c         | 12 +++++++++++-
>>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 --
>>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 --
>>  3 files changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
>> index d4f20900f33b..7a9c3fb80fec 100644
>> --- a/drivers/remoteproc/ti_k3_common.c
>> +++ b/drivers/remoteproc/ti_k3_common.c
>> @@ -155,6 +155,13 @@ int k3_rproc_release(struct k3_rproc *kproc)
>>  }
>>  EXPORT_SYMBOL_GPL(k3_rproc_release);
>>  
>> +static void k3_rproc_free_channel(void *data)
>> +{
>> +	struct k3_rproc *kproc = data;
>> +
>> +	mbox_free_channel(kproc->mbox);
>> +}
>> +
>>  int k3_rproc_request_mbox(struct rproc *rproc)
>>  {
>>  	struct k3_rproc *kproc = rproc->priv;
>> @@ -173,6 +180,10 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>  		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
>>  				     "mbox_request_channel failed\n");
>>  
>> +	ret = devm_add_action_or_reset(dev, k3_rproc_free_channel, kproc);
>> +	if (ret)
>> +		return ret;
>> +
>>  	/*
>>  	 * Ping the remote processor, this is only for sanity-sake for now;
>>  	 * there is no functional effect whatsoever.
>> @@ -183,7 +194,6 @@ int k3_rproc_request_mbox(struct rproc *rproc)
>>  	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
>>  	if (ret < 0) {
>>  		dev_err(dev, "mbox_send_message failed (%pe)\n", ERR_PTR(ret));
>> -		mbox_free_channel(kproc->mbox);
>>  		return ret;
>>  	}
>>  
>> diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> index 7a72933bd403..d6ceea6dc920 100644
>> --- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
>> @@ -175,8 +175,6 @@ static void k3_dsp_rproc_remove(struct platform_device *pdev)
>>  		if (ret)
>>  			dev_err(dev, "failed to detach proc (%pe)\n", ERR_PTR(ret));
>>  	}
>> -
>> -	mbox_free_channel(kproc->mbox);
>>  }
>>  
>>  static const struct k3_rproc_mem_data c66_mems[] = {
>> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> index ca5ff280d2dc..04f23295ffc1 100644
>> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
>> @@ -1206,8 +1206,6 @@ static void k3_r5_cluster_rproc_exit(void *data)
>>  				return;
>>  			}
>>  		}
>> -
>> -		mbox_free_channel(kproc->mbox);
>>  	}
>>  }
>>  
>> -- 
>> 2.50.0
>>
