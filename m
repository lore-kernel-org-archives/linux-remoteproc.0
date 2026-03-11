Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17204361647;
	Wed, 11 Mar 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258235; cv=fail; b=o51qR6YQWZxkUI2W00IVsKpwxk88TPcq2tT/yVRcpdpZLEyPoUG0x21VAO0nD5zToTc4rSqG84tlrME7RTjs1uriCswSCcnroHXH2FNjxkwbm6ksKT0QDj8L1ygkKj8qNisYmDQ0ta+E6ksrbQWXltU4AFneJQ+nOCMHzC9bL/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258235; c=relaxed/simple;
	bh=z/BrPb1JQ85qyTw74dfB+GjD6YVz4E7K+DUOL6SfSNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ArdskfpmqT4t3QL/YHsWv5BHSk68WhByFW08hP/6S+O3pq/OHL06GQaDZTBNKqssMw+pm2lcr2z04zYAQw75Fy29aAFA6xYPwHih5PCF2xBS7RTPshCY1huQ+GopHz1UROio0h3+SnSmO9KaNcGCy7Uew96NDJXnnsHO+7g+aUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SoYmeJO3; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SoYmeJO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSW1hUCiV5xjemGZd+FsnywC5we67RDZTH1FvdLWA1hKzk1cDfpuzqawKrDxnF+JlMZIcVOa2IJNSPVpHL5KUGKl3dui6snGMULQfrTirnmqDwAbx8CLqvkH7UuVMfS6H9egsKUW20StdDzLk055eklhECfCSm1pqPaItkjg93YWPcZvTuJ3oOiIXI+M4qIGQGkfrBXd0je7nW8J2jpAw5VB3lbVlCso1+EGwwuBP9XTzdzJtGD9hFIvzKs1OmLYPxd15SWhd+SaRfpzchc3R2jRo5sY1o7eDqPBGsZxepFsmTa49DRfpiDnBjohdA0rsX3r9J24XxNmJLHucfgiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYRb0rduXWO7uRnZ0izr7m62ctMOqsqi6O6U5x3KlSQ=;
 b=h7frCfCf1BPj3+mFhFDd4mPftj29++rCzmxLqAEfsvKNB6nCHHS/Jzm+tdxCKf1r7FSFVKCl8m4a9qo6RMSeEnKXBYeUEmHUAEbDes+9YuKbqo18NRTPEr4E4OkF0FvRlAEyiomE+MAZPDwS351djtuKEaZiCiMqruSP6xHq26YmziVVKV97HUgn2lqBx/mCXuufJ5Nqbe9Dqs/XucgRdPVFeLFLsRNFzh7FSukS6pxDkT/XwIjXbEkZnSpyFjbGFJVd/KvXBX+z1W87dLphihuBtBnDrtGQhkpBh/f7SRhnaLhSjr8RIuLpzyT3t2QS64ChxMxIvX9z+yzcJvG3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYRb0rduXWO7uRnZ0izr7m62ctMOqsqi6O6U5x3KlSQ=;
 b=SoYmeJO3CO1FoSwgcG8aFEQZYaFv5HtK0f3BiI1mNmb1YX+qt7MApaocPt1uxCTNZafDALx7PIpYP3G4QcXG5FFr4lHQrBWt7GG25YLOhLuHs9WrLZM1fhF9cRra8L+bTDEnUZzvoVdbnIN8fDFWe1d22VrzNo7GzD3c9h+LHmE=
Received: from SN7PR04CA0062.namprd04.prod.outlook.com (2603:10b6:806:121::7)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Wed, 11 Mar
 2026 19:43:49 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:121:cafe::e4) by SN7PR04CA0062.outlook.office365.com
 (2603:10b6:806:121::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 19:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:43:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 11 Mar
 2026 14:43:46 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Mar
 2026 14:43:46 -0500
Received: from [10.31.206.142] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Mar 2026 14:43:46 -0500
Message-ID: <9bd9b628-7af4-47fe-9c83-ef9a9220f6ea@amd.com>
Date: Wed, 11 Mar 2026 14:43:46 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: do not send new mailbox notification
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260219224329.3475032-1-tanmay.shah@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260219224329.3475032-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 6decc239-489d-4ade-297f-08de7fa6830d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TS62DUQ0OasC5/cn+8Z4kTRFox4aXewv+pj2HwooI0NQEwSolwhOYhHYYmS0C8aqFiQ+q+RXABCajwD2lgDIwhYk3Lon+rHyj00C96PtSrCGzhV7dueSoQcjgDoEYa9IH1sue4ktNC4af7nz30p+bktjgTmJMMzsf5QMWUFt9CIQrXNmZi23NkyfmN8YTrHGLJatXgx2c3Lowwp8AFieoOYHRGNZ0qJuHa8tzB0+l93/XeNfbTriULOoQg3SkjEmWPdt8J4BCzGLIT0fGPwcHXweaVHWpphxptUc1lYYifi8H/LZ7Wbq63p+Tb+uH63GBeCfF9qrFSsT2MiG2Wco3MAwjqtcqD4OR54lrqLLG4eQQjZQYg98P1SAiviM/rYLbuf/8kIL2dklu9CaJRIQqwzEbnMnAaD/L808FHJWmS/rlOnra2Le31s1atPotYGCmONLXBfpHi+/ZgiWTheAHSfmRTg5IDg7JAPKYyCNoAN4SiGVYut0seTHIWARV8jDYWvCu1tF4Ed6kwD3ZKpWjlIrrOm8lF0C1x0cYHZmtLaBumaiUA77M0iPWY8y79jVzy6DKqxG0gtMW1xdAw2uDhiKVhITeC7pD5eiyjLH4Syhi71ewseef3TEZYFG/BVrXzL6JqAt+4T05sqyHjuG8KRYv3cA9XnbX7bPhYy516CIQV49O7gRI/x+DkSPvHiueTi8VGuCnvDp+mOLeNEgpGNgPDK++6SeStEh4L8KXaY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EszFQdub60Xdt0jXRUv4QqLIbhYNpseFpAeVs1IZ0woMfcTHxyjUrARTyi6IVVmVvmMIdzIpAWBrcKDwf5ZYLom326nv3j/FsvwFbwp6KYeHlrLO0gA8L+FHkEvOLU8e5S6PQjXoxyS8mD+hCA9FY5uSSyIoAAXtjC11YUm6zgDmOCM8Zp7p47Ip31V79f2DOhxBycX6uEpqJKu5AXz4zb2pHmk54r8GwujKtwwqXMDWWn+hEiEaiHJHaSIWzdkkE/2nyokz+5PhViNivsUsGWYO4ScBRKFapFeNdItbsIVtctEQTeGNfwIkdda/qZ4uQQtGUUbHQUbSyfN4ljW0y5HjbYAd2uZTWGt2/oeMl4G3L3sULAK2IoCBR+honLSWnkCFcre97jix4qrei8zsQ91rHMuE8EuyBSEcGY5rwQFqsnLy+Vy8Hs5mDKAlNcmf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:43:47.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6decc239-489d-4ade-297f-08de7fa6830d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080

Hi Mathieu,

On 2/19/2026 4:43 PM, Tanmay Shah wrote:
> Only write a new message to the tx mbox queue if slot is available in
> the tx queue. If queue is full, then do not send new mbox notification.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Depends on: https://lore.kernel.org/linux-remoteproc/20260209234430.512492-1-jassisinghbrar@gmail.com/T/#u
> 

This dependency is now merged in the linux-next branch.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/mailbox?id=57df858a46f0a4cc104716e0ec88864e5c386ca4

I don't know what's the process, but can we merge this patch and
dependency both in the for-next branch?

Thanks,
Tanmay

>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index bd619a6c42aa..622de733c929 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -332,7 +332,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  	int ret;
>  
>  	ipi = r5_core->ipi;
> -	if (!ipi)
> +	if (!ipi || !ipi->tx_chan)
> +		return;
> +
> +	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
>  		return;
>  
>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
> 
> base-commit: 462799c088e71b2b8a511c2a9649420fcb569ab7

