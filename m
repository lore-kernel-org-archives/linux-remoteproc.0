Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A713C2B80;
	Tue, 15 Sep 2026 14:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482798; cv=fail; b=YuE7yH9YJCuwoPpjwmmTs0jTzgbQ2/G0n0eH9TL0SseO3OsJSVHRjxoxdL7wgiXbKRTRvp/mpDkroYU6k+drD5erMWCuIwDr5cYQs43NRcyUYjvDxIxKsnRQihw2PS/K6QCnHXfTXlrhtIHg+c4JkmiPQqZKksZnmjj22oEOEhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482798; c=relaxed/simple;
	bh=ca6Hk+VveT/UG4gSo5TiQNXsJ1VLZbYfsMJAvznSzOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pFKTveVEl+wDb9AIDTZhTm3fYKIqXSiRnUqhzpVfDlAns0O0/p0Uip3VhhJO74zeAwUvv3L26yb9ClN1IMql9MoKE9/ABmGR+KgMcAFZBPNSWkEZVfbfvs5hWV86pUbOiEYj//SeBHEnfDGAp+sPOrN5D84i9JhUPhHamztagyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BREgwQJd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hHTpWsfA; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BREgwQJd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hHTpWsfA"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD1BCw013376;
	Tue, 15 Sep 2026 09:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4e19HiOreb7T3cKC6/N3qqtqyzbjiuEN5lsGEpv8s
	8E=; b=BREgwQJdoKRic9yafKtKVHxV0zrUfYW8EYm5E5nu9e+++R6OjZNo0RLGX
	3++AxTJENFCL5To5N+3u2gpZtruKW50w8O+r28ToIu3smAcOjViZXRMp9D95wWjh
	XKny68XzLyG1/cIpjzm8CtGtx1JKR691mm2IpelgPkWFs0P0HFv4RWZ48VwGD35V
	PsN5NUEgifxZe1KsVz7cxgn4O7Yqjca3a+zsxZL1+tAmxabkQXg5+/wZXxuD8nie
	uVn20mD14cESNsVkyqpNf12pnN+NU2Ztf+mvZbZ8GaYpLW6+s6u2WMxuVeeTS3Kw
	bF2UCMQzjitczrT4RatSlP0vAByBw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gq362sygx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:33:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSax5c5iQglb4PMF/SAuefCJvziFkMHnPId5en0p0sPyhladptx7Elmn/SrTYm3cAsl0gw4XDa5/ZYwB6cCStZhdgv03tnq2JAt7w/JdJU9ty97EsijmjYEFc0iScWeu1rlscXGPkfC++tJGy/qgSCNtfe+uw7ovHsiW2rW0HQv3VrNhOXLty6W1Am7B7/cxBHOXczOZLOepiW/SgGEIfRCEW+is52b2Q24yT9CuNUASH004Vz86MN/RNuWlIxDuisPqYTnfe4pj/+RVSUvU2h1MbVk7AOSOj2O0vhStfRRiLogiHF+VohLy7SrTWCR3Nr4SyQp8OBdwohbOsQnKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e19HiOreb7T3cKC6/N3qqtqyzbjiuEN5lsGEpv8s8E=;
 b=quKNO/cpYWv7iGsrBaQneR9KsYNjeHIQz676qauURRTHcONG6hGzUz7wWlf4d5Bd4M0/jZviWMz7I2kbw+V0IUjM8x2RRpRYdzMcXdsNW0WoYMjMLI7tGzIfvV6S8rmAtln6q5P1PHKMTXSeRN0/R61pFVCkOrGtGeRE6XTAqc8sL3gWUKYrle/4SMpc63H10B2O+zQ2HgL/yNFILrcp72liBUyKz9YU/2K6tJ3qS3SSsC5hVoJvN5CRGguELfSA+cFokXqX6bz3mRyHjROwng/o/7CjcZiusg0s7/+U0Ntszdn+Zww1QX3+64rBuofM/biJFiLaFH46YpPMMiuUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4e19HiOreb7T3cKC6/N3qqtqyzbjiuEN5lsGEpv8s8E=;
 b=hHTpWsfA4/6TbYbMAf/D3JthMflkCr5TQ6T/u2W7nBazZpLQnbuaGt2OhMEJFQNF9ibFUPOSOnvAaDKgAcx2zZTo4SZVg8jaBXC4J5c43DP/CJT60BtF+BpSPYCratie7uIJd2SHDAgDDzaL90Ah1TWUHl1VKzytJzXhkqgjZS8=
Received: from BN9PR03CA0947.namprd03.prod.outlook.com (2603:10b6:408:108::22)
 by PH7PR10MB6675.namprd10.prod.outlook.com (2603:10b6:510:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Tue, 15 Sep
 2026 14:33:02 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::9f) by BN9PR03CA0947.outlook.office365.com
 (2603:10b6:408:108::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Tue,
 15 Sep 2026 14:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 14:32:57 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:31:47 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 09:31:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 09:31:47 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FEVhtL3401892;
	Tue, 15 Sep 2026 09:31:44 -0500
Message-ID: <1a553f4f-9c36-472b-920b-281469659898@ti.com>
Date: Tue, 15 Sep 2026 20:01:43 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: k3-dsp: Fix usage of omap_mbox_message
 and mbox_msg_t
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        "Mathieu Poirier" <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260904195634.2275867-1-afd@ti.com>
 <20260904195634.2275867-2-afd@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260904195634.2275867-2-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH7PR10MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: b8285fd7-3876-46bf-b0ea-08df13363ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|10067099003|4143699003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SzDiMGLdc7gNMSwdGCRwCgZZ70HzegItcZi6SvhNZ+cah9PWJ03jHmCEm6UVjc4T2mXpF+wBsuAxjv9B4Osha5MvuYMcCXa+/k3uoUjpoiLoE7HjIBAhxiCfU04TKkyrFVIuK4dOoP0j6VKnRjo9Buxr0m5X1cUK1oMTmqwPkHKlOOBw39xVWWUYyc/hLPSqIEExTLxneME+Te68XWK5H97zPTX/urSaiLM8npR0rKy5DRL6i7M1yaCwWsmlv6IcoNR/ujTp8Og8CUa+LQUqkaf+lG27a35ITmsb5s/EbTgwKxrHmAAmeQXXmxcInXq6XeVcBJiSuNzdB+EU8SQfxtI8Tek2NCiwPP5IRzfZiuhbEdQMv18QdtV14hRsb0d7Ie5uT9iEw47bzF6b01MUeVE04f2QX7Y49uYbSmBYRbmG1GclMX38NRzFCvQg7VE3iSeB0zzua6wKgYlb4TgiqtrJKEol/XTpn/Lu2bZral4Nq9z/4MOuBW88O81mEd4GKdOFSRZvvAQXwiUL/zg2/RDA18tIdRqLx3X8JGHGnuS+/dx1EloTRs8SYUpwnxE0AZraurkeDa/Uirqi5RbrbTpbpico/7fu5QU8GOT7cIlPrTzCMJQVdpjBZD74hJeS65HzqKZuw2fimIG+2aH/3J7e1efhre9jodGtel9ZfaO2Af6UDRvD5Nh1YGx7xiRshIykTimMqq0UDXO+cQyuHw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qcs7TT6fSgjR4PvdlAyaaBL/AY7TCmTz9eWtQed2Svmy4tX2xDS5C0UKqri7igN+S0GqThhULEReEZxqydPs37RT7vly15wW1CVrglHIYRHJVVMsccuLjLYJP9y5vLxj86yHHUH6OrR2fle8g/naBdpFJVjMc2T4gDS0uPT5oag0966paeKcBiBzgL+VcJIYIYFsBEx3bk8yd401wsqiJDMsSzzVA93IWXBnFgYaT0T7Z2z34aW5srFUlg2LY6z+CSzcGGVndpshOAogOxDJ0nE/h5AgLyQsOLLSAs0SqL0a7epOltYbB23/MbC6LKwzw7ICO7+QEpyOxqPEy/7d6eutZH0NQ6hmt9kECStvJagkG+K6ldqTrZ8rZnPHWfIpwNzmEdeLrAzUegO2FirE/IYaPdV5YDmlZbmF5Zkx/+V2EQilE3LEQaQYRbIiiZ7F
X-Exchange-RoutingPolicyChecked:
	sr4QvrhtRtHDaSrydGbTgnG22r6Om6zlQ4Ei4SGAALBxYP26ndZD7bU17cizqlF/fssfn5cAvEYQiCR+fSMV4YaW+5zE5VOdOh4RziPGRb+hkMsN4MKxXrqEo4M0cRnrXWOOwc/7X0p4sYfPgcWHjTh1byUO0/UThqI7488VOAvfhrrgOj5YEuUp8tJRkOHTGW4x5J2I/itC3iXsDsU3vEqhzReH+cxo/A2OIzKqi2Be2NdCuzVvsAptwqJ3rtDwnGH0uuP2joK5iN8fsbSjekk+HBjUG5Utn5/b3pakqw5pnlrK3QvMnPq07gQz/RFDriNoWoPX0JOhXPVGwMnE6Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:32:57.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8285fd7-3876-46bf-b0ea-08df13363ce5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6675
X-Authority-Analysis: v=2.4 cv=P9yvFSAu c=1 sm=1 tr=0 ts=6aa95727 cx=c_pps
 a=1kzZLs4G264k5kMmJ/E+Xg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=EYxIc1swQjW10dGkJLMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1WjhQZ3Z_u66ADl2AvUdk_O03-Z7UblX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfXwmHGGLdxDdZq
 uPzK8IyR71MegjtGUNrFQ87qw9zEadtq+qe03touSw0dCuVRVdcCyYfOD4OYHfltGTVD9tpuhoo
 Bjk/UPe+rc8g6zQ/goebpMS74V2r8Te/4YoEzznv68AIq9M/sewZUrL/G5W3h81s8kI9jJyX0KC
 xcJ+zYBxu4tT4XpwzVtr0lNFdRQFaqEkOEFZd1K4kdXUh+B/xN9BiqTaLwH+3o1l1R/zCPHtIQg
 qhKm8ndhM9z/LG0ydW/lrvA0jrPXxCmmFVtgP3YFdeH6IOJAwkTmEVTIw3fpnHvmc3/ILDigQmA
 PfqbcUJaSYSVQiAdwSwrnZrUbmWYvprK6KBencLegYivOeGqYupqDFD7/A/k4mPF1s8DNYoPBqA
 DtRaHQT08vM2mLRfeezrWFWDdBga+28njg74hYqDFF6kUwapI060nsKKwwIiiiGve59XOLaY2BJ
 oSDTgYFrmesXs5/lfjA==
X-Proofpoint-ORIG-GUID: 1WjhQZ3Z_u66ADl2AvUdk_O03-Z7UblX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxMSBTYWx0ZWRfXx4qgJOehTDN6
 Fgq8VXnZEewAHr7BPlh1d0YbnB5NOWXMHqxJ382+j/tgwJdXcLjQdOUaO31P2SjK5KzM9qwejyu
 YG1D+wvZnfQ7D2ou1E5bXHRdG0a+Z5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150211


On 9/5/2026 1:26 AM, Andrew Davis wrote:
> The type of message sent using omap-mailbox is always u32. The definition
> of mbox_msg_t is uintptr_t which is wrong as that type changes based on
> the architecture (32bit vs 64bit). Make the type fixed to u32.
>
> This then means we need to fix the helper macro omap_mbox_message so it
> doesn't cast to u32 twice. What this macro should be doing is converting
> from the message type returned from the mailbox framework into the
> omap-mailbox type. When fixing this we should add a macro for the other
> direction (from omap-mailbox type to something that can be used with
> mbox_send_message).
>
> After these changes, make use of the new macros as appropriate.
>
> Signed-off-by: Andrew Davis <afd@ti.com>


Thanks for cleaning this up. Test suite is happy.

Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Beleswar Padhi <b-padhi@ti.com>

Thanks,
Beleswar

> ---
>   drivers/remoteproc/omap_remoteproc.c | 10 +++++-----
>   drivers/remoteproc/ti_k3_common.c    | 10 ++--------
>   include/linux/omap-mailbox.h         |  5 +++--
>   3 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 6ed0f28edac9c..efff95b8e363f 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -499,7 +499,7 @@ static void omap_rproc_mbox_callback(struct mbox_client *client, void *data)
>   						client);
>   	struct device *dev = oproc->rproc->dev.parent;
>   	const char *name = oproc->rproc->name;
> -	u32 msg = (u32)data;
> +	mbox_msg_t msg = omap_mbox_from_message(data);
>   
>   	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>   
> @@ -550,7 +550,7 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>   	}
>   
>   	/* send the index of the triggered virtqueue in the mailbox payload */
> -	ret = mbox_send_message(oproc->mbox, (void *)vqid);
> +	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(vqid));
>   	if (ret < 0)
>   		dev_err(dev, "failed to send mailbox message, status = %d\n",
>   			ret);
> @@ -628,7 +628,7 @@ static int omap_rproc_start(struct rproc *rproc)
>   	 * Note that the reply will _not_ arrive immediately: this message
>   	 * will wait in the mailbox fifo until the remote processor is booted.
>   	 */
> -	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
> +	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(RP_MBOX_ECHO_REQUEST));
>   	if (ret < 0) {
>   		dev_err(dev, "mbox_send_message failed: %d\n", ret);
>   		goto put_mbox;
> @@ -777,13 +777,13 @@ static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
>   	struct omap_rproc *oproc = rproc->priv;
>   	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
>   	unsigned long ta = jiffies + to;
> -	u32 suspend_msg = auto_suspend ?
> +	mbox_msg_t suspend_msg = auto_suspend ?
>   				RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
>   	int ret;
>   
>   	reinit_completion(&oproc->pm_comp);
>   	oproc->suspend_acked = false;
> -	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
> +	ret = mbox_send_message(oproc->mbox, omap_mbox_to_message(suspend_msg));
>   	if (ret < 0) {
>   		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
>   		return ret;
> diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
> index 3cb8ae5d72f67..4b6da3363f6c2 100644
> --- a/drivers/remoteproc/ti_k3_common.c
> +++ b/drivers/remoteproc/ti_k3_common.c
> @@ -54,7 +54,7 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
>   	struct k3_rproc *kproc = container_of(client, struct k3_rproc, client);
>   	struct device *dev = kproc->rproc->dev.parent;
>   	struct rproc *rproc = kproc->rproc;
> -	u32 msg = (u32)(uintptr_t)(data);
> +	mbox_msg_t msg = omap_mbox_from_message(data);
>   
>   	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
>   
> @@ -94,15 +94,9 @@ void k3_rproc_kick(struct rproc *rproc, int vqid)
>   {
>   	struct k3_rproc *kproc = rproc->priv;
>   	struct device *dev = kproc->dev;
> -	u32 msg = (u32)vqid;
>   	int ret;
>   
> -	/*
> -	 * Send the index of the triggered virtqueue in the mailbox payload.
> -	 * NOTE: msg is cast to uintptr_t to prevent compiler warnings when
> -	 * void* is 64bit. It is safely cast back to u32 in the mailbox driver.
> -	 */
> -	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)msg);
> +	ret = mbox_send_message(kproc->mbox, omap_mbox_to_message(vqid));
>   	if (ret < 0)
>   		dev_err(dev, "failed to send mailbox message, status = %d\n",
>   			ret);
> diff --git a/include/linux/omap-mailbox.h b/include/linux/omap-mailbox.h
> index 3cc5c4ed7f5a6..e45f8c3841c23 100644
> --- a/include/linux/omap-mailbox.h
> +++ b/include/linux/omap-mailbox.h
> @@ -6,8 +6,9 @@
>   #ifndef OMAP_MAILBOX_H
>   #define OMAP_MAILBOX_H
>   
> -typedef uintptr_t mbox_msg_t;
> +typedef u32 mbox_msg_t;
>   
> -#define omap_mbox_message(data) (u32)(mbox_msg_t)(data)
> +#define omap_mbox_to_message(data) ((void *)(uintptr_t)(data))
> +#define omap_mbox_from_message(data) ((mbox_msg_t)(uintptr_t)(data))
>   
>   #endif /* OMAP_MAILBOX_H */
