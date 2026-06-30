Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E9022424C;
	Tue, 30 Jun 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830322; cv=fail; b=Yz6j5ghmbB03KrHhECOKVnFXatW2088i42fw8QtGrGawi7bkuaeJDSCDz8aRIP7E9Gt+cm7wOada0L7FGRIYAgK7dOov6IrP4ipIwObpW0umOrP0+3Mks1ERn1sBhGVQaZulaxAl2nnDaW57GlNwk4vIpsgkNWGlGP/Ut4yPi0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830322; c=relaxed/simple;
	bh=iluN4PaHSAliAzNa+2pa6Y7OzLBP9Y9DjNSohTeCVhM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QdLNg3LaD7d30UdYvxzym0AZyuvUj7+bfiXq3PsuaVlM/uR2RGuxGryk2qWOCXGkfZBHh258UNU5PK49m2jR3zeRU3ven8ohUsM+Zp8lxz0okakeyeRA5Bg/wFOhY7eCZN5bhWvCvnay9SPoJeLTALjWbIszOM1Yes93xwuXe4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jqsdgg2E; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jqsdgg2E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgJmMqpM9ob6/WDvYvr2ttjgxPr+b5KchOge+2VDxs4E7HdDgrdxFDMfWHuAtliTi6fzqyogmujYmIsAQhy5+4oGj4kl+wAss23bTVjUaRJPTQT6Z6bSkwyCD4XVsAiWnlVwxkBHyM3qknUsN5UR/ogfywmgFvsEtAhXAMV4eKiwVQ/dLB/E/I2yQ6+dSopgZ+Z6oEkSY86iIOqyCZIbZ2Q7cbx4mDMVEmnhM/h5sfrOokZmYMCaivLT6MQde/eloY9lvivhCdE2jcvtyDSi3DBE4TJKw2dB6YBKdjoGKdNHuvLwY8F0H1Bo1QxuDHzlwCOxGXvcuZ/tiYQWVBBd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkBrKadc+mVYTCtPJ+vidwj5Wf8aeFAEpWwN3D7Al1w=;
 b=GFPZpof57QO6KGjHfaTZans4mytmb7d2s5YltcCNWKAJxXxB3JEzGMezQdsieDtyilrjs66yX0TPXS3HH5s9SQxnq6bbT9A3X/PMPr1YoYDuQNhSaOTcy/b2ZAH1XutUHk7RM4E1wQm3aRGcBcA/+XkpqULCOLcHuThM36H+08luLvTaHGAcFOfTTipkjUQE4nuxXAQymg//Fzk/QIi2egDs7bzCdjcc37bQShaneOc4oXXzGqFwlE84gnBtMWhh+ues6az8qO6r6vqlbxogCTy8xSmwgdeyUJF5fldzuD6ch20iLQE0Mx+DHau1gTSVTgbK/F0PHu3q+PLFLWBKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkBrKadc+mVYTCtPJ+vidwj5Wf8aeFAEpWwN3D7Al1w=;
 b=Jqsdgg2EUde/qiBXincs1VfUC/8ozqH4pZRTjFAn6YtaQ49PMb8LeyBCXwrEwZmkYGDzti0FbIgPF0RKMXfqhCPNp4TrPEqlVmwG7lCcIxJM9Wu7R+tOdkiCG+C436KPwZ6j9RAg2cheN4M6+bRuL1O4pM7giH2+N3I2og/6QrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MW4PR12MB5628.namprd12.prod.outlook.com (2603:10b6:303:185::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Tue, 30 Jun 2026 14:38:37 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 14:38:36 +0000
Message-ID: <7ac43aa8-cc3d-4ffa-a1a7-d6b130640ac3@amd.com>
Date: Tue, 30 Jun 2026 07:38:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tanmay.shah@amd.com, michal.simek@amd.com
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
 <20260629164003.3940208-2-ben.levinsky@amd.com>
 <20260630-porcelain-skunk-of-modernism-2bf87a@quoll>
 <ff690a87-1929-400f-b566-74458c3c7da5@amd.com>
 <62400796-4b88-4880-be3e-a336b1c5f863@kernel.org>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <62400796-4b88-4880-be3e-a336b1c5f863@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:610:119::32) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MW4PR12MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b0b6fc-8436-4df4-b9e6-08ded6b544f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	uWjDif/o9eaZ7ziKqCsy3vdBX5ifCZ/j+g02l0g64i4T50sJUe9dc8XFBPbE4r/V5v9vA/94t4dEMh2z9FreGMc8HApVpXCyFiOy+Qqpt359pxcQ639WuEKsCdiPtY85kPiR0T/A8uRP5MFWYxBjY89AKwfLNTF6RZeUeNuKkiVzLpVhKlWTKF9LsRmY8ywC0S0WMx8JP45zib36caooGRqv/w3PAAOoSTZrZzPXWtcGJZCpZPtELwkhlwesWKIivDNt6fAUz0XI/qzZedoa8zyROrxWhJfUgYC261yuOA4pqKt5hBRAhBeFiJSjfkSKzehsRcVmujNkNLBZzASBhQ8TMESUspVobb6wMPRBqA9XYSYJ0rnuBCWoXtfy0IH7RK1DXyIP90v1SbmABMmDCcwFBxjwC8etuem2KGXBtnVSYgQzVzXLKWtg4GieMxRIHNXcK3HLOxb3YJ2Vqe8mjKWaXBtOpbEKJdFiqWYCHM/HlR5HDBgptnRKxqWk8F8eNtxrlt3CmbI1NSj21h1nuV0aM32hxt9HhWf/kfQUm6Onayf2UyQ4JZSAMp0kS6w9UllQdF38rwdteqvtRg6+nEvwa7j4/esHSlZnVtm0GSwFMNO2Ntiu4/LzfP2Ttswi/we//HHfcqbsSHAXVe+PTDQmneVeB5tvqnZwoSBnksg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmxpLzJnSWRLUVQvWU9GWWZKS2loWVhaNzBuZ1c5MUdGa1FscnhqSHhXQkJl?=
 =?utf-8?B?a3IrK3krZHYrTmY3MXE4WTNKd1VxRk9nV2R2MjlIanZDditMb09JSzUvaWtJ?=
 =?utf-8?B?NDc3YjhLVWV1cnVVL29ZNi94QTJkR3lsS0lMckQyN0U0cFIrbTd3M2RvQmRn?=
 =?utf-8?B?U2xmdGJGUi9BYWVNdXlBNmNLNUNhZ2Zja0pQUUl2Y1hyd3BpdHZVeVFzUkVI?=
 =?utf-8?B?UWoyMkZMME54T09FekhPMVB1VFR4YUNVQzV1T0FjaHZMTWdHcHBUdVIvcVZF?=
 =?utf-8?B?Y2Y3bjd2MkhOeWNwZWh6OENnamJYS0xaMitPKytDajhER3NmaSs2QmpnSXdV?=
 =?utf-8?B?MGk1MTFPNnc0R1ZuMk1yR09HQkg2VG5tNXNpc0lkaDVMZFU3c0drK0RCNE5s?=
 =?utf-8?B?S2orVXNGZlBzdFdyN2ROWmJlVmpPTWgvQWZ6OTQyMDNFQ2RDSzcyMWsrUVhP?=
 =?utf-8?B?MW1hNlNVUkVzdEdhMG51ZlUrRENQcGdrT3IxT3VkdVlrL3owNDRJRnprbWJJ?=
 =?utf-8?B?ZVhKY01SaSszOGdmZ0QxSWRkL2E0b2JUYlh6aUFISXE5N2xJM21rYndYckhh?=
 =?utf-8?B?SEtoRWY5NzJocldPdTdockdSQTdLTkoyV3ZQTTVQZWFDQXhTRXJNdTV0VFJI?=
 =?utf-8?B?SDQycjVxV0F5ZGwxQVhxUE1UVXM5MFBWNGVISG5sSGYzRnVwNnV2eHI5SnNh?=
 =?utf-8?B?cUlEM0RrV2lWVDljbmNiNlVXOWpwbHJYMndLVUNUc1FnTDZ1Q0pTVm1lM3cr?=
 =?utf-8?B?OTJOZnZnV0ZyUysxTXByVXFLd1kvdHJHZEx5b1FOK0lGKzdUWHc1NzNSUmo4?=
 =?utf-8?B?NjRvbUZtbUs4OWhPK2w5cDZnTkxEQWpqTXdpYUlvRWtIWHNwTEkxVFh2UGpG?=
 =?utf-8?B?WFhWWE50V2JmZWZtRGl4SklaSklpaXhUUFpraGgyeUhiT2k2djZ0ekFYWU1v?=
 =?utf-8?B?MVZ3ZWdoNFNiMll6bzl1UE5IbldNNmxUZ0tldmM0ZldSTHJJa0U5dzlQWEJ3?=
 =?utf-8?B?UERvU3dtL3pnOERxWDJEdnJjWlNSUUFyZkt4Sy8vZjdZRDloSXdRa2RvQTA3?=
 =?utf-8?B?MGQzbzZkMDNuTG9MMXR2cGZyV2htSndHUWtSMlkxTlVFdDlEQ1RNZUdzbHp1?=
 =?utf-8?B?YzRMS0dpVWxEVzB4aWc4MG1ldjc1QnVzd0VYYk5lcUgydWgwdDhteUF2cjQy?=
 =?utf-8?B?eXoxT21hNGVTbUg0UEFjRnFJQ2t3STlkSXo5VDdGM1lLekNYdkhRM200R3RU?=
 =?utf-8?B?Qm1TUXJMRTdqZ1pNRUI1c000NXEvWUtzQmR3MExFMktzWVUxK3l0UnQ1bGRF?=
 =?utf-8?B?UndBdjUxMkg1czZtUEkwcm9HbUthbGM2MVo5ZUVRYnM5V2hQalZCd1pZaFdx?=
 =?utf-8?B?Q2VaQ2pOejVjMVlkcXZaaHlRZ2hNY3R2Wmk4dHd5MktyYWZlUVgxMmVkektG?=
 =?utf-8?B?aGx0VjdXcU5kSHlUbUI3M2M1aTFaSE1DQk5Hd3hBSWd5bzBlUlprazk2dVR0?=
 =?utf-8?B?bHVmTUd4UjlGWnpYb1RaTjkwZ1RqSzM1ZmpPem1OZ1hPV2N5ZkZPUkZGK2Qz?=
 =?utf-8?B?OU0wcFRIQnBHTDNiQm9QM2l5TGltZFpuNmg2WTNIT2Y0MVBhUXJTeXQ2OGx1?=
 =?utf-8?B?czdCcG1rMVdPcmtDY0lxUDUydnlGMTFjZHhNT2VucWMyTnNOUUs1Y3ZHUkZw?=
 =?utf-8?B?M2p3ZUE2bFRXeFdoYzNneTU5cC9EQ1YrenQ5dzdsbVNyeWVhVGRZc09MRG5I?=
 =?utf-8?B?aTRjZVBya1JYS3pLNmhrMG5FSXFHYzlBU1c1WnlaWk5MYU52NENMMFRyRGp6?=
 =?utf-8?B?VitMTVVtUTB1Ulk1d2dTQzZmSklaV2lBQnpjSEMzNjM3d0F2N24vZXpPUjls?=
 =?utf-8?B?TjZIbUlGUVRjMnVXNGxMSGJ1L3lmaERuYTdBclp6ZFcwc0VuenlOQVBEUEZn?=
 =?utf-8?B?TGNkWWpJc3BTdWpVaTVQZ3ZINFAzWnZQVzU1VlFvbk90ZW5GcmphQlhnaURH?=
 =?utf-8?B?WUhBQk9nRkg1RGpSdElSaUVjaHJXVmdrN1BNV3ZTZVBVVFlaRHlTSFk2RHBr?=
 =?utf-8?B?SWVOakJ0bmFoZE55VVBkSmRobnpxVlR2WitRU0VzMTBLaEIwTzFuM0JMSnBn?=
 =?utf-8?B?QzZNTnp1bmgrcy9rZ1J1L2lNTUtpdzI1VHFUU0VjcDJyenZBOVVKbE1YSDVR?=
 =?utf-8?B?cWYvNGdudTFXZzdnd1lLdHNFeGt1RXhBMThzOFZJL0pSM3hyQk1MYlExWTRw?=
 =?utf-8?B?bEhCYVdiQUZXN2d5SXZETW1OMmRwQXBGYzRLQUVEOHRENHpDdUZpdVRPTFVH?=
 =?utf-8?B?NUlEd1JEM203T2NRTWdtQjRvaWxvb25vVDh6VzN4WnlUczJoRTZjZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b0b6fc-8436-4df4-b9e6-08ded6b544f6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 14:38:36.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1KOcEcTKX3CGG5mIq3a7ZkXPhHoKfRv5rUS+uTl5oXoSuvBH3XP1nor7TmxJOtWTVuYj8mhJJuN4wAp1f694A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628



On 6/30/26 7:27 AM, Krzysztof Kozlowski wrote:
> On 30/06/2026 15:47, Ben Levinsky wrote:
>> Hi Krzysztof,
>>
>> I apologize if this came off as my ignoring your emails.
>>
>> In the v3 you had said: 
>>
>>> +          - enum:
>>> +              - xlnx,versal-bram-rproc
>>> +              - xlnx,versal-net-bram-rproc
>>> +              - amd,versal2-bram-rproc
>>
>> If there is going to be a new version, this should be sorted by name.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>>
>> I was uncomfortable in adding the Reviewed-by if that is what you meant.
>>
>> In this v4 I believe your review comment to sort by name was addressed.
>>
>> Apologies for my misunderstanding.
> 
> Did you implement my comment? It seems yes. Did you change something
> else? It seems not, at least changelog is silent. So why would me Review
> tag be not appropriate if you actually implemented reviewer's feedback?
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the clarification.

I misunderstood the intent of your earlier email and erred on the side of caution by not carrying over the Reviewed-by tag. Since the only change in patch v4 1/2 was implementing your review feedback (as noted in the cover letter changelog), I understand now that it would have been appropriate to retain your Reviewed-by.

I'll make sure to carry over Reviewed-by tags in similar situations going forward when only the reviewed feedback has been incorporated.

Given that the current series has already been posted, what would you recommend as the next step? Should I simply wait for the series to progress as-is, or would you prefer that I send a follow-up revision restoring your Reviewed-by tag?

Thanks again for the explanation, and apologies for the confusion.

Best regards,
Ben


