Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619BB2C9D;
	Mon, 21 Jul 2025 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115856; cv=fail; b=CPIy0Zlypv08a8PXLGZV96XcyVGlAYLMd9pRbVDjYDDuD+E6y3Hxard9cOBna/Rt37XgE8Gcq+ncOEad1usYIRi8zZAAfuzUUQjziQmU/Od7cMEUG3Vl2/6otVjapI2eCIbcM2S6UER5KL/j0cSdLJRnI0W36o/jvXkGdZH3qkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115856; c=relaxed/simple;
	bh=dSQDKzZKGM4xQPyPY2+7h+p40+51HC0b3GYvfKFAvpI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bI+6OLr3YgtiB0iK10iJiowIGY/9waDb2vyhOFiGPrYyfbN5053y5SVGydGnTZ7MbqqjZM3C/sprWzBms0GvKFrZa1DIrvYKIjObWre8UyFHcb9KWunGthajbOydgKTQWbgA2eCM4aw+Fi66XFYW1lCSnqHAecg4CksLyWFLVoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yBK/Z4e8; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yBK/Z4e8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEF2Fb6aOL8aJrCXZ4pPMu7IrySEICJlC/1/ahG1pDonVGiz+t8yOMsI4ddEleJIKo2v3KOXI1DwCntFaLzxmmyqGKwGZWNEByB61EjHZqTaTq5TvHFpeGm+ZZBE4Gvn2gdH7Rg9iIveIi64AgAHdcvzECeZ8+YX6yRvgeLpW4ItgqmPMJimLGvHRB4C1gP0DCOyrasQROEafiSjm/Fjr3fyCVlu8CKQJgq2M1zPKsyoPGeDCorb012Uh9v2k/kd+zBK4vm2uso9SckRMvYMqOOzB4/479klXtIfdw89z+eKjOdQflyDEdV4AZf3WJw61xIsOYZpz73gA4vZo727Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWfkKY9IeYhLbKi8fwPEY5HM+vrgF2xaGUiEDJhnS8U=;
 b=H2jhU9XARTFWJa38CQsvf8JAkOo19ZWeDcFayCPoFifqGWtPLtHsRRJOpOXgw8IoBSokwt7ID8on6fjLFOwt540d6dlOtRZ4cRRO+bxlIrqiwrgiOookfTmafNE5sTP8Pqp+pTb9b9lF14Sul6Uv/tbY8gnVxz7Nkh7HD5qkMTqboocPO8d6V4KpQgOkp3avXVwDubXd87KYN9yQasozVXhfMcxYAAFStKnfcCXw4fKxwJ6crcuEHuXwrMiFA6fNCH7E/g0TbkeW3NoQGWIcbLayXSFhdOlTNAncMVNULaQnchDgYd3bMm/oZGmWKYoUqV0ELmevpRWohPGRw4oW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWfkKY9IeYhLbKi8fwPEY5HM+vrgF2xaGUiEDJhnS8U=;
 b=yBK/Z4e8aVs0kvdi6AJcVeh5InAWzkrHEWonXaj3EKvsBZyfV6xo4dRUunR5a7t5Z1vKg+fSGTmCcZOGIlTa5PSjJ0h7EoPYGQBRA7HtxOhNhYqY9N0RFOrf0H0uKlJHduhbe+kqn4sixgjKd/wUmc04T1IU4fnEoueH9t+vaO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by CH3PR12MB8210.namprd12.prod.outlook.com (2603:10b6:610:129::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 16:37:32 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 16:37:32 +0000
Message-ID: <ada00b1e-b717-4051-9b33-3f43b5c08097@amd.com>
Date: Mon, 21 Jul 2025 11:37:23 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH 1/2] remoteproc: xlnx: disable unsupported features
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
 <20250716213048.2316424-2-tanmay.shah@amd.com> <aH5bynQwaHbCJR3f@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aH5bynQwaHbCJR3f@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::13) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|CH3PR12MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f4d5ac-057b-4f74-3618-08ddc874e3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGNQMHVEdmtOYjhtZDJVZldGM2RKc2lJZVRodVdJVlVEQUEwWlVHOWFYK2Fu?=
 =?utf-8?B?QjZRQU1EQnQ1N3Bya3lCdS8rTXpwS1M0bk0ycWZrL2liM3B2UXJSUzMzZC95?=
 =?utf-8?B?VkVGQmRNTzlqcHErOWlHdWVtN0FhTVYyUVltOUUzTTVhNEE5NFBaRW9rbUo2?=
 =?utf-8?B?UFNpbXNtU0JjT1d1UmZ2M2RqZnp6T2VPeEtYR0d3RzhLRDJRdEFEU2d2WVJL?=
 =?utf-8?B?WEdUcURxVWJjT0VLR0JwN2pZWElzVWxZZzZxQ0EwOXh4K29LZDVONE5HVTUx?=
 =?utf-8?B?UE1VOUdBenk5WWkrdFpvWDJSelZkZ1k2dVArZE1mU3dKZVJTMFZwcWtmYmJ6?=
 =?utf-8?B?cC9USlRlVmpNUG9tQXpTak9wbFB2aFJ3RndCSTNFODlSSXoxS2lCYU81aERF?=
 =?utf-8?B?UlZaQnJTUnBZcnV1NjBqenV1SUtEeFN1MzRkamNWVnpNTFV0WXNrUUdyeFFj?=
 =?utf-8?B?ZkxNNDJ1Y2ZjWEZTbkpZd1YyTU9NWm1FT1I4UklZRWlNdktscCsxdUhSVlhW?=
 =?utf-8?B?ZklTQWE5ZmV2UXhlOVdCUzh3TW9PNnNtclpQc1NJWGhvNEREM2VUR0haQllp?=
 =?utf-8?B?WTZHSUFHQXpyMlBJOTc5VXBySm0ra01YV2tZMG83Mkp0eUlaTmlOUDcvc3Zr?=
 =?utf-8?B?Skx0ZDVXdHVkUzY3ZG9aODR5Zjd4UmozU2phWjZrL2pCemJHNkRQOGg1VCts?=
 =?utf-8?B?V2cyWFJNVDlRakQzZ2wyanpWa0VQc29WbHlTamJrdXhQbUlySEI0SlFLb0l6?=
 =?utf-8?B?QnV0eWZxRERMTFU2RCs1WmhxVlZ1NlFUaHZpbGVXN1VjVHRJeUZXeFdUQVhP?=
 =?utf-8?B?TWxFWGFoQXZ6cEZJK2dFb0dTejBQdGxqZkM5UFd4NGhBckIvN0lKeGQvcG84?=
 =?utf-8?B?Wnh1T2VyVUVSRkVOK0YwKzRJdWFTVC9SQzdXNkpWWGZpYTFDMW1scHZkczZm?=
 =?utf-8?B?THk0akROV25FZEk5Q0NpcUZic2gwU1I4a1VWaTZZSmRHNEFsK2ozVFBNNGNY?=
 =?utf-8?B?NXBsKzlBOFZObWtwdlVwcmltaUdRRUVodnNYSmJma2hJK0N6aW4xV3I4Wkh1?=
 =?utf-8?B?Qi9PbXg2TkRrSFVqWVlXWHFvN2J4NTVVWjZGK2xyOVQ3dXA0YUowTjN3N3Q3?=
 =?utf-8?B?TTQwMlNpSWs1RnVZd3czUHAybmYzR0dEL0xIU3pFNWRiQ2Znb1JPNHNaQWp1?=
 =?utf-8?B?Y083OVBGa1FPSVlDTWl2di95SFJSNzhqeGZkMU5iMUZqQjBXdGduUDY1MmpW?=
 =?utf-8?B?ZUV5MCtDRUNNNS9YeGUxYUdvTExWZ1dnbC9kQk81MTRkVVo1Tm5JRkEyQkRS?=
 =?utf-8?B?ait0K1I3L1ZCREdxRVgyNnNoTDEzMEM4OFNQUGZUZTlmZG9tWkZ2U0ZFcnhs?=
 =?utf-8?B?ODZZN3ZlbFMyRlQ1TElNb0JvbmZOOUk5NHdnZkl4VjRUZWtqdUFXN0RONVhi?=
 =?utf-8?B?ZEh0L2QvakxvY0ZKaHE2Ym4xcFI0dWNneDkrS0srZFhodkpaS0xwQldrWWJT?=
 =?utf-8?B?aXpld2hhb3Jmang0d2x0WU1Bb3NDcStMMi9vY2RaNUkzOFllcUZMeDNobml2?=
 =?utf-8?B?MVhpOEdzcVZobkpnSGdwTFNwMjBHQjlRdU9QVW1LTXhSaHZGZDR2Mmp3S0lW?=
 =?utf-8?B?RmRYdlBWZXBrWTE1NTJUMHpVVHNUVFJqVmEzcEJUWkp3bU8rOGlBdVdoRmNI?=
 =?utf-8?B?WUNOekNhMUErYldnUUEyV3UxcFBzS2dvQUtsWjdORmQ2SCs2aVl4SngrbVUy?=
 =?utf-8?B?ZG1FQWkxZG00YTZwUWpHMjRQUS9vV1NnSFFGS1JoU2lpNWUyckVWWkJLd2lP?=
 =?utf-8?B?UWhNQzhMVG10Q1hjcDExVGEvWEt0YXdNR08yb0ZqelRGZjN5YjFkRFpFZHV1?=
 =?utf-8?B?STVaOFJXY2IxUEthZ2I5b3drZDlSVmRpb2txRTd3UmFLVUgrQU0wTktDN0VM?=
 =?utf-8?Q?efa2vx092dQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWh3cGlxZXU4cjVpSmMwMVlMZm9xNXZjaXJzTXoxeTNmTDV3T25ZN3YzOHNM?=
 =?utf-8?B?MVhlZmx5VnpjR2JZR2NLb1V6N2lXOTVyNDFkeU9CNEc2d0UwT1RyMXRRMlhv?=
 =?utf-8?B?V2pqM1AwdnVhelBjWGhtVGN1VmQ4bzRvb0VNSnM5MUM4V3JKT0t1eDZOTmYv?=
 =?utf-8?B?NzVoN0d1dUtNUmE4V01Nd1p2T1k4dlJTRlNuOUZhUWZtSG5tSlV3VGNXQTR4?=
 =?utf-8?B?V2s5RmMxcWk5VFhlK2FxMjlJTzBaWUNXNEwxUDlZcjZDUW81ODM1U2hEQ3cz?=
 =?utf-8?B?R2k5ekJ0TW53NGxDMVBSOCtHR043UWFRdUY3Zi9rd3JoUnJqM2JtNGhURkwv?=
 =?utf-8?B?Y2tZRUxERFhHdWZ2MUhaNmplTXdzRkhyOWQ4QWtZRVp4Z1BoM1lIYk5QMGJ1?=
 =?utf-8?B?ZFhpTUtsNUkwK1FkT0VyS1U3SW9CSVN5MXFhK01SRkN2WkpXN1VTK3BMZXJY?=
 =?utf-8?B?UmpPRjVnVVA2OXBld0FWRlU5TzlGcktwaUhsN0crdVl5cExiZWNkL3VUd0hq?=
 =?utf-8?B?U0hDeHE1YWJYU1UvekYvSzA5YTdGalBSclc5QmdXVFIrY1JwczFlcmtocFB3?=
 =?utf-8?B?VEZJeXZRdkZGTHovTjNoemI4Nlp1OC9IdDk0aElaemxXc0JZdEt5OW5iQmdY?=
 =?utf-8?B?VFEvTFNDSG00V25KeWt3TjBndmhYNHYvTkhCOHJIL2VpdFR4b3lTWVFudm1h?=
 =?utf-8?B?d2p6bUdhMkloZTFhT2lpemV1WFh0TlAwdXRjTXhoeDk4VlJmUnkwNlJCSDNY?=
 =?utf-8?B?SmZwWUZUZnJjVW52OFlrbytIZktkbVorODFsRXNBSVJuc2dSenZXalZlVlN0?=
 =?utf-8?B?VDc3UWRrVHA0V2ZrV0g5S3gxQU5lTTNLQWd6RXRsTTdOclIwdDlzeThSNkRF?=
 =?utf-8?B?VlBDNkZUd0ZIQVlEUSs3NUpBVjdrMzZXRVhudkFVR1Z5WXNYMWJoVW5FdFpz?=
 =?utf-8?B?endGbEcvKzFvbktWNnl4enFWRjBIeG5hTFRZaGdPY3ZMSGFmVWdlYXllOHhv?=
 =?utf-8?B?bVplNlc4cWFXRzFyVmlyN0dMMEdqWlZKaFdVK21sQVF2dDdYQlF2a2RaOVd5?=
 =?utf-8?B?dzFRTW9LR1NrSzdLYnFSUHhBdjRzL3IvRkZrT2d2S3VYQ3hJc2dhZXREYkU3?=
 =?utf-8?B?aEpLMlNrMFFDeTlQY3ZDU1lQSFhBV3A4VjRLVElBSDk2WEVsNlBhZnc2T1ky?=
 =?utf-8?B?OVpkbGxjR1RNbURxanhjR2RibXdGRTI0S2J4VEY0KytibkpBd2hycVdEb1Uw?=
 =?utf-8?B?OG9pYml1a1VIdjQwdk1rOC9NZWpYcWNDa0czNnh3dHhYNjBjRDZlLzhrOXpV?=
 =?utf-8?B?dEozbWhTZDd4WHZOUmxBZkhuOFp0UktNaGJmVTk5bTZsR082aGtObFV6ZEJD?=
 =?utf-8?B?dlU3d1VLR2ptWk9qZ1ZIaWVidkh2TUxQdlAvR2liUkVmajZ5WGUzekRpVDEv?=
 =?utf-8?B?TGhvb0M1Mm5NSW9vRGNmWVdWbVo3S2tURmMzL3JOZ0IwdXhJRnpCdXRJQVFl?=
 =?utf-8?B?RGgyVTFZdzdndlpFQzNYMkRwSVVyZ1NDVkltVnVTV1RTSDdZV3B1cmhXZVNE?=
 =?utf-8?B?L2VPYnkvZnVreFNEc0pFMk1OQmNoaGdPSTRhTXJWQWhLU0owNnlYTGdNK25T?=
 =?utf-8?B?emRvNkdBUzIzMkNFc20vZS9tQ2xPZVkwN1F4Q0NhM1JlbXJQS0g5MmM3TCsx?=
 =?utf-8?B?bzhoSnZXakRDckNtT2ZxandDZ21hWUxYWEZjVWFuK2V2NXdWRmo3UGovSmlF?=
 =?utf-8?B?UDM0T3o3eUhEL2xueXVnVkIrYzVVaktXdGxPUWdxSERmVFJraXRNWWMwZVpV?=
 =?utf-8?B?ZnIrcDFaaU9CQWRoU2FYcFZuejVlcVdLNVc1eWZZWlBXN05la1JLNk4vQyty?=
 =?utf-8?B?UGtqZzhqV0QxbXlBNVU3ZEl6U3pJRk5SRVFWNVR0NllaUXhYOHRPL09ZbEVT?=
 =?utf-8?B?WFFqdit2VGNJUWN5Tys4VXhYcDJSbXljSkZic25YZC9NUHd1aU5ZUUlaV2c0?=
 =?utf-8?B?cHFrUDlQYkd2SzVYeXhCVVcrbHRVR01DRXJTOEhNeFErY3NRZXRKakJrYVk5?=
 =?utf-8?B?bk9NMkxUbENNSHg0bDVsSWE5YUdacENoZXVTQkw4dVVWWWtBcUQ0OXZjYi9N?=
 =?utf-8?Q?33PTlwKrCSGzH0CesIq8iy1sE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f4d5ac-057b-4f74-3618-08ddc874e3c9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 16:37:32.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgXkqKcoT6NOOYSrIGm1PsdR/st9K+tv3mzUtxNbEd37jfD6LolEAkKofa+3uBNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8210



On 7/21/25 10:24 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Wed, Jul 16, 2025 at 02:30:47PM -0700, Tanmay Shah wrote:
>> AMD-Xilinx platform driver does not support iommu or recovery mechanism
>> yet. Disable both features in platform driver.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index a51523456c6e..0ffd26a47685 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -938,6 +938,8 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>   
>>   	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>   
>> +	r5_rproc->recovery_disabled = true;
> 
> If recovery is not supported, and it is set explicitly here, does it mean the
> present upstream code is broken?  And if it is broken, how was this tested in
> the first place?

I think upstream code can be improved to change "recovery_disabled" to 
"recovery_enabled" and set it in each platform driver if feature is 
supported and keep it disabled by default.

When upstreaming base driver I wasn't aware that there is recovery 
feature in remoteproc until recently when I started working on it. I 
guess too focused on fixing base driver features. That is how I missed 
to add recovery_disabled and test it as well.

That is why it's better idea to replace "recovery_disabled" with 
"recovery_enabled" and keep recovery feature disabled by default. Same 
as "has_iommu". So platform drivers enable it if they actually support it.

I will add recovery feature for xlnx platform later, but until then it's 
better to disable it in the platform driver.

Thanks,
Tanmay

> 
>> +	r5_rproc->has_iommu = false;
>>   	r5_rproc->auto_boot = false;
>>   	r5_core = r5_rproc->priv;
>>   	r5_core->dev = cdev;
>> -- 
>> 2.34.1
>>

