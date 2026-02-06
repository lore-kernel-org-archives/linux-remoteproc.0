Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD5329E75;
	Fri,  6 Feb 2026 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395927; cv=fail; b=ncp9FQJaARf7d2dIHbPgJsnA+j34BRfpx4/z5fM3jp4dd8nzVLjnqXiUCqBa/K5IVAN63cF4bS2kkHgBzqlvh60grPhNHeYyW5Uw1oMvddeR3HEYjn9KKTwOSQXoUSoHdsJDeOw6mQylhf9ZsLEXMZ0JaEPEZkMG5zoZxzFiFDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395927; c=relaxed/simple;
	bh=O9RrskAilzDZCVqP/kV2IOFmRBPYrefFquX4BEcc29E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=om+weODUZ6Tnl9iQIehkOL+3+qMYDlwxT7U5q1QO4MeKgdZ3JdUmWXyFYUCcc/MOI/VfnfbYlkn/J1CbL013WfTGCZipUxM1xHhUkm4t6zoFTVVM7VwFifcNL2JVwQpk8w0Kdw1iKvqqAabZIculX96pEy0t4qkG6wsrM0MWw1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fuif/oRn; arc=fail smtp.client-ip=40.93.196.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fuif/oRn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFp5+6cskpfcYkKZ2LD5mEAtntsyjEva5PUcp3pOhhzYGKID5ejCC8XxVAt6gXzD6N2ZsQeInZIdI3JLpR7ShpvXY9xbe0Azkx3wTOSP2u1C4Sw2rVwly00p3H230yVW9TC1Qijsxwnr3ZMzBBrXYfg7o76YDTqQy4cRqq1ljVavJVVb09XiyIEb1sruEHgssza28KALUfoP6T2hMwgHG7ZXbUHlqwZZNafRP/2lWwwci/036damNLGe9xJqM1aki++B8CpsA6bhgPkkpSlPs65tS2yg6XjXNmLReoFbyXqtksn4hZ0WeuWmPGmZl/DUgO7HmWg+kKAc4MNJlA6+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX+GYyt2seKM33FyxpLreIW1Hl5vObNWxBTXRotjnu8=;
 b=OTXZDeGE1gVULHD13TrZ0Q5DZiJBzIbg7s7XSGlSYVOADdinRy7qfCk4Z1udMnJ9tn40T3I0uZJfQB8fvCG//txMROnYT+nwa+JwTbChM73KYwTgReduiIHioxYsGu+6vqYZwccnZ+K+Nx8CIADe7UBQiRlyH3j/GaUB8JBHG8a0N6kjDWh6GatpwoXTa6jbPyLfKlQg+jc5tD9hrPkz//3gnum742rM8mr2s3vg/oqyHribPUL7MFVlj9rrvGj9QtU+5tyM6590XhBUUbsXfmCkIMsSzbuDnWGFioz1zjimQl6ZQ05G6DeFaFnE4an9pWYqMQfc6hwPaT0hEmEEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tX+GYyt2seKM33FyxpLreIW1Hl5vObNWxBTXRotjnu8=;
 b=fuif/oRnOG47YBTidZwqLgsL8AQH1eATmO5xAaZok+QeGPfDazHaG/DrHqFUXvVp8SCif0/MYUIABkMZv8oMWSnJQAHNbhiUAbKdB4ezZBLN++/c1mv8u/HkJ7xPL+liQizgtupRO/q4NbifNLF6G4vGjy0SpaPECttAsj2d1T0=
Received: from MW4PR03CA0356.namprd03.prod.outlook.com (2603:10b6:303:dc::31)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 6 Feb
 2026 16:38:18 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:303:dc:cafe::1c) by MW4PR03CA0356.outlook.office365.com
 (2603:10b6:303:dc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:38:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 6 Feb 2026 16:38:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:38:16 -0600
Received: from [10.31.203.247] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Feb 2026 10:38:16 -0600
Message-ID: <9e34e5a0-447b-408c-b759-fbf1fc940ae8@amd.com>
Date: Fri, 6 Feb 2026 10:38:16 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: fix sram property parsing
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tim Michals <tcmichals@yahoo.com>
References: <20260204202730.3729984-1-tanmay.shah@amd.com>
 <aYYQT7OGEuGeOP9G@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <aYYQT7OGEuGeOP9G@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2392e1-3f44-4ece-1b92-08de659e218a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzRQVkFPQ3ZDYzU5bVc5anNIc3JCUTJVNHpiNWg5NWxQS0RydG9BR1lVSzhL?=
 =?utf-8?B?VDhJKzdwRjFaREV2WnM1VzQrMlhoVkZzaUQ5OWdWeCtLNE1YMzh2d1FOSGZT?=
 =?utf-8?B?cks0cDcrODIyUlpVRnFmWGZTLzFlOVNFLzg0SE80T3Mydy95L3dhODdXdlph?=
 =?utf-8?B?eW02Z2xFeDJ0OHkrT2ZSanBySkh6Vll0TjlDSUFTaXZJd2wxQ3l5RGtsQWpw?=
 =?utf-8?B?aHc0UkJTc2Z5Nlp3YWlRUWNybVR6dW1US0lzcU9pUHhxanhsOHlIdy9tVjVs?=
 =?utf-8?B?NElpTHI5UmJuTFNEQ3djb2JHTENCcjRpWm80eTVLalhDWCtZc2V4ci94VTRJ?=
 =?utf-8?B?d3hZaStHNG13bzgzckhMeFYwcFNUSzcrc3ZtRUlVWFBxMGNjREpTMUl5cUZC?=
 =?utf-8?B?SUhvcmhMMFF3bzd6c0dUYmIwdTFsbTRmcG91bm1vVW9YSmxhKzMra0hKZFRt?=
 =?utf-8?B?WWdtRUpMSFdtT2lpSzk0K2p0THlJZ0ltYVVTa1BvMy9XVkNsUDVsZE9uRHE3?=
 =?utf-8?B?dlYrNkM0T2s5bGNmMGRhNnhnKzd0U2l0TE5NblJ1OVFMc1JRUFZOZENSczBk?=
 =?utf-8?B?ZzhJN3dXSGM3clBJVGp1d09RcFlYQTMyajJQQXBRUmxwZzJlc2haNEpyVHN4?=
 =?utf-8?B?SVJnd1hTbGVSTGl6Vm51WGVUdHV4MG54RXg1QTZjMlltSjN1SmRhRWMvU21s?=
 =?utf-8?B?TytNNGRsdWRzMXlTcUMzek8xY25ONXIxY1lkQXRRWTdKaWpWaDlyN3pmTGRx?=
 =?utf-8?B?cE9wNXVYUnIzL3JOcUNYc0tIUEhqVCtQbE43cTdEditaK2k4QTAxb1hZTWdV?=
 =?utf-8?B?MlYzR2ZyTGdiTmJOQWdIL2h0WHFkbDVVTlBRMER4Nk0rVnMvUjVNVVc3KzFW?=
 =?utf-8?B?SWVxTWhOMktKMGw4NTM1bXFSTHRXd05oR1RtVzBhcDBSM2xtd2RzTFVnei9O?=
 =?utf-8?B?MlFxQjIvdmVtZ1FKeloxT25MMUc4QVY5L2VsVU9xaEE4ZzN5Uys0THM4V0s2?=
 =?utf-8?B?aVdTUkJMQ0pKUFpvNE5hNUV4N01VNDdvYVQ3ZzJLUVo2MTZXeTZrYmpMRjdy?=
 =?utf-8?B?Y0pnSnFpN3dxdkZLSUNwdmZCY0xSV3NNZnVrTUFYRWhmSi9HNUtpMUJRVEhL?=
 =?utf-8?B?czRkT0g3ajRhSDlpcGtmWUw5OTdZOHBzaTdTM1p0UVM2cUZqSWhUZ3U1TEYy?=
 =?utf-8?B?T1Vkb3NveU14dDhrRWJCakswQTB5Kzh3WCtoTTM0NVBDS1VXWG5zQkk5MzVN?=
 =?utf-8?B?RTdlaDlwU3I1dm9pd3E0VjI3Umoyb3NwVzRIYUI2bkxuL1RoT0l5YzhaSjdS?=
 =?utf-8?B?NURpOEJqYjJzNWdZU0lZN3FhL2F0RWsyOTdCMlBPalVNS2FHa3lGTkFBeXNF?=
 =?utf-8?B?b1lYSXFBbVFSN1pGV0hnVlVETWswSFdtQ05xOTJETTl6RTUvRGFPNVFIOXJW?=
 =?utf-8?B?dmVKUnpzK0FmTU1vVWNPbzRRRFAwekhBTEdPVHR4TkpYQXQ2cCtPb3VjSFhI?=
 =?utf-8?B?aitOSWgxTFpDNnpvdkwyOUE1UUl6U2pUbFFUalM0RjcyRjIwaFZjelI3U0FJ?=
 =?utf-8?B?QW1JZEtWaVRmbC9wc0FSV1ROd25aWE5tMUVub1JZVExndDhWRGZLbCtZbVQ5?=
 =?utf-8?B?RGFFNVRySk9QTkIvaCszOHFhN0VXRHpEZWN0bUk0VVlBVXlmbGxSdk91SHRY?=
 =?utf-8?B?WFlXODd4NERiSkpyYzZ5YXQzUlI1RThwcGk1cDB6ZnNPTThLb3VSVWdLcExT?=
 =?utf-8?B?ZEN4blV0QldNbzZDZzJDZ3UyUUgrbkhlRDRsYy9oMnI5TkxhcjRyQzBNRFVa?=
 =?utf-8?B?RVdCWEVEaFZ4L05lUWpBbWNtSmt4YS85eGRaeFB0ZWVjcVJOTExTQWZTWnlD?=
 =?utf-8?B?a0tTRGI4QWVrL3pSUWUyTjlHYllsWm9FNnIrdmpIZVlJSHEwNWtEVEJoNWtM?=
 =?utf-8?B?ZHVqYVcyZzJKTUVVMFpwT0tJdWtGOUFXY09vaGl0Q0I0cDNoVVNMMUVjOSs0?=
 =?utf-8?B?WGZyc2FDelpDRnRDZ0o0VUcrSm9BNXR4TFdrZG5kTTBxQzhvZXRjbDVFSUFU?=
 =?utf-8?B?VWlzMkRPaFU4MUt4ZHdxcFU1K0lOd0tSQVVCZUMwNEcwblFiYjRNeW04Uy9V?=
 =?utf-8?B?U3JXOGJ1OW14RXpyOFJSR3A1ajBIN1RPdWczMUNHajlhVmdzUWpSRzQyaFN6?=
 =?utf-8?B?MDRyRE5BcUdJS2hNdklwNCtJVktxODJCemQ3b0ZXSlU4QzdQRnlaZ1d0MVMr?=
 =?utf-8?B?L2pETnNheHBMRXpoUXFZQUhzNHlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RfDBpEMwWfQPISBJ4EFf/ByGbrQjUrcR7YEN0iWPOu6jA//C5gHbkeTKc0emVBPR9n9m1mVGee5KyRcy6Kh7EM7w/xpbsqD3eyMBgDS19iAZEBtZ1xOcsDgbQPibqxmMnazW3rTb68nJnF8RE+74NONJsmv09XbEmwbPlTnkklE0ynK19UuxOkm1M1UWUZ2At5cx36OYEqHn5uuXYeAyCJNbLAz/QvoJ8TQSi0iTrCHwhkKYalop50YchUOfas0S0T1JTEJZwS6weNLEgK7T9ROKHmYmNtIryBXrioAGS5HQrJjFfC+YtKFbP+WLQaK0y+9MVPT5CFF9GUdeDBz//n+Ov8vwyBsl1GwWsyRX9LwrhLpzgS6f05u01ZxhHL/5MJdKceMD7nizVCKWSPkAyjzZvqqX2x2uQvh4tqtxFh4YFDs3fPQDLn31y2ruXUHN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:38:17.3783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2392e1-3f44-4ece-1b92-08de659e218a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581



On 2/6/2026 10:01 AM, Mathieu Poirier wrote:
> On Wed, Feb 04, 2026 at 12:27:30PM -0800, Tanmay Shah wrote:
>> From: Tim Michals <tcmichals@yahoo.com>
>>
>> As per sram bindings, "sram" property can be list of phandles.
>> When more than one sram phandles are listed, driver can't parse second
>> phandle's address correctly. Because, phandle index is passed to the API
>> instead of offset of address from reg property which is always 0 as per
>> sram.yaml bindings. Fix it by passing 0 to the API instead of sram
>> phandle index.
>>
>> Fixes: 77fcdf51b8ca ("remoteproc: xlnx: Add sram support")
>>
>> Signed-off-by: Tim Michals <tcmichals@yahoo.com>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index bd619a6c42aa..970a9ef97945 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -1005,7 +1005,7 @@ static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
>>  		}
>>  
>>  		/* Get SRAM device address */
>> -		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
>> +		ret = of_property_read_reg(sram_np, 0, &abs_addr, &size);
> 
> I'll pick this up in two weeks when 6.20-rc1 comes out.
> 
> On a separate note, it would help if an example that includes an "sram" was part
> of the xlnx_r5 bindings.
> 

Thank You for reviews.

Sure, I will send separate patch including sram nodes in the bindings.

Tanmay

> Thanks,
> Mathieu
> 
>>  		if (ret) {
>>  			dev_err(dev, "failed to get reg property\n");
>>  			goto fail_sram_get;
>>
>> base-commit: 85ab651885e1b542ee0bb9ec4642ef0b11716997
>> -- 
>> 2.34.1
>>
>>

