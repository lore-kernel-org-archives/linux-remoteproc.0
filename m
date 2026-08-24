Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4310E381EB5
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597941; cv=fail; b=o4ApaR3nyx7XKmthUbgTxPhNu6EuL0FfsWIJ/RzMBzFMgl015GDPeZa6+Ip5BdGLpaR26JfJT9nXFrKe5KZbqHofDye8R25Y1KV4yqK016yceSNlVbRINNHU84bp3PnEDkNOurfpuNUWSdbWkP7F9XXuQTBX+0Zlk6U+pHZnz8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597941; c=relaxed/simple;
	bh=472LbO2AuJI8FenMQtasOffVLtig1fAq+KVq7ldklZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MDOCuZLLWcutfNYre/hNjZRRFdY8hyrgwCOqIs+5zRn9048RVmDW1JGAnRHfQ6YX0xRpRHzuggnpCwH3DlfEmslFZDBoWKgCOjIygNP3FWjxqg85Xm1upnQAhPglpkHM5FJ8xRkWCGltdpxHbROlXSOplwih1qvetNZnnzbOaCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f6VQYx0x; arc=fail smtp.client-ip=52.101.43.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f6VQYx0x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uekk+BzUh+9UNpcf5lMKim4LLzs2s6bR/Q6ezvD6VQdVgT4iEqqxBxY47j8s+Oluw61ugp/NE3v4mjWi1VIU3v533wRIUkhbYhnfRN/LruvZdxNxNx49VC+K8kBVvsC2PU8Nq/u9iN0P4blAoz88lZZlucDjhsnXYd8gDb4oifqwPQwZ6FMUeUYtN6b3cCH65X9z3mHC6cHe7sdeUK39YWgTXRfzdjMcDK+UsFNHScPIIsiGKAs8aOQCwVHrWMNgraOr1yz4h2N6S7oKBZZNKImI9Av8Wbov3M0vre+yoFudXEUbbkMiqt3BcY5oAlb90s/0l3goXjS34tTxtkRGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWmP/QFhdJ3VUFOWA2aSJJyKRoScLzFdfTcxtdKmfcs=;
 b=wM2guNODo1tSjgL4vtyV67ENrBG7a/xoJ621mo6t78fHF6Q6Iz269crvZ4EkFRlkr4eXVWvGIrOKhTijLlWtYQfGGDNBel2RYntCI1d3IDHAamn4vPEn8huIGuDJtpkWJn5CeVQUqnWKBtSLerc5g++hr6rVy3lXFTiNRFGEYgDUtciENYiUABqXZwMkcLKb8cf6CsaC2DZX4vJ8GkERrOgsCWvpxIEmug1egx4T2W9H40wN587Mtkanm7njDnl90av+V8VnboK71obzRCc23AMMNhv3P+I7t0UuWyN7Qi52B4MKNX6Wo/nd9HnGxU5xqEuGG6flzmf5ifzCqG7jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWmP/QFhdJ3VUFOWA2aSJJyKRoScLzFdfTcxtdKmfcs=;
 b=f6VQYx0xlv8lSuc/Dz5EQA2L6o60rnMow4ZIgfqN7Y4aCoHTmaUqP6bT6IUa6Bn4PSFKJcK6wrC1xruulzcEGPKHQu2fd0G7Zk/5fK70ENcyNGJ+10h2kmlf6vkOB8Bg6cI25j6e0LuVMOFxfcExIoHVNsmdRS8wDNNur0ud4E8=
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:58:54 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::48) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Mon, 24
 Aug 2026 18:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 18:58:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 13:58:51 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 13:58:51 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 13:58:50 -0500
Message-ID: <4df5138c-dc37-4d09-9a9f-06b6453384fc@amd.com>
Date: Mon, 24 Aug 2026 13:58:45 -0500
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|IA0PR12MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: dae51153-b58c-41c5-14e1-08df0211be5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|13003099007|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LA7ABhABVDJBUjtGKHW3gjCWjLCNkkHuJUfbB28Zyi+5MgYaY67sTgOHOAbmCzhl3ZAcVc2MrsIdahYGgEdYawv338AP1l0Uyzv32QGVO4NawadHNh4gVW+7QC93TudgPFbvog2+KV2t2pjfAA00T5uQfo/xq2g9FprmbmVTExl9XJWZ9oLFsDXu0HHE5OrVz/NbAUbkGSVUnkIwo5Fch/TFaeMY6ZnrOgJpHio6o8wI79VQt0yzNQ6lXhQcFvkLCcqU6QW70NhR88mkpWfhg1D07Qx2KIGhQlrZ2SicpU0KSa0Qk2sD6QovH1+zDS83LK2EwGNKjwTAxUZZfNbxWe8zAMbEj60T17Wc2Mb4RS9jSu+XKngojLq1wE9Ftx58mVm3g3SfmqWmRJh+v4NtzgRtyL/oGAtTPxmQXM2mUElQkexWmKAlmee+o3u6Ghml0RPekZPmEpziDqoSZ1ekhb0CZKUzUSgLh7QisrbU0gY5WC5Sr1jy3gQLNEUbaO/ZKIBz/p3J4KBEfrS0LOt0P7ZQooeCiWnk5+zTlZIYnmTQbIf5CohGNp2Um3z+ohK4Q/aeKLpeTIAzU8G0eB3fH00H/KoaqdtRBpntzRcyBblAcmTs4y0l3COhO8yvxiNLbcN0ChHAn08IxvBlDG6zEBStUwHeutPLjR5KF7GdrfvCgApYNzN+10kLm0awT6+XKxJkQQ99yXGJN/z7FarKWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LYc7mb2WvAGjz/yeZGK4BhVL3GLPoKjPJehisTF18Yr8JtO30OjMw9AqCmB0iNpPmbeJ2FxGrzHRBUtl3cQtwo6DZiXDV780YNG3TsrqePkdsrVADuoshijNSygYRRjd8ZVxY8lFN91du9eFzINog9FITC3CRuxrP7JcgvJwxCNsbbWwK9YzFFjwkoLT0/18/OLdFPz8vtt5SbAd48QyYURqfwSwBZEXuWvFbVGiUbthfV2CrZEZX8CkpzFq01eYwe8XekPzTX6CUssx/8dIkmFECUbmPvPRGm9UpFaCcZaRlQabux9uTJPhtROVoluk+qnReRtwDbW5L2bl3bNEJKMo32t4XjlQCWDcBHFsOEzM3PgQBCoz851FDjKZ9AckKylIyOG2+jsXAHKSND955nBG8qNtD0T/22VFYuIppid3SBpQjlPfyJ/RgmItTL57
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:58:54.0177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae51153-b58c-41c5-14e1-08df0211be5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694



On 8/19/2026 10:33 AM, Mathieu Poirier wrote:
> Tanmay - please have a look.
> 

Ack. I will reproduce and send a fix.

Thanks,
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

