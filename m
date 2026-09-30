Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAC651B16A;
	Wed, 30 Sep 2026 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791190; cv=fail; b=sRqXOtGqwUkrhzyFLkjvPFQ2poi6ua31VuA/HvsDxOEAOila7SnFD5fIO9azetB3dD29AViPAr4CxkCG1GstWbNO58YXgbxkBc7VJR+Og2xBxslpeki4aEybdBDbF5fm6Wja2P1W93B2eSwNhuAVRePV4x8dFzVqBsaf9c8n0So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791190; c=relaxed/simple;
	bh=ckNHO1hYjVd28fVIG1trrY7oJb99CIzrCQv9IPQmDEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BHgmBStGA0KOXIDjP0BOhScbmdQIxUS/XlKApdqszNhlhaKPe5ZnjlCWeaOdlFtN1ZtYfuOEJ7hsyFCInhuo7ZwArJ5CBy4wYzVogC3316uP4zjIewsaCvfNPwjRQtSl3gbzBZ1+JDuBkglsAiB9OLo82Ys9ycrEjjc1jdzvV/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YiJnLTIb; arc=fail smtp.client-ip=52.101.56.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YiJnLTIb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2GC3KCYZnXwZqi7r6zO+lda4jbvFjQ2wSxAAgx+3ZiupMgf0dyYSVRlM8Jos48DTsdHfxeb8X36jQYMfkzhJR/nyjf3JvTKlGkWL2RqU31wIOcs0J16f5TRTcnebZyK9oktieYNKW8TCXjGErbXTDvgd8yVc0XPMVSIj8qQuer+oE7e4igirUfyLTf0DjRx7Xd2MK6jgB3CHApSjyuAcNovwC2buAamEk5WZHdbiea8uWryIE1j0HPJgomMLkq/c3q3eAD/T3JegH9FhBDufc18pJy3h5Zz/OweLbkwQCq+U4a2L+3KzYjyXPIxh1t8ozGJl3fV5E79mnGBy1tKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjZDGGZzP7+Oox1GjavcA17V5y6YVFr7aXJkB0T5JAc=;
 b=Cxl9l0ljHep1Yyh0ZW7GpYYd3S+p/1d6T8PATUiaMEYoafxb0UKEFR7LVzcJAeq3PIUiSZMNAtFkmrXYCXtwGKRN2jzuXaUAGTfVx4XKFYZbG78pVjtH95pr0Fa9iZ2DyocUcVwuD2lPiedGVqBSQnYeIqZK6zU5qzSvyyBd9d+O8aD+7/myVoE9McRt1OFxFPp2vaIkAjOw2nDktfB65gF+19yGCqKquHql02eQ8svz72Dwt587fSx7fzkCpcnEIzn7PHoC4rXojg335uGtrVKfgD6UXGlXI1G1yfteHTYQrNYpDhsCi/vCDvGktIXUH/TOlNMOPVsebfjH3MD3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjZDGGZzP7+Oox1GjavcA17V5y6YVFr7aXJkB0T5JAc=;
 b=YiJnLTIbMK96TVaqtga8/TaKicNdXiXt191S3X9GhoxIjNOg1uFM86y8ghBAda4DIQE8GorM9b8Dwd0AZRYM+KINZo+kLvj0Oauure0yEdkw9e6KL6cNZ5wN+8u7SkNCJ7yPgGuPSFpXcvN1y/Hir9p4+/Vycnd+FSwLPMYRTdE=
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by DS0PR12MB8767.namprd12.prod.outlook.com (2603:10b6:8:14f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:59:41 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::28) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 17:59:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:59:41 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 12:59:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 12:59:40 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 12:59:40 -0500
Message-ID: <e4c802fb-652d-4c87-a0e8-1f1d7f566cda@amd.com>
Date: Wed, 30 Sep 2026 12:59:40 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: fix typecast warnings
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20260828155846.2883035-1-tanmay.shah@amd.com>
 <ar0oE_M9sgEpJ0st@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ar0oE_M9sgEpJ0st@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|DS0PR12MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f23ab0b-f10e-428b-7c1b-08df1f1c9a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|11063799006|4143699003|10067099003|260925022911599003|260925021311599003|260925021911599003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Uc9mXs/sD489Fwz5evrzfqx4F3iHlFiRQHJDvy5KcBTknLFh874KtN8GQ6PBDRGwwt5+ROPkE2DrYfxR2V+cn6Leo4/HaqpwshWTriDA3r43JrwH/LK/ocCXHciX33ZHJltVFxKL8zQ0Te59YRJNK3GiCbhLDP4BwVVNXjtXvY3KcVL2gkeVeLVAVmMoJ5T72ILJ2CNlCI+nwgoKsWv3SVbonxXSjN2CLQRGrve0B3hjLSFoSBAwLMNCJsUNYrZbR4hH5khJFc0taVgZ7CDDpqLDjl1ZH/IecZBCvGb/8+pOYsi1KagL0qj7MwzTRQf1nwdZvOpdg+Z81szHFlMDal0Fy06uoQH/hxA9jQ1Kj3nhQrKXTGZYIJTQBlKTgUw3vwlWwhT91pYlvHQRuc8LjyxiJ5gmsO0j5Wwk2r4EnLnKFZeCP4vr0PANVTXc2en406On7qs7W10HU4H41QOZWSf2ebuyibCwTft7tSFgh+l73vjk6vOFOLcn2LDd83reklG21TGMhL2Sh6NG/BdJ2dzgAMsCenDjlM9JGnH9yDgVeuj2OX1/BkKHlsrxraByA+aK7/ruNezSaHkDKmfhgdT+EBHCR2SfHXFSY1zUCf69k5+2eFIyV3tejjsVsGDzpmT0adyOB3dSxm8g93meqU+pVGwXhm3FpcK5ZUavQQM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(4143699003)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FJTgoVkg3DIgqWTrlqC5sEjTURb/KE5RzkdI0Y2Yc7k+t6vaL37Cz80McldsF0E0ckcZM7hc+ursy6iWA8+IXc+2d87G/oiR9/YHSR3wVWsUTrVtd9lgB6W4lVCS+YLDbgNHRhd1x8IKZuRmm86LcZxLF/UkZpBZa6u7TX4ovTWTx0LkITy4mP7PuLUdSx6KlnT4W95r2buV/XRi+XCfvUS8z5ffhqv+TIXlF+d8OW+NBR/AauRYFos/pJ7952MFHLcaMeTDtHpInZbGGvQvcNKvCsrS5DDrAhGY7VQS7AsfrasL1AzX4aVpcVa2U6gzygKVNfHAFh8aIMnZSsfX37atbbsQrg44H6l5wfJZ2+ZTvM6reJeIka/S4Pu+5QJLRNomfHK4xWDm0jVuK8YHS3FrnMfrqrxPUAlm7txFTpC5E1nOJ/ca/HOUea1YWCJK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:59:41.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f23ab0b-f10e-428b-7c1b-08df1f1c9a11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8767



On 9/30/2026 10:17 AM, Mathieu Poirier wrote:
> On Fri, Aug 28, 2026 at 08:58:46AM -0700, Tanmay Shah wrote:
>> Fix following sparse warnings by using __force attribute:
>>
>> sparse warnings: (new ones prefixed by >>)
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
>> cast removes address space '__iomem' of expression
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
>> cast removes address space '__iomem' of expression
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
>> cast removes address space '__iomem' of expression
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
>> cast removes address space '__iomem' of expression
>>
>>>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
>> incorrect type in initializer (different address spaces) @@     expected
>> void *rsc_offset @@     got void [noderef] __iomem * @@
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
>> expected void *rsc_offset
>>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
>> void [noderef] __iomem *
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> 
> I have applied this patch - apoligies for the delay, it got lost in the heap.
> 

Thank You, no problem.

Tanmay

> Mathieu
> 
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index c685bb5fa62c..f9cdd3c024dc 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -568,7 +568,7 @@ static int tcm_mem_map(struct rproc *rproc,
>>  		return -ENOMEM;
>>  
>>  	/* Update memory entry va */
>> -	mem->va = (void *)va;
>> +	mem->va = (__force void *)va;
>>  
>>  	/* clear TCMs */
>>  	memset_io(va, 0, mem->len);
>> @@ -746,7 +746,7 @@ static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc
>>  
>>  	*size = r5_core->rsc_tbl_size;
>>  
>> -	return (struct resource_table *)r5_core->rsc_tbl_va;
>> +	return (__force struct resource_table *)r5_core->rsc_tbl_va;
>>  }
>>  
>>  static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>> @@ -770,7 +770,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  		return -EINVAL;
>>  	}
>>  
>> -	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
>> +	rsc_data_va = (__force struct rsc_tbl_data *)ioremap_wc(res_mem.start,
>>  							sizeof(struct rsc_tbl_data));
>>  	if (!rsc_data_va) {
>>  		dev_err(dev, "failed to map resource table data address\n");
>> @@ -794,7 +794,7 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  		return -EINVAL;
>>  	}
>>  
>> -	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
>> +	rsc_tbl_addr = (__force struct resource_table *)r5_core->rsc_tbl_va;
>>  
>>  	/*
>>  	 * As of now resource table version 1 is expected. Don't fail to attach
>> @@ -834,7 +834,7 @@ static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>>  				int offset, int avail)
>>  {
>>  	struct zynqmp_r5_core *r5_core = rproc->priv;
>> -	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>> +	void *rsc_offset = (__force void *)(r5_core->rsc_tbl_va + offset);
>>  
>>  	if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
>>  		return RSC_IGNORED;
>>
>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>> -- 
>> 2.43.0
>>

