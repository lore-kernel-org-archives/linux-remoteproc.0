Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793034917;
	b=yQ9Im6YRofopuEkY+IPvI38foeI45LPh8zpkORIyyw2UN7ZKCUqTToJf7dAhafjo74tk
	 ljTDARHpUL60sT4wm/2Z9ncsCjod6nLEXNH1kvaO7y/CumOEZGdMO+JP+up+LpnhBtZM1
	 jHbg50qeNCpasFTULAa1hozu8TZPI/JDYaG3Msdz+kJPLlp2iEwaLI4IOOhRYJaqtXtjF
	 YovkwJJlfue9K775ZeR4MliUWnn4BpPpizPHz6+bil2dBXFenlGVGJCafF/D2fQWETqzR
	 p+AuytAaNS31zvN4yBJOS0h/De3fXOc0MzwbwChgMGJXzlrOnxVAwSHipOZEpDoVu7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034917;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DKu8h8jZccXIPbVfOdq0PTeasDuAup9VtgL5mknB8Vs=;
	b=Wn21nLrEnTg3sXf4Fnqc/r5BorGQaMn47utHlz1+m9C3UtPgXEFA5Ywg0/Jl0XsvP3Tv
	 D9xzmMTj7MwcgTNvS4HAN/BKTgYe/khhM0TUAiIgW1vPpUmQ+tMOJElgwB2iAjs4sfLxs
	 uawW2+7w5pNlRZ8h6p2aBYf9MkJ0HfDI4Zk0xuS6gQQ1B1hdBD3I1KuTRebyAVH6W2l+A
	 7N5BeFUWZlJDvHA03apazZB+JQOwa6OlhErK24/kfm+eXqnR47eEuTgOEbwyC3Yo9YSKH
	 HNIm2jFXhdcv5whYJthq4n3fUHXuZeQajHJXD/LfGDjVvJfC28jCUgt0JCDbZFd61rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VuCy7dwv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.2
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5E606A31F;
	Mon, 26 Oct 2026 17:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B5E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VuCy7dwv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNAbBgOCgitEDjSKEuCK4YChgoGy0kr0MQ4l/i/FyXMJTuK7uvytirTEcR2hrMBLRPxksRt5xghiCNfCjFCJ/4MND5zEM6/djq2Y2vTtbj9QoKxr076BNeDEOGqbLMNaqaAs4eZeBJQfvMxSWxCW9vh1u8QvjHZ2u/QNbcmHIP3c3sSEzwHFvSz6ufVs8nxTx/b5rST5L+AyoiiUB3VCnR91K63L2gqECjQm5MYYZJOxLoRBdPWFue2XEA1eMgYbcn8B4Ov2bB5+Fm+yGq3M8Q6PnF9VADgUvEXhaNMV66x5rXuBV5NapKfPUH5l276Q42FqqVdBPObQKtcv4LqK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKu8h8jZccXIPbVfOdq0PTeasDuAup9VtgL5mknB8Vs=;
 b=JZHPpV6jk4sB4CASJ8b0XBPdum7rdQVPRAMCqycGn63FdyJnyW58eG9biCH95ENS1RXsEdtqTbJN40gkyqqw1xmRfCHXUxktthzXansPTigj9PltqlmRsJ45ty7fbs+W07mjcDmcKPUKT6biqti4k06Ua02YN9J9pK2EDvZDxOnvMkDlpEGjb15jw3cm+4oN62DEflhoOXJmQXEwZyAdLybxHpe1LFbraA1qqklKsHq9zuD3Jm4z6VT6ZlPCWmxMFLUVdOkXqwTTZ9aE0LwcZrg81H1OcNhEf1NNgKjoantuEGlB5C8xgs8AvGXjP0r0i8EXE7j1OwdXZgck2ufElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKu8h8jZccXIPbVfOdq0PTeasDuAup9VtgL5mknB8Vs=;
 b=VuCy7dwvRWRNQH3XaU2jJNtQS5bXIjpIMJJcAyW/ZEJbWyLsl4s3sbRFXHBebJKkfs+AjWwlmI6mPDhxC5yNgVmdHO/iFDl9p8ICnSoeuKxOHRDIicnySfR4gLz7dyO6vzjTlAPXD4Zy9RGg91ygs8BsYnDFnBo6ZNIrNw9vMNM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6) by SN7PR12MB7251.namprd12.prod.outlook.com
 (2603:10b6:806:2ab::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 17:15:06 +0000
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44]) by AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 17:15:05 +0000
Message-ID: <ddbedd49-c27a-4786-9b81-c8a3d31d2903@amd.com>
Date: Mon, 26 Oct 2026 10:15:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Levinsky, Ben" <ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
 <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
 <0df4bfd4-2bcc-42fd-a22d-e704e4b41d5f@amd.com>
 <cbd2e370-c8f1-46c1-87a8-fa25fdf6ea97@kernel.org>
 <d89b656d-44cf-440a-8e06-6e13cef2dbe9@amd.com>
 <835fb494-ad66-474e-9fbc-71a9dd7d7608@kernel.org>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <835fb494-ad66-474e-9fbc-71a9dd7d7608@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:806:d3::8) To AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AT6PR12MB174769:EE_|SN7PR12MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a7132b-672c-4e69-f0fd-08df3384ade5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|261026140227099003|56012099006|11063799006|261021123027099003|10067099003|261021121427099003|261022105027099003|261026121527099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Upqg7E67TH9nww7ZVM3KTTCQlRBOZjVfljA6X2jXp0KYGnVYZk7YdKk4uC12NIih2pMamaZMBRG5k5g1sXRnQylW3Vf97zg7JDz59+mPmBwQAfSRcovltZRqx4AlPQpc+MW2oumS65QP+Mio2UyImJGgUbvSV5IP3dGfsVPkzD4l9ZOwb538B5GYkBXEGvX9kaeUzBNinJwStoUL2PeXJcVZDDroXbdssfWx8LxWAj00JV8pgss2wJnGZF8DeZgP189D1O6JBz031Y3jRsN3XEiWuAM3oHxSy/pNbyxPjLMAWOA3qOMuG2y21nuboeMZEvP8Ii91No6+F5LML4/5aALJ4oEVsm43D+dk4IbISTwVOSmHoAyMs2LY8CaFJBElrkhDdsNen04wnYVlRhHJ2cXFPw4qiS3JrjkTH+5ksMFo4pGgydWvbpSLHo1sthp9OlUgU1Wi5uz9No49sCqRgsSLGGSep4g4pik/58vKifkk+a4aEyHfupFoOuPohA8nclSY9qN7O8Lb94OU8F2Z3jLdQ5a/8USoM2dmDhLTEVArJ03jcmciyuC19MSw0opdMvFrP08GLpYTDSvj3XFXmRIKlQT2x5hdkFwKa9YVfpLKOFHyM/JMvYHUgFgmUGS8P03e0mbcD7dQHZIdlClZDgw8Kprp6Psu2Jtaw7Tutdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR12MB174769.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(261026140227099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261022105027099003)(261026121527099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVIbU93MDhSMEVEdjR4MHhKRkRsQ1JrZFlTMjNGcVBqRU5IVmt0eHZvd2xp?=
 =?utf-8?B?MlcvMjVQRjhvT3FzUVNEQnpBN05ONElZWlRhVmZxMHVmRHFvaUJSS293ZTlO?=
 =?utf-8?B?dEFZOWNnUkdVa01PSEYvNytwMjdBemhjY3BHNUZ1YUprMkpRWDZFRGNIUmlt?=
 =?utf-8?B?S2c3RVZsWk5HN2dvTXhwVHMwS1dxdllHeHRlQjRjWVdxNWRXaFlxSjRnVWph?=
 =?utf-8?B?aEpQTWh2bDE3RkdHWEttbjFEQ1FRYW5wNGJVNVk5TzJWaVQvanJtcGltQ3JQ?=
 =?utf-8?B?ek1RTkJrdm54L3FwcHlWVHh4aFBrY0xsS3FmNG9OM2Q1ZFpCdEoxQ29mT0Uy?=
 =?utf-8?B?U25JTkFTalQzeDBZOUd0T2p0T1lsY2VMNWVJeWJ3bkg1TGpCUlh2bXFObmhH?=
 =?utf-8?B?Q0FrYnhxU0RzcEFTSzY0emlnWHJvTXZ4Q2p0UjBRVllnMlY5UnVjRE9zUHRN?=
 =?utf-8?B?Q3Zxd2FTd1ZRaTl0TnBMa0dINjVnNGZ4bzRQTWozWTd6VVJGNmlkSnBoc01m?=
 =?utf-8?B?bkNxUG5iVkRhakUycTFmbndtaUtBd2QwSmNTd2ZsS1JvaWhPdStUWWZ0eVZp?=
 =?utf-8?B?RkxsVXE1dUZIT1pDaVBWL1FWS0NmZXNYRm80SWR4b3RvSFBrTHJPc0ZUYjNl?=
 =?utf-8?B?WU1nbHJiYS91RlhRbFd1bjMvVFZzb1JkWXNFTXdZVHJnNkZHZUtJRGQxdk1k?=
 =?utf-8?B?UEV0V3NOaG1MeG5Sd014RnVzSHJEaHVuakhnbWtyaG9iSlREdm9JbnNlODl4?=
 =?utf-8?B?WExYV0NXbXYvb3ViK1RYZkprc3ZMbWRiOHR6OHVIWlpsV1V2VGE2dzJSUUwv?=
 =?utf-8?B?Q0x1TnFvQnFHM3ovdndyYWVidDFRbDBxSmZhRmJ4QWxNZnlKamE1NnVnR2lL?=
 =?utf-8?B?YW55aHh2c0FZcEdneDJkT1ljRytiZlpvK084bFd4S0JmNnZGU3dvZnJrQlJB?=
 =?utf-8?B?UlVWK3RqU2NDekVvRHNmbERYcFliVWgyRllMYTE5WXFpZ01YcGpHeEtVcTRq?=
 =?utf-8?B?NlI0NEYyblJWOE9NbktxeEZrcFN1K29abGdTakdaZXM2bGFTWWYreEFYUmRx?=
 =?utf-8?B?a05vZzR0UEhYNEF4S2tVTlF1Z3dJaVBZY0UycGF6VjA0QmpVM2JBUWYrM0Mr?=
 =?utf-8?B?T3R0YjRvY1hOSk16eGNFbjVJSVUyQ2xNdkd1KzdoUFdObWZIbXNuSmRvR1Zl?=
 =?utf-8?B?YzRXRU56UW1yU1NhU2xESC8rVjRaS2s4UTlaWkg1OWxlK2VHSE5YTDlPdHJ2?=
 =?utf-8?B?TitzelJNL2FrbFRLUzR4cENIR3BWcWh4Zkh3VmpNSnplaVZHQlNFS29sWkVo?=
 =?utf-8?B?MmV2LzZIR1VRaWxnTUJEZkV3Z1VUbTVhdXlXMHVWSlZCYlBQdlI3cWp2cUtR?=
 =?utf-8?B?ZjYvSFVoRDhXVUY1dXNIOGZYVXBjaGUwSUJGUkNkcWxtVEoxNS80c0JQajhP?=
 =?utf-8?B?MUx3Y0NOejcvWVBLckhoL0FmZXRhOFZNdmFzVWxFMURwSlF2ajFxRmliMFV0?=
 =?utf-8?B?bWRwTXoyT01IdjlPQUo4MmpldVUxOXBBQjZoUytCcTVxcXlucjllOUNaeUxn?=
 =?utf-8?B?anh3WitUYnpZc0ROTDlkWEVDejlld1FRM0t0KzRTMVBjUC9vRk5wL1U3QnFZ?=
 =?utf-8?B?MDl3SGx3bEdNT2xQeFFUTzJYbkw4NmJIRXBzMG5aODFiazN5Z01ISkJUT3Rm?=
 =?utf-8?B?c1QvTEc0MHcyOS9TU3FVM1RmVUh1aGluMXNrSlJJUEhaRUwxVUpFUmNrU3NF?=
 =?utf-8?B?SEN0RzJBQjFwbTh6NUhGa1pqMEtDOEF6ZzJ1Qk5yUlNTakZSK2E4L2NoS2ty?=
 =?utf-8?B?WktGdFhVa21tV0JDQ0psNGtDRmE0VzQ0TFdNaFBsaVVSWE1UMHBlSlJDUEV0?=
 =?utf-8?B?SWZsQ3E3MXRISVQrSnVzUUZTTWYvaFo1MGV5T1FFUHRGc0FLcnczMVcybXM1?=
 =?utf-8?B?bUNERmNNRjI5Ym5XT0hSd0o0QzZNTVhNM1dRdkxHVWVFTHhwWFZlUzhUb3Ny?=
 =?utf-8?B?dm5jMWxabUMvb29zTlhtbmJYTlNaQXNnY1hKQ2xNL3kxbk8wZHA4OHlnRWFB?=
 =?utf-8?B?cjhoajF0ZzFuMHNWcm1Sa3BTaFZpYVlqZGpBY095bjJnMy9ZUnM1c0Q5UGt3?=
 =?utf-8?B?UjA2R05Pa081MU5pRkVYWTFtTVMvSXc1L2k1Qk5kMllzc0hqbmk5OHZrS1U1?=
 =?utf-8?B?UnBNdWdUQ0xiV3RNdk5GbDJoNnoyb0JiWTl2UE1VdTRHTG9Ma2xRejZCZWdZ?=
 =?utf-8?B?ZDk3emR0NitXYWRpeld0SVFmZm4xdFRubkVSR3BqenM0SHgxOGxBT2lmQUo5?=
 =?utf-8?Q?yuxAmBsJzeHIlqOSey?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a7132b-672c-4e69-f0fd-08df3384ade5
X-MS-Exchange-CrossTenant-AuthSource: AT6PR12MB174769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 17:15:05.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjvEFYfNi3X4p/ooDgcC1iQ2Lnx3GiWe0kyJHtnSm8h/6OwtCxuowLJnMxmXCTqBzyB1VXoXDAElI6Lk2NJDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251



On 10/20/26 5:18 AM, Krzysztof Kozlowski wrote:
> On 16/10/2026 16:11, Shah, Tanmay wrote:
>>
>>
>> On 10/16/2026 8:59 AM, Krzysztof Kozlowski wrote:
>>> On 15/10/2026 17:31, Shah, Tanmay wrote:
>>>> We use 'amd' vendor prefix for all new drivers & bindings. Also, there
>>>> is dedicated IPI hardware which can be used as mailbox too, and we
>>>> should distinguish it with this PL mailbox. So I that is included in the
>>>> compatible string. (pl-mbox).
>>>>
>>>> If we are also to include SOC name as well (per compatible property
>>>> guideline), then we should include one of the SOC name as well:
>>>>
>>>> So, I think 'amd,zynqmp-pl-mbox-2.1' is good.
>>>>
>>>> Krzysztof, are you okay with above name? The 2.1 is FPGA IP design
>>>> version number and not the SOC version number. So in future let's say
>>>> that FPGA IP design is improved then the name (pl-mbox) will remain
>>>> same, but only version number will be updated i.e. (from 2.1 to 3.0). Is
>>>> it okay if we explicitly mention this in the binding description?
>>>
>>> So you will release the same SoC with different versions of the block?
>>>
>>
>> Yes correct.
> 
> Well, then this does not look like SoC block at all.
> 

  Hi Krzysztof,

  Right, it is not a SoC block. The Mailbox is a soft IP core from the AMD
  IP catalog (Mailbox v2.1) that is instantiated in programmable logic ("PL" acronym), so
  the IP version, not the SoC, defines the programming model.

  Following the other PL soft IP bindings, which use a single IP-versioned
  compatible without a SoC name (e.g. xlnx,tmr-manager-1.0,
  xlnx,axi-can-1.00.a), v2 would use:

    compatible = "amd,pl-mailbox-2.1";

  with the driver matching only that compatible. The amd prefix follows
  what we use for new AMD bindings, and "pl" distinguishes it from the IPI
  mailbox hardware. Is that acceptable?

  Thanks,
  Ben

> Best regards,
> Krzysztof

