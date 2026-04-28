Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D43366823;
	Tue, 28 Apr 2026 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414897; cv=fail; b=J/0yiBuWyfStYIU3fN6Pu7LmNMmWAC9T9evpRhX7Ucmxf9l5wpKHVaQ2YcmreYhfr4yKvKoC3V0jKrWRNmyBy/A9WZJ2wbS9LnNe5ifF45bkZjE+lcMF0fY+N8J4RIykHTrfxvUA8oS3/09RC4qr2ZKnHl1PgnG9AqAWqdZDecI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414897; c=relaxed/simple;
	bh=rXynNvttOVkEo4QPxBM5VKRYIxWeuYEDf++voL+E7V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qSNQQoVXQDkKtJ+UxdleCxOwcGhi94KXt0IbNSeGGHV81KqPqrap9QcaAV20rKNRsKnMlAGP7ov6AfTh3lZrS7tpUdYLONWVyVcswOrIaMPm5BqEipBwHGtqS0kFF2RwcspG/YyNHbF4wsioBKk9DoILNwba+ZiX0afXhJpsvd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ctDPttfW; arc=fail smtp.client-ip=52.101.193.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ctDPttfW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIuSXMtBouh1cmD/CA/q422ExayhiRYDpTXQoit2NyCZmaTwx73tgq9W5tOogU/m/Qq6y/e94PhURH7BQMaWvzPdIJSDurWgE9uOb6jE1boyoCLF0ADmP+evIbz7JCo8WYLnpPuv/LuexH3Ukeh1YM6tb3i1bA/zdszdL5JgYzoTr1seqVvBVq47R0n1yJseorKhlguhTm1yTQ3zmFK+UuPEdRTqtCo553AV78BPWlZ87ZHqyrmT2nGHQEDcBcN58RELbfnUB3Kec+r1N3E6Xkv93cd6CPxPwXOr30ePq6oDvaQuU4Hw+ojmHlf0FiBA3vZo6NU2SuUvCsD7dRk9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv9gRwspbo5yluuEF1nPVM91tB9+GO0z0cB/B0tzamA=;
 b=K9dmVVkHmQhnNi7SiohmSmSEckpuoYdQRJrEVC4HYSSfsqIvixl7pJ7CWgqF/soun2JlxnahcnxRhMBeA1uSYtQgbkgILA2L4y9VJHFSnDRUOL4WCFoNnlVxDjJDi9RNNVu8vOSSO04+4YZ3J7Lx8VE10F7XS0d+s2aaTKMeYZWuJedWqv3Nkhcxtn4xsRVgSyCxNIm2MAW08Hags7bXYnBxXHrc7kS3wiVBYb9D3K1lSSVJx8x49kIb+C/zzha1yJgC50O51Pxmu8bY4qHSJ+c7iVHwaQrCskpGUecqBldcCJx9NjwJZNuzEhStwsy7NgVHxmUHXISrawLxUcT4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv9gRwspbo5yluuEF1nPVM91tB9+GO0z0cB/B0tzamA=;
 b=ctDPttfWO8Ajj9vBBKZcomTYaR2qvOBTHqhwOyVo84C9UhLYCu10l0civlGdJUm9I3BeIRDxxfXst4XfjG/ICi+S3DT9TI5u2jzlconNhz9kbucIrbbAYuDQAEXfHG99/mOJ8h9ydefq+dmcjJt2VgfzVxX+MCkRc8Nxac+D580=
Received: from BYAPR21CA0024.namprd21.prod.outlook.com (2603:10b6:a03:114::34)
 by LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 22:21:25 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::81) by BYAPR21CA0024.outlook.office365.com
 (2603:10b6:a03:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.4 via Frontend Transport; Tue,
 28 Apr 2026 22:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 22:21:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 17:21:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 17:21:24 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 17:21:23 -0500
Message-ID: <c8cd8b38-3548-45ad-b92e-1096691dc45b@amd.com>
Date: Tue, 28 Apr 2026 17:21:23 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2] remoteproc: xlnx: check remote core state
To: Tanmay Shah <tanmay.shah@amd.com>, <michal.simek@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260428213327.210574-1-tanmay.shah@amd.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260428213327.210574-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|LV2PR12MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d46818-c33c-4b70-5191-08dea5747c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lSjuafJJU7LQzyolbaTYbs1LAGwLI0IRKRsVUijHV4Vx64AK7ZiiqSCWgZwfXrmlMZCmnHeONKHg2XZAijGVqD2yC+PKHNBeOejFcdkuxGliZ8s6XoIRFDN5lAuodTIcFyRSFJDxJRKhfn275+By77Q+RNkUqjc3dnOexL487fJPTfptomRV4cB78AOK5uNKeEHUuHAILAIjhjogiOJM8WWUN5xz/My9MM0U9mIzRkKiUBuXdLGcNeavydjHfGRlgGgMbjCFU4O57bd1NMfOi6izPvt1gz5EEjhuA7scxoarq6/M4CgQduWjVgsj+nkPTYUt7h1f3vO7GtajyKLlM7Yqy9Vu80yO/1CkF8wiGCBE1u20v09jd5DN7geuy3N0CSpPYlq2XxFZrRo+k3qipPLouWw5V2gOsN7eDyxOXS3WWi1L2VoH7PcpE2Szl60IDpj6AUMzF9YnkP60LUc7E2xk26NPML4QZAhqIv1DI3OFd/DYzGnJRrpr7Yd+JgyCpAIVFbG0+0lHrdFGAYqQxS2FpsUcufKHzKQdU6vlenpfAIe9zygd7PndKt8PL9K5dTmf4opjzwfgqJMGmE+qK34vS+cqzbMofmzlMdXIzmOstDmrTo8vR5kCYWX71UHMqG/bUsX54gwWNvjsngcrkH3s15DKwS0aQrtOgdXD4iw/iyFhaL3OzE6YQwM8U7XRjFFVgVcsLR4guud9B+pUVpe3kb1y6NY7bpp8eC1Lc1jgwOmGOIiC0oNSdAYXo/RekyJ0evPZlliYaY20KcPsDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XCiCZwL0Ugqgt3m3RCWt/YRhicvLrOYY86DGIZnXT88nWcwenLTlUqvKT0XlAtPElgQimoPxbYvnXcElU8HPplScmIt63ZXoJIRnpR2/boRMdiccR40Ee/4WoJ7CAYSlYdlpB6KESQYaNApIWJeIEHNawQ8grs+0zhuOXf5NGIng+L+gIhC1OiLogXIEjChTpRlLdKmuLEtLbmO6wR1QnBsSmQDTkgw/b3nPFlLEYW9POyyNBaTpBbli3sFVqAgRlTb1t1T5UmvOZ3MsjJotjXaZFYoQTf2o3u8Ngjc3H0mhhpWHd7pkYbYVwlpfkjD2wSRbsVxgJevMgi1+YX9Ra9bTaJReluD1Wg8Tx1KPCDH+2kMQ+44ZO9WNcn1p5d0ykJR31muKSM4CIogXh4HRShwe3GlJOes+Nc7r25GqpUPvYJ1fBNVsmQ0a2lQd4o/o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 22:21:25.1353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d46818-c33c-4b70-5191-08dea5747c3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773

Rejected-by: Tanmay Shah <tanmay.shah@amd.com>

Sent v3 with Fixes tag in the commit text.

Thanks.

On 4/28/2026 4:33 PM, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v2:
>   - fix subject line: %s/node/core/
>   - add comment explaining optional resource table availability in the
>     fw
> 
>  drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
>  include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
>  3 files changed, 85 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..af838b2dc327 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
>  
> +/**
> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
> + * @node:		ID of the RPU component or sub-system in question
> + * @status:		Current operating state of the requested RPU node.
> + * @requirements:	Current requirements asserted on the RPU node.
> + * @usage:		Usage information, used for RPU slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage)
> +{
> +	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> +		return -EOPNOTSUPP;
> +
> +	return zynqmp_pm_get_node_status(node, status, requirements, usage);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> +
>  /**
>   * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>   *             be powered down forcefully
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..45a62cb98072 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/*
> -	 * If firmware is already available in the memory then move rproc state
> -	 * to DETACHED. Firmware can be preloaded via debugger or by any other
> -	 * agent (processors) in the system.
> -	 * If firmware isn't available in the memory and resource table isn't
> -	 * found, then rproc state remains OFFLINE.
> -	 */
> -	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> -		r5_rproc->state = RPROC_DETACHED;
> -
>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  {
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
> +	u32 req, usage, status;
>  	int ret = -EINVAL, i;
>  
>  	r5_core = cluster->r5_cores[0];
> @@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  		ret = zynqmp_r5_get_sram_banks(r5_core);
>  		if (ret)
>  			return ret;
> +
> +		/*
> +		 * It is possible that firmware is loaded into the memory, but
> +		 * RPU (remote) is not running. In such case, RPU state will be
> +		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
> +		 * sure RPU is power-on and out of reset before parsing for the
> +		 * resource table.
> +		 */
> +		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> +						    &status, &req, &usage);
> +		if (ret) {
> +			dev_warn(r5_core->dev,
> +				 "failed to get rpu node status, err %d\n", ret);
> +			continue;
> +		}
> +
> +		/*
> +		 * If RPU state is power on and out of reset i.e. running, then
> +		 * assign RPROC_DETACHED state. If the RPU is not out of reset
> +		 * then do not attempt to attach to the remote processor.
> +		 */
> +		if (status == PM_NODE_RUNNING) {
> +			/*
> +			 * Not all the firmware that is running on the remote
> +			 * core is expected to have the resource table. The
> +			 * firmware might not use RPMsg at all, and in that case
> +			 * resource table becomes irrelevant. However, we still
> +			 * need to make sure that running core is not reported
> +			 * as offline. so do not decide remote core state based
> +			 * on the resource table availability
> +			 */
> +			if (zynqmp_r5_get_rsc_table_va(r5_core))
> +				dev_dbg(r5_core->dev, "rsc tbl not found\n");
> +			r5_core->rproc->state = RPROC_DETACHED;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..7e27b0f7bf7e 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>  	GEM_CONFIG_FIXED = 2,
>  };
>  
> +/**
> + * enum pm_node_status - Device node status provided by xilpm fw
> + * @PM_NODE_UNUSED: Device is not used
> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> + * @PM_NODE_HALT: Device is power-on but in the reset state
> + */
> +enum pm_node_status {
> +	PM_NODE_UNUSED = 0,
> +	PM_NODE_RUNNING = 1,
> +	PM_NODE_HALT = 12,
> +};
> +
>  /**
>   * struct zynqmp_pm_query_data - PM query data
>   * @qid:	query ID
> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>  int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>  int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  			      u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage);
>  int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>  int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>  			     u32 value);
> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  	return -ENODEV;
>  }
>  
> +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +						u32 *const requirements,
> +						u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_set_sd_config(u32 node,
>  					  enum pm_sd_config_type config,
>  					  u32 value)
> 
> base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be

