Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48997287263;
	Thu, 21 May 2026 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779389325; cv=fail; b=f4aSxWxNXARftg31G9geZqPRs28e6+7AIZlv/2OMmngYBNpnrftHufMDVe8TbBTsLvwZso+3zZF24u6ldg8XR/XjTIVMbn3J2xUkWX73g17X9Ml/UkKdcH4vv2xFlPlMTcEEfwlqATlD69riZU8TJi3Kug/WuVmaN40k1dHr8Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779389325; c=relaxed/simple;
	bh=VZhh1uEkEacdxhYbLngrp0o1rW2ebSSZw3EzcJCoi0o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=B/Vf+hR+skv3op9Og8PjxVYMjuCNxn86O3l/z32qepv6O7w0N0I67CryZIhu6aBfOQxQL3DUEfc5lr2xy3ZXBXgkaRrlnZn8ChMLLIb0k/V09tCpmx/r5fZpz+MK+g9mkZN4M2WZLEEKpYRJOpJGzGJco4/fCsrZuFUBV1xwMDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UFVJKLCD; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UFVJKLCD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmKY+2V/HdgWuc9BH1Lz7toflKEmcVZ3cq9PC3ZWwFX1bRBbq/aii5A+45igUsY2MN3DeINWab9Kon0RtgZq2TY3IABylbaprqjheZN5PgjNGXbx17+AoZzy88nIHekVvMoO9L7M+ZnVDGXl41fPaK1UeneoH5UFwJdYnIMFuMBl7pkHGZgwyhsQRbzP5uw1e7nHWOY/7nJriQypIF26/De3NEpxdZf5nYdZc0eetC1Bt5QNx5ms53nve4uH6wiqzdooWzxUN4S2S79asoil/p37U+HG2nXpBCpJxJ2rf4iFBt1bK465Q15BLmM1eAJIEJn22aZMrX09OJw7cEhC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haxjZpdV/etBA59D51CoaHf2q7Tar47DYgCxhAETaNA=;
 b=yK1Oe9hu+w1aN+2j1BepmNbLtk4cH58ducu4LIHMirooy9yt0woNCRsLUVNzXq3l+HhUUXNIrCRZbzHgiM6KhgMX2S5/HqIEN9U7igeVATxq6/O3mhExJPv9ewrCD6tUUAZgiQvmJIZfqomFutWnxidrC9HWZrQZYeaBt6uPgWMzi/jgRS85OxcOLFrDeliEK7j1Wtmqp1fPbPXfRfD/SL/iKd4s2vP7kOdFKgasCCZoSEZ8c0pWD9gnM//ilyR4fk+F5i6hlzalM9NV1RQgaBMaEE53EUiffNLrlgY1zq1Av2xjzBC3ZXZCYlsQzLCvdMXjsDmxCilXWMQ+s8m74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haxjZpdV/etBA59D51CoaHf2q7Tar47DYgCxhAETaNA=;
 b=UFVJKLCDBKkt1BUpbE1E78JlAkk+QxHocbmlLfk4kiXE8iygKYADP9hcw0QR1jM90ip3vKhtn4mQX+/vmqpZuK2W4d+GBwtvN40SXckHNp1nB1vHnWXgPwaQAqzenHRcGTXRDYtGlIEXfd5zCy29SYzCTTfD+5ve0IAuc+5QSEE=
Received: from BN9P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::17)
 by SAVPR12MB999168.namprd12.prod.outlook.com (2603:10b6:806:4e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 21 May
 2026 18:48:35 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::26) by BN9P221CA0009.outlook.office365.com
 (2603:10b6:408:10a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 18:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 18:48:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 13:48:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 13:48:33 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 13:48:32 -0500
Message-ID: <be63e9a0-e325-46eb-9c03-54dc22878ed6@amd.com>
Date: Thu, 21 May 2026 13:48:32 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
From: "Shah, Tanmay" <tanmays@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com> <ag9FcXeIIiJWdld7@p14s>
 <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
Content-Language: en-US
In-Reply-To: <cbd418a3-1585-4592-8e86-b0750e19ec0f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|SAVPR12MB999168:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8d8fdb-630a-471e-9a56-08deb7698fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|11063799006|4143699003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	QcLwaNbEbKl8RJHyNyyBoIv8z3WMMFvR+IZ+xG2wXGHN34Ujr+icB+JvL2SUrNbxvmLZbfgHD/vnwaoa6MMDF9XHY9aZfYzLv3deDUZcgSqbEa1PujxNa/JvEWPkPyPHlZv7Q7ZUY3MMXRNG5aJ1qbUnEd9Fu0bPh5iD5DPlPpSv8gJVyEe92KOrBKszhYWH9AmUuPFKjstLD888V2OLB1dF26wWlRYALqvDcoTRoohI9Z9YjFHR8OEz0gSK2tOxpmaNRo4ciNxPzFlCSdwhE+pERhzE6g2QCw4K+PXkFDCf4cC0i2R9dYJ/UMPhXJOevyXEhNHSbzZ/Look/HK75AOLt969Ah7cQeXFQ/F2DGZa0PBJy7saE2eyw3+aAR+yJrEQIc+rbN1ugOmN1R8eUzLbNWyz3+fiMusCGFCwce7Ss5w7NrNMhgWWabrf+Rdn+Lb+4W+XOrT0oKkcLEklXY2ghX8qAhogp+dD4phi9qR28S06Rb1jcz2iprsqadOhK6zVxycmdopAoETgHlTpeqmaEDFT/DXaJYR0OBT6LRTMB2w5rsPJHuUdy4rC/KlseQ4lgaKT5GNt/Ufke6j7SgUe/eK919cg/fkHzZYnhLvOZFg3W+cvPKooDnKiTdXiahMWJsJXwSdqT9nlsTPshoedFXjDBKM/SKa3fPGXylPLanQRjPaYY2nhC1IkyolSJ106gOQs6F+ZLYviCjsF1CT9hLsPxCV62GJq1K1/dj0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(11063799006)(4143699003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DxvE95RdO+MO+4qUIyjWvEQFm1Y+cDjjiLk3FQWSGMk9Yp+R6StCW+kzLclPoCkLfhjhlgWoX+04NIzgtpdaSKpC5e2K2usl9hQ61y1eVE/OWtpt6FWsk/Lh/tt50VhXUvR4lw37wysREITZq9pecrjrBFprzP8XfGcGLXZXZyCZwPP4b9ThKxbkz7kjDQv9pghqPgj9YNQqL1rxxB1Jbawu2opp0nSXV4RsvPS4m/+1qLO+8Va/ApOeoKiy8YSGZmBK6kH7qonurAI98QLQMRd8kQFx6F5HnJeg5zAmqnY4TXTKi7Ri8B+NlrytrYHEVz1pJcx1Omj/CYk5IVhFzTDaNUs9YfObvOYa5DR7pXx0FkSZfJMLyO4b+2uQX4SQ5E9pCDPLEjeqlFY+6RDvOVW6Uj9FqEOHXPnv+KwhgEJ0AdZf93ad46Fj+/6wXcDc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 18:48:34.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8d8fdb-630a-471e-9a56-08deb7698fb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999168



On 5/21/2026 1:38 PM, Shah, Tanmay wrote:
> Hello,
> 
> Thank you for the reviews, please find my comments below:
> 
> On 5/21/2026 12:48 PM, Mathieu Poirier wrote:
>> Good morning,
>>
>> I don't recal reviewing the first revision of this set.  Can you provide a link
>> to it so that I can read the comments that were provided?
>>
> 
> Here it is:
> https://lore.kernel.org/linux-remoteproc/20260422202558.2362971-1-tanmay.shah@amd.com/
> 
> The device-tree bindings needed rework in v1, so I sent v2, before we
> ever reviewed the driver part.
> 
> 
>> On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
>>> remoteproc framework has capability to start (or attach to) the remote
>>
>> The remoteproc framework...
>>
> 
> Ack.
> 
>>> processor automatically if auto boot flag is set by the driver during
>>> probe. If remote core is not started before the Linux boot, and linux is
>>> expected to start the remote core then it uses "firmware-name" property
>>> to load default firmware during auto boot.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
>>>  1 file changed, 34 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> index 45a62cb98072..652030f9cea2 100644
>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>  };
>>>  
>>>  /**
>>> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
>>> - * Allocate and add struct rproc object for each r5f core
>>> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
>>> + * Allocate struct rproc object for each r5f core
>>>   * This is called for each individual r5f core
>>>   *
>>>   * @cdev: Device node of each r5 core
>>>   *
>>>   * Return: zynqmp_r5_core object for success else error code pointer
>>>   */
>>> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>>
>> Why is there a need to change the function's name?
>>
> 
> Before, the function was actually adding the rproc core by calling
> rproc_add() function, but now it only allocates the memory by calling
> rproc_alloc(). For auto boot to work it's important to add rproc core
> after all the other hw is initialized (such as mbox, tcm, sram,
> power-domains etc). More details below [1].
> 
>>>  {
>>>  	struct zynqmp_r5_core *r5_core;
>>> +	const char *fw_name = NULL;
>>>  	struct rproc *r5_rproc;
>>>  	int ret;
>>>  
>>> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>  	if (ret)
>>>  		return ERR_PTR(ret);
>>>  
>>> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
>>> +	if (ret < 0 && ret != -EINVAL)
>>> +		return ERR_PTR(dev_err_probe(cdev, ret,
>>> +					     "failed to parse firmware-name\n"));
>>> +
>>>  	/* Allocate remoteproc instance */
>>>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
>>>  			       &zynqmp_r5_rproc_ops,
>>> -			       NULL, sizeof(struct zynqmp_r5_core));
>>> +			       fw_name, sizeof(struct zynqmp_r5_core));
>>>  	if (!r5_rproc) {
>>>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>>>  		return ERR_PTR(-ENOMEM);
>>> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>  	r5_rproc->recovery_disabled = true;
>>>  	r5_rproc->has_iommu = false;
>>>  	r5_rproc->auto_boot = false;
>>> +
>>> +	/* attempt to boot automatically if the firmware-name is provided */
>>> +	if (fw_name)
>>> +		r5_rproc->auto_boot = true;
>>> +
>>
>> What happens when a firmware name needs to be provided in the DT but you don't
>> want to automatically boot the remote processor?
>>
> 
> I think that use case is not needed. If the user/system-designer doesn't
> want auto-boot, then having firmware-name in the device-tree serves no
> purpose. User can always load the firmware via sysfs once kernel boots.
> 
>>>  	r5_core = r5_rproc->priv;
>>>  	r5_core->dev = cdev;
>>>  	r5_core->np = dev_of_node(cdev);
>>> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>  		goto free_rproc;
>>>  	}
>>>  
>>> -	/* Add R5 remoteproc core */
>>> -	ret = rproc_add(r5_rproc);
>>> -	if (ret) {
>>> -		dev_err(cdev, "failed to add r5 remoteproc\n");
>>> -		goto free_rproc;
>>> -	}
>>> -
>>
>> I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
>> it simply to make the error path easier to handle?  If so, please do that in a
>> separate patch.
>>
> 
> [1] This was moved to make auto-boot work. The remote core can auto-boot
> only after other hardware is initialized. The zynqmp_r5_core_init()
> initializes sram, TCM and power-domains of the core. Also, mailbox is
> requested before zynqmp_r5_core_init() as well. We can't auto-boot core
> directly without all this. So, I had to move rproc_add() at the end of
> the cluster init, and rename above function from
> zynqmp_r5_add_rproc_core to zynqmp_r5_alloc_rproc_core.
> 
> If you prefer, I will add above explanation in the commit text, or as
> comment right before rproc_add().
> 
> 
> 
>>>  	r5_core->rproc = r5_rproc;
>>>  	return r5_core;
>>>  
>>> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>>>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
>>>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>>>  			r5_core->rproc->state = RPROC_DETACHED;
>>> +			r5_core->rproc->auto_boot = true;
>>
>> I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?
>>
> 
> That function is now zynqmp_r5_alloc_core() as mentioned above. Also,
> until now, auto_boot was set to 'false' only to show that it is
> disabled. It is actually used and enabled now.
> 

"I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?"

I probably misunderstood this comment. Here is the correct explanation:

The auto_boot setting in the zynqmp_r5_alloc_core() is done if the
'firmware-name' property is present in the device-tree.

Here it is done, if the remote core is already running. This is to
support attach-detach use case.

So, auto_boot is possible in two cases: 1) If firmware-name property is
available (Linux boots the remote), 2) If firmware is already loaded and
remote was started by the boot loader. (Linux attaches to the running
remote).

This is the second use case.

Thanks,
Tanmay

>> Thanks,
>> Mathieu
>>
>>>  		}
>>>  	}
>>>  
>>> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>>  	enum rpu_oper_mode fw_reg_val;
>>>  	struct device **child_devs;
>>>  	enum rpu_tcm_comb tcm_mode;
>>> -	int core_count, ret, i;
>>> +	int core_count, ret, i, j;
>>>  	struct mbox_info *ipi;
>>>  
>>>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
>>> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>>  		child_devs[i] = &child_pdev->dev;
>>>  
>>>  		/* create and add remoteproc instance of type struct rproc */
>>> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
>>> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
>>>  		if (IS_ERR(r5_cores[i])) {
>>>  			ret = PTR_ERR(r5_cores[i]);
>>>  			r5_cores[i] = NULL;
>>> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>>  		goto release_r5_cores;
>>>  	}
>>>  
>>> +	for (j = 0; j < cluster->core_count; j++) {
>>> +		/* Add R5 remoteproc core */
>>> +		ret = rproc_add(r5_cores[j]->rproc);
>>> +		if (ret) {
>>> +			dev_err_probe(r5_cores[j]->dev, ret,
>>> +				      "failed to add remoteproc\n");
>>> +			goto delete_r5_cores;
>>> +		}
>>> +	}
>>> +
>>>  	kfree(child_devs);
>>>  	return 0;
>>>  
>>> +delete_r5_cores:
>>> +	i = core_count - 1;
>>> +	/* delete previous added rproc */
>>> +	while (--j >= 0)
>>> +		rproc_del(r5_cores[j]->rproc);
>>> +
>>>  release_r5_cores:
>>>  	while (i >= 0) {
>>>  		put_device(child_devs[i]);
>>>  		if (r5_cores[i]) {
>>>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>>>  			of_reserved_mem_device_release(r5_cores[i]->dev);
>>> -			rproc_del(r5_cores[i]->rproc);
>>>  			rproc_free(r5_cores[i]->rproc);
>>>  		}
>>>  		i--;
>>> -- 
>>> 2.34.1
>>>
> 

