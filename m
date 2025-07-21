Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55BF1FF7D7;
	Mon, 21 Jul 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116048; cv=fail; b=O0k/ronu2Sulr0+phYiZ4cZUO0paR2++BJExYdsgbwNU8fVXPXkCoa0m5yhTUCJLPFCmNswUohk4e2BQmCGAHzpKfli9Mf1maLlK+dXwC7AunSUEuyiahQ/BC5xKp1BFJLzLQcbdxtM8Qvj+BNCdI4/Y9rE10T/T34RghZNHVP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116048; c=relaxed/simple;
	bh=ju+7r/0jAtWRR+KQbtCeQLCE8Mkfmo2ilWbL/vnQRcc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UCe+HTiw8zYooCPDGTdPzWoAiZjPVu+cc+fjdq82sCWZMAb1uAi8Ebq8ITDAmg/Pw6zt/69oVuB4WNpzoZATYH++InNEVsnsGAEea+onCCtCbJyd9HQ5I/cyQRI0sC4NCULT2J7TUil4dfOo8wjzB/grJKlofuVhQXXRpf2563k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gdYFXC6v; arc=fail smtp.client-ip=40.107.93.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gdYFXC6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3/lp4NNwL5EeHXn+Ux0rvogeeqhaykQqQLqS+Hm6/hjRwYu3SeQZjZbhtkZu6Pcw35llX1llxBjtVesaLZqVknnCv+Feb1HbY3BSvCAFPpfOHwFff5k9UluenuqdhW2fzcC0qGpaeKSPBbVh1gvh2nK6pm0fPu1IXIaX902Y4BCNV+8Bxz3cPNa01hRY/lgjPNbh7rvv0OzoqSYKKmF2Pgn1ZZEjOxB+dMcM6p/8W7BkgfCB4uigRhiE35PwSvs8YuqSCuVvaUfBRdUaguLObhO+x5hIxUWx6dFnn7DAB8azY1Mmlxiyn/u/6HwLYzk7eroTnNKDNWjHLqUaecwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b56A+DISO/WpH4kNClEAPxiWyEVgLJnlZRtIKUuRIEs=;
 b=nIxFzLFZ+aGdWZbXa3bpoSrOLBFDp90XxJdbfwyO6Ns4dGEybLeZf1fHd5yRnNPRX78rlclzy3Od4tfxVOBxG2r0sF4NbzUv/Qn9DHEKemFZoSTUZvFCMdHptlS52RUbHVtQSG4gwcGTTWGuC0xr5rLj/EnTnVCLH2tuEd7sNmos7Gac1RMxNakI2IdQXO7i0//GcJeK6aLxpGAJs+D2zgs4z6ZtdnkvL1H0UpNC+T34ofiHiSW4qeBa+/8v2jIktRidsWBYAZFd99SJPBz8mJfnAGp5eNReSa3MZqomgDgaPE6Blj8QIPBuXVY4c1RUfPHVoiUJW0SMATwu3Ghu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b56A+DISO/WpH4kNClEAPxiWyEVgLJnlZRtIKUuRIEs=;
 b=gdYFXC6vZOFT+giKPR4f3f2wnEuDyFK5irhjfhgC6fJ9AABcWugZNONjMdL1Rz/JQc8wzFFHhLougdc6cARWUyNsV+hAsHx1q9/DC4IFVJAf/FwEbB8l64oH8SAa/LdwBHq4XlCPo6lf+AtBs+3DEhJzXmT27FP1S4HEMZCkwq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 16:40:43 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 16:40:42 +0000
Message-ID: <b1ada416-dd27-4458-8929-bf7d144387cb@amd.com>
Date: Mon, 21 Jul 2025 11:40:40 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Peng Fan <peng.fan@oss.nxp.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com>
 <20250721065724.GC4844@nxa18884-linux.ap.freescale.net>
 <aH5cNYY8_ai2xvY7@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aH5cNYY8_ai2xvY7@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:20::29) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: e8420ab7-f3c0-46fb-1b7e-08ddc875557a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RncxUVNYbUVpeENmV0xFZndSaVJDSTlHektBT2M3azVuc2I1enJGY010Qzd2?=
 =?utf-8?B?WnZiN0lLODlhTExSTDJrNDQ5MmIxa1pXaWkrblpnS1ZGSGFuVEZQWUcwSGha?=
 =?utf-8?B?ZU4zNVZsV3FPVUlCc1ZxYVh1SC9SMVh2UmFlQWhUTjA5czk1WENFSWdwNzFZ?=
 =?utf-8?B?amI3bkVsN2JBdFZrQTlXUnEzYkMwVnNXYlpTSi9TdGRmODQ1QjB6VkJGc1NJ?=
 =?utf-8?B?ckJBQU9jL29CVUFFRXRtbjdRSHFLY0R0aU8vQjZxSHRoa0JlNVV2SnZxUnJl?=
 =?utf-8?B?V2FVVW5uK2JXZTlLQUlmWk9YbzFmUFdjT0Z0YjhNL0JHZDNKeG9tTUVHbGFu?=
 =?utf-8?B?Zk9hclprbkNEeDA3M3kya1pIaWVOdFpTaGtNbC94RjJGejBnTnlEY1NXak81?=
 =?utf-8?B?SG53UUhaYlhjd3UraURsNi9YOTN2YzhIVWdaZGpJL3ltbW8vbDZGUW5peTk0?=
 =?utf-8?B?ZS9BK3lDemdCTUVvcWp2VXRaYW45dHJVaWRmUkhtOFE2L1hnOG85Uk5FbmVh?=
 =?utf-8?B?OXBQekxJdkVCSkcxMVJsY3AzVUQ1R21obXJJMFE1cEZtNVgrSEFWd1VDL3Nt?=
 =?utf-8?B?aEI1SzlvOFBRYVF2NC9uMm12ajBjcURjQUNPT3VaOWpDNEtuVjBhWjJGeXZU?=
 =?utf-8?B?a1FiYnNMU1VNOWdJQWFNWnZNVFQrME9KSkRwQUg1NGV3T3VQNUNIL0ZJdUJz?=
 =?utf-8?B?QThtQWtQRE5RTDVJS21yTjVFbkl5TlJsM2lvZ2YwQnpDL1RTbnlpV241ZUc5?=
 =?utf-8?B?aFZiWkJ0eXJCWWdJcDN1L0JnVHh3SjlkSFd4YmVNTnRjdTBjWVZORHVEbG9u?=
 =?utf-8?B?WENsTjBTZmR4OFNQZDY3TTd0K3ZyMlhHU3ZTT1h2ZElMdm5uRUVXdVJlZEps?=
 =?utf-8?B?ME1VcVV3d3lRUThTeG5IQ2p4QlNQNlk3MkVmSGZaam52cm9NRlRTdjN2dUhw?=
 =?utf-8?B?RUhCSUExUVRMTHpkUzdSMUVOV2RzSkNFZkh1aC9zUTFTR2VLa0N1eGhlK1c2?=
 =?utf-8?B?bXdPZ1EzRUxwY2FLZkUzdlpIejV1Z0xKaUZVRTd4ZDhLSFVraWs2dnBNWStH?=
 =?utf-8?B?bVBKcWJhRmFYYTBqeFhxV3U3V1RHNU5GR2lPaG1SalFBK0hkRXQ1TkNLVVlW?=
 =?utf-8?B?dVNzeU8ydFBBbjQ5TW9Sdzg2RmlqNlFqTXVqNEVwY1hmL0R3S3dTa21nV2FG?=
 =?utf-8?B?SjB6WHFwcUh2NkpEcXdudXk4cS9jZHNtOVNhUGdjWnFWMVY1QXk1eGRpKzVv?=
 =?utf-8?B?VWxvdmh2d3d6ZXdnQ1JTL2pYeGl5ZURhMnVySjFuV3gvQkVKRWtJMUdXSEJZ?=
 =?utf-8?B?aHNVRUJLbWU5TUM2ZHBiVUZCcHdidnc3cnlBYnlCeWNsR1M0T2o5bHFZRkJD?=
 =?utf-8?B?VWlSbGd1aXhMMXRIZCtCWnNqbzRLMWFuQTZhUDZ3L2JwcjJXcXVqbWJHYWxl?=
 =?utf-8?B?MmdyOHBrSGFybjRWZFFwM2F6VGE4SFBjMEh4T0Z6VXdRWXBaUkY2T0NVYTQ5?=
 =?utf-8?B?MVlNaXJXdStaNDBTWXdBUXpVZ3hKajhsNnlaUEhXZ0w3bTV0NWtpbzRtWlJ5?=
 =?utf-8?B?TTBUYzc2YjBweTFhVC8xVTF4ZkplMHg1RDZRUTNlVXUwdmhrUit2Ym9ZN0pI?=
 =?utf-8?B?TjN3dGhKZEIzc2wzaG5PZDIzZ0k3VkpZajVLaWczSFdrZjd6WlJ1aVRiRkc1?=
 =?utf-8?B?NjY4SHlhL292UEtGOWMyNmNEcGl4S1YzYWIrUlk3MFQvNjNab1pScWo3bE45?=
 =?utf-8?B?dnZGS2NCVEFmSllndkhpQkQxV3JwT01QMW5uVlVEaUhFbzRpeGQ4d1ptVThr?=
 =?utf-8?B?SWZ5L1ArTm5pRm9UeEVqZ0p1Wi82dS8vZjVDY2JIdDRxQlpVV2xxYUJGRzN3?=
 =?utf-8?B?V2V0WFoxYlBwLzVhcUJZVXdKTFhMdmlydG51alM4QmlibUxlVFh4amh0M2NS?=
 =?utf-8?Q?0lHnZUbqBFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXFUeEp3bGVnbnFlbVNhV2F2andxT0pHR2hzai8rMjR0dCtLZms5MERhM3VH?=
 =?utf-8?B?VzhWcXNBM2dSTU9ocmpjeWwvWjczVmlOQzhMc2I5Q1ZQK0s5N0ZUT1ZZT2Z1?=
 =?utf-8?B?d2NrWXp4NyszcEdrQk9LZytyd0tnditicUxUTForRTh1RE81cTRrQ2lVaXpy?=
 =?utf-8?B?NUp5ZDJDbXViVkJaTmxOUGV0UW1oRkp3aFdPcmFzR3NGUVBuUEpETTRkb3Jh?=
 =?utf-8?B?dnk3ZkY2TkJZMlpOeWZ3c0tyTllZaWxrcjV1UWlRLzhSODMrSHdqbEhhUXN5?=
 =?utf-8?B?S2s3Y2N4b0tkK1pEL0J2a2hzS3F6cU9kR2VTeXBEUTZkOGZWRzZLeExBc2pG?=
 =?utf-8?B?L2hRRWU0NytvYjIySHovMlBtYXZJYTVCQkRpY05jR0ZKMG1PRnpRL1ZMYXVm?=
 =?utf-8?B?SXBlbXpwK3Bud3BrNFkybVdvQXgyVldhWU5sOFdZNnVGMmV0ZmV5RnpUUVhG?=
 =?utf-8?B?RTh4dzFXTUdVZFl3LytaK1ZvWjJRODRGYlNiaGk5QUFkclg5akRUeEVJb2pE?=
 =?utf-8?B?Y1pMSUdGL3ZralFCb09MQ1B2Z2dqdWVZdWZQLzBxaVoxL21rZFI3cFdSbHhm?=
 =?utf-8?B?TVVDSTh6Q3NYSStGYnlTYnZpbFQ4MkNCOFJzKzRYZ3pHbm1iZWpWVFNXSmFw?=
 =?utf-8?B?YWd5SzBEbnBRMmV2cnloMjllMk84dmZuaVJSdHlWakYwV3BkWERVSU1BN3BY?=
 =?utf-8?B?MlNwT2NOb3YrM2l3RDdSRmtOcEVkcTZHdXgvcmJXVGFmZ1ltdDkzY1hMY0dH?=
 =?utf-8?B?azhGQWNpREQ4N3FudkRhRXZTTWdLUXUweTMvNXJOalZnclROOGE1alBTSUdO?=
 =?utf-8?B?RHJrNmFEUHcvSzVWSXBMbjE3Rml6UDQzMkdiaWZmcW9VVEdWYlpCVjNidFdE?=
 =?utf-8?B?T3RZcWZWNTkyOHJtNmVvNlZiRFFVekNVeVVRaCt2bDdFbHRqbXNUZWNQVENE?=
 =?utf-8?B?cXA5WEk0L2hOWEV6OWROdTJhRmNaU29PdzBCZi9VczlXR3BJMkcxYzdyMXdq?=
 =?utf-8?B?MTdrUkx4TzVmY1dIeXc3Y3QvSTFiYXkxeFhmUlk1OFU5L3J5S2RKQXJSbjhR?=
 =?utf-8?B?UXJielMwVlVQSkVsTm80OXZid0o0eW9TR2k1cnRQTXNPOEpVL2I4T0NydENp?=
 =?utf-8?B?WDg1U1BTRlEycytCSkdBV0dNWjJxQUF4OWpCQXN6dFlaMVp3empVVENPSGlI?=
 =?utf-8?B?Wk5jMDRQeGdhd0tpbS9INnc1KzV0RFZuK3c5bHg5R25qZXcrM3Nkc1R0RU13?=
 =?utf-8?B?ZFYyOHNZZ2Z2dFdIRHlRRWdieUdtdVJIUzhCdDJGVDlZNFpKbXJlS3UwL2Jh?=
 =?utf-8?B?NlNTZndNSWp3a3ExenRnVktSTnhYTG84dG5uWHB0MVBQTCtIMUUvNGs1Y1F1?=
 =?utf-8?B?NTFLV0F0UlVaZ2x2RTdkU0N0ZnBqa0dKc21iVlFPRExyVjZtZjRyeGlkeE5a?=
 =?utf-8?B?KzhpdDlabDE1OVQ0cXU3dUEyaDNNbWprY2hvZkFaWXpUOE9jWmxDazdrZU1z?=
 =?utf-8?B?cDhtUW8xT0FvVlFtNnpsT0c0ekN1akh2ckNnNGFTWW05MmFZQWQ2NjV5Rkho?=
 =?utf-8?B?UHlQbmJBblA3NTlNaVZUZDJva1hFSjc1VEZCUGs1cDB6VkFzWmhrZzI4L3dT?=
 =?utf-8?B?ejBrc3JFczdMTDJaVURhOGpZbzBBazNXc3B3ZlpuaFVQdmNXUG5rQ3ZsbXVo?=
 =?utf-8?B?dkxqWi90MW0xTHR6b3NGUnEySnphTnpqZDVBTlMrUDBWeFF1bTI3SWhpVEx3?=
 =?utf-8?B?c2g1VVNsUEhmcGpzOEFxd2FnT2RaSFRkZFplYVBwQjhkL2w1ZFB0cHlmRnhX?=
 =?utf-8?B?cFJDc1VJMFBGMWJ2Uk9zWG1IMGxVRzg5YkdKRGhpSFd1TVhNd0dndWdITllz?=
 =?utf-8?B?ZkdIMmJxT2M4ME0wcmVlUVU3clgvSGp6Z0l1SnJHWkxHcEQ4QVFlNUxoeVNw?=
 =?utf-8?B?dHpyM3FHd20yL3U4QnRwQy91TzQwZG5jTTVTUlg3Zkh6RzdFYklBcHdPV0Y5?=
 =?utf-8?B?Yi9VYkJ4cTNlZFpXR3lMUFhXSDRXQWxhbmFsNkl3azEzMHVlUk1uekJPYU1p?=
 =?utf-8?B?OEczMVNOdGV1d2lGTC9aTitDalllMm9zR0V2ZEpCejBOaS9EVEZVeWw5NDYy?=
 =?utf-8?Q?y4IA6E43OPRwTGA6JRtE1A2MJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8420ab7-f3c0-46fb-1b7e-08ddc875557a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 16:40:42.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYMBJqSPmgQAFVEQUzN+BiZ2s4DYALIRTtZJCSfCQNODfhQDIfSTx5wtLyH5ANVg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690



On 7/21/25 10:26 AM, Mathieu Poirier wrote:
> On Mon, Jul 21, 2025 at 02:57:24PM +0800, Peng Fan wrote:
>> On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
>>> AMD-Xilinx platform driver does not support iommu or recovery mechanism
>>> yet. Disable both features in platform driver.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>> drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> index a51523456c6e..0ffd26a47685 100644
>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> @@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>
>>> 	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>>
>>> +	r5_rproc->recovery_disabled = true;
>>
>> This does not block sysfs write if my understanding is correct.
>> recovery_store does not do any check. So even you set it to true,
>> user could still write sysfs to set to false.
> 
> That is the case for all drivers and not specific to this one.

Yup, may be we can make recovery node read-only. Or introduce new flag 
in remoteproc structure and set by platform driver that decides if 
recovery can be controlled via sys-fs or not.

But that's a separate discussion and patch.

> 
>>
>>> +	r5_rproc->has_iommu = false;
>>
>> The default value should already be false. Is there a need to
>> set it to false?
> 
> I never mind to see things set explicitly.
> 
>>
>> Regards,
>> Peng
>>
>>> 	r5_rproc->auto_boot = false;
>>> 	r5_core = r5_rproc->priv;
>>> 	r5_core->dev = cdev;
>>> -- 
>>> 2.34.1
>>>
> 

