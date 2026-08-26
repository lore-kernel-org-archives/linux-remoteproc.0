Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C148381A
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 21:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778337; cv=fail; b=To+idAh2O3bKbGBRxRwPNyeelWW/8MXGoDUv5oXaYgUNjuXqemSL4ZAlqdrFWxEeoVZOQbGAOIsYjGfenChRYe4ie6A9cDjaShwpEUps9MzCWcBbqCn4kL5YYpi/CCtGQaBVpZGTCnIV0PdwLR1ggiVN/6sOxgArThIFPvP9LkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778337; c=relaxed/simple;
	bh=KOGJf14RhG8EIXON97CYId+N7J9po0eRMPW1Kfi6eGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g0PXbxg0OS3tF1CGhBzJCO8VvDQxRaMdGZn0AWk3uA6nGTIEpHa+/ch006cEF7CgOCnt7bGNqYcgeENq0Aq0Ur9H18yfQLfiP+y2FD2iQJeYtkLZMEnR+p3lafxwlJ/Fxbz1UgEFB81zojqYWVhVHmjj5KnxhE6MSZ55hy6MM7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wlq/GS3J; arc=fail smtp.client-ip=52.101.61.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wlq/GS3J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTGK8C832czHN9chbdbFbfAwbBcNSQdoDd/PEQ7m5prA9SsIWfIR+rY8Ix14vZbbPB6RvcxTNHUrPBcdi2o6K61YGqCsmH6kk3nHFFYinvDkG3wWIWeGVuKUZALyegE8J+/bVH5Ip+kuz8fjSasCYQTiNj9gHpokVBExCPtaOOBbQmEpDB6c1+looroSCfyZw7dyPHNpXyvEaWrUadSFsodXlrsVxlBzrAShIkW4/gtySUOydxDtI6DsAIbLmiEoPc+WyyphGbPMu5KiL+S5ebKTcCV9W6CV58c6BZzgtBqTbY+uGOcxrCziLT4js+tG/LnQii+I/fLWhmhNonOVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4eoZ8393NXKziFRk1QTVRW/QqbUs5XFKcdZXsYACdM=;
 b=bDsZ7sy2TzxGNwgTRZhuAADrbHqS0J8Lpu3fQ6zagvsMwBnZ40YEBj9tLKUq8NcLj+pI4Ki4vfGvmfZO+mSzbMMWckyet73hlVBN9cSc4utcSrG+U3/nCxVAnZ0w3RjwuYw9XkO4qgI4LyafbIPHEwUTCIsDrLbFvAsojNmnHnZhOS6WbNvO2yuLgX0Hlv3XoAUWiMQwMJ3dHPvfKwK3F5h6LETBcSQCfFiyzR/fIlc9TGmoBRyBFg+La7NIkofGOwu+SA8nV8xLncIU3XVGZvxMgZWWD8IstYg7GZA4qZ/p+L7t+vhzCuMft7bCkXjVtO0LxR4tDwWbAIYDfz2h/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4eoZ8393NXKziFRk1QTVRW/QqbUs5XFKcdZXsYACdM=;
 b=Wlq/GS3JQy/xWbdyoJuHNpo2j5xTmL0goy1gqgjrCXRICTCWUj10DYHiA30AxdGKhKKbsirJNMTwxOhBs/qhdsPCmhd/sp4W8ZwI3vhTcQELD+iLOebdoBQ9fsvmHQcVvM5ETqhYXgd1T8tYe0mNjdvmEOUrcUmHokuBQBdjrys=
Received: from PH8PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:2cd::21)
 by CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 21:05:29 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::8f) by PH8PR07CA0022.outlook.office365.com
 (2603:10b6:510:2cd::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 21:05:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 21:05:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 16:05:27 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 16:05:27 -0500
Message-ID: <fc762f68-5c8b-4d35-b6a4-d876b9d4272a@amd.com>
Date: Wed, 26 Aug 2026 16:05:27 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: Fwd: [linux-next:master 2763/15982]
 drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect
 type in initializer (different address spaces)
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shah, Tanmay"
	<tanmay.shah@amd.com>
CC: linux-remoteproc <linux-remoteproc@vger.kernel.org>
References: <202608190009.uCbYi1Y5-lkp@intel.com>
 <CANLsYkxW7EeVQwH6pJryE6PzfVzVVodGCKbFOmycqffRLZ_SLA@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkxW7EeVQwH6pJryE6PzfVzVVodGCKbFOmycqffRLZ_SLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CY5PR12MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: be315c05-9079-482e-3d68-08df03b5c1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|13003099007|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wkcDHuRX5046DF5Lne8XPZVNSrSYh5icwj1yxrJM51LyRlpner5Hxk4AoISZ0nxsAsleKDLMZcIzHfprnKOhkBlFPR5+HYNj2pprtr3pKUdBOLKMraraIo7KTIlgFWDXwA1xV9HQmf5er1Z+l/24RzdVFTgo76rrjZM4DeJsvQFiVQz4bRkNUV91O4RUnSzKoAEYKHRD+tHjtdMT0/x18SqqbYD7D3KlLpKbSpRbYwsJb8ZqnIKt2mlp987QCewp7JZ/etAs2HbmDApCBPNyOdp2YkgHLkMBx5VDicX6qTWmCJUMwwvAurxwsXOYCcUNSqnX379Iam7pj2eh1OnQh9stAvqg7L96GF4NzoUukjkphaUat80zVOG8vcC3ClcYLted6/sLj3KLhylY8oX39K7Rs6RT0oQF0efvI6T1mzc6O+ZvqJurxcac25jmyEWw0wYx+194tQdVRch6K7gxDI/yXYaWzJ3LG7YBsSUDtO3tJLdOVZis3UR4JpzvHNPPvBCnvMeFfaccFdGp1bndZU/c/aqaAyDxslV29faLUZBJT77nyN1GEPJ6cQjRaALzHRjLIHw0rIEwnEsvLD5SbDEFsQ3913CcI5nzMLc/lwAuTI6oMnePNhNuHMSLEaZJvZzAXjCj5c9/4dTrf0esSg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yf3/czDkpiFq/dXUzUULZUun91YQZnhP+3UeA5trzt0vhcW39GE+VzPC4BXqhQc99+NzqJrEJBmiLqbO9gPN3bUKxUS03/kKcCS8j3/7Zk6TIpGohf/Gaonx4DyH1EfF3DfLZoIWnWsh1HTNFHOYh+PBNfJjHO3RQO2wEi0K+/nbmU2Fzj4P5ivA9h2XE9z/rWvFjRVMHrrYYByZeubBq5XThoyKJyk/mwuS6f7SY5J8O5Db0AsKfog8qtyWAbhZFniZ0pmnZY0Vb0yirW/RxSNX59/nJGwuxjxhUtvK1YkxqWpvCfFdPS1BznBFWAzG6SG3Pl3UM3r83e4QTrNqkXHU9a1qm1H3jFIISoxnvQbT0IrjS3oWlIwh2BbpAKPdfdWQPhjtL9UhM+novx6pW24/1WTg4ZpAOha7Wrp8SmOTDZLJltaGPCixuIaCQoP8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:05:28.2782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be315c05-9079-482e-3d68-08df03b5c1b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275



On 8/19/2026 10:33 AM, Mathieu Poirier wrote:
> Tanmay - please have a look.
> 

Hello Mathieu,

I looked into this. So, I can silent sparse by using __force sparse
annotation, but that's not the full solution. I think to properly
address these warnings use of ioremap*() APIs should be replaced with
memremap() API. This ensures that DDR reserved memory is not mapped as
iomem, and correct pointer type is returned.

However, this needs serious restructure in the driver. It will take me
some more time to address this issue. Until then I prefer to keep the
sparse warnings.

Thank You,
Tanmay

> ---------- Forwarded message ---------
> From: kernel test robot <lkp@intel.com>
> Date: Tue, 18 Aug 2026 at 10:59
> Subject: [linux-next:master 2763/15982]
> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse:
> incorrect type in initializer (different address spaces)
> To: Tanmay Shah <tanmay.shah@amd.com>
> Cc: <oe-kbuild-all@lists.linux.dev>, Mathieu Poirier
> <mathieu.poirier@linaro.org>
> 
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> master
> head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
> commit: 5ae3dc078874693a0a7fd1cf32660bd473fe544d [2763/15982]
> remoteproc: xlnx: Add crash detection mechanism
> config: arm64-randconfig-r111-20260818
> (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/config)
> compiler: clang version 24.0.0git
> (https://github.com/llvm/llvm-project
> 844a18e753e822736c9805ab779144b647a2c186)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20260819/202608190009.uCbYi1Y5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608190009.uCbYi1Y5-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/remoteproc/xlnx_r5_remoteproc.c:571:20: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:749:17: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:773:24: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/remoteproc/xlnx_r5_remoteproc.c:797:25: sparse: sparse:
> cast removes address space '__iomem' of expression
>>> drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *rsc_offset @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:
> expected void *rsc_offset
>    drivers/remoteproc/xlnx_r5_remoteproc.c:837:49: sparse:     got
> void [noderef] __iomem *
> 
> vim +837 drivers/remoteproc/xlnx_r5_remoteproc.c
> 
>    832
>    833  static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32
> rsc_type, void *rsc,
>    834                                  int offset, int avail)
>    835  {
>    836          struct zynqmp_r5_core *r5_core = rproc->priv;
>  > 837          void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>    838
>    839          if (rsc_type != XLNX_RPROC_FW_CRASH_REPORT)
>    840                  return RSC_IGNORED;
>    841
>    842          r5_core->crash_report = rsc_offset;
>    843          /* reset all values */
>    844          r5_core->crash_report->crashed = false;
>    845          r5_core->crash_report->crash_reason = 0;
>    846          r5_core->crash_report->crash_reason_str[0] = '\0';
>    847
>    848          return RSC_HANDLED;
>    849  }
>    850
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

