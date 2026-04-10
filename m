Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011052.outbound.protection.outlook.com [52.101.62.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A933ADBA;
	Fri, 10 Apr 2026 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775850350; cv=fail; b=OiR8IoaocV4MU1mouFxh07DJBuhBaTtU7SOrcO4GsAY99perNsvVEmBTF9wCTIdQqferw6UL1rFeROuSEVul0dED8okHUZ4co0il++VYcWhrQboZqSpvbJH+AJTpQMYPTtkdJjEoHayWbEbqBbUlYcN0dtCkstgaGvVEJyR0guc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775850350; c=relaxed/simple;
	bh=2rjDTLawVSdsAOK7Mb9StDwjOOQz1zeuhW89GiBKwlc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=i1CiBHdxaVtFSlgCexVMMV7RBp8+I2sECdJ3eI0YF8IddOI+gy9gw8xc3RcIQNuBSg8Am22RN+/gNo9vVVhG7+eI2J0V5MFiBeDM9reZgpm0ZZ3gPeaz0+eS2LUR7fAbhGR8m42tWA360oy7nHadwcTzDNIASOOaOPDNydTQdAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eKhJJqdi; arc=fail smtp.client-ip=52.101.62.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eKhJJqdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2kN3OE8n0Y4JvzRnsRGowxy6+Mp50WsKRcnWEG6VVjOwSFLV762R8ryDuCa3KQCqSMdJGGItCanbNKTMX/jLxbwz7Qtmj5X96L0mdTvPdjhwIVH7ro/OWdy0c0MCE5tPqSrans15fKDabXJafGgECNv8lXF23jZ++L7ieEAkwqvekOQXLIG1g5GwTvploE7jV5Fjb+byn2YukKvMSexVX9/+AM7IZk6Ic+JVuHyxeebvc/EWPLTrxy5QFHWMG4qTBwQ8q7jWt53gT1V3VN5eP0PGpyusiogPaJ4zL4fv/vzkg2qopC2D61XrhpCilCwRPJKes8IlTlgpplxaRyzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCQsEciYuFF5YReBT3FV7jTLZVTz94ebiZUqGtRwOG8=;
 b=Qvn51dK50aQSxp0fepKEPzLAw1TOGrdKLBpUGXmYjCBIDH32ODdGyEJETslMgfrk59J3FJeR1qLZqaC8uVgDbPuvoE6cimQlofv1/pdVy0U6/aPRflWx5Tsgap9MtS7i/SmI9BL0zpKD9kjwNfaMLeLDgPMe5BefP/WNXNNE5AJohoT2eErvbkLc/8livduL3GG1e+q/+09wh5EJqanSc/fyAjF6GSzUEANfWY5eGZyzOXD6BfNN4sfzTdjMHuj2JI+Ev3Kft4v4eXRoAJd89IKSAnvgkeA28hf0R/mh4SBEpeypqxLzNmswOsvRZZ0sU8PVKZfil0ywjzs2TErC8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCQsEciYuFF5YReBT3FV7jTLZVTz94ebiZUqGtRwOG8=;
 b=eKhJJqdir9EKNPvjDKgb5LDR5SvGv7/Jj/BVvE+AiRFoCmLkBGUbaTNUdtPi21ux8qwVlpGskCeVY06SROjV1z/R+JQoyOZ/jjdWPltYy3QqaVnIEbe//6fJV7lp5HqJJT9J5PVLdLWn7r+1KxI48IDEesxAPNIFd2YjbjuLwBM=
Received: from SA9PR13CA0048.namprd13.prod.outlook.com (2603:10b6:806:22::23)
 by CH1PPF2EB7CF87B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 10 Apr
 2026 19:45:43 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::7e) by SA9PR13CA0048.outlook.office365.com
 (2603:10b6:806:22::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 19:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 19:45:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 10 Apr
 2026 14:45:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Apr
 2026 14:45:42 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 10 Apr 2026 14:45:42 -0500
Message-ID: <b1017808-2124-4bff-9f18-7900c01c11b6@amd.com>
Date: Fri, 10 Apr 2026 14:45:37 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
From: "Shah, Tanmay" <tanmays@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260317201251.3920841-1-tanmay.shah@amd.com>
 <acbhbnBgJCP7WETC@p14s> <3f557b06-ea34-4f96-b1ec-75bab7c0d828@amd.com>
 <acwKHzN84v_CipBh@p14s> <06f3c1bc-078c-4d67-8a22-933069ecb2ec@amd.com>
Content-Language: en-US
In-Reply-To: <06f3c1bc-078c-4d67-8a22-933069ecb2ec@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CH1PPF2EB7CF87B:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6a50bf-6703-45c1-77fd-08de9739c0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	M0BS8oo6ESVtz0xbt0l09Bu4lOGNLfbiRXG9KtjTdPpdmsGg3YfJ51ogPk0FN8dln/TQjIVaysnh8j3RHEhmiPrZ274IDfFmR1xR7Fuf2nB62UKbNKK2wi4cpBN1WcPHNJWeq31a7skf7tDLB/kSTcXyhrl3Z/D6HEtd9cbh2w67YrKGb5Euz4DeJCCIV1c4VLwIhbQCjzEV3S5gHW4yNdm9VPwddv1bLRd31If01Ne1osFsIJ0EWdv6LPKSSGKCR/g3Wm9uRMKXnyj/0EDYXZ0760U2UW2EsB+CRJAHQEPAP1h7WYCEALtANr3gO23K7scRiSe2q4AhahpAAg8zsTgCPZ/j1kChVvVdpdsPSflfOJBhEG2J54NRrl+KRhn4oVPyzXmvDZmyYc/Lrd8o1KNrug/gx4L7m5uWUsJxU1GtvpApvtcSNKTxshGnz7wBW70uZMDSjWHtvwxePLUJHE4ODnlbs0E4CgevqdJAC64xK0rnMh8Ker5vLNKJF+R7MIJnozUZofd/OiFChtvyZCZK8WNf+jAAIPR8jw41OgrQmIa/xF5K7RqEQ2Rr9E6gJ/3PCgy8ILdXRzw9a9x2REs5hS7lWIV0yfFj4oEyOLZNdF/EYh0HOkrBY/0KwumMPKnKAE4fALzKWuiFQwnVCTnqDGcHlgp2/UVm05OKpmtyl3zOBd171tzDLcsjbjCBlZ8EWt84Zrl3d0HeUsSoPyELY7DAwfTvIPNpcm1N/fenUhRbPoH9TCQZH9vRey75gi1hGP1wCWMdqGK56RxDhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c0YMHo+qZ0xyn8C6qR9tiRpQ1Qw+yNFX8SmJLxB9Pojf3tkNY77i+qWtCBicQoaeszbna26lgEir7FCprAO764tmaJNCxDFKEQgXnjBgwm1Ao33Co3Ts7tgXpihDjQ/miUX5jVLjPiMrGT7EHIF+soGfCIFNRuEWTBwG6LvvT4uxqwkQ8PRtRqFlOqPVSNnDf6JymowXLwHNi/eu/VRb59lGhNStXDzkownMmRlDbgNz9Ky2258VbKgjWAaHt72FU3Negv2owe5qmhbzVLMyV5emFqz997qhFEvw96arPSCe85ObOn9sLsETZXd7o50GMtEmsSVIp71CsPNAjID9yXToFhrKGk2RyrG/vG0k3i+aCDCthMY07jylayPgnKuvebEX+wXFlnGQuIsOY2ZkY60APIA80pzz0CVBqDtykasb6zZTAJ7yiV5GGpPPZnQ1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 19:45:43.3695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6a50bf-6703-45c1-77fd-08de9739c0ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2EB7CF87B



On 4/1/2026 10:23 AM, Shah, Tanmay wrote:
> 
> 
> On 3/31/2026 12:53 PM, Mathieu Poirier wrote:
>> On Mon, Mar 30, 2026 at 01:43:03PM -0500, Shah, Tanmay wrote:
>>> Hello,
>>>
>>> Thanks for the reviews. Please find my comments below:
>>>
>>> On 3/27/2026 2:58 PM, Mathieu Poirier wrote:
>>>> On Tue, Mar 17, 2026 at 01:12:51PM -0700, Tanmay Shah wrote:
>>>>> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
>>>>> separate subsystems. In this case, both cores can boot independent of
>>>>> each other. If Linux went through uncontrolled reboot during active
>>>>> rpmsg communication, then during next boot it can find rpmsg virtio
>>>>> status not in the reset state. In such case it is important to reset the
>>>>> virtio status during attach callback and wait for sometime for the
>>>>> remote to handle virtio driver reset.
>>>>
>>>> I understand the user case, but won't that situation happen regardless of
>>>> whether cores operate sync or split mode?
>>>>
>>>
>>> I want to make it clear that this is not same as Cortex-R cluster
>>> configured as lockstep vs split mode.
>>>
>>> This is different configuration between Cortex-A cores and Cortex-R
>>> cores. It is a firmware driver configuration of how it treats cortex-A
>>> and Cortex-R subsystems.
>>>
>>> In the firmware driver, we can configure Cortex-A cluster as owner of
>>> Cortex-R cluster, and in that case, if Cortex-A reboots, the firmware
>>> will also reboot cortex-R cores. This policy makes Cortex-A as owner of
>>> Cortex-R cores. In this configuraton this patch is not needed, because
>>> if Cortex-A reboots then platform management firmware will also reboot
>>> Cortex-R cores as well and vdev status flag will be always 0.
>>>
>>> In another configuration in the firmware driver, Cortex-R cores can be
>>> independent of Cortex-A cores. This means, Cortex-A is not the owner of
>>> the Cortex-R cores. Both are independent subsystem. Only in this
>>> configuration, this patch applies because it is possible that Cortex-A
>>> reboots while Cortex-R doesn't and Cortex-R still runs as it is.
>>>
>>> So only in the second type of configuration, this patch is needed when
>>> COrtex-A running linux reboots and when driver probes and tries to
>>> attach it can find that vdev flag is not reset. In the first
>>> configuartion if linux reboots, then It's guranteed that vdev status
>>> flag will always be in the reset state.
>>>
>>> If you prefer I can extend the commit message with all above details or
>>> put as comment in the attach() callback. Let me know which do you prefer.
>>
>> Ok, that clarifies a lot of things.  Please add the above as a comment in
>> attach().
>>
>>>
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++++++++
>>>>>  1 file changed, 46 insertions(+)
>>>>>
>>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> index 50a9974f3202..f08806f13800 100644
>>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> @@ -5,6 +5,7 @@
>>>>>   */
>>>>>  
>>>>>  #include <dt-bindings/power/xlnx-zynqmp-power.h>
>>>>> +#include <linux/delay.h>
>>>>>  #include <linux/dma-mapping.h>
>>>>>  #include <linux/firmware/xlnx-zynqmp.h>
>>>>>  #include <linux/kernel.h>
>>>>> @@ -29,6 +30,8 @@
>>>>>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>>>>>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>>>>>  
>>>>> +#define RPROC_ATTACH_TIMEOUT_US (100 * 1000)
>>>>> +
>>>>
>>>> There are some time constant already defined, please use them.
>>>
>>> Ack.
>>>
>>>>
>>>>>  /*
>>>>>   * settings for RPU cluster mode which
>>>>>   * reflects possible values of xlnx,cluster-mode dt-property
>>>>> @@ -865,6 +868,49 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>>  
>>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>>  {
>>>>> +	struct device *dev = &rproc->dev;
>>>>> +	bool wait_for_remote = false;
>>>>> +	struct fw_rsc_vdev *rsc;
>>>>> +	struct fw_rsc_hdr *hdr;
>>>>> +	int i, offset, avail;
>>>>> +
>>>>> +	if (!rproc->table_ptr)
>>>>> +		goto attach_success;
>>>>> +
>>>>> +	for (i = 0; i < rproc->table_ptr->num; i++) {
>>>>> +		offset = rproc->table_ptr->offset[i];
>>>>> +		hdr = (void *)rproc->table_ptr + offset;
>>>>> +		avail = rproc->table_sz - offset - sizeof(*hdr);
>>>>> +		rsc = (void *)hdr + sizeof(*hdr);
>>>>> +
>>>>> +		/* make sure table isn't truncated */
>>>>> +		if (avail < 0) {
>>>>> +			dev_err(dev, "rsc table is truncated\n");
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +
>>>>> +		if (hdr->type != RSC_VDEV)
>>>>> +			continue;
>>>>> +
>>>>> +		/*
>>>>> +		 * reset vdev status, in case previous run didn't leave it in
>>>>> +		 * a clean state.
>>>>> +		 */
>>>>> +		if (rsc->status) {
>>>>> +			rsc->status = 0;
>>>>> +			wait_for_remote = true;
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/* kick remote to notify about attach */
>>>>> +	rproc->ops->kick(rproc, 0);
>>>>> +
>>>>> +	/* wait for sometime until remote is ready */
>>>>> +	if (wait_for_remote)
>>>>> +		usleep_range(100, RPROC_ATTACH_TIMEOUT_US);
>>>>
>>>> Instead of waiting, would it be possible to return -EPROBE_DEFER and let the
>>>> driver core retry mechanic do it's work?
>>>>
>>>
>>> It is not possible to do -EPROBE_DEFER, because attach() callback is not
>>> called only during driver probe.
>>>
>>> It is also called during following command sequence:
>>>
>>> attach() -> detach() -> attach()
>>>
>>> During second attach() callback, we can't do -EPROBE_DEFER, as it's not
>>> driver probe anymore. So I think will have to keep the usleep_range().
>>
>> Right, but in this case the Cortex-A did not go through an uncontrolled reboot,
>> we know the state of the machine is sound.  Do you see a scenario where it would
>> not be the case?  
>>
> 
> Yes correct.  We will hit this issue only during probe, after that as
> long as detach() happens we are setting vdev status to 0.
> 
> Another problem with the -EPROBE_DEFER mechanism is that the time
> between return from attach() and next attach() isn't fixed. after
> deferring current probe, when next probe and attach() happens, we will
> always find vdev status to 0, even if remote hasn't handled vdev reset
> event. So we don't know if the remote has handled virtio reset flag
> notification or not. Where 100ms fixed delay, gives fixed time to remote
> to handle vdev reset event. If needed this delay can be increased later.
> 
> This brings up another question to make the solution more robust. Do we
> have any standard way of handling such a situation? Like in other virtio
> standards, can this situation happen where driver comes up and finds the
> virtio device status not in the reset state? How do they handle it?
> 
> Also, is firmware required to restore the resource table to default or
> initial resource table after getting the virtio reset notification? Any
> standard decided for remtoeproc virtio devices around this?
> 
> Thanks,
> Tanmay
> 

All,

This issue was discussed on openamp-rp call, and it was concluded that
the common solution that works for all vendors is needed for this problem.

The design of the solution was discussed like this:

1) Resource table will have standard resource that will be used to ask
device to reset itself.

2) Device will set the virtio status flag to 0 after successful reset.

3) Linux will poll non-zero virtio status until it is set to 0. If
virtio status is not found 0, then driver probe will defer.

I will implement above design and send new patch series. Please consider
this patch series rejected.

Thanks,
Tanmay
>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>>>> +
>>>>> +attach_success:
>>>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>>  
>>>>>  	return 0;
>>>>>
>>>>> base-commit: d4ef36fbd57e610d4c334123ce706a2a71187cae
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
> 

