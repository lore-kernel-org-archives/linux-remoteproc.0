Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012052.outbound.protection.outlook.com [40.107.200.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A47E110;
	Mon,  1 Dec 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623052; cv=fail; b=ncDKGCLotTfIvxtWttS4+Wz79DeXyrbhpg9mxcWorkN5emDR1+NkQNXkIxPvbQRA4Pwe1yy02lD2mO3zVSKGDz4xdW0rPAWa2osZYpKB3KPC/8gj3VWQ0qBfiwVlJ+HD441dRgN3ZD513mFN5cFXl5O27MD7+NIh4cX65P4BIsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623052; c=relaxed/simple;
	bh=AhleiEUxqwORZ1AqkumCnjbKKFtOuiSwxLif8RMRBcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rvn/8WAU00PbWG6cd1wKo6Jr1IAuVK+VQl1lW0yzR8fajM0IzFc6TgrydhuNcHbvghGApCesURbHlKVdcwasSFKR8JQgyFLPn97+uoZYgerXKX2q81HQ72qcpslyUR0OuYog6L/qKvr6vvag9U1LG4+62N/oTPX0ock2qEG4Tes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZVa/siXG; arc=fail smtp.client-ip=40.107.200.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZVa/siXG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOwVicVCw66S5ER7tWY/OeRPAbee0RIS4fWOXcPpjptXB5O76fda+pnE9PZA2Z248d2GfyAQgSUoDFjbhupebKyqOaXtKYDEX1zRMFXRf2WLirwVzA63HWKB0VAmkZHZvttzYMcdfcnBgA/dRwaYrEbGr5D/NjggbJiUIN/8MQQQ6xayXH8FdfN78/1s9uQBBSFM5wu2J/6N1bgNUBBz9FyQN6/FXONToOep/pRKz4zbDdlRy82SR6fF1HKqv1354crJmixHlZJDA2i0Iuk2F8X0OHUr+4HCYeYtKOwCF6RWIEgmpVkU0OFgwa1+LukESDx72e6Hn5fr9tlnO6jQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuPvSNGfzrEczBO11v+vqzVShv6lFNEmO51Qd8ShAlE=;
 b=TNWedyhycFj2ewj+n3h9dKXhveXuLkl9zJk8PqlCxXfk+shLNlpnG8vu8V6n2+KKkSiEbjTsJJ2FiSTgFUDZniBH/ap3n7kaNeJBPd92zo4dXGGHD22k/pS1p6pjFzsl+qU6VREDBMIp4F4f+6O++mFENNWnRlQwZlORyYGvZunGMdYaOJW3gCCSflk8808GE0EvwAgAK/jhTGbA05AExJ3z45tHGzU2feWkcSpwnIKtnc8By70QowdA3Sk4gb7I6ZZTF2M2GFNgOmaDZ7uF0LMR25NXccp9qLE67DUtNs5XSYyxHhPvEfmOHpC7i92+U0JJEc8sSmdz5c+yafEfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuPvSNGfzrEczBO11v+vqzVShv6lFNEmO51Qd8ShAlE=;
 b=ZVa/siXGZv2fRkALc07+o2Bz5Gjm3falQiB2ROzRXJRjrEgEuMyG6UfFZ9OHoQ1PTYxks/qgfD1n+cgOYDGT1kjy07A1bAlCRbn18VidilIGgECOm8oRC38Rt6eOVleLpZHXGbLlJ+6UdF0SFTFuS+U56hVgvcTV7Hp8bATu7G8=
Received: from BYAPR11CA0051.namprd11.prod.outlook.com (2603:10b6:a03:80::28)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 21:04:07 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:80:cafe::62) by BYAPR11CA0051.outlook.office365.com
 (2603:10b6:a03:80::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 21:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 21:04:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 1 Dec
 2025 15:04:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Dec
 2025 15:04:06 -0600
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 13:04:06 -0800
Message-ID: <27a42ef4-20f6-4312-8b81-607b80419e7d@amd.com>
Date: Mon, 1 Dec 2025 15:04:06 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/3] remoteproc: xlnx: enable boot recovery
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-2-tanmay.shah@amd.com> <aR9VAtgfFEe56z3W@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aR9VAtgfFEe56z3W@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e96a2a5-31ea-4910-e8d7-08de311d2af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnZRRlhxS0NNbFBXTkUwcUk4b0NoaTFnVzc0SEVGWjFtdFp0djh2eHZOYTIy?=
 =?utf-8?B?SVhrK3ZaOHpJZHFuYldrTFI4b1Y3emR4alVLOFZpdVFVTy9paWkva1NZbVZq?=
 =?utf-8?B?ZVduWHRiVUd4MkVCUVhDbkNuRlJ6UEEyWEQxRlZkL1RMbEQ1aVRpWll1VlJt?=
 =?utf-8?B?cldNZUFsb3J0SlV6blhmc0dHV2NBNnUrUVFwTjA1SWhNMEp4Vm9xTjFTVmg1?=
 =?utf-8?B?UG9leStUcVZtMDZhR0NIZ01wallpMk5WeHN5K0xvWWlNMHFDQzlOOWJkcWti?=
 =?utf-8?B?UkRSVkZ5SkNtQzdGZEl0Vi9vQzl0bHNzeS9qSWNGNlBoWXhCNUxuUVpmR1o0?=
 =?utf-8?B?WFpvei9rd0ZIMUhXc1RPRUQvQjh1OWI1bm1ZNDQ3OWtkcTEzcGVkOFV0ZVh1?=
 =?utf-8?B?Q2FCN3JzRkpxQ0VsMnVnN05MdnpNSy84N2pqVFFGZkdhbkxaQnRxenB1anZ3?=
 =?utf-8?B?bVlrTFFoSDU0MWE1VkNuVEJ5U2xSNEJtRnU0SzBDc2lGTHhESWdaYklSK1J0?=
 =?utf-8?B?d0I1OStkYkh1VDRURk16ZFlzQmNSQjVzTnZWaDBTK1pSMnA4REwrMW9uejAy?=
 =?utf-8?B?SzYxeldMVnl5K2JhVjZHMjgvN0prbUwwYnRyeG41LzRsWlQrVzVFN0ZKS0xL?=
 =?utf-8?B?bGhWbjltTzVXOHBKdEJyRzNwN3ZJUHNPWTJWWTFrUDlDRGJZc1M4SVhJQjgy?=
 =?utf-8?B?YWpuak94dUo1cWwyaWhEZWxQSVQrSjBIb0tJbXQ3UzZ0UWJzWGJZLzBvREVR?=
 =?utf-8?B?aFhXUktUY0dDMjJKZ3RVVm1jbnd1SStNWmhQSGhZcU8rL0VMdUdWYWNFb0lT?=
 =?utf-8?B?YnMxOENROVBOeFRCdXlhbkZnMHozcUNxTE5mNHN5ZlBZZk5mOGo4SVIveGJw?=
 =?utf-8?B?YmhoMGhCMnVYVmxFTWkzelppUTdNbW53dGNLMi9FRU8rMHcxaDNmV0Q4dWFK?=
 =?utf-8?B?L2VlSFpJSTUzNW5FYWtMUVB2anpGYTFCaVZSTVZ6ckE0ZU96WVBZVWJhQVdL?=
 =?utf-8?B?SkE1bEhwWkYzYmhMbVJjOTFVUWx1R2JsTGk1NVJQRHJucHc5OXdoMUVQNHBP?=
 =?utf-8?B?NkhFVU1wb1lHL29RNTJ1Y2RWS01ZU2U0YTYyRXh2MkF3NEVNU1lONm0veGdU?=
 =?utf-8?B?eXNvUFRhbzh1ZGJTZ0hkaVZrUC8yallqcndrQXJIOVdpNUNlM2FZL1kwQXFq?=
 =?utf-8?B?bXNzSVVya0g1Sjc5dTcwNG45NVdBckx1WDFuQ2psMzBTL2d2SitETVdSaU9T?=
 =?utf-8?B?bHM3di9VZnhUa1ptSEVJWWJubWxZZTNUWjN2ME5wM0wvb20vMTZjbUI0RDIw?=
 =?utf-8?B?b3FhVTJaMzZLM0cxN0FYOC9YUVRLblNiQVBGSlFHek5IMVIzWWNoL1ptMDRR?=
 =?utf-8?B?aDJzUXVVNjlkU0d2NmVBLytoZmJTN0dhSm0vVXNqNTU5UVJZaWpOS3FIYW1W?=
 =?utf-8?B?QjFEN3VLNUZiWHFVNHIxdUpPcVVzMWJvOEgvekswSzZlcnlxaXliVmRrN2Ry?=
 =?utf-8?B?TStHczJxeTAwcmJkS3dvRFl3SUZWejNHdllaZjA1RXQ3R284TGF4bmlPcldM?=
 =?utf-8?B?UTN6VzVwZlBHUm45SHdhdldRZTgrbXVGK2cwZlI1WUlRWkxEYWRaT2djVG5u?=
 =?utf-8?B?WlJtcmw2UW9Nd1EvNTExU29Sd2hPWUNDZWNmZEtWOENrY1RkQi9UTURNNU1v?=
 =?utf-8?B?a1BMWDVDWWdXUld5YllZeXJHWlRyL1NEQ3BNa1JvVERaWENlcUxtdzNHbldZ?=
 =?utf-8?B?UDEyMlhXTzNMalFNRHNkTUd0T1NlMVphSWtQWUZGcGd4TUVkUkVjaHAwTXdr?=
 =?utf-8?B?aDV1QklhNkFWQUVNOGpMNm0yN2FOaXJRNStqa0Q5UlBzNUx0WFV3MU1JYlM0?=
 =?utf-8?B?Nk9FVk5OUEQ3WkR6WnFMVUNDRzdVUUkvWXJhS1g3aHhtSVkzZldBMzgrRHh6?=
 =?utf-8?B?aStWWm1aT3ExcGY1OStIbEoyUUV1MHRwWmVhZmt5bkdNR1RSdDZycHR0eDd2?=
 =?utf-8?B?QWVvS0ZFNmRVWm0wcVhnQ1k5ZTlkRW9wQTFMdjJzVHk4REloK3Z4SFlyN3cz?=
 =?utf-8?B?M1QzbnZVN1NRTFd6bFBwenJ2RWRrT0VYbWk5SnhmcVJIU2NLbWlvcERtZWI3?=
 =?utf-8?Q?djZk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 21:04:07.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e96a2a5-31ea-4910-e8d7-08de311d2af2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863


Hi Mathieu,

Thanks for reviews. Just got back from the vacation hence replying now.


On 11/20/25 11:50 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Thu, Nov 13, 2025 at 07:44:02AM -0800, Tanmay Shah wrote:
>> This is the default method to recover the remote processor from crash.
>> During this recovery the Linux will stop the remote, load the same
>> firmware again and start the remote processor. As of now, coredump
>> callback does not contain any useful implementation, but this can be
>> changed as required.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 0b7b173d0d26..8677b732ad14 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -891,6 +891,11 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>   	return 0;
>>   }
>>   
>> +static void zynqmp_r5_coredump(struct rproc *rproc)
>> +{
>> +	(void)rproc;
>> +}
>> +
> 
> Function rproc_coredump(), which is set by default in rproc_alloc_ops(), won't
> work?  If not please indicate why this is the case, otherwise this patch can be
> dropped.

Thanks, I completely missed it. this function isn't needed and will be 
dropped.

> 
>>   static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>   	.prepare	= zynqmp_r5_rproc_prepare,
>>   	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -905,6 +910,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>   	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>   	.attach		= zynqmp_r5_attach,
>>   	.detach		= zynqmp_r5_detach,
>> +	.coredump	= zynqmp_r5_coredump,
>>   };
>>   
>>   /**
>> @@ -938,7 +944,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>   
>>   	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>   
>> -	r5_rproc->recovery_disabled = true;
>> +	r5_rproc->recovery_disabled = false;

This part of the patch is still needed, and I will move it to 3/3. So 
this whole patch can be dropped.

Thanks.

>>   	r5_rproc->has_iommu = false;
>>   	r5_rproc->auto_boot = false;
>>   	r5_core = r5_rproc->priv;
>> -- 
>> 2.34.1
>>

