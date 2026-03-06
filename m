Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC44B344DA4;
	Fri,  6 Mar 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818159; cv=fail; b=A4eXKEuHdFCL/hcN1gKmUnlzNC5axZ7Hrt0mV5mEsheWU22YsRJXxKoO60DnVQsq6e5vsiKq6F6TurYIiWp4fjfflcJiLw4nbEI8TeXsfSL783skC2qjM2ZPJVk/QAY5mlWX9oECybyqfKrbifhZYuntLsPZJata5OdYqp7r07o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818159; c=relaxed/simple;
	bh=Xq5A8Cy6phEA6gqPWBxkGyydtaPGPCCRmwQDdS6ytes=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XB1Lo32GPFLsJIwNtTVmnv+MlZdKL1PLG6exQ1zqLCr/lxTrRoOWkdb+Mb2HN28wdyC4f323Bi9jNf51m9TCwP7JR9cHrcBm0k2ng7JzqwSaWOCBlKTfDw1QxU2B0+qCIldkbRVGk0+bUXIW9S0vfU84ycy28lLvUkbZY1sBL9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=maWCCKQ2; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="maWCCKQ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP9C3FvpQx0ap8s1Ax1leSyh2eVgGpnr85o6Z7CnpQ0E2gM9zqy6TaDU1vRgWahsBh7ufSFAz9NPM16h0Z3vZtyI4JvIr6JUny/4rB+Xf2gXMAUU4KvG+Oh2sc5FhqYeHA6YIHncAH12J0b4m0Xb207s3Z9sFTL7IHDhq1moiE8RlhICWd33/ByDM6fbrZgn1Wway4mbbHNMm976Yn53dcsabjFQml5AWZfLnHfWGI1955ADwzL+6BzAIFo9ZGPSlorO9QSWhHvvJwSN3/giz4NlhOF6NOcfW2auh/gdiQ4WknGnYB07aRHncY0HJ2R9dqz4kLZqR5u1/sjqupxNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvEWxBXIQ0DWuSnkBHpMaqay0qXZh4Wfme3040hBdqQ=;
 b=ezVBFz1okvd4pIGLdT9OSrlb+8O7ag9CQC4/lsNg+0pT+OTApn6B/GmTY9S3dvMLZX1rxq8gOR3ChfV2aZtPcro6SwU231IzhQlY/XesTBiuKaQQCIkTXwz0frF5AgIZsPKQw7AMnNG7fpSqaoBRoyosOJGZjclXZOFW6+g7eGAapbqv5d5U7oxZccGR992VakHIdsNf+c9AtDkglgXnIMyLEpDiwVNTJvfpwnqZQ4eSA402WZ4tk5xIWt9gZ68lGsERInvoidLXGvt73xNS22MdMXUDxQbRCwpgXlC+UZQleE6LInFUF78MF1s/6FkOZ3eJ1BRhQKwpv4m/unhp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvEWxBXIQ0DWuSnkBHpMaqay0qXZh4Wfme3040hBdqQ=;
 b=maWCCKQ2HeYtAIhPQbeRTvy9/HDCX8PGpDIY8Al14cwXZVwx5qgy2mTqce5H4VRnmwPudie42bO8+iu/vKNVo/rY96vloI6mF4nCDqDIQIPWiwoO2L9RxOKhTCTVhGcsoyU80lJvl92Ai+PT+ky+vGWm78/ZwhQpdWcduEol/co=
Received: from PH7P220CA0156.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::12)
 by SJ0PR10MB5661.namprd10.prod.outlook.com (2603:10b6:a03:3da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 17:29:15 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::c2) by PH7P220CA0156.outlook.office365.com
 (2603:10b6:510:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 17:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 17:29:13 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:29:10 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 11:29:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 11:29:09 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626HT9xO008807;
	Fri, 6 Mar 2026 11:29:09 -0600
Message-ID: <5d2936a4-9124-4910-93ed-c898d6facdb1@ti.com>
Date: Fri, 6 Mar 2026 11:29:09 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: keystone: Request IRQs in probe()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260302201734.320747-1-afd@ti.com> <aasMuUHVnyAx3FmS@p14s>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <aasMuUHVnyAx3FmS@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SJ0PR10MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe0545a-947e-4c65-5c47-08de7ba5e2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	QNnH2oI0284/90fH8O2cIxbRgWXoyNNtrfB9LHbQgGnwWcYYrK79RWy4GuWpJtewx5NP52p+8gcACrj+WeH4KK2kUcK2OAcep8GhWGZXNBrmQ3/fuY/zAzd+VOvTN1W1MMdQSKjFtqMuqFfibY9uWAcgnPsm0xTT/6f8G5Lr1SydLX1cwWHjhA6nJ4IZ6OhhJAQi/IMYri04FydmXARb+SZwS9lTpKrnYcT0mVVmZTJscRfdzhwZEpY+kXBvAYVRca1P5HsUj7HuX2hVfUnKXGLA9vIiYgovrbMVOSAsmRrfAnXso2qTb/pDC2VMPvvLbLfjf7DoK9PpKiDXOfKxehTVVVbkqaPJBO7kgYX0LziFjwvXuy9fG30igcFEz00U2x20zcKTNnHNB6Nb2ajqhcLSe9ILOTtU64GTul3iDjoc72pgIx4DkHNfaDXnZoe0YvrlIZDGKpeWvhxXUflXj9YwtnBReG2gqmDAaPwIV0xtb8sY2T85+jc2CRI8aEYtcKP4J8zzS0iW/mrYtaOGqEd7m3h6OC6ZnZuj8mXo6xliEpydCrwmQnryXefZWCN35/eqzKzTakPuce3aR3KJEDREDmwgvIB58aPj387ExXnBx0aEMnP2n0u0wt6XBuRLPu19Ax3v1DSqMxcpvEp1R8Q4gP2Vha4n9Uz0AW7bnmFgZpaDhVMjkeWvYE0+AnGCQ0yEFhSjxviDvfXB3ZQqX4nUh8v//j8UEatDVAkQpPwdTWBjdrSA4ydYdi9OUGwuJraXtKcX6azvZkFwsvKDOg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+hsNPMgebLPkzseR0BYZDBrVO3rQX5FwpjZtn5UEoBLuKTs3urHUcS7hL9YlR0/Yhr8UgzDln0rwvUAFg2DyowiZ1kHIm7TRrIKmR9t3z0ztfCI4fU2njrooFxF6khfjaCuUfV5i/SPJeQtAB8AuFmUBk/q9npVHjCHVNa8BY8CiCA3Iqgy04qmQnA6uDe4DamSbGjhWEAnDO7Bj1jj6BOqg45VSroUYvOEBgPxqCB0KW4eAoQRwfzmIhalErMHJ7ZLsPJ8eAXedan97HtMQf6qoP3p3Yta/37sRv+byZ3DAGYInLfHYewGT+OSndMclxtKg34VSnMjeeo/lSUyiJHIfz60x6WBGj8L7+Yj2qQEdJYy7ldCdR7msIQps+4CUA+9lULW7dzwo5I6LNFYaxGlRhEwz8qWEOoQ3lFz/QqEH+4m9ci4+UPbtpHYUqlGH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:29:13.7198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe0545a-947e-4c65-5c47-08de7ba5e2cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5661

On 3/6/26 11:19 AM, Mathieu Poirier wrote:
> Good day,
> 
> On Mon, Mar 02, 2026 at 02:17:34PM -0600, Andrew Davis wrote:
>> IRQs can be registered in probe and only need to be enabled/disabled
>> during remoteproc start/stop. This lets us catch IRQ issues early
>> and simplify remoteproc start/stop.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/remoteproc/keystone_remoteproc.c | 41 +++++++++---------------
>>   1 file changed, 15 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
>> index 4d6550b485675..e7fde55097866 100644
>> --- a/drivers/remoteproc/keystone_remoteproc.c
>> +++ b/drivers/remoteproc/keystone_remoteproc.c
>> @@ -173,35 +173,16 @@ static int keystone_rproc_start(struct rproc *rproc)
>>   
>>   	INIT_WORK(&ksproc->workqueue, handle_event);
>>   
>> -	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
>> -			  dev_name(ksproc->dev), ksproc);
>> -	if (ret) {
>> -		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
>> -			ret);
>> -		goto out;
>> -	}
>> +	enable_irq(ksproc->irq_ring);
>> +	enable_irq(ksproc->irq_fault);
>>   
>> -	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
>> -			  0, dev_name(ksproc->dev), ksproc);
>> +	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
>>   	if (ret) {
>> -		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
>> -			ret);
>> -		goto free_vring_irq;
>> +		flush_work(&ksproc->workqueue);
>> +		return ret;
>>   	}
>>   
>> -	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
>> -	if (ret)
>> -		goto free_exc_irq;
>> -
>>   	return 0;
>> -
>> -free_exc_irq:
>> -	free_irq(ksproc->irq_fault, ksproc);
>> -free_vring_irq:
>> -	free_irq(ksproc->irq_ring, ksproc);
>> -	flush_work(&ksproc->workqueue);
>> -out:
>> -	return ret;
>>   }
>>   
>>   /*
>> @@ -215,8 +196,8 @@ static int keystone_rproc_stop(struct rproc *rproc)
>>   	struct keystone_rproc *ksproc = rproc->priv;
>>   
>>   	keystone_rproc_dsp_reset(ksproc);
>> -	free_irq(ksproc->irq_fault, ksproc);
>> -	free_irq(ksproc->irq_ring, ksproc);
>> +	disable_irq(ksproc->irq_fault);
>> +	disable_irq(ksproc->irq_ring);
>>   	flush_work(&ksproc->workqueue);
>>   
>>   	return 0;
>> @@ -427,10 +408,18 @@ static int keystone_rproc_probe(struct platform_device *pdev)
>>   	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
>>   	if (ksproc->irq_ring < 0)
>>   		return ksproc->irq_ring;
>> +	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
>> +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
>>   
>>   	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
>>   	if (ksproc->irq_fault < 0)
>>   		return ksproc->irq_fault;
>> +	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
>> +			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
> 
> request_irq() sets irqflags IRQF_COND_ONESHOT, something that is not done here.
> Are you sure this is what you want?
> 

devm_request_irq() looks to also set IRQF_COND_ONESHOT matching request_irq().

Not sure it would matter anyway as these IRQs are not shared, behavior would
be unchanged.

Andrew

> Thanks,
> Mathieu
> 
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
>>   
>>   	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
>>   	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
>> -- 
>> 2.39.2
>>

