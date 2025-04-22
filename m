Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C61A76BB;
	Tue, 22 Apr 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745346614; cv=fail; b=ZgTBgYiERG+2nfBRVIhQvKkapslccjaz0YNaRESlOy61cQu3+LQFtD1JGtKFJhapTHUY9leBq5YcOIfmhkIz4KJiZlke1PjZzQzWZZAMn7UioXmo7A9AO7pk0xBv1bHOpaLqgqPnhd1h/rdnZCLnrNjLkMwCPteyoI2VZdojF30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745346614; c=relaxed/simple;
	bh=O01Q5Xgij3xcIBAzwjuWpHpH4WNQTkJideHGQBPT2rc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AmT5LC5pGCbme5zLdbtuXSCnGsrBJDTfdyaDg/4zBdJdJxegPi/Ihhb9yvMNBEp1XWFo/zcJvXs757z6hc8Qz5k9Hr1Xg10MgUaXmFsFt8x6m8v6Ri4uTmhHOvp8jf+c/0cMX20ZyIQCs0KWfcE9NY/VAP0vFpnwwwR2Ih6sVeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QeTmn2pJ; arc=fail smtp.client-ip=40.107.243.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QeTmn2pJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdPQ/c5XURsQmM5P4WA8YTEuasqu0Ub2dhTn/8pkEO31WgpOwK0+tSzAFXQMtJxDxJpxgMRcA6WyT2R4JgxJ319orSXn7kqbVDCNgq5RbVbJur8A6ub6E0b9I9udVv45T6JegouLY0Hfmr/iK5xVbOxiZ2Yc/d6TP1FCGR1Iqx99JBTvOoUXD3SH6GFBonP/UvQAko7FmfTSMpaCWM47o+6A+3kCLr5kgsp5L5CvHCA4ph750ECjrd1K3bnLIfanVTTSiXBx6CzPVagg7nP5oxczH1jNAdB4tSdOV6sLsrhbHxLvC5oX3inm8VG36KzDjzMbqSSsXFYlJ25qXnjTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3Csvzz5F1E38xNC9e3vNNM24D8/XaL0duoh9pAQu9Y=;
 b=LYdJHrYpjXhS6bp2uJVtDR/dFcmqPrlPyT1AxQH/CUHseJ/CPNbJLMhY2qnK9tM4npI5K+xQRUw5FONegyD2nooqOD8uhdyg+5htcU0GUW72LKqWP61fbHL54WpP/g0ky08nmgNY2UBVstWCHQycj6kkEntDvHz3OotqyG/9N2QjG5R75MPpwlXpu1qjxGvQiw4QvM3GiA87e7oc6FofUPbrH6kBh6z6hZs07iGz2O5vYd5/H0cJtKsakKRZLxTY9DnPOAF+sB83BdTzWOb3I3xyGz4+NYXghvfv3pHejvHhvYqWwQRhe0KzhIm6W1qB94oXdsg7qNrnARm75HOD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3Csvzz5F1E38xNC9e3vNNM24D8/XaL0duoh9pAQu9Y=;
 b=QeTmn2pJWYsIWGK1fP7yvFGDhlBwhWyxEAPDlYYzoE9adDdaDCvQpTnzfjl+FJkyW4DyEmYu0sguhmP2J0hNAZJYQXrD4hifrJFmbV2amIrbnz5h5qR0w3dPUWua+rXf30r9JYPt7jCIK2biTJ+p2nWpXuFzrSj1ao7gSm7cSus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 22 Apr
 2025 18:30:10 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 18:30:10 +0000
Message-ID: <7dba1e4c-a7b8-4e18-82a3-db2a7f4fbe5c@amd.com>
Date: Tue, 22 Apr 2025 13:30:08 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414184600.1166727-1-tanmay.shah@amd.com>
 <aAe80OlwWENHI2I9@p14s> <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
 <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <CANLsYkzDCy1QWY23uwVz_35tjdUdATqc66QA=sp5=gSY2vUnRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0123.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::10) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 741c5934-f957-4fdc-8042-08dd81cbb6f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aCt4ZitLYS9CRzBqQzVNVXRiVnFsN1lCMlA5RjNPc0JIUHdGdFJ3TnROd0lq?=
 =?utf-8?B?blhkWmNZNDN6RFlKM1JIL3piK0lrZWZ6VU1oczkxbzNHNWhCbktQUlArcHE2?=
 =?utf-8?B?WloyK05seHpDS1FTU2RHUndDOUNCT0NhUU5NSkFGRkdwZ3A3RTdPdkU5RGdo?=
 =?utf-8?B?b3pKTHYwanVoU3dmZ20xSXUzd0s4eDJxdm9CSnVIZXpTcllOL3dPVk1LRXJG?=
 =?utf-8?B?SG1DL1ZxQWhQc0xrYlExUWM1a0pUanZUK0ZOci9zT1I2U1hRZSs0em1DRjNF?=
 =?utf-8?B?MldKNDVKVTIrR016Y2h2Y0ZHR3FUbi8ySXdwVXF3aXVBeWNZdk1FRVpyeXJP?=
 =?utf-8?B?K2Z2ZStKUlUyaHFsM0Z3WXdkQ0ZCQUs5R3UyZGtqYmF4K28rTnBKcnBqQXlS?=
 =?utf-8?B?TVowaWJQSzlhc29iMEdTRGQvT1JvM0FleEpaVlYwSE9wdmtHNnFqMkxVOUxK?=
 =?utf-8?B?K2lDMEdzTFdEQ25Iblp0ZEY5bDhHZTdlWmc4SXptQUJtcXZFeEZ5ZFEvR0tI?=
 =?utf-8?B?dDVvaExGWkg5MjQ3ZXk3WXdtYms2WDVUT3FrTzIzcDJWRU9hVmh0UmJDdnBG?=
 =?utf-8?B?UG9RclRoOHhVS1AzZ2paeXcyT0dOTjJVb2pIZnlEY0dIamlTUmZvY0ptNC9i?=
 =?utf-8?B?UGZVVnFlLzZhWjh1Zm8zMG90Q09pZHRYRmFKNWdPVE4wUE9Sb2lHTEh0S0Vi?=
 =?utf-8?B?L2hJcXB0amlueGp6M1JFV2pXT1paZEJvTS9hREFHejB4aERDV2FVUWpWMlZB?=
 =?utf-8?B?MWNuMWpqWUN6aURvZjU0QkxTaUVNalg4eE1uKzdtQmdrTjgxMTFVZTZCTi9h?=
 =?utf-8?B?cDFDNzFUOFgwaWpxMmZxTitBd25jc0Q1TVZrQ3pTNlBrT2JCTkRDd2JkdHdt?=
 =?utf-8?B?S1owMWdkMUh6MFNBZGhGMlg4aUJsLzV2TGhlZlJtNWhsR1Rsb3E4cnd5QUtu?=
 =?utf-8?B?MWwxZWFTUW01Slh6NVFzMUVNemxrdlRYTjMvS0dBSG1rOVJYdnhvTGZ6MDRX?=
 =?utf-8?B?MURWTnFBZzIzMWN0clluTm9FSUJVVlowNnZmSGNTL1pjNjh0QjlzU0RRcWxy?=
 =?utf-8?B?VllYQXNJaUwzdVd6TCtqZ3krZndZOWhDV0VYSGNWaVFweXQyRWhtNXBQbTQ0?=
 =?utf-8?B?cHZvcENTZnZ3RUl3MVdsbU12UFVla09MOFVRenRnWE1ZanMzVmFKWGUvRndM?=
 =?utf-8?B?bXhOREFqZ0wxSmd4NU83UURKL0NDbmZteWk0V1RSWWh1M08vSXR1Qi9sYXV2?=
 =?utf-8?B?TFVSdVhFdzNLSDVnMW9sd0J2YWQ2TTlqREhJeUJZcTNxOXdOWVc1VHUzQktU?=
 =?utf-8?B?TXhLaWtPU0w5L2doWjBRRXdMN3dubTgvNkVtbE1OUE1IQU5mbFF5bUUvWk10?=
 =?utf-8?B?aDcvbDQvS3pPdjByNEE4R2pHeFBXd1R4VVpxREE2U01Gb0F1a09OcERvalNs?=
 =?utf-8?B?bmVNeHVXcWpOZmJvbHRyYmgxS2wrcW9HUFAzV2g0ZU1tbUc2SHgwbkp0WWc1?=
 =?utf-8?B?eVdDeTAvbVZPMlpXMEFJQ1JuN3lkN1FtYXdhYjZMblR1dWlZWk9GaDIxUjlC?=
 =?utf-8?B?a3JUeHo1ZGJ4ei96NkhVWkJBYlNhM3N0M2xmR3dzbzVSVXF0YVA5MS9Ka0Nx?=
 =?utf-8?B?ektUUC9pano1cWtYdEhsL3VBeHpNUGRHVDVLaXRVRENqNmFTSjIvTWI2SEph?=
 =?utf-8?B?WmxjRjlTOXJpeDBiL1BXZFNEL1pSOW1rYVhwL2NGMEVGL0dVdGp5WEhpRysr?=
 =?utf-8?B?bnkrcERBbzIweVNNbTVmenhJUkw1YXNaTnZiOCt4dVJ0NkxEUVplZmZCS0tT?=
 =?utf-8?B?T1EvWkJEK20rSU85U3h6TFU4WG04TFVmTDBrQW15NkU1b2diRVpZYlVhL1Y1?=
 =?utf-8?B?QzFEYm0wVytmOUpvWWlzVTZVTWhuOXJGazdRUTJpd2x0UVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy9ENm5uK3lkMDlDbmtYUDl5blVzTjV3aWo5bjA4SisrU0kvWUI3aVpjQWtk?=
 =?utf-8?B?M0oyOWdCTDhJN2Zmc3pqL3g3M3gyaU5EU1M5YWZSaEdtUzMzai9PTVd4VHF5?=
 =?utf-8?B?cmhESmpEQ29iTFFHaGNzRFlJUHd2N0g5RnJFTVRWSTFkY1Bwa2ovWmN5YjFF?=
 =?utf-8?B?Q2pTRkJHM0x1SjR4L3o2Q0hnSlVyRloxczRXQ0kzRlhiT3hVU3NBVXBCWHUr?=
 =?utf-8?B?VDBLT0VLSTRoSWJZVGR4UVVnUFM5VnV3UzJWTkFPTkFLTmlXcy91endWbnUv?=
 =?utf-8?B?akpEMHZUbGNTdm1zVkZHcUZwM3U5WEJ5RkU3Z0cwa29OZjBtWC9ZRmRwbzhR?=
 =?utf-8?B?cVdRYkdRQWhNVHB2WEJWOE5vTzBIL2lyMGw4SnpVc1J0dm5IMmlvQ2tmeG0v?=
 =?utf-8?B?THV6ZDZzYXkveTNyM2t3aWdBSC9yU1hZYy91WUlsclZPbUFFNUFuaE1ObmdB?=
 =?utf-8?B?RnlYWHZXV1UwWUZiVXdwYlhLK0lyQkxRck1WZXFoeXQxV1k5MWwxTjh0TlFR?=
 =?utf-8?B?RHRUZk5zYklrVUNyYjc4MFErL0JpUXdpLzBZbUVuaGh1UWhPUFlxdGFNNStQ?=
 =?utf-8?B?NlN3TTVxREFLYW95VVgwM2JCRlB6cmpsWHg3N2g5Q250WWVRNVpkNGY5c3VK?=
 =?utf-8?B?RHFFSDR5Zm5xbzRkSkdnSG9rYzAxYzdieXd1aUVKc01iZDAvK0NWNWhxNFkv?=
 =?utf-8?B?WFNXLzFLZU1ZUzA0WFNWSkU0UXVxREVpTmp3M3ltVlNOek5HL2tlZFVzYWY0?=
 =?utf-8?B?M0hVbGRPV0Z2dDFIeFIvVnR5bGlLaFRWaHhBalE1RDdsTEJ0NkVVdlNTbmEv?=
 =?utf-8?B?OGFqYStQMTQwZUtTZ3J3WjNKTGt5NlVhTDVQNmwrY0NCRWZxSmVRSWlraUN2?=
 =?utf-8?B?Z2Y3WWtTVWc4eUI5Y3RWVFEzeU5DekJMb1haUzBIVUlpL09CMVVkNVl2c1N5?=
 =?utf-8?B?N09pK1c3K3pQVWdrRTRDK0hNckUvZWZYaU5xWWhLZDRtVXJlQysxRGljMURJ?=
 =?utf-8?B?V2RNbXNBTDdyQ0hKZ2pWbE54cGdEem5QLzNwd2FPMm4vbFV6cXhaUXFFT2tp?=
 =?utf-8?B?MWJabWhqeWlTRzZKZmRuWWhCWlJydTRNTUdsTHphTG1La1VRaFhpWEZ1Ti9h?=
 =?utf-8?B?RUlrRFMzK2xEL3VTR2VnZUtranpnZkpQWjhYOCtVdHd1RmFDdXV5RjlsVFgv?=
 =?utf-8?B?YzFsZkhjbXpzMnZlU3RVeEJxd1hxcEpDWjZSME5hUnFrNG1VbHFpNlJ5dVU5?=
 =?utf-8?B?aFlydWFMRlo0eEFrcnp3bjg2dERvc0ZqRGVycXhaWndtN0xxRHk3a0tVaGpZ?=
 =?utf-8?B?MU5CaGY3SHFhTllxcGZkOFlFbmkxR01RbDBNenp5ODI5a1U0VmhOemZ1OEhX?=
 =?utf-8?B?cEZ6WkZUbEZEaGNaUVdkeGVrWHdVL0hXejZrRW1GMk9tRUI2NXhEdW1DTG0w?=
 =?utf-8?B?ZzFGSzlZUXlsQzdCdHhFNzdKMys2MmVOM1FwQXRmdkI4NzAwbGQya2lHZENW?=
 =?utf-8?B?dUNIeEpGbjEvWHRYRU44TEovMmJncGNMSTg4NXp3MWR1UGNUYzdNVUkwVkxU?=
 =?utf-8?B?aW5oV0ZwREVWSU9Rcnc4YldqZFlIckZndXlIZFFVWk9CNUovUEtnR3BKQXpG?=
 =?utf-8?B?T05tVjBkWGxlZ3ErRTg0Mng5RUEyVGhveFN2MjhTMzVtMzVOTUhRNkdPVHZt?=
 =?utf-8?B?VUs2bytRdXJUZGd0MGJTV280Wm1jcWZjWFU0NS8rdys1VWJLbTJDRVFVMjZE?=
 =?utf-8?B?amtGNTZsQnBkZ3Iza3ptSjJheGVoMDZmbHhJeFEzM2VIcGdVcVNRc2x4S2oy?=
 =?utf-8?B?bXQzVFlLWjMyZWJ5Ry9UZGFkMUhzbHE1WUNSOExBN3FmdGc5WlJGbTkzcWJo?=
 =?utf-8?B?aTBZc29lWnk3UGh0ODNDRDNSRFZ0TGthL1hSNjVNOHdEby8yU2F2VCtkTFpE?=
 =?utf-8?B?WHpRdHRpZmZMR1Jhdm1zOFpnN1VHdFduZWpicklLTG9mSGhrRStjNFVkbTNq?=
 =?utf-8?B?N09ycmZhamoydEV4ZThnblZkemo0RlVLalNSeG5rM3IxeUJxRlU3eEY5WVNL?=
 =?utf-8?B?d05UUmp1aGtRN3FZNGlnQ0ZsMnBvQnpWMlNyYnBrNUpFYUZCaS9VRGNKQnJj?=
 =?utf-8?Q?7Jl+lOgcvVvZW2WQvU6d+wbIn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741c5934-f957-4fdc-8042-08dd81cbb6f1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 18:30:10.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAxMGTS+HeDlPyyeslihJYnYIGrOIw+4JSu1ZYizFpgit2/WduQOZNvNoCUFjq0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664



On 4/22/25 12:49 PM, Mathieu Poirier wrote:
> On Tue, 22 Apr 2025 at 10:10, Tanmay Shah <tanmay.shah@amd.com> wrote:
>>
>>
>>
>> On 4/22/25 10:59 AM, Mathieu Poirier wrote:
>>> Good morning,
>>>
>>> On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
>>>> Powering off RPU using force_pwrdwn call results in system failure
>>>> if there are multiple users of that RPU node. Better mechanism is to use
>>>> request_node and release_node EEMI calls. With use of these EEMI calls,
>>>> platform management controller will take-care of powering off RPU
>>>> when there is no user.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>    drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
>>>>    1 file changed, 28 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index 5aeedeaf3c41..3597359c0fc8 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>>>>       dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
>>>>               bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
>>>>
>>>> +    /* Request node before starting RPU core if new version of API is supported */
>>>> +    if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
>>>> +            ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
>>>> +                                         ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>>>> +                                         ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>>>> +            if (ret < 0) {
>>>> +                    dev_err(r5_core->dev, "failed to request 0x%x",
>>>> +                            r5_core->pm_domain_id);
>>>> +                    return ret;
>>>> +            }
>>>> +    }
>>>> +
>>>>       ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
>>>>                                    bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
>>>>       if (ret)
>>>> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>>       struct zynqmp_r5_core *r5_core = rproc->priv;
>>>>       int ret;
>>>>
>>>> +    /* Use release node API to stop core if new version of API is supported */
>>>> +    if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
>>>> +            ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
>>>> +            if (ret)
>>>> +                    dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
>>>> +            dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
>>>> +                    PM_FORCE_POWERDOWN);
>>>> +            return -EOPNOTSUPP;
>>>> +    }
>>>
>>> Here I have to guess, because it is not documented, that it is the check to see
>>> if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
>>> zynqmp_pm_force_pwrdwn() returns and error code.
>>>
>> Hello,
>>
>> Thanks for reviews. Yes you are correct. Actually instead, the check
>> should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is
>> supported, only then execute the call otherwise print the error.
>> Hence, the check should be something like:
>>
>> if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
>>          error out.
>> }
>>
> 
> The above still doesn't answer my question, i.e _why_ is a check
> needed when zynqmp_pm_force_pwrdwn() returns an error code?  To me, if
> something happens in zynqmp_pm_force_pwrdwn() then an error code is
> reported and the current implementation is able to deal with it.
> 

PM_FORCE_POWERDOWN will print redundant error messages from firmware if 
called for feature that is not supported. By doing above version check, 
we are avoiding those unnecessary error/warning messages. Other than 
that, you are correct we don't need to do version check as 
PM_FORCE_POWERDOWN will send respective error code and we will fail 
here. But version check helps to differentiate between actual error log 
from firmware when call is expected to work.

>> I will fix and add comment as well.
>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +
>>>> +    /* maintain force pwr down for backward compatibility */
>>>>       ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
>>>>                                    ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>>>>       if (ret)
>>>> -            dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>>>> +            dev_err(r5_core->dev, "core force power down failed\n");
>>>>
>>>>       return ret;
>>>>    }
>>>>
>>>> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
>>>> --
>>>> 2.34.1
>>>>
>>

