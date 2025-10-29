Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013019.outbound.protection.outlook.com [40.107.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA22221721;
	Wed, 29 Oct 2025 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781919; cv=fail; b=mwdX+7EUayyAJHbQ50Qbwc2OzHYMOiBcjTp/55AXvYp30UcUIhjQUUvy5U87Y3it+hekpjSndbM5vZq3W5rqjILzX5F/u3Q2DaXoL7U5kJNieKfCcIT7nzGILUv8FTHmcW3AwdOTtVh1D2uMi9dE/kVxzIq4eXqJcmvSuN9CO4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781919; c=relaxed/simple;
	bh=Hlor3HQDGIDgJe/6EAfwzd8gx2l/nw5fyoAgwS7bk0I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=jDRe9FuD1zjSAn5TI5ilGHunYYREZS3eAY7bDDNPPJuiO/IPI/lD3bkEyq/P3JqHBH5WmS3PDzg8Ufo9J4g/MPaxDzvA+9yoY9wMX7lQP+3/ZO4iHoA0LuAV36Zl6tr8trKmGrH73Nde5QA1Cp3q5Ny83V51dUnPqSqpucnqgwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KNd1loKx; arc=fail smtp.client-ip=40.107.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KNd1loKx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlAW4ryDqUcS27jirIViJC7eUVcdRIQyEAh+ABfAknOGQxT9B2GTEqNCT1fZDDIT5m94xrZwpyc7qWbpkwHe/gKj1H5QC3eXmw7SnZppmV8tb6f+VOxnPFNJVO//1DDkgVbU3SMacJL//LnilCxs/jB6WyzNu8rBH5Xt1/RMHX9yBJ08QZnUIxVpUw3yCspcFqVcp6zzjm+svzO82uREQxdM8GWrPdV8EcZNLZy7SiQyPicWEU/ALWb1lOoGQBKUBrlpbvs1Z33uSRNCNY/TjTpaCdaMdWq9xhlw0XhCS2RvLnJiv1lXnwPG87NUBwkmvltCEmknJiM5BnBzcDxm5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTaOVVnHtGZZWoXe5ttWNLISj+GvZLDZ+Hemtcuf2fI=;
 b=LDbrb1Wjj41mEhqZMreKATKrAEx7SbqKi1ALA2pd0cPz27IX8Ky3ksafNG87ysHudcixnNFYDrkMJB4ePHscVuJl9uxhdK93zAhAY2EyRQhZmWuY4BvGCdGVAyOl5WbmlnxJGwBCBaTc6k+hmMk+b/PZ5UJ8XRcdrRVba0toTH41R9pYeYtZf8w9xPfvqAFrMwOtYyuGrYp3s9dLutR6cdcinvgcv+5UevaR1FKZPGQE5TjgCEclKojTE+YC4Aq2lG0FosVriNRc/iElgwPgU53lRPHnoJNM/cnd4crxJqhCrTFJUwVQ9sy1c7uu6l/MgAAqR7gsvm/r90V+qTF8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTaOVVnHtGZZWoXe5ttWNLISj+GvZLDZ+Hemtcuf2fI=;
 b=KNd1loKxkqDmDLLbnhhIGVv76HqTylEvFmunn8SwDZx07y96mzNDusMtornKtJpkTXR6tUtV0pwiz88sGEEqPaircRzqfxqJnA3z6+dPFzAQ784hv3oHsSojeRdg94PiJLTYyYpr751YUCB00d90Bf+TUDZHzkgimcXohFdE0qY=
Received: from PH1PEPF00013301.namprd07.prod.outlook.com (2603:10b6:518:1::f)
 by IA1PR12MB9740.namprd12.prod.outlook.com (2603:10b6:208:465::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 23:51:54 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH1PEPF00013301.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Wed,
 29 Oct 2025 23:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 23:51:53 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 16:51:52 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 16:51:52 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 16:51:52 -0700
Message-ID: <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
Date: Wed, 29 Oct 2025 18:51:51 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
From: Tanmay Shah <tanmay.shah@amd.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
 <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
Content-Language: en-US
In-Reply-To: <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|IA1PR12MB9740:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b0733d-493d-4434-5ca5-08de174622ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDJmVWhoOEIxNUtxWlRhMXBSajhwTnJUZExzQWo2QlBDaDdvbERwTWtXTnJw?=
 =?utf-8?B?a2tySXpnc200K3JlWVBIeEpoK0RIMUZVaXpBNCtFQVA0WHRkYXIwWmdFbXM2?=
 =?utf-8?B?MXA0MTZlY2RlYm4xOFRSZTdyMXY2Ym5IR0JwQ3g4T3NNaGNGYjd5Mi81dllH?=
 =?utf-8?B?R0QyRVBXaHEwaG1pdHBlVDkrSzBHb2UxTkZ3aGNZekNWNElWRnVrWXE3ZUc4?=
 =?utf-8?B?N0pzaUdubGZFLzFMY21zVmh1KzhJRmU5OGZEeE1yRW1RbmFPNzcxNDl5OXVP?=
 =?utf-8?B?UVN0dVZkeWtLYngrYXFSalJkRGZpU0UzMUlCSm5TU3dDais2VFRhMzcwZmVr?=
 =?utf-8?B?UU5sd3pESTJ2WENhL2t2OEpyR3JJNFh1dVA5TFRHOE1CdThBRE5FT1lWZjBJ?=
 =?utf-8?B?dkNyQ09NYVRBRTFaRHlsQjVXUVNwU3g0b1Bwa1VOck9HUW5UV2dRemxiVFpE?=
 =?utf-8?B?T2oyMk90amh4SGFpM3J5L2FhSkpkOUorNVFzQzNEMVdwQnk2SFM2N3RoWWV4?=
 =?utf-8?B?UURyVmcyWjBoWnNESURSdGtGYWduYXQzcjNOVDN4akZ4S29Oa0NGaFZMQTF0?=
 =?utf-8?B?S0FPVG1kVnpzNEk0c2QwU3RaMHMyL3pVZWhPS2dHWXBUcUFpWlhpdEVPdGVF?=
 =?utf-8?B?OGNodHJHbXVLY3ZjQkJsQ1grdjRyaGt1OWhVRnQ4NEYyVDRTWmE1cWxjZ296?=
 =?utf-8?B?Y0ExeEJ2Y01BRlB4Ym9CWmdCZEY3VkNvM1FHZmlXRzJxbVhFdmFjVTB3SHAr?=
 =?utf-8?B?RTQvV2Z1K3lqU1BFWXlmcTFoTVhCUXFJNmhYdlh1SkpCZzdyajV5bCtGZ2VQ?=
 =?utf-8?B?V0N0RWtvdWtNaE40NC92WUFQSWxKN2FjcFY0VTMrWXBzWUEwWC9HTjREenlE?=
 =?utf-8?B?NU9jT3o3WUROc0I2anU0TnlQS253eDNGaXFpQzJ3SGRnTURGZHpRVjBobFNZ?=
 =?utf-8?B?cXJJdjdIb3hUWG1COXhETmhzcERUOGI5OGtIWUFzbXVtcFZNdnp3UVBmUENl?=
 =?utf-8?B?N1hKaHA3RXNITm1sT0VjK2c2eTA2bW5CVUVIMU9PS1VkQW9HWHlTa1J5M0RZ?=
 =?utf-8?B?ckNzYVUwYmtUc1RQR29BNEhXUFNhMGI4YmVTckhQZERsOGM2WkdPS2Z0aFJL?=
 =?utf-8?B?WUZTS0hNaFZna0tJTXRTZVpEa2lLVnlxaDRra05WNnNuRE8wbVJOZHBmOG4w?=
 =?utf-8?B?SFVjdnhhL2NPd01HUEI2Y0ZhdXZ3dFR1ZDBHREpkTDN1UW55bFd2dzdVWWFy?=
 =?utf-8?B?VmlBY054ZTFHcklhRllpMHJyMVF4Qk5FQWpOdm1jc2RsVkJkOVNlcDBSRmFO?=
 =?utf-8?B?Nm9zNU5BU3lseU9WcVROb3lwT3RDRHpneFBSTGphQUo0a3BPb3dxYXRzN0gr?=
 =?utf-8?B?bElnUWFlR25yTW55UjdvNHg3bE1yMXg4Z0tNSmJCaFRFT3hIaU5tZGhDT3pX?=
 =?utf-8?B?N2lpRDU4cVlPckZMZnFucU1VYW02SnVzZmRuMkJKVWJ6NlM2YmpRQ0VMQkRQ?=
 =?utf-8?B?YlhhOVYveEFFWGxleEdQeTd6SnVVdnBWdFZxTGg5b2hrcW1sbjNZc0s1OXdn?=
 =?utf-8?B?UUpyY2hrdkN1YUNXdDJERUxkZjIxUHp2b1ozNmxqQm1YbjhpTjFFaWozY0I0?=
 =?utf-8?B?eXFhUGUyVHFZbVRjbnFIMkp5MlJrcFFPM3pDR04rYTZiK0o2Lzg2cTlnUlhn?=
 =?utf-8?B?R1c4Zlo0NmcxTFVoeFlwbDl3YTRwc29sbjNOMTJIZ05YeHpjS1hCUGovRmhV?=
 =?utf-8?B?aUFXenJLR0ozTlNKQjJoVDBQbEtaSTV3TzMwK1h0VnoveStHU2lQT1RmaTRx?=
 =?utf-8?B?T3dualFPeU5SSzVYN05PVzlRODFGdC9IVHdwN3ZRWFc2MVIxM0lldW1LRVA0?=
 =?utf-8?B?TnYyR3JYZUttWTcyN1k5OUxGQ0pBUnlJZldMKysyclBISitwdVk2ZVRkNjg0?=
 =?utf-8?B?MEVndlpoL1psMGF2TVNYNHlOZWZkbkhVNGFFRjdGUzh5QmFXdStTWE9IRU1v?=
 =?utf-8?B?TTc4TERrbkpCVFFJTEtQU0t3S3IzZHRTVHdHcmRYZHN0V0RiTFNSVDBXZXdn?=
 =?utf-8?B?Tnc1U0J3M1lIMEM1cTJWS1lQUVdCSXYvOERXMXlPUU10SEpET3dSeUh6RU1v?=
 =?utf-8?Q?LVxE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:51:53.3248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b0733d-493d-4434-5ca5-08de174622ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9740



On 10/28/25 11:15 PM, Tanmay Shah wrote:
> 
> 
> On 10/28/25 10:24 PM, Peng Fan wrote:
>> Hi Tanmay,
>>
>> On Mon, Oct 27, 2025 at 09:57:28PM -0700, Tanmay Shah wrote:
>>> Remote processor can crash or hang during normal execution. Linux
>>> remoteproc framework supports different mechanisms to recover the
>>> remote processor and re-establish the RPMsg communication in such case.
>>>
>>> Crash reporting:
>>>
>>> 1) Using debugfs node
>>>
>>> User can report the crash to the core framework via debugfs node using
>>> following command:
>>>
>>> echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash
>>>
>>> 2) Remoteproc notify to the host about crash state and crash reason
>>> via the resource table
>>>
>>> This is a platform specific method where the remote firmware contains
>>> vendor specific resource to update the crash state and the crash
>>> reason. Then the remote notifies the crash to the host via mailbox
>>> notification. The host then will check this resource on every mbox
>>> notification and reports the crash to the core framework if needed.
>>>
>>> Crash recovery mechanism:
>>>
>>> There are two mechanisms available to recover the remote processor from
>>> the crash. 1) boot recovery, 2) attach on recovery
>>>
>>> Remoteproc core framework will choose proper mechanism based on the
>>> rproc features set by the platform driver.
>>>
>>> 1) Boot recovery
>>>
>>> This is the default mechanism to recover the remote processor.
>>> In this method core framework will first stop the remote processor,
>>> load the firmware again and then starts the remote processor. On
>>> AMD-Xilinx platforms this method is supported. The coredump callback in
>>> the platform driver isn't implemented so far, but that shouldn't cause
>>> the recovery failure.
>>>
>>> 2) Attach on recovery
>>>
>>> If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
>>> then the core framework will choose this method for recovery.
>>>
>>> On zynqmp platform following is the sequence of events expected during
>>> remoteproc crash and attach on recovery:
>>>
>>> a) rproc attach/detach flow is working, and RPMsg comm is established
>>> b) Remote processor (RPU) crashed (crash not reported yet)
>>> c) Platform management controller stops and reloads elf on inactive
>>>    remote processor before reboot
>>> d) platform management controller reboots the remote processor
>>> e) Remote processor boots again, and detects previous crash (platform
>>>    specific mechanism to detect the crash)
>>> f) Remote processor Reports crash to the Linux (Host) and wait for
>>>    the recovery.
>>> g) Linux performs full detach and reattach to remote processor.
>>> h) Normal RPMsg communication is established.
>>>
>>> It is required to destroy all RPMsg related resource and re-create them
>>> during recovery to establish successful RPMsg communication. To achieve
>>> this complete rproc_detach followed by rproc_attach calls are needed.
>>>
>>>
>>> Tanmay Shah (3):
>>>   remoteproc: xlnx: enable boot recovery
>>>   remoteproc: core: full attach detach during recovery
>>>   remoteproc: xlnx: add crash detection mechanism
>>>
>>
>> I gave a test on i.MX8QM-MEK, there are failures, 1st test pass, 2nd 
>> test fail.
>> Without this patch, I not see failures.
>> root@imx8qmmek:~#
>> remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
>> Partition3 reset!
>> remoteproc remoteproc0: handling crash #1 in imx-rproc
>> remoteproc remoteproc0: detached remote processor imx-rproc
>> rproc-virtio rproc-virtio.1.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio0: rpmsg host is online
>> rproc-virtio rproc-virtio.1.auto: registered virtio0 (type 7)
>> rproc-virtio rproc-virtio.2.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio1: rpmsg host is online
>> rproc-virtio rproc-virtio.2.auto: registered virtio1 (type 7)
>> remoteproc remoteproc0: remote processor imx-rproc is now attached
>> virtio_rpmsg_bus virtio1: creating channel rpmsg-openamp-demo-channel 
>> addr 0x1e
>>
>> remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
>> Partition3 reset!
>> remoteproc remoteproc0: handling crash #2 in imx-rproc
>> rproc-virtio rproc-virtio.1.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio4: probe with driver virtio_rpmsg_bus failed 
>> with error -12
>> rproc-virtio rproc-virtio.1.auto: registered virtio4 (type 7)
>> rproc-virtio rproc-virtio.2.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio5: probe with driver virtio_rpmsg_bus failed 
>> with error -12
>> rproc-virtio rproc-virtio.2.auto: registered virtio5 (type 7)
>> rproc-virtio rproc-virtio.5.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio6: probe with driver virtio_rpmsg_bus failed 
>> with error -12
>> rproc-virtio rproc-virtio.5.auto: registered virtio6 (type 7)
>> rproc-virtio rproc-virtio.6.auto: assigned reserved memory node 
>> vdevbuffer@90400000
>> virtio_rpmsg_bus virtio7: probe with driver virtio_rpmsg_bus failed 
>> with error -12
>> rproc-virtio rproc-virtio.6.auto: registered virtio7 (type 7)
>> remoteproc remoteproc0: remote processor imx-rproc is now attached
>>
> 
> Hi Peng,
> 
> I don't understand why it should fail. The patch simply implements 
> rproc_detach() -> rproc_attach() sequence.
> 

Hi Peng,

Thanks for testing the patch. I appreciate your quick response. I think 
rproc_boot() should be used instead of rproc_attach(). That should 
probably solve the issue you are facing. I will send v2 with this change 
for you to try.

Thanks,
Tanmay

> In your case, when you do detach -> attach via sysfs that sequence 
> works? If that works, then crash recovery should work as well.
> 
> Could you give steps how do you generate the crash?
> 
> Thanks,
> Tanmay
> 
>> Thanks,
>> Peng
> 

