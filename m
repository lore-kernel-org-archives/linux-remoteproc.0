Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D320DD48;
	Wed, 29 Oct 2025 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761711354; cv=fail; b=NSExGGxDaJn2iEuQpoGlpxN/lxfMg2KNC2ruu+EDvEHRlTlHeFhN3KVF4JNBpycl92/pF6HxVi1Q3LXfT4b6CZszGLoZCx+ZTBbqh4CmwBQ+kwtDYTV0bezp9YumsdrLrLHKeMi1or7leeVrSy+HRFsiadWruJcK+RYGHQehRCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761711354; c=relaxed/simple;
	bh=CloLRCH5ihb/rczTWTazVyyApCF/iRIZq57cyVdSKxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KPIoIwTTlOHT49lqkk+WEgfCbLIAkibWd/OgDxVOJSdmjJK4Qyb0gh3kwsOHUlaV63OSauXYHVMPIpkvvZjVHcgKxs5Zd4yNqj4/WhcPVtE17aE7PXId2asIIcsSJ539xo0sUyfUuZjGTkitpj69V0lunJ6ZIm7xt8Dqwuqb6zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Lu/RiMpx; arc=fail smtp.client-ip=52.101.46.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Lu/RiMpx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhjoI4wCfRRhgFRQ7kt0+KrKLL+gk4404CYLlRDNo+XwBV32NHIVi+k9xl+1kyXS2P8wzL36WvqUfljr5CvrPRnqoHYdbeshHGwxQIuchUSW8s1BVBXrvezjt5gQDV/HTn/HzhCPwr8rNuYW9jpVs6fRthpN3MoRnX3jlwBK38YUj5k0E4Hqikj9r4s4Z9UKq7xMX6OldGgqZDW2mNZaerEje89w5IGfl5EW63tWL2rloPlwClAO9oqgTlzJqf7dUD2UvvFP/TTc4FkjhdloHnW+IQS0tb2ijm6qLPKJkWTCM5fqsKA6BpyLn/kxtVpA5bggrbychEBLyWuI3qWrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUdBRxiA3cOeoCWKUku9TB9V77qDbkVwRsLRchA+OIQ=;
 b=uiNhY6BDiQ5PeTMDJVPrUAwUZYLvnx2cJt7G4Vb7rM+NjWwR6VnTHfOnWsnAdwoX+SF9fe5kcEAKaLX5nH39fiSaPUVZUdHBFwEUkA29B4fzj6kSehvjU9JXVNBqqEMRH4IdlOcePQxtuakVs3ChsTDR1/FeNJYUqmHiIUFsfptywnSJaTvU4gy0o6B5RSPA5Ku6MHrGvVju4jSkEe1XdJoES3FPFZhEg3N8JM22Dlv7Gd+oz07Sjzp3eClKNgk9lXuS9j+amw/Zyk9zLschueifUUIWjg2qiy2TmfARCPwx3yD5UsLYchMtC94dQBUiucrEO8mkNg3dJqUn81YLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUdBRxiA3cOeoCWKUku9TB9V77qDbkVwRsLRchA+OIQ=;
 b=Lu/RiMpxWBSXY2ANIWNfFOEr5hfF/RCxAL7zGmQGD7eh62qQxIYJqAlPEw/j9Xy1ZUUnZkDk2Q3lKjackv953aZCuk7M+4DxRD60Fa8GQcUnQS6Lp0cmYF16k6R9hg5+QPGOmReRKLPmg/IkQr+VqsmEm1Wrn+8ZFM3ck7wrokI=
Received: from PH2PEPF00003847.namprd17.prod.outlook.com (2603:10b6:518:1::64)
 by IA0PR12MB8984.namprd12.prod.outlook.com (2603:10b6:208:492::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 04:15:48 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2a01:111:f403:c931::1) by PH2PEPF00003847.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 04:15:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 04:15:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 21:15:47 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 23:15:47 -0500
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 21:15:47 -0700
Message-ID: <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
Date: Tue, 28 Oct 2025 23:15:41 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
To: Peng Fan <peng.fan@oss.nxp.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|IA0PR12MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 08234d2b-90ab-4db3-e05a-08de16a1d6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1hRMmwrRDVCdzRCZHV0N0tDOWdiakxIV1BxbnFqRERuQTVFNVU2c0M5bk4z?=
 =?utf-8?B?elgySlhlU1lmTkJqR2tDclhYNGE2KzVacUJBNGdKRHExM2tzNEVXTytORDRL?=
 =?utf-8?B?MUFIbE9HYW1MWGU4TG1LeW9PK0I2WjhrMDYrWHI1dTRwYXc1dy9wTXNIdVVB?=
 =?utf-8?B?TWYrUlVraU9RL1Yxd2hBY3FLZnRaUWV2bTRZQ3AybDBnSllKVjRSdElyUEc4?=
 =?utf-8?B?bnlycFFyTWNrSE1rQ25CS0NQRVlKTXZpWTZrK1d5UVJQNjVvQVovUnh0MzQ4?=
 =?utf-8?B?SVZqWjE1ekorQVJ6MWk3VklURmlYWFRxUnF2KzQwLzFLZlJ4bkI2dW9XaHN1?=
 =?utf-8?B?RXozVnlZSnhtNG5pb1UwdTQ3L0laU210SVlzejl5Vk1hQ01Zbzk0NnpqRCtD?=
 =?utf-8?B?MHhMUVdySG1BVm9STEcvS3BPOE5VeGRld0xUVU5PazJ3THQ2elJSUjh2Z0NM?=
 =?utf-8?B?WWlzSjFUanp2RXZNWjNRWCs3VUdWM25mRWlpejdGNEFNK3B6WGpVdFdIdElt?=
 =?utf-8?B?bDYzS2RMSlU5MkRHaFZTYkhqV1AwWGFkZTc4dnN5eE04Sy90OFB2NFNEbzNv?=
 =?utf-8?B?U3dzbUNwbTVlRUZ4bkxmVi9pV0NhWlVJejlhbG1HMlZlb0h3T2dSSzIxWmFi?=
 =?utf-8?B?VlNRTFEwUEJtTnRPTlkyUldmWDl4N1dqUGNWM3pKOHBrNHpVQ1U5TnJLRzRI?=
 =?utf-8?B?Y05HTjgvU2wvWjBTL0pxMkJpejBCWUFQU29Kd3BKOEpMRldGOWNERGpYV2JL?=
 =?utf-8?B?Y0t1SExMd245TVVHVTJBbC9SWEpzM3ZZMTUwNXhDaXZHbXNiVWs0ZzA0Slkv?=
 =?utf-8?B?M3V5c0xaWkhaZ094VDRaSDd1T2tqNDlQN0ViOHd5YTRKTHE1ODRsNGUxT1p1?=
 =?utf-8?B?NDZvVnJQb1FaSUhBcDRWb1k1cjFSVGFwVHZ4ekhDZFB6TGxFQzlXVVdtUzJE?=
 =?utf-8?B?ZjZLMnpiRmswQkN5RmRVOWZOWW9mM3hEYkV5ZmNnSisrYTBnYXFsNXh4MU93?=
 =?utf-8?B?bE41SE1VdFdqcytZaXpwSU1HMzVGVUxHUXo3bFA2UGRyeHB2UDhMemNPZm5S?=
 =?utf-8?B?QjdKYmY2bnJnOUxGS1hVa0RnZTNOTmNYT2F2TTE1WDFWZWtLZjNBcS9zUS9z?=
 =?utf-8?B?UzNldnZzUzlsT3c4a2Y2S0xUS0JYS2VFTGpVNURsZmZ6bXVOOENsUm50N0lE?=
 =?utf-8?B?YndLWFNob1c0RkljNDZtdFg5RzMyUWdzcmU1UVFkY1FtRkQrRkFZbGx4K29a?=
 =?utf-8?B?dTh2Rm5Mc05zdGc2a0l3ZFFMZUdOaldjK3pENE5EUVVJd1ViaTlKeEl3WjN3?=
 =?utf-8?B?UVlrMWxiemt4SDQ5a2Vad3FXc1Z3UFF5U0JRVFFnL3pURDhONFJLbEN0NXIr?=
 =?utf-8?B?aFBQVTQ1ck5uSnY1YkJjbXRqWGZUdy9KZHlMMVpBT1dhTW96ZXBhdzJ2QTVk?=
 =?utf-8?B?WlJGaEtyZExlNkNEeGZqY0kzN2o2UE5CQjNaUmp4OGxMcmpsdWtJazR5L3h5?=
 =?utf-8?B?azVjZnpDSkVmTGxJeWVkVjdrY1NsU1VZdEhDUE5KcDFRUjJIdlRweXBTclRF?=
 =?utf-8?B?Rmo1SWxOVHVGMnZRNFRhMHl5dHE1SkNBRXN3T05xZTRHdnR1THh1aEZCaXln?=
 =?utf-8?B?V0hBNE5SdXBzUnM0dXBFMVNKR0dDMzNQbVEwY0ZaUjJ0RllIQzl5blE3R0hV?=
 =?utf-8?B?b2FrblJtL0VFTGlTa0xiV0xheStyMHFia2U0UjRCVjl3R2l3NGtjRjhQMCtm?=
 =?utf-8?B?RHBWdTBiVHNqSERUb2tvQSsxRWFnWjdwWVhuQXB0V0loblhxU0hZdVc5cWhE?=
 =?utf-8?B?NXhRZk1IYzQ0ejdxTUkrN0RkditUTGpOZUNLUUxkYXA4WHRaeGZFS09LTUJG?=
 =?utf-8?B?SGZZcnhPVHRvSmtXZWxmVjVIV3ExaTgyVHhjU2lDeFpib1VhSEtWK21reTNK?=
 =?utf-8?B?YU4rWUEzSmt4NnM2WDZEcEJXMW93QjJlRHkwM0VHcGF0Qlczd1JtbGJaeDRM?=
 =?utf-8?B?Tkc4RFZaQndSU3dQVEw3dXloVTJPRXBRYnZyYjN0SXpwNDFWMmdZQncrTmoz?=
 =?utf-8?B?bHgxNm91bEdiekJNdmRGbnI4QUpNTkpadStEWTBuaWtGNzZ1V0pORVdpbVZm?=
 =?utf-8?Q?qHH0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 04:15:48.1099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08234d2b-90ab-4db3-e05a-08de16a1d6c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8984



On 10/28/25 10:24 PM, Peng Fan wrote:
> Hi Tanmay,
> 
> On Mon, Oct 27, 2025 at 09:57:28PM -0700, Tanmay Shah wrote:
>> Remote processor can crash or hang during normal execution. Linux
>> remoteproc framework supports different mechanisms to recover the
>> remote processor and re-establish the RPMsg communication in such case.
>>
>> Crash reporting:
>>
>> 1) Using debugfs node
>>
>> User can report the crash to the core framework via debugfs node using
>> following command:
>>
>> echo 1 > /sys/kernel/debug/remoteproc/remoteproc0/crash
>>
>> 2) Remoteproc notify to the host about crash state and crash reason
>> via the resource table
>>
>> This is a platform specific method where the remote firmware contains
>> vendor specific resource to update the crash state and the crash
>> reason. Then the remote notifies the crash to the host via mailbox
>> notification. The host then will check this resource on every mbox
>> notification and reports the crash to the core framework if needed.
>>
>> Crash recovery mechanism:
>>
>> There are two mechanisms available to recover the remote processor from
>> the crash. 1) boot recovery, 2) attach on recovery
>>
>> Remoteproc core framework will choose proper mechanism based on the
>> rproc features set by the platform driver.
>>
>> 1) Boot recovery
>>
>> This is the default mechanism to recover the remote processor.
>> In this method core framework will first stop the remote processor,
>> load the firmware again and then starts the remote processor. On
>> AMD-Xilinx platforms this method is supported. The coredump callback in
>> the platform driver isn't implemented so far, but that shouldn't cause
>> the recovery failure.
>>
>> 2) Attach on recovery
>>
>> If RPROC_ATTACH_ON_RECOVERY feature is enabled by the platform driver,
>> then the core framework will choose this method for recovery.
>>
>> On zynqmp platform following is the sequence of events expected during
>> remoteproc crash and attach on recovery:
>>
>> a) rproc attach/detach flow is working, and RPMsg comm is established
>> b) Remote processor (RPU) crashed (crash not reported yet)
>> c) Platform management controller stops and reloads elf on inactive
>>    remote processor before reboot
>> d) platform management controller reboots the remote processor
>> e) Remote processor boots again, and detects previous crash (platform
>>    specific mechanism to detect the crash)
>> f) Remote processor Reports crash to the Linux (Host) and wait for
>>    the recovery.
>> g) Linux performs full detach and reattach to remote processor.
>> h) Normal RPMsg communication is established.
>>
>> It is required to destroy all RPMsg related resource and re-create them
>> during recovery to establish successful RPMsg communication. To achieve
>> this complete rproc_detach followed by rproc_attach calls are needed.
>>
>>
>> Tanmay Shah (3):
>>   remoteproc: xlnx: enable boot recovery
>>   remoteproc: core: full attach detach during recovery
>>   remoteproc: xlnx: add crash detection mechanism
>>
> 
> I gave a test on i.MX8QM-MEK, there are failures, 1st test pass, 2nd test fail.
> Without this patch, I not see failures.
> root@imx8qmmek:~#
> remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
> Partition3 reset!
> remoteproc remoteproc0: handling crash #1 in imx-rproc
> remoteproc remoteproc0: detached remote processor imx-rproc
> rproc-virtio rproc-virtio.1.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio0: rpmsg host is online
> rproc-virtio rproc-virtio.1.auto: registered virtio0 (type 7)
> rproc-virtio rproc-virtio.2.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio1: rpmsg host is online
> rproc-virtio rproc-virtio.2.auto: registered virtio1 (type 7)
> remoteproc remoteproc0: remote processor imx-rproc is now attached
> virtio_rpmsg_bus virtio1: creating channel rpmsg-openamp-demo-channel addr 0x1e
> 
> remoteproc remoteproc0: crash detected in imx-rproc: type watchdog
> Partition3 reset!
> remoteproc remoteproc0: handling crash #2 in imx-rproc
> rproc-virtio rproc-virtio.1.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio4: probe with driver virtio_rpmsg_bus failed with error -12
> rproc-virtio rproc-virtio.1.auto: registered virtio4 (type 7)
> rproc-virtio rproc-virtio.2.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio5: probe with driver virtio_rpmsg_bus failed with error -12
> rproc-virtio rproc-virtio.2.auto: registered virtio5 (type 7)
> rproc-virtio rproc-virtio.5.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio6: probe with driver virtio_rpmsg_bus failed with error -12
> rproc-virtio rproc-virtio.5.auto: registered virtio6 (type 7)
> rproc-virtio rproc-virtio.6.auto: assigned reserved memory node vdevbuffer@90400000
> virtio_rpmsg_bus virtio7: probe with driver virtio_rpmsg_bus failed with error -12
> rproc-virtio rproc-virtio.6.auto: registered virtio7 (type 7)
> remoteproc remoteproc0: remote processor imx-rproc is now attached
> 

Hi Peng,

I don't understand why it should fail. The patch simply implements 
rproc_detach() -> rproc_attach() sequence.

In your case, when you do detach -> attach via sysfs that sequence 
works? If that works, then crash recovery should work as well.

Could you give steps how do you generate the crash?

Thanks,
Tanmay

> Thanks,
> Peng

