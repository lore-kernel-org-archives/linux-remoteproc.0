Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677925258;
	Mon, 16 Sep 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495920; cv=none; b=Q8QUxbOrNhyIfF8ObYzjFN4oH5OIQyY1N4FJDWBm+IghmCpiir7O5UZ5HcciiQV4LzGsvg/3p/eoe679XlLOzRGqx3qn62ZJa80/NUXarWpqabO+aRg8YzlPPORfOjKMdpnqCc18AbYou31ifjC5qLp4kvD/OdKbznYgypNDF7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495920; c=relaxed/simple;
	bh=jfiFvJL5ZnAzIVubRnSClMYcUCZgnxJ9RWuVjcuFWjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WAI87SlkGKeLd5hOudk6tCEbHtFyTCE+9/7dW/rrA2NJJaSR4F70Bu9ltBi5JJdNpLc47gejP04SXyyFxZEWh+MexlRf8xXUsToBFg7blnoshHiiKDQ/e+Kpm+agOTUs8zEtJx28cquUMX5CviGAfYghOOgj5IpSAmxhykSNOv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iKUdTEdz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iKUdTEdz"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GDXKnT001947;
	Mon, 16 Sep 2024 16:11:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	pzKlTlaaDl0uaMzQRGAamPumS6bIJxxB/Zfn3DyAQMY=; b=iKUdTEdzQ4hsCQum
	AqWADdayCY5NFPNlCvPknH44LxEHc9xXzQumfRKrEIELuk7tMdsCG+disGQfg+ME
	yjOfOsBL8sz11Bh5fRE0wGcglK5T8VRVeovY9jA0IQ22MGWqxUHx3N7tCR1T227d
	pQ+Bzc4fvO09tf/nDGqGBCsKUHS2QQV9Mx5O85w05NHNxBjBZaWnXXrSPMdwGonV
	+vIixuMR50mAkK2N35HxASWo3VPUj80S/jz27J/OrdqJYHySTvp2YzHjko2FS5tW
	GY0IH5YZT/H0TS0gJwekum9/r6O4oOT05w4n6+8qTDCD0eDmPNMzFsFsTYv8ns8g
	VfIq4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41nnehcv74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 16:11:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA9E94004A;
	Mon, 16 Sep 2024 16:10:13 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFAB5278270;
	Mon, 16 Sep 2024 16:08:12 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Sep
 2024 16:08:12 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Sep
 2024 16:08:11 +0200
Message-ID: <28d02c1f-967b-4384-9c0a-e05fc7f237ed@foss.st.com>
Date: Mon, 16 Sep 2024 16:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] remoteproc: stm32: Add support of an OP-TEE TA to
 load the firmware
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
 <20240830095147.3538047-8-arnaud.pouliquen@foss.st.com>
 <ZuRiTxDN7+UO42H+@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZuRiTxDN7+UO42H+@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Mathieu,

On 9/13/24 18:03, Mathieu Poirier wrote:
> On Fri, Aug 30, 2024 at 11:51:47AM +0200, Arnaud Pouliquen wrote:
>> The new TEE remoteproc driver is used to manage remote firmware in a
>> secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
>> introduced to delegate the loading of the firmware to the trusted
>> execution context. In such cases, the firmware should be signed and
>> adhere to the image format defined by the TEE.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
>>  1 file changed, 60 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
>> index 79c638936163..400a7a93b1c9 100644
>> --- a/drivers/remoteproc/stm32_rproc.c
>> +++ b/drivers/remoteproc/stm32_rproc.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/pm_wakeirq.h>
>>  #include <linux/regmap.h>
>>  #include <linux/remoteproc.h>
>> +#include <linux/remoteproc_tee.h>
>>  #include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/workqueue.h>
>> @@ -257,6 +258,19 @@ static int stm32_rproc_release(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static int stm32_rproc_tee_stop(struct rproc *rproc)
>> +{
>> +	int err;
>> +
>> +	stm32_rproc_request_shutdown(rproc);
>> +
>> +	err = tee_rproc_stop(rproc);
>> +	if (err)
>> +		return err;
>> +
>> +	return stm32_rproc_release(rproc);
>> +}
>> +
>>  static int stm32_rproc_prepare(struct rproc *rproc)
>>  {
>>  	struct device *dev = rproc->dev.parent;
>> @@ -693,8 +707,20 @@ static const struct rproc_ops st_rproc_ops = {
>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>>  };
>>  
>> +static const struct rproc_ops st_rproc_tee_ops = {
>> +	.prepare	= stm32_rproc_prepare,
>> +	.start		= tee_rproc_start,
>> +	.stop		= stm32_rproc_tee_stop,
>> +	.kick		= stm32_rproc_kick,
>> +	.load		= tee_rproc_load_fw,
>> +	.parse_fw	= tee_rproc_parse_fw,
>> +	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
>> +
>> +};
>> +
>>  static const struct of_device_id stm32_rproc_match[] = {
>>  	{ .compatible = "st,stm32mp1-m4" },
>> +	{ .compatible = "st,stm32mp1-m4-tee" },
>>  	{},
>>  };
>>  MODULE_DEVICE_TABLE(of, stm32_rproc_match);
>> @@ -853,17 +879,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct stm32_rproc *ddata;
>>  	struct device_node *np = dev->of_node;
>> +	struct tee_rproc *trproc = NULL;
>>  	struct rproc *rproc;
>>  	unsigned int state;
>> +	u32 proc_id;
>>  	int ret;
>>  
>>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
>>  	if (ret)
>>  		return ret;
>>  
>> -	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>> -	if (!rproc)
>> -		return -ENOMEM;
>> +	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
>> +		/*
>> +		 * Delegate the firmware management to the secure context.
>> +		 * The firmware loaded has to be signed.
>> +		 */
>> +		ret = of_property_read_u32(np, "st,proc-id", &proc_id);
>> +		if (ret) {
>> +			dev_err(dev, "failed to read st,rproc-id property\n");
>> +			return ret;
>> +		}
>> +
>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
>> +		if (!rproc)
>> +			return -ENOMEM;
>> +
>> +		trproc = tee_rproc_register(dev, rproc, proc_id);
>> +		if (IS_ERR(trproc)) {
>> +			dev_err_probe(dev, PTR_ERR(trproc),
>> +				      "signed firmware not supported by TEE\n");
>> +			return PTR_ERR(trproc);
>> +		}
>> +	} else {
>> +		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
>> +		if (!rproc)
>> +			return -ENOMEM;
>> +	}
>>  
>>  	ddata = rproc->priv;
>>  
>> @@ -915,6 +966,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>>  		dev_pm_clear_wake_irq(dev);
>>  		device_init_wakeup(dev, false);
>>  	}
>> +	if (trproc)
> 
>         if (rproc->tee_interface)
> 
> I am done reviewing this set.

Thanks for the review, I will sent a V10 ASAP to fix this set.
Extra information: the OP-TEE that introduces the new
PTA_REMOTEPROC_RELEASE command has been merged.

Regards,
Arnaud

> 
>> +		tee_rproc_unregister(trproc);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -935,6 +989,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
>>  		dev_pm_clear_wake_irq(dev);
>>  		device_init_wakeup(dev, false);
>>  	}
>> +	if (rproc->tee_interface)
>> +		tee_rproc_unregister(rproc->tee_interface);
>> +
>>  }
>>  
>>  static int stm32_rproc_suspend(struct device *dev)
>> -- 
>> 2.25.1
>>
