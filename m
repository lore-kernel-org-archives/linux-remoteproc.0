Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A118F2FB;
	Mon, 12 Aug 2024 19:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723491883; cv=fail; b=fxHq5JIKyqpzQW2mlTXiAgavCUOj7VUgWKB75kmMzWJlJnIRaawVpSIxoGK/UVCRwcS4tt8WfJtEpuJBwJ/+5lyyschTDxpkumTvq8I5/7cHwX6MMYf3I+g7Wt8v/kTPwWMH4ke7ausCPtqDZJ3ybjJwMiGEjQ018QcJN64wPHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723491883; c=relaxed/simple;
	bh=M2wtPHLj74HWKy+VPb/mi6gtcTweADYaHa/OZOu9e3Y=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bsSVP+biGIVR1/+Ebm751DXnXbQ5qT1DyDvimaCGeRpPfTBn2TRb0aM4+N3w5vq9M5ngR9vhg14PAb6XmLBqIXzu1dlqrtiRCoXlq8xYJbHNbSPXTudk7xqRs+sIGHDijkcXXUyNp12v4vp19ciHly96gZxf28Ach80ZSc9wp4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sVlMM23k; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sVlMM23k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8l92F3eZcKdHBc2cqGFamV5b46zfewVjWNBVAVPbxKd8Ltzj5G8yeqaN4iHOZ2tER44NE+YOslzQ+Ha3dTqVUYWwj6d/AIKCtu7XQoVXTSAlyPeD9Nkuy4G8sLjBq+i6QXDvpBXuiLzpeK3Pp0koxCpsKJHwHX2aCEYqiwg7glxqY3B0cCoemLMFaTjU2KiMq1QIqt/lhDdmC32Nv3LqElEudVylad5F9ovLiWzKFiFDKmproCLDWmKT4nXzUx73bVys2d9X6TlTdSq3OnSVUKkQ8gEclms+imSEcQLX7Og9kBq5pIC5K0FHsJdy/7PC8F6S3FgUxiFRQRYUNZ/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zudczu/ZpZ7W2PUsM0C/zF3UBykxvPAPAjYNB3GMO8=;
 b=WTGJ+nQ0uXmPh6+BceZgTlLDqYAbokmWjKlqsILS24O/G3cmvI4UwB21PJ/kK8IhdVSnLdXS8z5qCfWTXV+RNfzb9zkOJkrfKagtIXTu7utDaQwvqvX+srxOTzFcfPliwcXD7XD79iRuTVnQarpJpB1ojnRWu7SK5WYeTPVIlStUOFZRpL6ab2Mgzd/FzFJaLEBwhRWix30hY1D8tWpzuXxttTdpNbpPtIw2YWfAvlflg91JeDaS2JjQs24nyQIjYKilH4s+0L0VxgZQjUIZ/FKabfsqTAQl7XO3swS72PdojuGOIbV0OweSNZVm0U1p7RcKdEePxuQxjCcd3rCdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zudczu/ZpZ7W2PUsM0C/zF3UBykxvPAPAjYNB3GMO8=;
 b=sVlMM23kSgd9OoHKqabC62bRv9DTW9Jmjmzoc2/UvJUBBZW2Wb06AtIp734ZOe+ELpofHEqnJEzy8IfJ/Fz3mJzcytamiiWVdfpnGEVLGkFOGbPRtL0K75Q/F8QQJVSVS+g0DKc0+mf6ErGA+GSg6TFY21ianQt8k3oZZBzpHuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by SA1PR12MB8724.namprd12.prod.outlook.com (2603:10b6:806:38b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Mon, 12 Aug
 2024 19:44:38 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%5]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 19:44:38 +0000
Message-ID: <8a779a8f-1785-4960-b31f-02c278c78b89@amd.com>
Date: Mon, 12 Aug 2024 14:44:27 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] dt-bindings: remoteproc: xlnx,zynqmp-r5fss: add missing
 "additionalProperties" on child nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Ben Levinsky <ben.levinsky@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240811153438.126457-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <20240811153438.126457-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP5P284CA0088.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:93::21) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|SA1PR12MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a8da540-9bf1-4aa2-f39a-08dcbb07336f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXVYSStxZ0tQWkF6QWhqZE1sNW9seTlmbkNRalN4dmc0dUlYTzJlMENKcHVx?=
 =?utf-8?B?Q2lveDRyeXZTTngzTGFJWHBTL1ZYY2RaMnhLNGFSOUp2NGlRZCtKSDRvdHNp?=
 =?utf-8?B?b1J2WjU1NHlLSVNVbUhZUFY0TUZlNmRBY3JxTG9mcDlWVVFLcUg5Q0h1WkVh?=
 =?utf-8?B?QXhrZHRMR1hDZkU2a2dYb05FRS9sazY1ZldzYnkxVGhmSm1qdlpjK29YZ0dn?=
 =?utf-8?B?dm85RVplUUJ1dkhXai9HUkYzL1kzeVU2Y0M2aDVSeWpoQVRINGRzR3hZOFYv?=
 =?utf-8?B?Wnk3VUFmNFZtVTdHQU5GUllQSm1iUTEzN0FsOEliMVgzS1pzQ3cwbjFYRVNC?=
 =?utf-8?B?OE12TGVGZkNjZjNTbllQRy9kZVk3SmpBS1diams0Zk12S3AwTXhCMUpHMVNv?=
 =?utf-8?B?UHZwdk9KU2M3cmVLYVBaMUFZY2UwYUJEdllDQVRselFDakw5NStodzI2bDA0?=
 =?utf-8?B?RHEzbVZPL1JlRVh5R2NSVVZ5Qmt6S0JOcHA3K0pOMXlLSm5neDh2L3h5dThX?=
 =?utf-8?B?WStrNEtyVUJPSlJZSGR3ZWszenIrTWxaWVhEa2xEZnpRelhLNjlRN3dqYnly?=
 =?utf-8?B?ZkZtcVdTODlZSmR5aWdpZk1uZ3EyZnB2WUJIVmVveG5pSllaMHVPSU1LSW1C?=
 =?utf-8?B?SjVLNmVDYXZPODZ3NWhYZjRIR3JYWENUdDc4NWJOSzVyamRTYlJVODlTWk56?=
 =?utf-8?B?Wkc1eXo1OS9OVFhHdEJYbTQ5SzdvYXVXNk9BTzdLU1NQeWRORlJYTC9XeHR3?=
 =?utf-8?B?U0RITDlNNlBuY3lQdjFGRXJlbVp0UlZtQnA3aSs5aWt4V2FOTHNaMUg2SE96?=
 =?utf-8?B?eVhSU2tGZGJPMitweHZIYXc3TStBZlRTK3VpMHhjVWNUTGZNYms0aVU4ZVJS?=
 =?utf-8?B?Rk12c0hNckN2ZFhmcTlzc3ZrNHRZN3ovSmNNVjBKQ2YrQWhWOFpkeHo3azgz?=
 =?utf-8?B?TytkRnB1cWlHY1F2c1A5SUFtdG9lSisyVFZZQ0s1cWZhSzM1dnhkeTlrUzRY?=
 =?utf-8?B?WE9BSHh5b2VRdUlBdnl6VjFwQVZTWEpuU0x3SVZ1d0NDcDcxU1N2NGFPVTk3?=
 =?utf-8?B?bkkwejdCMXpWVWl3bzZvM3BjTlk2czJvWVdBWXNtdzFhYUlBTFVGZWZpelZM?=
 =?utf-8?B?cWU2Y1A2bEgvUkp1Q2xaQyt0WXMxbUs1ZEJiWlkzSE9YL09sQ3pNUi9NeWx5?=
 =?utf-8?B?NFhCN3J1eGZwOVpFY3QvUkN6ZjBTTjc2Q051NjdwUktid2lyNmh3T3dSTUJX?=
 =?utf-8?B?WHpvekRUQ2U1SjBRVDcwQ0RaTzc1MVBSRFFSenNCdms2L2RPbm9uOTV1enZz?=
 =?utf-8?B?Wmd5Zy9mb2Y5ZWpwMHYrZlMrbzFtRHIrMjFmUnplNUh0aWFCWVA1cURRTWpo?=
 =?utf-8?B?NG5sMEIyVTJzTmswNWpvaUtCMWw4MVdoY2xBWk1HYml6R05DVktyYlNTTGp5?=
 =?utf-8?B?QmZBYVpDWXBsUHlhTFRIWEtyVmMwcU1raUNYZmVDTnF6bWtoUGRUSTFtRE9v?=
 =?utf-8?B?VFZVZWUyMmc5SGtjNDJISk1HNlRJN2VXa0g0WFdLNENJakxXYmxWbTJ3Z1kv?=
 =?utf-8?B?MEpQK1FTMEd3UXFLYzE2UFFoTkZLQTljdTI1bGkrbHZQVENYRXZyUkhlSVlD?=
 =?utf-8?B?dlNkQ1BDUkVRYm5MUUZsaE4wc2JzZHNHaTFKT0dROTNPcHo4YStPa01adnRX?=
 =?utf-8?B?VGV5Tzl6ZWFKVUtzMjRoQlJvdC9neVpScmd2QWpzTnljREZtV1VhWHZHUWc2?=
 =?utf-8?B?UklDSTErVENHWW9YamtyUURCU1lxeWxwTUQxK21ISzl6d1hMak1US2ZacGlU?=
 =?utf-8?B?aUFFTnphdU9pakJmWi9lMkxlcno3MlJvYUQyVkhPaUx6WDdVNklEYWtheG1s?=
 =?utf-8?Q?EiOs34GUF9df8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEFqTzJjUytWSmZsUDJHdmhQTFRIc2dWNklxYy9yOUthOVhMMVFtdlhyajBr?=
 =?utf-8?B?TGtTQVh5b0lJVG12eXVNajUxM1drdTJKc3pvZ1BtZzYyUFhHWHZwYzRBaWNV?=
 =?utf-8?B?YjdxZlZLNWc0RHhZS0N0OC9IMlMrYkV3UVNxeEZkMnlFZE83aDFVZWhUVldJ?=
 =?utf-8?B?ZDhxWkN6WXV3bWwwODBBbHo5NDBwa2x2TmJpd3RGazM5Tk1hTzVlTDZBb3Jl?=
 =?utf-8?B?N0tpc2dwR3NBbE1mcUJ1UDdWQ0JwWkZja0RMdWZqRS80eFdKY25KUHdsUUdu?=
 =?utf-8?B?R095OXRnN3E3VW83WVRVaVZldENtTjlJMDhqbVpaYWtPWFZvYlR5SkJueDRG?=
 =?utf-8?B?V2d5bjJIdkkzdGV0L3ZaUXJDd2dEUDRHQ2ZrVDREWUN2cXVBc0QyM2lENHNC?=
 =?utf-8?B?ZDZzWFNLSmxhZ2JQWEpBQjRlRzhZbGZoSEd4N1hCRTVoVllTRDRQYXcvd3Yr?=
 =?utf-8?B?YmFCM216c29GRDlmZ005dVlxK2hYcmhzQk14WitpbmRHS1B1VzV0UW5yTWIz?=
 =?utf-8?B?SzJCM0lFS0NqUy9uSmJzamhCL3hLM3VZczcvOHNDSmxoOVorSFVqdUhZNkU3?=
 =?utf-8?B?Y29sL2JobmhzU2plL2pJU1AwNGxaMm55cU05NTBLM0sxY0Q4ZnBpWHlNdUYz?=
 =?utf-8?B?Tzg0UGtWZWhacmt2MmV4YjQ0MU5oTFA3aVdXNzliUk1Nckh5MkZCcUdOd0p6?=
 =?utf-8?B?QXg3Q1ZsWmhHNHp3UFhUMGU3Q1FHMTE1VlRPdlFhUkhaZm5vNm5RdkZhdGJ0?=
 =?utf-8?B?TzJxMXIyRlg3cUFzVkxyTyt6L1Yyay90bFVpbEJtQTdDSjJKUXNZQkNjYktk?=
 =?utf-8?B?cDhIQ3htY3hZa0k5WEhOVHRzcTBXSVZ6RHhZdnlWS2tXdUtiWm95aElnNUFP?=
 =?utf-8?B?VHRFK3F5THV1dDlCMkt5VWNYOXFpY2dReTVlSWJwdVJRVTdMQzZtTEtkSjc0?=
 =?utf-8?B?R0dtSXpjdUxLNXlHcVNmRVU3QWtHVkw5MFlHZWZBalZnTHNjS2lpZWp1RTNJ?=
 =?utf-8?B?ZVp3Vk95TDMwWWNaVHRvdU02aTRZUElUajJVeTJDeVhEZkFZMlBUZWtHd2s2?=
 =?utf-8?B?YS9Tb1JzUURuRTZuUnpzTmMzL0xqbjZwcXg1cDBKNVB4QWVybzliZCtlQXlp?=
 =?utf-8?B?ZFU0WnFiWEtQRGhVNUJTUVAwbjQ1bzNYcE82KytSQ3pTRENqZWYzVkFNSGlR?=
 =?utf-8?B?SXloUWc2bVJtZk5XRllZc2diaVV6MGs5QnEzWkhkTWhWU292RUEyZmNldS9v?=
 =?utf-8?B?UEJBcWthV3RSU2RBbU9TRDg4amtBNnNoRGwzcHA3SFhZSzRhclc5ZGNEZ01n?=
 =?utf-8?B?clhlWVUwclpwaXhROElXcldDcHN2a2J1Uy9YTGVlZEdxSHp0S3lZTkZGUjVV?=
 =?utf-8?B?NWdMNGF5TzRUUThlOG5GeThFbjNPaXdNM1lMLzVWSGIyR2xoWlphYjRZdkEz?=
 =?utf-8?B?elk5NHd3OTRXNzVXMHJhaldzYzZlTFBpaGxDaDN4RlNBQVhHZUxRV0Q1aUZG?=
 =?utf-8?B?TXl3R0dzVTcwZm1tUy9TbHcvdFNZK2JTOXFEWGRmeUw4V0txa01QVnR4ZTA4?=
 =?utf-8?B?L2g4TVI2Y0N5VVhYMVpiZ0d5L1l5VmVlU2xqWEV4T1hvN2drZ0lkbjhTbGcr?=
 =?utf-8?B?M3k0N21nSGtrdDFRWGxvTGZ0RjJaOWxoMk53bk5QaHBaT2JxNGFYQ3dka1Bo?=
 =?utf-8?B?NkJ5QTBQdjY5dk8rSVMxRTkxWklkRFVpMnAzTVMwWnVtbVBYbDhYU3NoQ1NP?=
 =?utf-8?B?Z09xNi9HZGdqb0tOaUYvMnNiSjd6MTJzQW9iMmVGRUNkenZtSDhjam9ENDZP?=
 =?utf-8?B?d2xHQ2sySmM4U1BuMTF3WkhJeWdERU5Gbmo0VmxLZVlNUFRPUGZycDYySmR5?=
 =?utf-8?B?STVSSk9GREVPZmhQQitaekROVE96SGNXRFg2QVhPSzBOZy9kSHdkaDArd2cy?=
 =?utf-8?B?ZktRQ2VpNHF6cjVURE93Vkh5UktXeUNUdlJSS01JWmhwUmYxb2hCR0R4dyty?=
 =?utf-8?B?RnRWY1Q5dS9OaXBDdGYwK2RxSkJheWtqUkhsbHBDZ1dERXllRUYzalVpK0Vt?=
 =?utf-8?B?cExraStBdFZ0c0VqbmJjZjFHNGZXY081ZVRpYzBEbWsyRDdaZ2h2UEZ1MXI1?=
 =?utf-8?Q?fN+PhYaaNl5yCKjfl+skUdlZ3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8da540-9bf1-4aa2-f39a-08dcbb07336f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 19:44:38.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYNexwlHlL++lq0y/nGeXs2nqWLRB3vYxcPtAF//puGwm4ZutldRkAvzubdg5Oq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8724

Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>

On 8/11/24 10:34 AM, Krzysztof Kozlowski wrote:
> All nodes need an explicit additionalProperties or unevaluatedProperties
> unless a $ref has one that's false.  Add missing additionalProperties
> to fix dt_binding_check warning:
> 
>   xlnx,zynqmp-r5fss.yaml: ^r(.*)@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
> 
> Fixes: 9e1b2a0757d0 ("dt-bindings: remoteproc: Add Tightly Coupled Memory (TCM) bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> index 6f13da11f593..ee63c03949c9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
> @@ -62,6 +62,7 @@ properties:
>  patternProperties:
>    "^r(.*)@[0-9a-f]+$":
>      type: object
> +    additionalProperties: false
>      description: |
>        The RPU is located in the Low Power Domain of the Processor Subsystem.
>        Each processor includes separate L1 instruction and data caches and

