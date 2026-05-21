Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7293FADE9;
	Thu, 21 May 2026 18:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388770; cv=fail; b=bIo968YVq2aUDRUivdsJfzkl3NNWfk8yLnFoufISSQ+CKKv3myR8Xpe08jISrzYAPCEE0jFgKx9/ies9kGXlgKiiUK3VpG+tZ3vic2QY57cBLPMHajlpwQcRmxBbJy/HtJOIrkY2NJJ5lnmbcjzzeZImIDLHWTgO7+91RgeVR8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388770; c=relaxed/simple;
	bh=hilDjmgWhH91hRtsZ8Ehd6y5/GYrfNfMTMPyarRi+NQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MHD79ozqgnKSp6D5aeH9JLJ3fe3MgJ4v9W2+4xUpuCdDLlpLDc3s2aKlEY95bdalfcDUfaQFnkNQZh/K5bWu3nU/T7OoMJeH83NegtB/A/ju/hbvW349J93/bj1GQNBRrltXCCfAETZQqXcDyBE95Z1YndxZrBqtW6dTdMLThnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v/WENYK7; arc=fail smtp.client-ip=40.93.198.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v/WENYK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcb7XgD056LdhhVYvs+ck9ooT3/ycZj55rQ+6Wkd7b+cgPBtpxZnll2oz+JXYM3FrOsRzi0sY6yxkqMdl2XpTmZR5omju0W0suI8SSU9pbFy7sJ7+iKO8NDQoYqYgIslIZNUrDe35TNddrhSHFK5Tm011YmnSC56VGyE/Dd5vOdNnZqQp0hW8XnaKv2+cf+3cK4RWQUxla8Q2JAnS9aw/A9bBYAXN5iMogG1J6cFAQOfhFCfchROeEG+gQ2AV34+8gTT96fixGWW1tgS3B6TzjxBb8At3qEJm1cmyZ5qBL2xp7tlw3Zs2U1acbwVgnVYDPAguGz/mV0gNOlfmNMZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUuqnkKpMiTaGBdYpouSGWbg99BF1ugmlYqSXAkpVBE=;
 b=X3R1YfWfxsw0ln88iAw71TVCegQxpTIVr1L3axwg6zrrRZ1dDIKAry6sRYUmfTVfy18mfogXBu3GrqDVT38jAZXXX7J9P/q5V3hNreNLx4mQcZvb/N5LeZT38UEReBYRT1euOVHXxun/HxIPr6hE82Syftwv9TAAMdemJU74Gy6QyMWNrNrSwlvWtKhm6aP/D9KHNCYj3pSKNxyA9C1mlN6ZiI6GUK9oyoIvxiWrdGoazmIt3/KA+XeD66VVH4LYwHYOE3WnUxu05H83YjqwdfSJyNcKMsUZY+s1ieOGWP0ZneUDf4AUfdncWwBmWRMlyzKB0Nj4GAZ8QW2KE4Xqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUuqnkKpMiTaGBdYpouSGWbg99BF1ugmlYqSXAkpVBE=;
 b=v/WENYK7oWs7T5i+T1IIgyvHMAJJQnCnERS1s8j7AQigbuZdrn5IjA+uyLxvcB6kfZ5I9/sphvEmjOZMa9n/1cleGajRGtYyDGurTk7a+GEoSYFfcH5oJcunoW7bd2iEmNMzMqhcIQ+zudbyudBu0jo0Ml95p9DCQjLS/V651aA=
Received: from DS7PR05CA0044.namprd05.prod.outlook.com (2603:10b6:8:2f::10) by
 MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Thu, 21 May
 2026 18:39:16 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::3c) by DS7PR05CA0044.outlook.office365.com
 (2603:10b6:8:2f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 18:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 18:39:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 13:38:58 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 13:38:57 -0500
Message-ID: <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
Date: Thu, 21 May 2026 13:38:57 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com> <ag9FcXeIIiJWdld7@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ag9FcXeIIiJWdld7@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: a617c5c3-d191-43f5-faa0-08deb7684028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TXozvrNccruSPTlQsXW4QqRITKPYi75PduCsgmn02ZzanxrLSWpjyjShyxYo7gxK4Qm393OCzYEZM5gBBzzkrKrKJ3egBvKCInAkgYjBUWByXo1h8N9KVCfdKz3daoCXdUP1yEvWbdSu+OpudUSwlo2GCMkCx3kFOb2azBbrplHZS3SFvsTmwyS2PCoqWZMzGZ59glJAMZThe02O8mqeZhPm2unMcXVWVpiYZsbNRGEDHRdmYerIu/Ku6gXp1r2TZPPRC8Jzwi2rhWRrT9EBIPSjQ8SF8C17ke8HmucXf9fCicgQbLdKD+UFnVxz5oXwlCA2vegBPIo1f/Pk2m1Cdpf9RCBuJOxKNbSqDuxCIMryKzjkif46gTr789oiapQPXcWgnMvYmeppuAB8wDFXYkbvItnh3NURPGwWVOXT7bE/YhZ/1l4EvHJa5ADmTUO5+4FnSayRMCMVmE3fXQw93MPGUzkWCjIcDiKuXkm2uNqu35WWKsSI0l5flhu7UTSPt5NHxa802hO6EamH84AqGKT7vQ9mJtyALJQm2/+krIpnSToB5ZAKHihUsH9CLZ8KBwwvlTAZMe8dhlIaUUgriNVB1kfGlkL4ftJqwU6rxj8mrKAcyn67EeDyxRv9JkIRy0VhnFcprweVUj+pL/dTUwI2oU4vEtlKThRLKdA2tx42y2CTuhQlc53+roKOQf/sfSV5TndQgU2l0ymoR/1hSTLh/HtoY6iGxeTOgUlQbZA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9Ru+khCvFLgl4KIncn7AIsIrYwwfjZP0bv21CGVcemb0itzi4BL4FK5VRcmbp/deKRrHBBba9x8eN9iLAGd4hNIji/tslUpXFvk6sTFatdwz8b0mOdGDJI/FybIrRN4C471fvpiFcuuDW4ojTELxlPr0rgXqZEEyz0fJugfh2fxdbmovWDTM5RWM9twLzYiAaFO8q+ajmj9ABNTOYheBTIwH80nSc1M1yCLIPR0RjwQ8+BLXPNUPBafwxKppGlQTo/9gQ0Y7boancZdMk2c9nriWa3JOAQ5eOd1YyJbRJq3Fg99yNLLMwGya35U52UIzN/UTKbuX+/OhLS7FbJ3FoOH9etVOJ6mY8l/s0TxLn6wTKL/GHdJwG6cFL+YXfoLuRoleeDVWfvrqmGx9dbKDmOVDG6gjk9vYQ0lqNxg10JwnPP1W6qgRV+yhdaESgnDp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 18:39:11.3290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a617c5c3-d191-43f5-faa0-08deb7684028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207

Hello,

Thank you for the reviews, please find my comments below:

On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
> Good morning,
> 
> I don't recal reviewing the first revision of this set.  Can you provide a link
> to it so that I can read the comments that were provided?
> 

Here it is:
https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/

The device-tree bindings needed rework in v1, so I sent v2, before we
ever reviewed the driver part.


> On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
>> remoteproc framework has capability to start (or attach to) the remote
> 
> The remoteproc framework...
> 

Ack.

>> processor automatically if auto boot flag is set by the driver during
>> probe. If remote core is not started before the Linux boot, and linux is
>> expected to start the remote core then it uses "firmware-name" property
>> to load default firmware during auto boot.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
>>  1 file changed, 34 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 45a62cb98072..652030f9cea2 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  };
>>  
>>  /**
>> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
>> - * Allocate and add struct rproc object for each r5f core
>> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
>> + * Allocate struct rproc object for each r5f core
>>   * This is called for each individual r5f core
>>   *
>>   * @cdev: Device node of each r5 core
>>   *
>>   * Return: zynqmp_r5_core object for success else error code pointer
>>   */
>> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> 
> Why is there a need to change the function's name?
> 

Before, the function was actually adding the rproc core by calling
rproc_add() function, but now it only allocates the memory by calling
rproc_alloc(). For auto boot to work it's important to add rproc core
after all the other hw is initialized (such as mbox, tcm, sram,
power-domains etc). More details below [1].

>>  {
>>  	struct zynqmp_r5_core *r5_core;
>> +	const char *fw_name = NULL;
>>  	struct rproc *r5_rproc;
>>  	int ret;
>>  
>> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  	if (ret)
>>  		return ERR_PTR(ret);
>>  
>> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>> +	if (ret < 0 && ret != -EINVAL)
>> +		return ERR_PTR(dev_err_probe(cdev, ret,
>> +					     "failed to parse firmware-name\n"));
>> +
>>  	/* Allocate remoteproc instance */
>>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
>>  			       &zynqmp_r5_rproc_ops,
>> -			       NULL, sizeof(struct zynqmp_r5_core));
>> +			       fw_name, sizeof(struct zynqmp_r5_core));
>>  	if (!r5_rproc) {
>>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>>  		return ERR_PTR(-ENOMEM);
>> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  	r5_rproc->recovery_disabled = true;
>>  	r5_rproc->has_iommu = false;
>>  	r5_rproc->auto_boot = false;
>> +
>> +	/* attempt to boot automatically if the firmware-name is provided */
>> +	if (fw_name)
>> +		r5_rproc->auto_boot = true;
>> +
> 
> What happens when a firmware name needs to be provided in the DT but you don't
> want to automatically boot the remote processor?
> 

I think that use case is not needed. If the user/system-designer doesn't
want auto-boot, then having firmware-name in the device-tree serves no
purpose. User can always load the firmware via sysfs once kernel boots.

>>  	r5_core = r5_rproc->priv;
>>  	r5_core->dev = cdev;
>>  	r5_core->np = dev_of_node(cdev);
>> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  		goto free_rproc;
>>  	}
>>  
>> -	/* Add R5 remoteproc core */
>> -	ret = rproc_add(r5_rproc);
>> -	if (ret) {
>> -		dev_err(cdev, "failed to add r5 remoteproc\n");
>> -		goto free_rproc;
>> -	}
>> -
> 
> I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
> it simply to make the error path easier to handle?  If so, please do that in a
> separate patch.
> 

[1] This was moved to make auto-boot work. The remote core can auto-boot
only after other hardware is initialized. The zynqmp_r5_core_init()
initializes sram, TCM and power-domains of the core. Also, mailbox is
requested before zynqmp_r5_core_init() as well. We can't auto-boot core
directly without all this. So, I had to move rproc_add() at the end of
the cluster init, and rename above function from
zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.

If you prefer, I will add above explanation in the commit text, or as
comment right before rproc_add().



>>  	r5_core->rproc = r5_rproc;
>>  	return r5_core;
>>  
>> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
>>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>>  			r5_core->rproc->state = RPROC_DETACHED;
>> +			r5_core->rproc->auto_boot = true;
> 
> I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
> 

That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
until now, auto_boot was set to 'false' only to show that it is
disabled. It is actually used and enabled now.

> Thanks,
> Mathieu
> 
>>  		}
>>  	}
>>  
>> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>  	enum rpu_oper_mode fw_reg_val;
>>  	struct device **child_devs;
>>  	enum rpu_tcm_comb tcm_mode;
>> -	int core_count, ret, i;
>> +	int core_count, ret, i, j;
>>  	struct mbox_info *ipi;
>>  
>>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
>> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>  		child_devs[i] = &child_pdev->dev;
>>  
>>  		/* create and add remoteproc instance of type struct rproc */
>> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
>> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
>>  		if (IS_ERR(r5_cores[i])) {
>>  			ret = PTR_ERR(r5_cores[i]);
>>  			r5_cores[i] = NULL;
>> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>  		goto release_r5_cores;
>>  	}
>>  
>> +	for (j = 0; j < cluster->core_count; j++) {
>> +		/* Add R5 remoteproc core */
>> +		ret = rproc_add(r5_cores[j]->rproc);
>> +		if (ret) {
>> +			dev_err_probe(r5_cores[j]->dev, ret,
>> +				      "failed to add remoteproc\n");
>> +			goto delete_r5_cores;
>> +		}
>> +	}
>> +
>>  	kfree(child_devs);
>>  	return 0;
>>  
>> +delete_r5_cores:
>> +	i = core_count - 1;
>> +	/* delete previous added rproc */
>> +	while (--j >= 0)
>> +		rproc_del(r5_cores[j]->rproc);
>> +
>>  release_r5_cores:
>>  	while (i >= 0) {
>>  		put_device(child_devs[i]);
>>  		if (r5_cores[i]) {
>>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>>  			of_reserved_mem_device_release(r5_cores[i]->dev);
>> -			rproc_del(r5_cores[i]->rproc);
>>  			rproc_free(r5_cores[i]->rproc);
>>  		}
>>  		i--;
>> -- 
>> 2.34.1
>>

