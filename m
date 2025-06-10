Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F811DE2A8;
	Tue, 10 Jun 2025 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580052; cv=fail; b=SsacfLOd+TBCOADcR4UQpm0fcSWdhhaefBIj+OGhOSrnbczuwZAkvCA8cpqThIjKEAfR6kVIJj/cKiRAqFL06gBz6ebpQab2qcZjSP6/Mf9P4nf6NvdeZS2vyeeC/3fCHZUSf2qfEVmvEVmJxs9IDl9+V9Ecn1J5oWUlbRGUMBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580052; c=relaxed/simple;
	bh=ITwBHtZGZUGq8qZK9BvRlPNPzoCmVJs5wFRNjZ9tuFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tPFtxzn9j7TKm20F9ZxwouX9I9wV4EURsqSepAzk7PMhITm842izPT0Qc5yWsks1f739zaUAX+r7C32fjzITRbDZC0gq2OLAwomidRE3ISEnFqknUmhXISS3xzAv9AIo4HvVzcg158XSJytpzR0EgQFdlnG8CyIYsLwlFgZxyaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D7T2wscp; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D7T2wscp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTBmlxlYROEq84KHws41MEM7myyCD8Vs7d84un13QvWJ5HAyT7NArZwz//1oExWUTgCV0dB6FZIJqCOGJ+wVjzdcAv3iQ5FzBc30+elCIk4MNsWPIJz+DTfQajT6QFSH8B9NTPoYHlZuEiTDo8RGPIQFZccMN27vEDbmABelz1pKJOdzgwOFy9Umno8CkQ7idzbXxQ40yVjNR+xsgWX9g+i+kQ04HZnbe7vyfllTo6cm+8MIlAKCH9ofGEsEVAm6ttzbeC+K/5iHYh8lNAff0wTQRJSsrlYRDt0c25ZQmfcIVlhAVlhG30CGtszQWL1li0hirshw6AGkLqdXn7f4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHutlkLDpJOQn+VVLBHZNnJSJ/AEMeBUHcHnKJYvtIA=;
 b=o8MfFuPS+2DNZ5Lum0WjoyGd5jaeS/ePqtxcwCTtqzZ4uZKCJUKFcUqpejdawheNLSeISUNmcL+dzGfC+FuJe1oBMwTV329ifbLCtrt6lcIEDnqQnT+HHBVguI/ytLGU7YoGpezfMnASW5Gdb35HMoX7QqVD1MuI7NcXhJLCEyppf/al/BLOvPdpxKS4IuHf6n/B6FzqJr9/epm15PNYOHRtBbUMX9NIT8ZVxN2j+jvzMO1Jcri+ky9oG4e566GHF9ehKimDWGfnTq36lEnfOxcTY5aUOszndATbIgGfYnofiK4Y/1SanF7rvi08KiyZBYGCvio56HN7RuvWRaxntQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHutlkLDpJOQn+VVLBHZNnJSJ/AEMeBUHcHnKJYvtIA=;
 b=D7T2wscpCEKuPRrt9pSblUXDkhiOW3DWE2VLCkKAuyHvRjDaQyOnYpV/fpw8QfTRkbHWWlD+DN//TUGtmuKAOaMGOcJkdRMZ2j3v6BrXXdw9x3YUdAQ7kpZ1LryN/nQ5onayWILmrdyImHhwgigaFupHsI73uDk228rwe023/ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 18:27:27 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8792.039; Tue, 10 Jun 2025
 18:27:27 +0000
Message-ID: <8cf807c4-de59-4280-b7c6-e01ca0749ebf@amd.com>
Date: Tue, 10 Jun 2025 13:27:24 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH] remoteproc: xlnx: allow single core use in split mode
To: Peng Fan <peng.fan@nxp.com>, "andersson@kernel.org"
 <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250609224612.2428151-1-tanmay.shah@amd.com>
 <PAXPR04MB8459348088DB7A4FF4253DDA886AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <PAXPR04MB8459348088DB7A4FF4253DDA886AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0805.namprd03.prod.outlook.com
 (2603:10b6:408:13f::30) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 5298d9d6-5851-47e7-b86a-08dda84c73d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTFTYnBwOU9IeTgwZnJ3QVJHc1g3bXliWGZmbVpmZktHa3lzSitGaDl1QjJr?=
 =?utf-8?B?WDFGM0lwRHBJMkVoRG1zTS9HUTBzTmxqS2h3Tlo4dUxscktGdytuaFJ1bCtC?=
 =?utf-8?B?ZUJLVG5vOWlVRnBJRlhUajFLdUNKNms1ejNhV1RSdXcrNHJHQTlsNXdtQTJR?=
 =?utf-8?B?Y05iTTVvOVN5amNLbFRrUUhEQXpDUzd1YXB5N25YUjNOck03VVNjVUQzUU1M?=
 =?utf-8?B?THNlRWJsWDVid1FRRklQeTZONjJ1Sk5tTG9hNXBKOWQ2bzluUUtRQUYwOUhC?=
 =?utf-8?B?bDNid1JWak9ONE82VWZkL3BSRWNqVm0wc25GbTY4Ly9ZRERRcDZ5L0JET0Rt?=
 =?utf-8?B?RENLVWRrQ0VLVWlVMjlWcW41c20ybUZ2M2hkYW03M3FMeExHR3psNnljaU51?=
 =?utf-8?B?QTAxbko5Vy9ZU3M1SGxPWHY1OVo1TjdmMDFBY3dVQXQzSmtpdTltdjJpVlU2?=
 =?utf-8?B?MDkrM0VmV2dzaERlREZBVHpZcDFXa3E4cEluM3ZtY2ZqZEdYTUJpUVZxZ3Q3?=
 =?utf-8?B?ZCtoSllwRndJaHEyVkpsd0dWTUF0aGxWWHJqMnFtd25PdGVRMmxvU2J6U21Y?=
 =?utf-8?B?dFlTYldRREMyejhYNlUzS0dNaTFvSXVnSHdKYlJ4UmEvbmtHOURWTXJHZ2NP?=
 =?utf-8?B?VzdRaEJtUThVdlBocWYxVk15cjlKemliMTZqZTAwb1kxRS9ieXV4aVVNT0Rw?=
 =?utf-8?B?MEQrSTJlSy9LVlk2MzhKVHdZU1kwbGR3dFJSSzVaczVRU0t4TTVpc2V4Z2Iv?=
 =?utf-8?B?VEpkKzFQVlpET0VOUTk4V1ZHYjM4TW9oOTV5eGR1Y0hKeVhBMDhacmR2UENj?=
 =?utf-8?B?VzBzYkt2aEl1Qi9PNDFRMkRDL3B3MmVYc1lzc2VaVVlDcWRUNVZpbndhVW9n?=
 =?utf-8?B?aVF0enRaVFE4eE1DbEtmdnR3dmRNc1ViUW9hZEM0TDJKdXZNQ2hJR3ExNldZ?=
 =?utf-8?B?Tzl5VTFxcHNBZ09lem1yRDFpckFvRnlrcStRb2N1R2RwK25CdEptcFBENDJX?=
 =?utf-8?B?YmpwcWRXdzFQWjFXSkYvUWR2Yk13ZkhRN2UyWHFiVzJ6WTkvekhCTGw1WWF5?=
 =?utf-8?B?WnRJdnJnUmxadVkxZUdzSURPTlUvWXF6OXluYmluL2ZjSEFyRTZaSFZLRktY?=
 =?utf-8?B?V09NL2I1MWRzblYvNWM4SmJZZ05yRHVXcUtxN1gvVTVvdGtPWG1MYlBlcXEz?=
 =?utf-8?B?a0JRWU5oSDJRM21ieFZGWHRXQnNnMy9uc1RQYldqZHZXYW1qdmpnSDU0TWI2?=
 =?utf-8?B?YjNrZG5rUXpGbUFTNWNHQk9jSTAyaU13WFBTOFdsVDQ0UlJLaTVoN2lJTjVo?=
 =?utf-8?B?dmljam51UFlqMTk1Vk5vQzByTVVqY2JNWG9EdU5neXlGRVJQMnpGS3BtaGtr?=
 =?utf-8?B?RHFFMzdrS3UwbmpSVzJkUEhISUZJa1FtbEtOaDd5d2lOUksxWFFQa1dXZFc2?=
 =?utf-8?B?MGU2UVAycng3Y2w5MG9rczNyQkhubDVGU0hGbjRYNFRjZXlEVE1QY3hGUDNx?=
 =?utf-8?B?ejdSV3N6OTladmo1eFVhdEtOdnJLUFFSelI3a2xKSU1Ec0FFVkFsT0o4Kzhn?=
 =?utf-8?B?VWxpOXdnZERndkxGWjFvVUovUDV3SFRHZUIrakM3ZTcwQ3BDZFNXL0JtRU5P?=
 =?utf-8?B?K3NBTHFtMTlxdW8xektiWjNnNkFVcFo3QUMrcUEyRm8yVms5dU9lT2lleStG?=
 =?utf-8?B?UjkrOGpCWUM2UlZoVWxvcDN6VkE1Z09iYTV5c2ZmakxiZ0ttVHhTY3E5TUpX?=
 =?utf-8?B?RWdxMFBPWFhpcm9VR3RkVVp1Uk9HRTlOMThKWFBLYWVHNXdzelpQMmlnQ2gr?=
 =?utf-8?B?YVlOOTBpbGlXemx1aWtiekpIU2RvbnBSTjROMkZ2M1JpeUR5NllCSmZYM0k5?=
 =?utf-8?B?U0R5V21maXM3bnEzV3kybHpyaEhmeU1VcVZIa1NBMmEvOEZWbnhaNmQra3dW?=
 =?utf-8?Q?2BPxYbWdSNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHRkZjdCWk1LOFBOSTYvT2lEVnRVSEpxaXE4N01nWThOTTN3ajRQMllyMVU5?=
 =?utf-8?B?UFNRNFU1ak5BU1ducU1aN3V5OXZPWXV4L285dFZFRmNpNHNySStiNW81MXpy?=
 =?utf-8?B?Tlh3ZU91eC82OWhqL093OUJaaFBLT1BET082UjdaaCs2Um92WWV0Qm84ZkZG?=
 =?utf-8?B?bFFjNVVqVDVsRDZMdXNTKzVXeVRrZXFnOG15VUpNdWdTNVVzcmtvVmZrR3JG?=
 =?utf-8?B?bnJtU0RmOVN0QmkxZmpoWUN6WllIM3lNTzJMeTFnR3JSeFlXdWk1b0RBTWty?=
 =?utf-8?B?RlFzNGV3NWczYjNvdElkNFZjRzY5eHZxdkJ6d1g1U2Jibzk1c0t5OFN0Smdw?=
 =?utf-8?B?NjVGRTVHOGcwY2RtTmszaGRLQkkvblpMTUJIM01rc0lyU1pYeEpuOUQ2QkJV?=
 =?utf-8?B?SWh4RzNpcjBtRVlNZ1djRHJyK2thTzRHcTNaZ3ZzaEFSZEREL2ZzM1FRQURP?=
 =?utf-8?B?Q3FoMWZvRXFNK3dINEVnOVUrSWx2UXhJcms0TlIxWTFndUFBaEFqODhpMGNV?=
 =?utf-8?B?anE3bm52a3Bac09RaFJ5VDk5VzdIQ1VjbWVDQTZvclBUY2FwZktKSkJTaUV3?=
 =?utf-8?B?VVBRWnhHRGRDdEllOXV0T2ZNNlFGd2hzZmU2RFlVNGtORVBmNE9iWXR3NjBG?=
 =?utf-8?B?RkVTR3lIbGlEeFl1MnA4RXU5djcyN3FDM1NFa1Z2bFZtUHVpQ0d1Syt1b0wr?=
 =?utf-8?B?RHhQcXpabWpncCtzZk5vUFdDOTREZlZSb1RiQ3BFVmZNemoxMVNqS2RJL2xo?=
 =?utf-8?B?dStYQWxwTDBTaUtlNmxVbHZKemJlZExsMkFJNDJTTDhCWUpyblZic3RnTFoz?=
 =?utf-8?B?Uk9CQTFsbVFvQUh0THhoVGhOd1Z4NE02M2M1ZC9vd2g1Um93elpYVnNMdlM3?=
 =?utf-8?B?dUFWY2NXMytZVXBmZXUzUU05Sm1TNVRJSTNBWEZnQUhFaTFoVk5GcHdUcUo1?=
 =?utf-8?B?eXRtYjV2cDhJZ3Y0UWtYZUQ1SGRlMXlYR3FHdVFnRlhiTUJHZDJBaEVUUFpS?=
 =?utf-8?B?VS94Rk5PL1pTcFpack1IUmJnT1V5dlpXd2ZTZ053TkNmS2E1cEtEM3R4Kysy?=
 =?utf-8?B?UzI4VG9tRlliVERLZzl0VzRJcG02OEs0M2QycUNFTjRJMjlJWHRaZCtvN1BX?=
 =?utf-8?B?Qjc3MFhFNDl3TXdGb2EzNzBSYzFlVVZQS2RLQ0t5N1pXVE1LQjdFZ2ZYVzJW?=
 =?utf-8?B?bFRsa2hRMVVNUEJNN2RZTlgxTGNNSjhRd096UTRoQzFDZmFjSjlkbjhxc3RF?=
 =?utf-8?B?TGMxYjl3aXQ5V2JXYWU1TFQ3Qkxob1J2WVJVSGdsdXR0M2FWY1RiMnl4aFhJ?=
 =?utf-8?B?SFRwQ1BhNnlCVGtyR0dWKzhyYWtra1pRclV5UUp2ZFU3aURtRUpteTRyU1Vu?=
 =?utf-8?B?STNaR0I3YmhCSUJ0c1VkMFZDOXNzVFZUN1BKMTgvdHNrQWk5RDlFVEhCbVFC?=
 =?utf-8?B?QURra0czRmMvandnUzZoRUFSbHVtS01MUHhQK3cyMDJERjRGeTh1Z2pZdHR6?=
 =?utf-8?B?MU9tZGVLSTE1MkJYcTNwdzVGYjc5dTUwSkJNR2NCUGhicVdmNWE5dVhIYWxN?=
 =?utf-8?B?QVhzc1RoclJGL3dSNVExbk9lUmk3dEFlbXpLZ1JDOFB1YkE2MnJzVUN3Sm45?=
 =?utf-8?B?Z1QyYmtnaTJ3eGtNWmhpVFcySFpnWng1VGhFMThtZ2R5UWplL29jakgrYkJk?=
 =?utf-8?B?OHE1WFN5UG41VkdFNStGT1hRMWpiZVhoK3ZqSDA0Y3Z1MHQvYWhDR3lkaDVv?=
 =?utf-8?B?eHNNZmg0amZHdkVrNTNaVEVHRi9KZVJ3MTR5UTdJQk1QOWF4QnpMMVJrS2Y4?=
 =?utf-8?B?SFJaVkhYTFdrYlZvT3E0V1dsZVQzRHFvNGJRTU12Zk03LzNpVVMvVDBBSTF6?=
 =?utf-8?B?MVh2clZMTVVDODdJVWRLTTZ5WDdhbERPQWt4anVOVGhwUzBVQmZGbVp6U2hT?=
 =?utf-8?B?VzFpVlBhaE84dHpJbVFONFczYzByeTJ4RHJHTEhlZ1ozcVU2Z1hlbjVWSU01?=
 =?utf-8?B?OFlNbVJJTkpKQ1p4djRiMnZWWjU4alEyUWVXQXArRkI5OGJoR0dlVnJFcFJB?=
 =?utf-8?B?TlBvZjRuUjkybDd1eStETWYwcW42emgybFplS0tIaWxuK3g3c0t3cnVyVzJp?=
 =?utf-8?Q?45WRs5Q5dYkH3xeseskL+YA++?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5298d9d6-5851-47e7-b86a-08dda84c73d1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 18:27:27.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vBuRgWTSIj3PrdPf+chDS6FRu+7ISTU0tWz5dykCVjj1a/FTjmVxs6yCqOUn0vt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604


Hello,

Thanks for your reviews.

On 6/9/25 8:10 PM, Peng Fan wrote:
>> Subject: [PATCH] remoteproc: xlnx: allow single core use in split mode
>>
>> It's a valid use case to have only one core enabled in cluster in split
>> mode. Remove exact core count expecatation from the driver.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 1af89782e116..f314dd5bdb26 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -1339,9 +1339,6 @@ static int zynqmp_r5_cluster_init(struct
>> zynqmp_r5_cluster *cluster)
>>   	if (core_count == 0) {
> 
> "if ((count == 0 || (count > 2))"
> should be used to here.
> 

That's a fair ask. I will fix it.

>>   		dev_err(dev, "Invalid number of r5 cores %d",
>> core_count);
>>   		return -EINVAL;
>> -	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
>> -		dev_err(dev, "Invalid number of r5 cores for split
>> mode\n");
>> -		return -EINVAL;
> 
> 
> Then it is safe to drop this code piece, otherwise if hacked devicetree
> being used with 3 r5 cores included, things will go wrong.
> 
> Regards,
> Peng
>>   	} else if (cluster_mode == LOCKSTEP_MODE && core_count ==
>> 2) {
>>   		dev_warn(dev, "Only r5 core0 will be used\n");
>>   		core_count = 1;
>>
>> base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
>> --
>> 2.34.1
>>
> 

