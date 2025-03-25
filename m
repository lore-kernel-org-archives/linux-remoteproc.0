Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813921F3B8C;
	Tue, 25 Mar 2025 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900860; cv=none; b=PYBD6Y5lpYAKPNFGScFtHZk1QxJDSir1xgtKj92Ux0Jfvgwghft1QQTXduM0MWagRT4yWrsf9cr35G9wNcwmQgFov9fJlaqmKdjcL00D2HJ8PldM1SnVgaaL+GyPR5E3R3lHWNe4vrD2FJfgeukEVNZPhu5r2w23V0mPYcqAn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900860; c=relaxed/simple;
	bh=blkVhaJyPYEXmS5/OQ4f6chIHr8Zhz7mgpT4b/Ovl5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VodBflbnMjv/s7Fbdjr3jR+vjG6glLNzWVC3lxm5rDmZEQbzAbdq7R2h+6ZSnj+NsHi8GEZjSII+NIuLIkPUSxk0G3SHD9Prh+803ECdv82vBqDX8IlEP9Lqn4DiqoCBuS/7RWgzziRAV3kyJZg2eRJOHLYlQA5GY/nkvYmSSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NJSEPNwk; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NJSEPNwk"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P8D5mb012512;
	Tue, 25 Mar 2025 12:07:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/KukUtJceVhgFPBW8ObUIe2L2Pux41mXB/v8R9UNM+I=; b=NJSEPNwkJ8tkCKwl
	7VwKYPTpC49WTPydD8yBNcPyNXc00jUAW4YyJL1zzD0l9NiNFW/INkUx84MYjtsL
	chIg3y9lWqt279iltfNDxHXvv9kbk0Gv9Ikn9Wan+iJNmIShbnTzXjW1K3RJPELI
	yHZyBsxn92e1cnZRx8vleOQ4erc5Y4+nlTMQsqx5fTBtoFY9RYyNDwLRsD65Z1ck
	Y7aXQdyo8trGSrF0rjalYuG8UMcQrfU+w95n03pLdiA4unyjC/21s7mHOsIeujKL
	MDyIyyhHUVfzB4DFqD/+HhMgu92BO2qvP8keuKHQj1lG9wdxjTQRIb8teVyeOaqY
	hz4HpA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hne5cavt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 12:07:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1858240047;
	Tue, 25 Mar 2025 12:06:11 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49FDA84AF5D;
	Tue, 25 Mar 2025 12:05:14 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:05:14 +0100
Received: from [10.252.12.99] (10.252.12.99) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:05:13 +0100
Message-ID: <a2c8655c-48e8-49e5-8460-175f73729f54@foss.st.com>
Date: Tue, 25 Mar 2025 12:05:12 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/8] remoteproc: Add TEE support
To: Bjorn Andersson <andersson@kernel.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-3-arnaud.pouliquen@foss.st.com>
 <6fufphs3ajlc7htj74qus6gifdd4yd64l5yjn2zyjrtdezoe4f@cqbbzg63acv4>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <6fufphs3ajlc7htj74qus6gifdd4yd64l5yjn2zyjrtdezoe4f@cqbbzg63acv4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_04,2025-03-25_02,2024-11-22_01



On 12/6/24 23:07, Bjorn Andersson wrote:
> On Thu, Nov 28, 2024 at 09:42:09AM GMT, Arnaud Pouliquen wrote:
>> Add a remoteproc TEE (Trusted Execution Environment) driver
>> that will be probed by the TEE bus. If the associated Trusted
>> application is supported on secure part this driver offers a client
>> interface to load a firmware by the secure part.
> 
> If...else?
> 
>> This firmware could be authenticated by the secure trusted application.
>>
> 
> I would like for this to fully describe how this fits with the bus and
> how it is expected to be used by a specific remoteproc driver.
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Updates vs version v13:
>> - define REMOTEPROC_TEE as bool instead of tristate,
>> - remove the load of the firmware in rproc_tee_parse_fw as we will ensure
>>   that the firmware is loaded using the load_fw() operation.
>> ---
>>  drivers/remoteproc/Kconfig          |  10 +
>>  drivers/remoteproc/Makefile         |   1 +
>>  drivers/remoteproc/remoteproc_tee.c | 508 ++++++++++++++++++++++++++++
>>  include/linux/remoteproc.h          |   4 +
>>  include/linux/remoteproc_tee.h      | 105 ++++++
>>  5 files changed, 628 insertions(+)
>>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>>  create mode 100644 include/linux/remoteproc_tee.h

[...]

>> +
>> +MODULE_DEVICE_TABLE(tee, rproc_tee_id_table);
>> +
>> +static struct tee_client_driver rproc_tee_fw_driver = {
>> +	.id_table	= rproc_tee_id_table,
>> +	.driver		= {
>> +		.name		= KBUILD_MODNAME,
>> +		.bus		= &tee_bus_type,
>> +		.probe		= rproc_tee_probe,
>> +		.remove		= rproc_tee_remove,
>> +	},
>> +};
>> +
>> +static int __init rproc_tee_fw_mod_init(void)
>> +{
>> +	return driver_register(&rproc_tee_fw_driver.driver);
>> +}
>> +
>> +static void __exit rproc_tee_fw_mod_exit(void)
>> +{
>> +	driver_unregister(&rproc_tee_fw_driver.driver);
>> +}
>> +
>> +module_init(rproc_tee_fw_mod_init);
>> +module_exit(rproc_tee_fw_mod_exit);
> 
> Please add an equivalent of the module_platform_driver() macro to tee
> framework instead of open-coding this.
> 

It is not possible to use equivalent of the module_platform_driver() macro
as the device is on the TEE bus.

I followed recommendation provided in Documentation/driver-api/tee.rst[1]

Or do you have an alternative in mind?

Thanks,
Arnaud

[1]https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/driver-api/tee.rst


>> +
>> +MODULE_DESCRIPTION(" remote processor TEE module");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 8fd0d7f63c8e..2e0ddcb2d792 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -503,6 +503,8 @@ enum rproc_features {
>>  	RPROC_MAX_FEATURES,
>>  };
>>  
>> +struct rproc_tee;
>> +
>>  /**
>>   * struct rproc - represents a physical remote processor device
>>   * @node: list node of this rproc object
>> @@ -545,6 +547,7 @@ enum rproc_features {
>>   * @cdev: character device of the rproc
>>   * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
>>   * @features: indicate remoteproc features
>> + * @rproc_tee_itf: pointer to the remoteproc tee context
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -586,6 +589,7 @@ struct rproc {
>>  	struct cdev cdev;
>>  	bool cdev_put_on_release;
>>  	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
>> +	struct rproc_tee *rproc_tee_itf;
> 
> TEE is just one specific remoteproc implementation, why does it need to
> infest the core data structure? Do you want a stm32_rproc here as well?
> 
>>  };
>>  
>>  /**
>> diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
>> new file mode 100644
>> index 000000000000..9b498a8eff4d
>> --- /dev/null
>> +++ b/include/linux/remoteproc_tee.h
>> @@ -0,0 +1,105 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright(c) 2024 STMicroelectronics
>> + */
>> +
>> +#ifndef REMOTEPROC_TEE_H
>> +#define REMOTEPROC_TEE_H
>> +
>> +#include <linux/tee_drv.h>
>> +#include <linux/firmware.h>
>> +#include <linux/remoteproc.h>
>> +
>> +struct rproc;
>> +
>> +/**
>> + * struct rproc_tee - TEE remoteproc structure
>> + * @node:		Reference in list
>> + * @rproc:		Remoteproc reference
>> + * @parent:		Parent device
> 
> Isn't that rproc->dev->parent?
> 
>> + * @rproc_id:		Identifier of the target firmware
>> + * @session_id:		TEE session identifier
>> + */
>> +struct rproc_tee {
> 
> As far as I can tell this isn't dereferenced outside remoteproc_tee.c,
> can we hide it therein?
> 
>> +	struct list_head node;
>> +	struct rproc *rproc;
>> +	struct device *parent;
>> +	u32 rproc_id;
>> +	u32 session_id;
>> +};
>> +
>> +#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
>> +
>> +int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id);
>> +int rproc_tee_unregister(struct rproc *rproc);
>> +int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw);
>> +int rproc_tee_load_fw(struct rproc *rproc, const struct firmware *fw);
>> +void rproc_tee_release_fw(struct rproc *rproc);
>> +struct resource_table *rproc_tee_find_loaded_rsc_table(struct rproc *rproc,
>> +						       const struct firmware *fw);
>> +int rproc_tee_start(struct rproc *rproc);
>> +int rproc_tee_stop(struct rproc *rproc);
>> +
>> +#else
>> +
> 
> Do we really need yet another bunch of stubs? Can't we just leave
> CONFIG_REMOTEPROC_TEE non-user-selectable and have the drivers that rely
> on it do "select REMOTEPROC_TEE"?
> 
> If my measurements are correct, it's 3.1kB of code...
> 
> Regards,
> Bjorn
> 
>> +static inline int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int rproc_tee_unregister(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int rproc_tee_load_fw(struct rproc *rproc,  const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int rproc_tee_start(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int rproc_tee_stop(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void rproc_tee_release_fw(struct rproc *rproc)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +}
>> +
>> +static inline struct resource_table *
>> +rproc_tee_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return NULL;
>> +}
>> +#endif /* CONFIG_REMOTEPROC_TEE */
>> +#endif /* REMOTEPROC_TEE_H */
>> -- 
>> 2.25.1
>>
> 
