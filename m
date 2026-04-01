Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4200E21B191;
	Wed,  1 Apr 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057029; cv=fail; b=OJvv8YsmR8s+ZK5O9Wce0Bu6KGgjwNS1tvrGqH10wlDqZNGJ5+3QeXXQ74tg6Xlta09/Z8BO0kuAW0Ep3Gt9b7iEKc/Kyp3+/wCH8e+3fLGbjOOoAHLg0kT3eFrCtaAdsgAsDOi0YqYAyl0qNWLZrOgP5QA/p1koTrV3p8Up1+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057029; c=relaxed/simple;
	bh=3456oneyn/8EH0nBhO3jRR9ncTHPdp5HvophDs4Z1KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OwSgTz8h0f+nzIu1lIlFFKwaYhQ9iuLSrFuEoabKn7T98Nqxgz2O2rxjRsWqh0NS2xIMmX28edku+VIhhdHOQZ8r4mc+GI2lPPUEZGb6oo18PxljVhsimkKmuBb+nJ1P8Jusj8CN0oR7DXy2jYQPRD+ogdjgQu6/V1q2esoih28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vljPzDxH; arc=fail smtp.client-ip=40.93.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vljPzDxH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svXCKuHLIpOhZw3CaOKFNt0WNHbM2QUGmq3xOIQbNEMC1ZUbh54fZWYyGtk1lbpEFcT6TDy1Y8Ugln37vAlu9qt0N3f7CSMjlePBTducD/FxyQXHP1VClfPJ+oRMjOOUECwwgVuvIukA+pcGiaGvo9xTOk8b92DlfWwiFShmhIihANh/NSoPt+o84bnZ1stpVBhPZ3xkL7o2fnkv7yeNwA7Awh5o4OxQCLdANvUZN3x6+14q+bzuuk9qJH6rGdaULWp/20ZFwYl88Ygei7jqbfO6LvhZJQk/c2eK36VwHaaseqxR+D1lxFe5AzACBz0kvuh9gLm0jK3toU7DQOPXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZdiNlfwmKi8TxWrix/KBPXReuILkt7xNhTFPG2ykVU=;
 b=FhUPyIkCj0acH05uDidIEyvkQlH/r7AjO4LRWwp1K6fCDOIUJUQY+Nb0nGSti7uZY+SY7Zi2YoxP+jaXv570UElxbQmwsBpVa6BUlcSpMkK964Ux7Jc2Towz4/h5aCH0VsyCO+//+GbHIHhbFSANe4yhQIiPSGS+elpRrNyU0lUXXjKXvOBx5w4lLvvPGVTl/gZ86RU4ubgR+37LCySjbYDNv5/uupTcZ7+Ps2b0N+qq2Bq50+EiJ4/0IaX3GdDEXvlJ3ovdZnc0D494NpPE1NIaLhUyw2+a7vofGJ+gcKlxQSX5hF0/eF7ZXPfMzk5MDKlxJXvXhmQpzTUAkFdbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZdiNlfwmKi8TxWrix/KBPXReuILkt7xNhTFPG2ykVU=;
 b=vljPzDxHYC4BwKK12W8jE+TZWukqtEXZQjdIXlnGpLkRvdMUtgWedl4EBpmmjeYB5DisZcYjMmexM0hJZ+C3JsxcJon/oMzgGDNEDsGP/RyYJPr7RwBSGz1UXLxbQf5+g0mEU5AclOyVX6kmZK1HUL/2mfiJ2vLF32RrrlhnksY=
Received: from BLAPR03CA0178.namprd03.prod.outlook.com (2603:10b6:208:32f::32)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:23:43 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::ba) by BLAPR03CA0178.outlook.office365.com
 (2603:10b6:208:32f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Wed,
 1 Apr 2026 15:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 15:23:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 10:23:42 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 10:23:41 -0500
Message-ID: <06f3c1bc-078c-4d67-8a22-933069ecb2ec@amd.com>
Date: Wed, 1 Apr 2026 10:23:41 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260317201251.3920841-1-tanmay.shah@amd.com>
 <acbhbnBgJCP7WETC@p14s> <3f557b06-ea34-4f96-b1ec-75bab7c0d828@amd.com>
 <acwKHzN84v_CipBh@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <acwKHzN84v_CipBh@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dd7307-421b-4f67-3e54-08de9002a87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JaEAkDbwP6JD0VZYJHk2GTVdYCe20FIj7Q52dwZ48qnoEgQjAuqJvm03j7ThW+doYlTlU2dOWZ/8LpZLC7lT9l1zdrGAs862gljoaTMLgBelaPsv69WXJMpAb1xmCRxz6Eg20Wupf98klfk1W7SI8OBbN7Kj6uuooswMJoAafbh2mHbM9E5Nn/S5LUbxp9gS+UQxTkGEU8YK2ZV8GW0Wp9pXPz7E32UVw3R230DOVxsEzJeDJSiBo9pR1HqVsv25Lza3aP5NdBL9CaPFGuEtrUV7FKJ3xd5oUyXbdq1ywJjPP5Z11uAJ4/BFmOH3gQXHKM8qDakvNBgarexNl1fAE3FAOs3mKFam+80Al+e3stfK/Y/XPbcxMRc914SQBIfnjI9GYlM//7q4owyIOBjMTd3wp/P3Cuyk7pKsAwEaufCZ3xOVrq1hvo84PdeNzwv0Gzm+uSUBg2ZlHdKLiV8oRXdfeauY2KaF6iY48Aw5RJQWnhv7yM3Auu7ldiAnrff4u2Sh/AffOTfJYZ1ZdkxBEE59+LgkXxvITavoPwoUlbkK4uyT/dH37TUDA1z7fhYu4MlXqgoVH77FQpe8eGKS8jnPjy7IGGu+vdzBYGJwyJcbNYwbCE5NCkZWlqIcvkCDiuU/wypwg9zH2gO3C8DeqX7s3sJb13z1dyzwlGdrjlB5tP4AprCu67z0UY2XjKipdE5A4AbClCFRmcPIzmOUwVWe/IrA4MriQ7IG6F7fcFUz80K0GskKTrFEFBYgvpbNkNUEn/yQwib366Il1VOpgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1obrAFM2htfmuwEJGzVy/GjdlNXFAlqYO0pFqLRvc42L2IiHx5OnocGy0jUUgNZpJwfeUGfW0iBMZxQXcJw0+JINSRuEvs88EqkKQ37AjDw8FN5HYch/5+UNnQmkL+YIvh1iF4banXmPD6fp+C6vT/pR9LOW8fioRHAUeBqTpG+ZmsN1HQyFt64D7iLOchdSX99IKiasSxZUH4uAAA5BsxVMdgxHUZJera15eVbchEXIRnURPUP1jv6Ly3txFbqSCoQLMcTTiJT5UMcFXzjxYDsKv0uzajRKHydTixfqPo4PL60149Kd+JNXj4iSMNHjnaoaC29LvwfefsYJdQ6J3sa+j6o+f10V/ZtzQf8GXAs7inyxRpvUGuGdxo4xmxYTMOYIdmiakPdMpBiA/VyV2NSeYjaJyUb7OLjPS5pQarx3X5ymUjSOpSqVy2AlED33
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:23:42.3992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dd7307-421b-4f67-3e54-08de9002a87f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644



On 3/31/2026 12:53 PM, Mathieu Poirier wrote:
> On Mon, Mar 30, 2026 at 01:43:03PM -0500, Shah, Tanmay wrote:
>> Hello,
>>
>> Thanks for the reviews. Please find my comments below:
>>
>> On 3/27/2026 2:58 PM, Mathieu Poirier wrote:
>>> On Tue, Mar 17, 2026 at 01:12:51PM -0700, Tanmay Shah wrote:
>>>> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
>>>> separate subsystems. In this case, both cores can boot independent of
>>>> each other. If Linux went through uncontrolled reboot during active
>>>> rpmsg communication, then during next boot it can find rpmsg virtio
>>>> status not in the reset state. In such case it is important to reset the
>>>> virtio status during attach callback and wait for sometime for the
>>>> remote to handle virtio driver reset.
>>>
>>> I understand the user case, but won't that situation happen regardless of
>>> whether cores operate sync or split mode?
>>>
>>
>> I want to make it clear that this is not same as Cortex-R cluster
>> configured as lockstep vs split mode.
>>
>> This is different configuration between Cortex-A cores and Cortex-R
>> cores. It is a firmware driver configuration of how it treats cortex-A
>> and Cortex-R subsystems.
>>
>> In the firmware driver, we can configure Cortex-A cluster as owner of
>> Cortex-R cluster, and in that case, if Cortex-A reboots, the firmware
>> will also reboot cortex-R cores. This policy makes Cortex-A as owner of
>> Cortex-R cores. In this configuraton this patch is not needed, because
>> if Cortex-A reboots then platform management firmware will also reboot
>> Cortex-R cores as well and vdev status flag will be always 0.
>>
>> In another configuration in the firmware driver, Cortex-R cores can be
>> independent of Cortex-A cores. This means, Cortex-A is not the owner of
>> the Cortex-R cores. Both are independent subsystem. Only in this
>> configuration, this patch applies because it is possible that Cortex-A
>> reboots while Cortex-R doesn't and Cortex-R still runs as it is.
>>
>> So only in the second type of configuration, this patch is needed when
>> COrtex-A running linux reboots and when driver probes and tries to
>> attach it can find that vdev flag is not reset. In the first
>> configuartion if linux reboots, then It's guranteed that vdev status
>> flag will always be in the reset state.
>>
>> If you prefer I can extend the commit message with all above details or
>> put as comment in the attach() callback. Let me know which do you prefer.
> 
> Ok, that clarifies a lot of things.  Please add the above as a comment in
> attach().
> 
>>
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
>>>>  1 file changed, 46 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index 50a9974f3202..f08806f13800 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -5,6 +5,7 @@
>>>>   */
>>>>  
>>>>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
>>>> +#include <linux/delay.h>
>>>>  #include <linux/dma-mapping.h>
>>>>  #include <linux/firmware/xlnx-zynqmp.h>
>>>>  #include <linux/kernel.h>
>>>> @@ -29,6 +30,8 @@
>>>>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>>>>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>>>>  
>>>> +#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
>>>> +
>>>
>>> There are some time constant already defined, please use them.
>>
>> Ack.
>>
>>>
>>>>  /*
>>>>   * settings for RPU cluster mode which
>>>>   * reflects possible values of xlnx,cluster-mode dt-property
>>>> @@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>  
>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>  {
>>>> +	struct device *dev = &rproc->dev;
>>>> +	bool wait_for_remote = false;
>>>> +	struct fw_rsc_vdev *rsc;
>>>> +	struct fw_rsc_hdr *hdr;
>>>> +	int i, offset, avail;
>>>> +
>>>> +	if (!rproc->table_ptr)
>>>> +		goto attach_success;
>>>> +
>>>> +	for (i = 0; i < rproc->table_ptr->num; i++) {
>>>> +		offset = rproc->table_ptr->offset[i];
>>>> +		hdr = (void *)rproc->table_ptr + offset;
>>>> +		avail = rproc->table_sz - offset - sizeof(*hdr);
>>>> +		rsc = (void *)hdr + sizeof(*hdr);
>>>> +
>>>> +		/* make sure table isn't truncated */
>>>> +		if (avail < 0) {
>>>> +			dev_err(dev, "rsc table is truncated\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		if (hdr->type != RSC_VDEV)
>>>> +			continue;
>>>> +
>>>> +		/*
>>>> +		 * reset vdev status, in case previous run didn't leave it in
>>>> +		 * a clean state.
>>>> +		 */
>>>> +		if (rsc->status) {
>>>> +			rsc->status = 0;
>>>> +			wait_for_remote = true;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/* kick remote to notify about attach */
>>>> +	rproc->ops->kick(rproc, 0);
>>>> +
>>>> +	/* wait for sometime until remote is ready */
>>>> +	if (wait_for_remote)
>>>> +		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);
>>>
>>> Instead of waiting, would it be possible to return -EPROBE_DEFER and let the
>>> driver core retry mechanic do it's work?
>>>
>>
>> It is not possible to do -EPROBE_DEFER, because attach() callback is not
>> called only during driver probe.
>>
>> It is also called during following command sequence:
>>
>> attach() -> detach() -> attach()
>>
>> During second attach() callback, we can't do -EPROBE_DEFER, as it's not
>> driver probe anymore. So I think will have to keep the usleep_range().
> 
> Right, but in this case the Cortex-A did not go through an uncontrolled reboot,
> we know the state of the machine is sound.  Do you see a scenario where it would
> not be the case?  
> 

Yes correct.  We will hit this issue only during probe, after that as
long as detach() happens we are setting vdev status to 0.

Another problem with the -EPROBE_DEFER mechanism is that the time
between return from attach() and next attach() isn't fixed. after
deferring current probe, when next probe and attach() happens, we will
always find vdev status to 0, even if remote hasn't handled vdev reset
event. So we don't know if the remote has handled virtio reset flag
notification or not. Where 100ms fixed delay, gives fixed time to remote
to handle vdev reset event. If needed this delay can be increased later.

This brings up another question to make the solution more robust. Do we
have any standard way of handling such a situation? Like in other virtio
standards, can this situation happen where driver comes up and finds the
virtio device status not in the reset state? How do they handle it?

Also, is firmware required to restore the resource table to default or
initial resource table after getting the virtio reset notification? Any
standard decided for remtoeproc virtio devices around this?

Thanks,
Tanmay

>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +
>>>> +attach_success:
>>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>  
>>>>  	return 0;
>>>>
>>>> base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
>>>> -- 
>>>> 2.34.1
>>>>
>>

