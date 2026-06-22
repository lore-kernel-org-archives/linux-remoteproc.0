Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D35B379C2B;
	Mon, 22 Jun 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131164; cv=fail; b=PxazZtARCFOUloLzmBY3SIXMEWZWBgEPg3Lg7C/FitlyP8JWxzDVqoQzciZfV1yFeCmMPb2TZ0//B5uFCs/iJJtmTWDH1O7e5vbXgj01pDOxMxIXoJXsZVU52IgK3HtAzYMAlF9ZPfcGQd+4EWwz1qHcOq2IpQI0sbEVdZEOGnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131164; c=relaxed/simple;
	bh=ow9bJFk7YjLoutkf4F5dPUt3QaFAnR72j8ZBubI+usQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tok1FFC6qY4Q1kuNZTi4nx/N8qnFvfUSvbZ9CnFKpcoLzC7UvVIvgt4Xi/LuwBRDo1l6oUXZf6/MJXD38GZscA67kl8v3Lbkgi0FDlr720jTrvLYqElcBPEjKDyr7L5kGpLljFsRor7S2aC+7wn2uCt4QvSKHmDQ0zoBDfX8VZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nnbVQeSt; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nnbVQeSt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1TVgfuNpqnFfad7dqLIh543jm/RiSyxIy6FT+7i0CjdMcSu5DAp1zoAoefUNb/6HFmkX0BD3gbM4HekwX7uDMjG2Ji1kJiUQeI8BMI9f3gl5pVTyqSA+8Kgx4WNBQ4dRkzeoNDt2I3h1G8xhkpmS3huWc7OTCcMJkd51W+q49atqmPmTKApbjOrNBLXff9Y0TQnlWj4I+JOVwKjlF5RtmHSIpEnBnSvzouba+la08Ad1mSOqZ8noN2HNPzn1sjf/tKYl89gVpwyXtX+YI5TsJQBaM3qY0WY12F+/gXcmCDOl7eVYJ+/1djP4rY+w3BSy6bPw+9g4HFYGahkEnaxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAwNolHbKVPrV/vuIaVUYafaXZfUGEk40LFWQPRf1C0=;
 b=HPT2z/ym4Imy77cZCFewV4WDhpTa/YNEs6rzrsY0yw/ZfAKUmvnv5CDrOSiQzJwkgt9mEC/YHWzlYfMGjoQTEnhkVixhexk5bxOQAV2Vp40Txq7kAvnZWr66/m3PuR4w9zZ8jR4/HVKUaNbHanL9GPklei2g2TcfLMt+/1YA4YXRdpbMEqAg5GS5y2negfZ7+qo/zAEEn4cv53JUPzitLa6zl6RMsr57f+K7kj9SDbaP+0gjF4g4vl3s1AoacVBZTwnkJnvf0oBorHn87sEUL3yQZoOsGaRnUQY09WBXcvCai+BIBZSJlY0ZzfZnXQtwe7t8wD5zTor+Wl7n4ynrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAwNolHbKVPrV/vuIaVUYafaXZfUGEk40LFWQPRf1C0=;
 b=nnbVQeSth6bYJCCQxnLH/nDhUOzPRXSgTfGC1XCI8CZpVl8RY6fNyDmgtvQn9cYfYv8KdirI28TCc+z//hvpqOxCw5OypcM3RKnqrCqXxQCMvC4WClwrK3p6MFG//7LXltmr/GYg+2cJ3fYV52XH9Q57HUXgy6A2x6cddwziRrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 12:26:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 12:26:00 +0000
Message-ID: <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
Date: Mon, 22 Jun 2026 14:25:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260619163854.410392-1-tanmay.shah@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260619163854.410392-1-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0055.eurprd02.prod.outlook.com
 (2603:10a6:802:14::26) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: f3227f4b-ded7-47b3-c0fc-08ded0596b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	QJUqenALDwkCsjd0Ikf3QDpznUCjX0G+Bwaek5L88nOpF24htXZDDdbw9szx1gvKR+ZiQpJYmWyMx3bB5KjUWH04G5h2Zh1TNQKiBt/gvFbEE0kNeKAduci/SnCmOLC2pHMhbs8wpv7yumbYWIWyDe3O9bo/q19WVJUoL6LDTpiqb2bxmytEB7WE5bJQrEYN9iB3nbPPODiCbuRepT77fsNWZvnlMNX5s2oX9RWYBe5hhxIxjxSitj1CVomr3/wV8CG0WGoHWxMvTnvkVQthKduYdLsQDR4lED3Ulm45ZkBVh2yXNyNxnFdiZmjVDhg3je3dS+mghUJTF/f6yQdHBz2CaVlIs0MYINChFJGoUMS5bqnhQ7mjKwMO6mKy5Ttt6kicAXrbeWBAC7lB6cAJLE0iJ2G9/eAhaiiTLL82n84McKLEeyidX3pBAC6fEZfcBfdK22c/rqTD6Rj9587JxH0Qaz/m2upldSwGauvVOjRT6P2+8rdMOKUMhsr+6LVoDtaPCBvmncwk5gYDI9VSBwlUILAs2NuqqA2MUxmRgdUCEtnzLLMgKWNxcUojDlk0nsVwFPK3zSk/CjxhePv2Plu81un5zNfjs4csCSHre0p11jK/yb6QzK5AEsGvfn414IbeuMBpaRs0CcCHXDsb80JsHtVNXeqIIUiqhfREKjw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25IdXFYaEx1cHJIaUVvZTRza3dnNkV3Q3VMK2N1RUl5V05MUHgyK2xjQlBY?=
 =?utf-8?B?cVBYVFJqRVhCOTZKSEN0cW1UeWdabzh3V1lRUitPOXNMRUczMUhOb25VdXRj?=
 =?utf-8?B?clNGMFF4YUgrNWY1Ulo5UXdOTjl4bXFGSkVsWkhGQkVQSVVhTVZPbG1sanNM?=
 =?utf-8?B?YUd6akRUSHZFVGlVMGx6RHVQNy9yVGhoR1FiSlRDL0R0TWVEYjVJRXR5dUtC?=
 =?utf-8?B?cmtEWlplbTlkbDJVZzZRbE9STmRtY2ZqNUs1Q1BjSHViMTlMQ0dNcDhXUUdm?=
 =?utf-8?B?M2s2UW9lKzAzNSttREgrRWlLTm1IT0tZSzl4bFdwaGVzcnJQUDJ6MUREMTdE?=
 =?utf-8?B?QUJObDFBb2lmTkJ0Yys4ZGg0WkkvTmFLUDlOQ0dsNEdHRWE2cE1CUVhUYUhT?=
 =?utf-8?B?UlFLNk96dFNDcm9JVVdDai9KK3czSHBFOWhkY3RNTzZ3cVJsc2xxNzl2MlJ1?=
 =?utf-8?B?QmlJRks1Nmo0dVV4c2VyMEtSYkhGQ0VDeDg5Rk9rRFkxemh5RUF3NlBCNzhR?=
 =?utf-8?B?U3IxUWNxcThKVCt3V1lkVE9KNkhkRGppK2FnZWR0NGZWb2Y4bjAram1tVGs4?=
 =?utf-8?B?dTNhMzJZY3V0TE9BcnlWVlNTdEZnL2pMT3lxdE9HMjV5eno3N1NlT2s2V21S?=
 =?utf-8?B?RGZZd3VuQzF6REhOM0Nod1ZtOHhnQzg5QllBUmN3MzFibmlUa2R5TjM1c0JT?=
 =?utf-8?B?RmlZSlc0R3YxbHFLZ0lyaGlBWkFUbXNFdVNsVkM4NDlTNm9MRU1Cd0Z3UG5Y?=
 =?utf-8?B?aE10b1RnL2YxNUVKbURyOEt3bmlGbmtUSXkvbUxQNTE5SkJhK1ViUVFTbk5C?=
 =?utf-8?B?d2IyTmRSem4weGh4UjhBOWVnbkdDejdHQVh4c0thMkV5c3pxemJ6QWZwdVBu?=
 =?utf-8?B?YjJoS3JCSWZpcHR0ZUk3WXJ2WWhhYlhmUFdOVmRpUnV2eDJIN09uVmx4ZHFI?=
 =?utf-8?B?UUgxZWxMenpJYVVGVTRXV3ZtSVkyODJpQWlRclI5L3ZnTUd4WXAyZEJSWjZL?=
 =?utf-8?B?cDdwUFNGb2lsMVhkT1pYK29kb1BTWlJhMi92QW5sVG5ScXhmdkpicHZ4MFRw?=
 =?utf-8?B?a1VFc29vVERsb2c5NzJlNjRnU2lWczJzazM0SXpOM0VBL2xGQytlRUtIOE03?=
 =?utf-8?B?ZXZ4ZmNSQmdNT3d1c1JMNG9OYUttZDhMYjk1S1JaYTFXMGtLcmlCY09mZ2tV?=
 =?utf-8?B?Wmk1aHRETDcyMTdaMmxTbTlzT1h0bmFIQndrMGlDczhoRE13N1VUUmMwRkNo?=
 =?utf-8?B?YkJCSCtaUmUyWWVSbWxWQS9uSENHc09FSFVrMmF4MWt3QXNtV1QwZituUlF5?=
 =?utf-8?B?dTQ3dEs1RSt6Mk96UkxxckpqZDZ4QWlHcW9ndUlWb3lkeWI0RGM4ZXd4RGs1?=
 =?utf-8?B?K2VNQ1l1YTBVS01aN1lpTjkzTlFTUWNicGhKd2QyOXowWVV2R09hTHh0Ulkx?=
 =?utf-8?B?U1NJaW1kMnhQRHNVQ1YyK3Vqdzd0WWNQRGVXdHF5L04rRHR0NlVMczVON3Zt?=
 =?utf-8?B?VVArbnNHa3d1WWlqRkt4YXhPNUdjeEJweFNJMmR4UnZiVWFzRTV3STlJbGF0?=
 =?utf-8?B?RmVFTVBxT0lzSlVkN1lzUEphRUJZMENTZkpCUmpyS1VGaEhSRThFUWtkT2ZX?=
 =?utf-8?B?dlBSVndxUEU4aDEyR3pQQTlodklpTFZMSUxJaWNiTGpLWldibWEyc0QwdGkw?=
 =?utf-8?B?Yk9UazNEZy9WODdRenFRUlZHSjVtbkM1ZzlVRmp4VGtOaUZKUndHVFRUUzdz?=
 =?utf-8?B?QWJFd2RCcUhuNFhXcUhTazU4N1c0VXpVajZJaWdJSXp4ZXAvc2NUWlRzR3lu?=
 =?utf-8?B?UHF1M1NYeHd5TXB3bDdnaHdZZ1k5ZndXNEtEUVhkUTNTOWx1WlVDWFBRZzY1?=
 =?utf-8?B?WHpnWHl3Z3JBODFaODRJMEVkTWsxVUZjZUxEbG4xbFB5eGV6aHZLd3FOWDhY?=
 =?utf-8?B?WHZLS1h1TGlpOExLQXFuWFArL29hdktkVFFuS0pON1NCVDMyTGIvZVZwVmhY?=
 =?utf-8?B?YXZsOFNaUjdtVGM5QnNGeG9hSDc3RG9CZ0MrY1QrS2tiemJjQ3lUaDg4a3cw?=
 =?utf-8?B?ejZnS3dLY3lTTWRaTTBpdEdjckdrUnNTN09KY3VmY1pwS0dpS29vc2JwS2F5?=
 =?utf-8?B?RkJHMzdFbGZEaDh4NmpKNGhEWFM2MTBRaTlPQ2QxQ2FYMHk2ZkdpTllTNHU3?=
 =?utf-8?B?MDdHRTIwSjFXN21rbHRUYkExa2FkdGFrUlZiQkZvUzhhTWFkTHhIR3JOeFpR?=
 =?utf-8?B?RnRYL01YcDc4dExlU1RLWUlKMUUyL3F2MEpFUW9PV1ltd05hcWFOdnpxd20w?=
 =?utf-8?B?aisyYUFaaTM3ZE5lZXhzOVNDcGM1NllnQTdON1c3K1dGdHlRdndPUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3227f4b-ded7-47b3-c0fc-08ded0596b3b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 12:26:00.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIh4OFoSkBb/fMRPzE06cUJ3zmvw/3hh/+61QGj3XOCETF/JNZBfCj7rvkREggp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396



On 6/19/26 18:38, Tanmay Shah wrote:
> Current _start and _stop ops are implemented using various APIs from the
> platform management firmware driver. Instead provide respective RPU
> start and stop API in the firmware driver and move the logic to interact
> with the PM firmware in the firmware driver. The remoteproc driver doesn't
> need to know actual logic, but only the final result i.e. RPU start/stop
> was success or not. This refactor keeps the remoteproc driver simple and
> moves firmware interaction logic to the firmware driver.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>   drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
>   include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>   3 files changed, 110 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index af838b2dc327..f9a3a95b0638 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>   }
>   EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>   
> +/**
> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on SoC
> + *
> + * @node: power-domains id of the core
> + * @bootaddr: Boot address of elf
> + *
> + * Return: status, either success or error+reason
> + */
> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> +{
> +	enum rpu_boot_mem bootmem;
> +	int ret;
> +
> +	/*
> +	 * The exception vector pointers (EVP) refer to the base-address of
> +	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> +	 * starts at the base-address and subsequent vectors are on 4-byte
> +	 * boundaries.
> +	 *
> +	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> +	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)

here

> +	 *
> +	 * Usually firmware will put Exception vectors at LOVEC.
> +	 *
> +	 * It is not recommend that you change the exception vector.
> +	 * Changing the EVP to HIVEC will result in increased interrupt latency
> +	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
> +	 * is non-secured, then the Cortex-R5F processor cannot access the
> +	 * HIVEC exception vectors in the OCM.
> +	 */
> +	bootmem = (bootaddr >= 0xFFFC0000) ?

and here you have different values without any explanation why.

The rest looks good to me. It is a step in a right direction.

Thanks,
Michal

