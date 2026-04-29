Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D634F247;
	Wed, 29 Apr 2026 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444918; cv=fail; b=gxDoUNK0K3zfd6qdOPZ9GJBXDljD/3WVQ8UAkjQSzVvLEs0Lr6eAfoB0MV6UQJwC9c+4Z+T052nO0E0CJzW5KU5OQcHVvYaCau90hu0LK808Na697PFgCv0n0fzGvLxE0MdkXxrL12XyGcPnFWIBKXLLbWDdsLJfgTj8B450hzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444918; c=relaxed/simple;
	bh=Hx93FmK7hjSRWzRHUWg06ael7ME7VfA4MJgK3AB9EKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=diLPD/sDkQKwY2y+1QtSbuIWS8PqOMxhFz68S/oaRMb6CqvlznJX7tnA0pYW8+zarVMxeoRhNPaqc6yK1oBkaVmK3oEvcBZ8WbsPBDgGVBLjvNff0MdUMG2nzX65VKCt4VtfCGt/18IykQoIlqmpLwNIGXtKaqg4bHLzsYRrj2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jq09HnYA; arc=fail smtp.client-ip=52.101.48.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jq09HnYA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJEiyMisI8xgIbpRSkC3/BsvHSgXbiRxrmi5cMapy8jFr/Y3bNjW+f7noKe42/6DVPwGUhjXMVmLWm07gu/luLWRSb2lW2BD7CsNio9QyAkhLmA37jl/R/mjwC+W3IbrTdIIJP0foqR/BwRUquTBxweu6gU4Tv6zMiDZHStGv5K733jnlChSe35cnNweVJxv/QOyieqvhgzWOe5sd3wtE3pGPvC78pDw43cEYg2B/y6FUIwgAMJm0lkjGKR/0+3Tt9u6pYASgCWD3RB7SQwR5waPqSC9O6a+nFrVlfghOzxX3z3IhEGoKUHtbhf0GnFi7vGmAqJmqGvo9yPcLweaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jwx9GMtBVvY+kGMilVizmz2e9t5B2rB7d9aWWu34Dk=;
 b=snFOqsvKcv/f9OksitIG4w4mEiEaZDV3kcHxIMt6JpfItH3lJ2jIAxq4y/pXu+lGk1ocBAXCxBI5kiA3hckjTImxk3AjsJHWyWAXOvK0EpLVeHKUp4Lr7ObNkjnMEKFWkgjbs8muI/sIXTcQUleis5xjhFa3PCPjnARXHVCjyJ8Y2RdlIzZZW0uffkEgRyVDc2L+RO9U/Xuqc73MrfnD+QcNmtNED4+YRtd5ELI0W7pZyXSJFbZwN1ueE3USdlb1WAVqhj27ne4epWZ2mYOcg20WJXqsOOjrXJbnxUrglweXboygOu6enZFSfArRWHcgcvY4vrg0pG/8iVqP6ABeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jwx9GMtBVvY+kGMilVizmz2e9t5B2rB7d9aWWu34Dk=;
 b=jq09HnYAdO6o66chWE33GWlkTVPIJKjehe+DwfJlMXzrf82xKDHzUxu8GTlAe63y/m/SD0DyRVBO8X36kRj8yQYUVzY3MVGTAOYzUO9OogyqufMIuLG8UzlYd0WGSr5JKTE67osM7LVD6G9Nx/OWRDXmGFpODdkdtNaG4bTJ9Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:41:52 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 06:41:52 +0000
Message-ID: <234751b2-ae80-4686-9e65-a5f12eec9f2c@amd.com>
Date: Wed, 29 Apr 2026 08:41:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: xlnx: check remote core state
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260428221855.313752-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 30813fdf-76a6-4774-5627-08dea5ba65de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZUt8zeJMiqG9VTsKl2vS/pLHnzsK15+A1us1XAXVnFUA9A2CIWCt98H3HSTggdlBVVGYOHv26MahjhbF0NgF+LbsWDC8cZBER5T8WNRFRdo3qEPqMkbyCrJUwCZFldRMlawIAaSEpMyQlqoIHiw6H0u95vykbfwyXAZjB+MuwGeetycli1x5rdQWJOi2onf3Jt9PxpXSARKgRw9aMHQJOM9yZjLsWwLp0qFmxczAowXgjxXL99pMtwiyLrG+yRqlk5OZcY30ssjkzrH+cCv0ahJQ2+v+tfz4+f2tg+hzQPADzWYV+HVx1hEFS7CNDLjKhv5x4wAhb0o2amKjmlT+ECzteJT+IAuwK7rrNCTTodxrjTUR2sb/LmW9QmpnYgI796qgB6U1BVy9CLd3HOttClSo00e5SjLC0bQigroWn27GNV2R0fJenKR4ru57r09fWIAX5ya+f+nmXKoB7Tt2CK32kDukfiREt/VjHGtlej1hJy+NVMbbZS43wo4O+BSWliR794jlgf2xyyp64YCfaHgP8gZesZHQd7/sTEW+Nn65j0I9+OI1boSy0TlVYtdGzAJ/cmB6MbgbnsjNShj/ShS6D9NlzmX788H2k4K0AYVbnunzNAwU0q52m0cPFIHZimEi1cpXIOo5zMOsSMyaN8S4G6LMzTg33MmBeyCNDArRiSTkaGyalW+p0CNCVhpozSieqKrWXKpWdq3AxAYYQ0zcDidbU+VGTU/pLBRXzaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ZpWmMwRnIzeWdEQldoL2ZNRnBhZThVZmhUK0xmRlFFQ1RiYndlZFA0SG50?=
 =?utf-8?B?dUxBYXB0QlovejRHTzAwUC9tV01XdEY4amdPcXZiS2xtTW14VkRDTlk2VjlZ?=
 =?utf-8?B?VjNnWjJjT2lmT0JwR2pkM21OeThyZ2c2S3QwS05nQkZ5cWdncElYNFdFUFF4?=
 =?utf-8?B?MWMzSjZOVUp2WGZGRW9pM2JYNnhRa3BtSTVHKzY3WFFNYjJjVnRZbEFXOHFL?=
 =?utf-8?B?K1J6VlF5WEk5SEZNZUV5dWxRRDhUaTloSDdYbTR0WFlocDZNL1dkWFF1dnZy?=
 =?utf-8?B?bUZ2Q1pSVTZlQjV2elFaNS95bitlaGZBWnR0NnQrekVxb0xwZGk1U2k5dnNw?=
 =?utf-8?B?WkZOd01sZTRwZTlUOHEwaWVoekY2d1B1dU44My9NSVNFUk1QVHkvNVpKMTdR?=
 =?utf-8?B?dGd1cHozTVM4bHd3a0lSV2thUjhjQ1NaUjIvSktFUDdOVVhqZGF5R0pRVWlW?=
 =?utf-8?B?L2RGNzA3S0padUoxeWtVdzRHNm9HYmtUQkVHNUw3L3FOb3VycVA0ZWFaOTF5?=
 =?utf-8?B?VS9hTkdnOFB0eFFjckpGMmF5QWQ5eHpJVmdBN1BUV2dtR3hnSy9taGJpRkor?=
 =?utf-8?B?eHFaRjY5RlBxTW5oVkVwQmpYa1Q3OWpPUGJRM3B6WVFRQ29Wa2VyL1JjdlNt?=
 =?utf-8?B?Z1ErY1ZQdVl4R0JNMXlJNGQyVmcyd0NNRkdTZEJMMmk2Zi9xdkJBRjRvanR3?=
 =?utf-8?B?WU9qWVhvRmRQUUVrZWc2TkVuR0tNQWhHRUtWNzlOUzUxUktsQml1aEl4bDRS?=
 =?utf-8?B?aWNPTEtpcFpLeFhNSGd6MWM4VWdCUjdYd3dBenZPWDlvRFVvaWRpbi9pSkdt?=
 =?utf-8?B?UTYvdnRBNytNcFpjN2Y1a0Zsai9Sd2p1ckdmb0JiQUJxbHVsbGUwZHJjanUr?=
 =?utf-8?B?NVY5cjFUUStXRlFuMjhmbmY0dG9HYUw4bXJzRnRRSWhJdFkvWTJmRXVOS2I0?=
 =?utf-8?B?OWYrMHF0VWQ3RWkxTnJXdlRkbUduUnRVd3R5WTJLNnNyUU1wZnZ6T2lEMERn?=
 =?utf-8?B?WXFwbUcyVUc1eFo0SkJjQnhRTXAyQlVvK3duV2dqWm5RRmE2d3JiN1NTTGw0?=
 =?utf-8?B?Smkrd3h5a3lmUm4vYVlxVlpaUjN5b0gwTUxyK3A0bCtkK1J0N2I1TVhkdmdM?=
 =?utf-8?B?R1plOWFwZlRoRi81UDUydmRDZUtVOW1WdFRjNDhUd2xGeXRza2xlZzdoOUpZ?=
 =?utf-8?B?akgzSmFRZHYxZ3M2RHVtN2hDcjB6cWp1VWtNUkhsaDVBUGpLSnVYVGI0OU9a?=
 =?utf-8?B?T0gxNzBpVU5xUEw5dmIzN1BBait2T242cXkrSVEwK3NCT2FDZWQ1U2E4V0dk?=
 =?utf-8?B?WU1vSEI0WjRWWEpRNXVBSlAwR3dxZnp4RTExalV3YkJ1eGxxS1V0WUJieFJm?=
 =?utf-8?B?cGphWmplUXVJVTZsMWxMNTh5dGZST1hRRFNEeWt6VnlMUXRYN0xCank3Nkdl?=
 =?utf-8?B?YzYrb2szcCtHN1pEaXJJMEtzakNmYmhXVnpCN3hWeFhLMkRhMWxnNUhqcmUy?=
 =?utf-8?B?K1puV0pTVGJpWVgyblhZUWRPN3R1ZkUzTUlqaUdyb21jQ3NOZU9qUmtQdzRv?=
 =?utf-8?B?V2R1YUVvaUZPZ3R4ejFONndiYU1iNTNvdUIzOHEzY1ZLZWR2SFE4cmtLMmVS?=
 =?utf-8?B?N0lwTE0xVWdJdHJFZXlSRUZhRWxnbkJ4a3ZkeG1qVlNKT0wwOFVBUXFhbkpX?=
 =?utf-8?B?OWRyalpnbkQ4Rm44SjFMdHhkbmZkYVgxajZoNHRkQjM3Z0FMNGU4R3NvR1F5?=
 =?utf-8?B?ejFsMHI5bzdDLytBQ3dDbkM2QVlXYmJBN005a3RjU3h3OG1YME85NnhlTGRu?=
 =?utf-8?B?UWh3ZVhYdUJPaUhxNTZiZjhKZFZBK1BWS2xwemNEQ1FnRkZYRGVrYUcxSkZl?=
 =?utf-8?B?VDMrQ0hXemV0K3hYS21vRFhzWmx4Rk9Rd05TOTZ5MEhSZmMxaGxaNThWTlZu?=
 =?utf-8?B?ZFJ0d2p2K0lTdkZtWjhQRDNoWW0zZ3diR2hVWENIVXNIaU03OURFWUNObXdZ?=
 =?utf-8?B?aDlVYjFxaUdaTlFzRHpydG1UY1hWcWFmSURPekJUb2tDTWhQMVpBQWpyVGsr?=
 =?utf-8?B?ejBiR3lQdHZFY2xmeWozOUNQTlM3ZHlaRmZncFM5dWx3SWFUZzBHUW9XeS96?=
 =?utf-8?B?aWUwNHg2dFd0bDZ3QU8vWXQ0cVF5OVpzWmxHRnROWHVDeHRoT0d4aWJQakhJ?=
 =?utf-8?B?d2ZZR3pXQWNGeUhXQktlbXhHVkNCcUdNN28rREhwM1hHZnBJYWdWd3hwYU9w?=
 =?utf-8?B?YWdBOXZvQUwvTFhKaVpFZGY1KzFHSWNyZUJ6eFpNdVRZNFV5WUlGVFhQYkpF?=
 =?utf-8?B?V3dTWnBhQjZNeXJMWEVXN3pUTkpIb2RhVE9HL09WTkxmS1R2bGtlQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30813fdf-76a6-4774-5627-08dea5ba65de
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:41:52.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5E1vK0hoQKpHqPPeQk7NWvmG3kH8wQRLEBjnbenQlAR6ejb/XkOmiqCj5v9hYzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967



On 4/29/26 00:18, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> 
> Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>    - add fixes tag
> 
> Changes in v2:
>    - fix subject line: %s/node/core/
>    - add comment explaining optional resource table availability in the
> 
>   drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
>   include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
>   3 files changed, 85 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..af838b2dc327 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   }
>   EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
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
>   /**
>    * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>    *             be powered down forcefully
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..45a62cb98072 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>   		goto free_rproc;
>   	}
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
>   	r5_core->rproc = r5_rproc;
>   	return r5_core;
>   
> @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>   {
>   	struct device *dev = cluster->dev;
>   	struct zynqmp_r5_core *r5_core;
> +	u32 req, usage, status;
>   	int ret = -EINVAL, i;
>   
>   	r5_core = cluster->r5_cores[0];
> @@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>   		ret = zynqmp_r5_get_sram_banks(r5_core);
>   		if (ret)
>   			return ret;
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
>   	}
>   
>   	return 0;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..7e27b0f7bf7e 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>   	GEM_CONFIG_FIXED = 2,
>   };
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
>   /**
>    * struct zynqmp_pm_query_data - PM query data
>    * @qid:	query ID
> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>   int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>   int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   			      u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage);
>   int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>   int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>   			     u32 value);
> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>   	return -ENODEV;
>   }
>   
> +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +						u32 *const requirements,
> +						u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>   static inline int zynqmp_pm_set_sd_config(u32 node,
>   					  enum pm_sd_config_type config,
>   					  u32 value)
> 
> base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
