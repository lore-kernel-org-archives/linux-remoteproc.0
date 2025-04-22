Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CBE502B1;
	Tue, 22 Apr 2025 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338254; cv=fail; b=P7Z6eNpeO4UiAEm2PVymm7ldPyXK8m1/StsS468Rx+Z6ZxteFIFpG5C4rI8gZ3liSo758j998JgIsydQh2GKJckq1IgX45ZNbHvcxUHNlroXZ3G7BQUzOISpVlo8eEdKbxYxxD8fyW6MBxPdkjvEdsdkYkH8UBbTQKc1bs8EYw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338254; c=relaxed/simple;
	bh=0y9MAoJ+W+CcqANjAxXn1wvb3O2ygBoZBrkoIXFQA/Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gmbss8WjBFQ/HAevE2+bb+mIUxTxHVzwLnTqNzt6hWRsRu6+XiQ+TpJKvCcs2ait1neWak+nCLROj5nsbEXxAVD4S3DqVkCbfP5h9C9KWIlypv8ZeDSJIyWsxpDege6tPD3D6RSM46P7/FBKxcqg4wvJtlV0Q7EDIolyjtOrAQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=evWafftn; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="evWafftn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV56CP99+8NCGkXhNPqIK1kZmmXTdQaGYmt4pdGzX4lH/Z4jFywB7Ahl60ddOTL48PglbmFEf0Rq9tXqWWTTaJ3Mv3KgsqwJAQSNCpHOaqww4NXqTu1T1RzIM8C41mMIk1FEyI8dXCeOXY68TdgzgwfLqFSycKGJAemssQCzTsMLoTvMvLND5cP/rDBMKIVv/Fhd0XK+3CRHtGcK4jH9GPCR1lj4A5zdzi35FLS1A3GI1L7I/lE0eNp4LFwCEShEy2LzVfMucVh1Zop4sIVMPeZIjmzV5tBwt3hMfdkUC5Xm/gXWRbUOqvIGKBGGcA7wHAly3ZE7ZM7ntlzHBctLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcS4woyJuyxmuYIgIkYlDKbvkzShIXPhFcn8EwPFa/M=;
 b=lq3jlRq4zFsXDHnmDQPV0TGnON/KwUsIF1rOKvepTGtNCXdMiH81KoXlSnTIunu9sk4Ue5BW7WY2LSVzTrM8o0mvDO+6dcePrN96oKZch2pWqmlyLdojFLj+HS5NyTM2PkDWkR02/4qNuCN9UBLzeQV9Fimoy0lfLVKuT68L+BfYqwuP7cx6g+IPt9aEYqZUGFiDNnR8tob7JMaaBgltfGJ/V4llfL/++VUP69grGbQ97aCTxyqQl/YOBwERBGLPEzgyWuD3yitQUta1LoyhAYWKkFEKObiohJTV/zEhzKBy90g3TSOkN0jUo43jN7oCGA7XSuuyUy5nq0nrrhUmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcS4woyJuyxmuYIgIkYlDKbvkzShIXPhFcn8EwPFa/M=;
 b=evWafftn7Z+VfYPd30zm7S9p4fzGdaF8BGaUnZeoGtm9gs182BEsrg/uRRLTvYnsY0zRV/dpSvBX3pKOGh7ynpTP44hLCFbTrAwE8wnELTsZmU6/QUGZAT8ctKfdxnc0I/JVhPr59L99wj4q7JljnCsnk2iI3RYGOFFG+j1ZLLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by IA0PPFB67404FBA.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:10:50 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:10:49 +0000
Message-ID: <072f2139-a860-406b-96b8-aa59a83950ee@amd.com>
Date: Tue, 22 Apr 2025 11:10:47 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414184600.1166727-1-tanmay.shah@amd.com>
 <aAe80OlwWENHI2I9@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aAe80OlwWENHI2I9@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:805:de::30) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|IA0PPFB67404FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e17e22-a260-4c8b-53ae-08dd81b83f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFJ1Qk5yUU1MZXB6ZzJvMmJQS2xKVzhuSzlJSHZ1dTlMaWpJMFNGNlBSWmoz?=
 =?utf-8?B?WWdBbDhMeE9KdmcxUXdmSk1sc1dDcWZaY0MxYXFjcXdsMGpTTUVCMnJrQ0xO?=
 =?utf-8?B?TlhDUGR1dW9jVE9PaGp2Y2drb2twMS95bnlpUEFpRlNvUkhSbU9QemhVUVdu?=
 =?utf-8?B?b1hRTUtTWXduUEpBR1ZrOVBQamV1S2g0OTZCT1dnRXJGRHZoUU9kNXA3TzZp?=
 =?utf-8?B?cnZlMFUvZ3VZOW9tQTR1RjFYZE1ybzM1bWVzcnVjL2RteHpueHBMN2c2WXln?=
 =?utf-8?B?cUo4RFlRSUlxQlhYN1lRcDBmVWpZOUJ1aDVNRkJOMEk2VTd5TkN5NGdTMnFK?=
 =?utf-8?B?aVJxajVYcHNHN1dQa0tibDRObXl6R05PNlJJZGZXcVN3V2pvL1VjNnRLSmk0?=
 =?utf-8?B?TmIyaWhKc0k3V0d1aTMvcjlDTWhSU1A1TTJkL09UZW1hb2FjblRPdVFVeGlY?=
 =?utf-8?B?dWpMSnZxOGU3MmovMExaYVN4T01EQnNoSW1aU3lQeWoyNzFGQVhBNlJieEdm?=
 =?utf-8?B?SzgrNnhGU0VHOXUzVVdGY1MwOUQ4NzdoazMyV0tlVkh6a1FKL0VzZUhsNitC?=
 =?utf-8?B?bFBMNkxVY3d1Q1NxODVTUVdXRFMvdDd0bmoycmRIcnV3eE9jYXhFRGlzN3lI?=
 =?utf-8?B?blJMdkc5MnQ1KzE3ckd3SGJQcGpYSkRBemZvRytpVUlGZDZ3bTRrU2pNejdC?=
 =?utf-8?B?UWZBZFAwY1IveHNTK29XWk1UUC8rUXVWZ3ZWamFNWHQrK0lCdHJ2OGpTUWV5?=
 =?utf-8?B?TzJSdjl5RkJOUnFUaTFqc2ZqMG9Oa1c0YU5OeUoyWUFTZ3dRMTY0aWpYM1JH?=
 =?utf-8?B?VjhTSVJYZDZxeWljQnhSTmN5MHlPMDJjM3dFdEpyV2JmUHdveUJaOFhjR1Ni?=
 =?utf-8?B?U25JRzF1c1VtbzJoMGlITnE5K21XS21mTWZ4UkxLVE9iYXVYY2ZOeFZKZ0Vx?=
 =?utf-8?B?YzNyMGJTNEx2R012RXVGQ0ZaQnUrUGRKNU1IRGRGbWxVM3RFckpGNnZsUW1V?=
 =?utf-8?B?Mlh3WVU0ekpnVnJFY05CbnpDUGhBb1FzeUxZa21JYzhZWWJGOVJyckpQS2hJ?=
 =?utf-8?B?SzZyTlgrNzlCSFliZFhvaWpqSEl6UVdsNi9lL1Fqcy8xY2RBNU5uWHErcDgy?=
 =?utf-8?B?ZW5jMzNQOXd2V1ZiVEZwOS8yZ0o0S3g3U1RvMkJ4MFZHcTZMbW51dXlyWkl4?=
 =?utf-8?B?dWl1RVE5ajRRNDJBVVFtMVpZRFpxK1ljZW54T3dUejdmYmFvWHEyR3lCck5m?=
 =?utf-8?B?VHQ5Vkl0VVd5elFQbENUU2FlUDVzdGVBalRJbCtWOVNBNFlpUktHbDlFMFRn?=
 =?utf-8?B?c2RBbzdsSDkzbVlYMWpPSnQvR3ZxYVB3aUI5MllhdFgyb1NwdnhVdm5nTjNF?=
 =?utf-8?B?RDlKTVNZbTVZOHVrNkJEcUhyWXd3cDJLMnZRK2VMdk1ZS0o3QXhta3MyUUdM?=
 =?utf-8?B?aExENzdtL3Q3aU9Jdmo0YXdDRlgwb1NDd0ljRHhWUFQ4b21ncEV3RUs0bVpD?=
 =?utf-8?B?QWVSWXVoZ2JJNmkrbFFTdnJiNFZJbFU5Y2F1eGhCZ3pxVVcvU0xaZUxaallI?=
 =?utf-8?B?R2xWM3RJNWptZWxiUW9IcFUrVDlpakx2ZHRUZkU0Zmt2NW1ZUlMzbThPOGky?=
 =?utf-8?B?QktCZTFlc3V2cTNzT3lvbzZsbmNZUkZMTldNZnhIb1ZJOFJubXpFWVFRaXBz?=
 =?utf-8?B?UlpLZHQ2UUZLWnlJREZRV0pCRFFhS08xSDJIWGNWYnFUeUVldjh1MjYvWm10?=
 =?utf-8?B?U1Q0c3NUeGxTUFlLa1dvU1dRL3dzSU1VT2dudHZhdXF1UHRHRDl1Z3M4Rzlv?=
 =?utf-8?B?b29iN293cWxDbUVXb3JkT2kyaGdDeW12QkMzaFpYTXcrb296dFhuSHd3b3FP?=
 =?utf-8?B?L3p4aldQL3h3bFRUK3ZwdHBUSHYxYjh3aHJ0OS8xaG5LeWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERrN0lNRHVCOFFyRGo0TGIzbjcxZ2hsQ0padjB3SGxkR3B5TkVmdEdySytD?=
 =?utf-8?B?T2kwQzhKTWtGcWNLaG8vVzBVN3RiREJzNmxWdDdFbUpvY2Fjam5PL2J6L2Jz?=
 =?utf-8?B?Tzlmak56d0hEOFAva3NHN2FMQlBRZnBxRkErSEtDdGppRTkrMHpaaWZHSGd0?=
 =?utf-8?B?cXI1R0FHZE5GMTAxamh5TEd6NGFLNjZrbmFkaGwramFGZy9lK0JnVmt1Tmds?=
 =?utf-8?B?Z0pOa1ViY1Z0UTg1UGp1YkZMaVhkaFY0YUFaWnpVaDNFSm8xbml0WDhHd3ZF?=
 =?utf-8?B?SWpoSllGcnorMDBWV0lIU0h6aCszaW44RXN4ZFVYZmdVOGNicUErMkpJNmN2?=
 =?utf-8?B?N0hISUtXdEErelFmUXdLcXRKRXdGVW02cmc4alpZMHo5QWd1MVR0YmxrSHFm?=
 =?utf-8?B?ejQvZjcxN0RTRmFiOUxJVHp3Y3hvcjRrM0w3dFdhT0xidVhzZnJkVEUwNk9a?=
 =?utf-8?B?Rk1Ebk84Q2swRXNIeEp0bnMwWHRuSmJYSERQRHBGaTdobm5GaHp0RS9GSXJY?=
 =?utf-8?B?aFk1NU8wdlgxaCtnSWJnOWxOVjRVTk1nRnZpRmFER0QxUWxBZVNnQ216azR3?=
 =?utf-8?B?VGJwN0dkSTV3ZXduTTJVKzRJdmlNdnFiOWltZ1FTaHRQUzZGa0ZteFJIckdD?=
 =?utf-8?B?d3AxdWZDUHNqTyttR1k2L0prNU5iOVQ2cjhFVGNuNnZ1VVJYVkYrNzFVMXdW?=
 =?utf-8?B?NmFxZjZkLzBlK1hwRFBTaE5ySmNNcmxUdTdOcXdxdWFSdytiM05ZWFZHTVc2?=
 =?utf-8?B?dWlUaEUvSFQ0RGE5Smd6Z1NlQ1dqamJxWE16WU5UQ3NObkFwRkhEaWt1M1Fp?=
 =?utf-8?B?Q0NhTDg0NHpac0g5UHdVMTQxZklHcVBMc0psNXd1c0k2eWdldjVmdnZJWFVs?=
 =?utf-8?B?TnRnR3ZaVldLdjJLQTJSRFdXZ3pVMUJ0R1p1TW1taHVrQXZYVUp1Uithd2FR?=
 =?utf-8?B?UkpEb0x5UWRVYlpKY0dGbnVvelNET3dIb2hwTG1SaFFPYkNZMTJpbTArbXNV?=
 =?utf-8?B?ZHNZUTFKeUVkWGM5WWR4ekllR0x1bHJvV2o3RUVjWG8wV2ZkZHBQcEpZbDlu?=
 =?utf-8?B?aEQxMDVmZVI0L0p6N3dFd0RzSzZEcmUvcmR1RUZUOVZ1MjJCY0ZqZjdBNUhw?=
 =?utf-8?B?VUF0amhxaU5sYXZKbUZYUUptYmdodWhuQm00VldESTVoaFZhaHoveS9INFp4?=
 =?utf-8?B?bmJndzhqcFl3dVN5ZDRqcFpiSVJOSjV5YitvbHZZTXlOekcyTHFTZE40cUhq?=
 =?utf-8?B?RHAzaFA1N2dFSi9yMlhTR2k3Zm9aajV5cFVHREtybTR4L0s4cUliWm12b0NI?=
 =?utf-8?B?R3JqWWgxUHZodVBMbjZmZ21iRU4ranNUa01BZ05ZaEdIWHlMVXJwNjNXWWFF?=
 =?utf-8?B?R3hFWVZyUkJxRTVpSDQ3aE9OSDJpTVpBeENZRm1ybktCNU1wUkdFK2ZLZURL?=
 =?utf-8?B?SVk3Y0pqVlZveStjL3lWVFBEbW53UWpCdGtzYzlPZnVNekJPYkF3dkVuUGhD?=
 =?utf-8?B?bkg5b1MwY09wbDkvVzl1MnFJOVhGUlBBbURMdjF3YXN1UHpRVUd4bXpIVTVW?=
 =?utf-8?B?NlhkR0N4elRGN3NhN3R1dWFzUGtoQkZySXBmSi83c1dYTWxuU1VVN0llaGtr?=
 =?utf-8?B?NEJLcEZUc3A5elJRUlhoK25HYTdxSloyY1pabXovdDl1cFRLVDFaQkcvN2VH?=
 =?utf-8?B?d3VZQUlMaTdPY0FqQjRQZUdwamJTNlpWZkdDNmRmL2NvTFhDT1ozdzZMb1lG?=
 =?utf-8?B?Rm4xZmpjR25PV2psMUcvM2F0T0pDeGhGTHZROWtBbUxGSUQ1MnFlY1dvNjdz?=
 =?utf-8?B?cWZyZ25EcnU1VjVzRmdHUnc2VC82SVJpSlNPODc0Y3cwMjQwV3NJNTd6dGtF?=
 =?utf-8?B?Z00yTGlwN0MyNEdqSWxaZEwzKy9KMnF0eWVjZ2gxaTY4RWtRWThyK0Ezc2Qx?=
 =?utf-8?B?WW9xU2FzbmZtWnNJS3VWQU5KU1Z0UWlabGxwN1NyT1M5bjl0WERiT2VORHU4?=
 =?utf-8?B?dWd4NTF5aDVOZE9lZnFOVlFidG1CUnUxOTZnQndJVngwU1lwL0hpaXZ3ZXk4?=
 =?utf-8?B?NHdzZ2lGZkJBMjZiRHUrS2tPMER1THQxWjhXREJKQnVBYWZLa3JZbEtqbU53?=
 =?utf-8?Q?EJuTj+QubXEKDvs5v8/YIhoFx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e17e22-a260-4c8b-53ae-08dd81b83f8c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:10:49.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOzKu13wmbtu2u7DowUYlv+INybFNLHuEp2BQBZkLHnOMb0incC5vTfH0uM4YvFU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB67404FBA



On 4/22/25 10:59 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
>> Powering off RPU using force_pwrdwn call results in system failure
>> if there are multiple users of that RPU node. Better mechanism is to use
>> request_node and release_node EEMI calls. With use of these EEMI calls,
>> platform management controller will take-care of powering off RPU
>> when there is no user.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 5aeedeaf3c41..3597359c0fc8 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>>   	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
>>   		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
>>   
>> +	/* Request node before starting RPU core if new version of API is supported */
>> +	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
>> +		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
>> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>> +		if (ret < 0) {
>> +			dev_err(r5_core->dev, "failed to request 0x%x",
>> +				r5_core->pm_domain_id);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
>>   				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
>>   	if (ret)
>> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>   	struct zynqmp_r5_core *r5_core = rproc->priv;
>>   	int ret;
>>   
>> +	/* Use release node API to stop core if new version of API is supported */
>> +	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
>> +		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
>> +		if (ret)
>> +			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
>> +		dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
>> +			PM_FORCE_POWERDOWN);
>> +		return -EOPNOTSUPP;
>> +	}
> 
> Here I have to guess, because it is not documented, that it is the check to see
> if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
> zynqmp_pm_force_pwrdwn() returns and error code.
> 
Hello,

Thanks for reviews. Yes you are correct. Actually instead, the check 
should be for version 1 of PM_FORCE_POWER_DOWN. If version 1 is 
supported, only then execute the call otherwise print the error.
Hence, the check should be something like:

if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
	error out.
}

I will fix and add comment as well.

> Thanks,
> Mathieu
> 
>> +
>> +	/* maintain force pwr down for backward compatibility */
>>   	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
>>   				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>>   	if (ret)
>> -		dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
>> +		dev_err(r5_core->dev, "core force power down failed\n");
>>   
>>   	return ret;
>>   }
>>
>> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
>> -- 
>> 2.34.1
>>

