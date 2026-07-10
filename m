Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063643F076F;
	Fri, 10 Jul 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694713; cv=fail; b=EL1iy14Y4ced6lhnsG3UXZDbTNdJ2Tn/Rzic+A+LJ8WVGSKZY35RDMI03J9ZVsGuvc1XV9zUwrgmBQoyvC8Q2uQ9qx4rpuJ+eobIaEzk5W3AYEi0tiPZens3HN53/iUoPTFXeUaIezxc7hQO4/ND2cScLMm7x/jX2u5euZrksZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694713; c=relaxed/simple;
	bh=gJFr5BL1i7G3bDV0b5zppzZoqJooVJxEEEO3jj2zrYw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VPS8v1f7TDPNVAjuf4z2I2Wsu00r1O+3lSoH5BnlFKAbdLz3hpajmgw0OzXeFO9JCmoRa9wd1GjxH9rCdl3obfOkx/hkF7OALIXamK5QnMG6GvnylLPdRdgpFeTPppJeWb45ROlvj0epaPgK2htlaVTNXzPWSAR9tdmqrs+ydMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4ipkfnkG; arc=fail smtp.client-ip=40.107.200.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4ipkfnkG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUWYyqe+Cbevt8TEkHPfkIirszeIDgzUuG4tX3/vStEGw0rdDLH7rY+8OyruKuYn4XJQfjO1muGvhunurUiwBYj2vjyGaqoc7FpTHBZxip1UpXZdvNd6fg7w/+sNTZRB/IpqQYaHGgfkQcBKipL/wlL25mue2/Y/zHKsOmCiVF3lBmhkgpUl0mBwrUCylFWi2o0UcQbCAv3CAjk4oxtoD2aunpRLj0IKW/I68VVopBj/bzku0xECxZKiMMd02DHvwHNkWnE8ODRvSqY03ktmdx78h81VuMXs2mRKrkDtBRm6d9FwO+pRTJX6mkuxQLdG4s/QAEqSVmNHZP+/1Sjt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbKRZAAUMqZepjmOc/6ZSpWD7sUz/VhD4c5Eq7u9fXg=;
 b=Imp0kUHHUdmg9SqKqoJ66nvgV7UI+CS9a+RdL3mA8XhAwiWzxupE+Mq3nOxek9evo90sMqUJPMhGj+wfuEccZPxq8UNVizTctidEsHfmKRkhXnGGHZ220EelRT+e+Qjtl/S45vYRzI8s4sZkr+5MRlWwMdXA1g1ULh3vQyY5LDm+vbjKcdNXfJwWs8sVdf3Lh1/J+WuEeNzbja3GlId/V4Sm1sDYTb/R/4t4hdmoWxf4p+yu/Vm6jM9ciUE2gaY7IR67XirbF8KznIBByM1hbna89+ybGeWmIx76juITmjg7qn5pSG2bjUpU1v2ynRKDsg8k9rHSSIbcUsZzMKmlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbKRZAAUMqZepjmOc/6ZSpWD7sUz/VhD4c5Eq7u9fXg=;
 b=4ipkfnkGSEXpxiKrnXatmkuEjb1YMwaUwWvQpFbimmc5ohiRDL9TWrtVpf//+bBm5DOCD34RL+YmeY7SSxXCzAKFvj7v2/xet9Rz2jhj3D8u81NjR4yhNM0z1ldVm12zeHxzYjnAht0qGLrW8jVHJ5qtPFdcivLuf1ASaioXgYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Fri, 10 Jul 2026 14:45:08 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 14:45:08 +0000
Message-ID: <911560be-3ceb-417c-bef8-1717948f3a8e@amd.com>
Date: Fri, 10 Jul 2026 07:45:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: document AMD MicroBlaze/V
 BRAM-based rproc
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tanmay.shah@amd.com, michal.simek@amd.com
References: <20260709145712.951146-1-ben.levinsky@amd.com>
 <20260709145712.951146-2-ben.levinsky@amd.com>
 <20260710-noisy-curassow-of-contentment-f0dbd6@quoll>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <20260710-noisy-curassow-of-contentment-f0dbd6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0095.namprd07.prod.outlook.com
 (2603:10b6:510:4::10) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: b795af97-0f9d-472d-4635-08dede91d694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b0+YlNZ8Pt0GTgMYettJ8yLQiBqa+XUXmGTRzHgdjI3ROrY4rTWz49I5eGa2+VhHld2JmhEKsvr65xli+YbxR2rbH+okIpAfGmG/UmiqANQKMmNfng4RR2o+bf1gmQU1OGAf3ZbMu1X9oIBx0QlFHotIZFd20QargYJEcLN9hEOW8e5KyrbYqcN0ohHdbrSlEUx5tylj02uc9ALCRuK/dZ9QfJtnxLBz6xfG/KAWRts6mC+jFhiGj1G+zw6MQTARoArpiaJpBhptAt5Zi+XWIEzC85/5HWf7/W/ozwPE8UYIE1cAj28qs0Mz+BO93B8c/BtlLYKYIdWuXP5uFyo2BeiXnvyQiTOp7Hq5MFbtzbtrK0OaShG8nQPMRDbBADOrjnE1h2qbzoxdwIP0UfD+7EMG3pPzTphbEKKDhpXrisjxAl+nCzHUTq+cqDQlpm4a2GgEliH5kOCj4J0sRxoMp88eHwkozEMLJmwmZnOfWcRQl4wB16WO0XhjwEhwSCxT04ETc9zPog0zcZ4rQVdLDc6nJchllvx3EUT425GiXy/Tify6bJw09WnrMAD1zAYVQsI13frQ7yG6DLlNRo+Fcwjn99taU38go5ewOlC7/gWNpNN4UtvheSg/DV+/EAjxJwpA0rmEaoKVsuuv1GQ2zXM5He+QxngJSAxlUmspo9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1DMFlZcS81Ykw2SXNxSlVmYXA5YUo5QXBENTk2R2xPTTRTK29lUDRJNFg4?=
 =?utf-8?B?azFycGQwa2R3alRTWnlObExIVERtUE5lSnAwYnF2WUg3b005Y21NZ2hCbS9J?=
 =?utf-8?B?cWtsYUh3Y0ZRZnlTblJER0Nkdi9nejV5ZXVTenhyNk5YZzI5VGovM1lqcUpr?=
 =?utf-8?B?K2o1TmxKMy9IN2Vmc3pDdTFsZVpjbnZJUGE1bkJIdENTYUp5Qys5Rm1mTmZJ?=
 =?utf-8?B?bWpWY0h5STRMbGhkY3U2dGpnK0MzbkNtSW1nNU52NWxNWEhURWJ4ZVcrWmpK?=
 =?utf-8?B?ZkVjTm9TTUg3QVB5MklkU2pjL0tnbXBQaTVGd0xOVVlsSVgzbnlIVnpDOWRl?=
 =?utf-8?B?MTBoOVMwV2IwekUvbDUzUGFxc0xXb1JrNCtlaWFlTUdIbmpNNDdwWHRrVlJ6?=
 =?utf-8?B?eFhRcWZ2ZU1pU1kyY21KT0pvbjk4bUZ0ZGdjNG4vNVNHcUhxV3hMaDdpTlVF?=
 =?utf-8?B?UHEwTWc2U2dzWkMxM2YycWNzTzhWbUlQQldEeDIxVU1VZDNZYmlnVkM0Qmhr?=
 =?utf-8?B?Z2gyd0VvOHA5R0ZSZ1dNS2ozSCt2L20rS0h6NEhFeHJYVjhjVUFsTVY1QmJF?=
 =?utf-8?B?M3NmajVqaGg4TktGRHduZHN3OFRSQkpTS1pWcDh6RmNTTm1iUHJqMGE1R2hr?=
 =?utf-8?B?YVlwYUxiVGRBMzZPc3lXWW9HRDBpWFo1UDhKU1FmU0F1QTkycGtnczJOZ2ZP?=
 =?utf-8?B?NXNVdUhIdkNoMTZXNTVvYmxCS1g5ZmgvMVo5ZXQwY21yWStkZUJYOGFON0RD?=
 =?utf-8?B?SDMxTVM4T1pldGNBMmI5OVFXdEdhMWI1Zjc4UmlGRmxxYVc4WkxNeVN3SlRM?=
 =?utf-8?B?Z0NXait1VCtLWFovNkFwbEt1ZmVsRW8xaTR0VHpXMjFsMFBpVXMxSWNYY05X?=
 =?utf-8?B?NXdHdnJyMVVwTk1OK09DdFlwVnAyS3dwK3F3emd3bEpqQXJ1bDhHV2pxYnZ2?=
 =?utf-8?B?ZXlaVzVzMGRzRVNGVnZuOWt3Zm9oUnM1ai9DZGNpMC9YaEpHQ1hYdk55NUNN?=
 =?utf-8?B?Y0ZqZDZIdXhEZnYybXYrazAwc2RUWXhsS2JZTjNFb2tEVDc3dThtNFRBY3Yv?=
 =?utf-8?B?Z3ZtOXhxK1E3MnhTbjVhcWR2dHQrT0dvWmpVS3B6V1FOUGJNUnozclJFRzJ4?=
 =?utf-8?B?L0RrMVJEeXI2UmxlcW5Xd2Z2aDh1S3U3NUZINzczWERnTEtxclJwUzA2eHM4?=
 =?utf-8?B?cEpCOVEwbVpMQUpVRWg3YVpKaUY2clZuSmdyTUJ1UFRKR3NNeEFsanloSWVD?=
 =?utf-8?B?bHFBdVkxNDhKMkJxRW81OUt2OXdZSitzNGJxMkhRU2JLQzhsazVDVlBCQnhZ?=
 =?utf-8?B?NzVHUWZPaGVRSEJndy9ZbzVhMERsV21qa2MxOFFlMks3NmZZL1ZnNC9yZEhR?=
 =?utf-8?B?V2N1T0h2MFdKamlLcGxBT2UrK3EvY2FJVnFvb2g0OVVtbkV1UmV5bVJUZDdP?=
 =?utf-8?B?a09oNXRPa0k1ajVJY1JpUE1kM3NoNkNuMWx3TEEyWlRPb3BxWkN0TWluS3Rs?=
 =?utf-8?B?SThSQ0pRNGpNN0pFTDMxY21aRWJXbkkyWVNzdEVJckFodGVyZ2N0MzJYMUJ0?=
 =?utf-8?B?Zkt4MjRtVXkzS0ZnQmU2UnNPWWlta3B1ZFpBYUFtN0tRUTFaNCtGQk11S3dN?=
 =?utf-8?B?WnJ0VVFxSlQvNTJUdnVuRURJM25HTXpQWWIwbklUaVNqMzRyY3ZNUVd5TGtQ?=
 =?utf-8?B?L05oU2F5NXg3VXg2OEhSMGRoTldWUm1ia0NOcXFkKzVpOXV3YmM3c3JYMFly?=
 =?utf-8?B?ajRIZUVkK3p6UzJCQkJFcStWelZCUEpkS1lxY0tFNE1ZcndQeEJjYjJFZ0Jw?=
 =?utf-8?B?aEFtMjlCMXpaNWpwcjg3dmZnWEZUVFdRQ2N6aEZ0all5OUpTVG9RRVFhMXJK?=
 =?utf-8?B?WmNXZUtDSHM0SkRxVnlDdVFRa0FYV0xRRlhJQWZVZWtEZmpaMEV4YzhzTkJs?=
 =?utf-8?B?eWFBRWdzWjdNK1I2dUhBM2RjdVFDMkNkVFI4enAxcEFvZUpubm5wL3RmWW1I?=
 =?utf-8?B?WExKcWtsb0xCVS9DUEpOYzF3b2Ewd3I4OUtZTDlGOVB5Yzh2VnBodysvMVg5?=
 =?utf-8?B?Yy9kTkVzREZhQ3hDa3JUMkxKZ2h4MlJ4N1ZuN1RGVGxsMmZuNDNGbDc1Zkkw?=
 =?utf-8?B?aWJNdUoveFl2T3BWQWJ0NDZvalBoa1ZQa0NQaGVHZC8vQlBTd1ZFNFVkTzVI?=
 =?utf-8?B?WEVNNVFMU3lSbWdkZDl1dFErN3FtVklNekEvM1NwcVY0RkhHZ0VZSy9XTExz?=
 =?utf-8?B?WXczRFpUTmJIcVFnSWx4VitkbWN5YkpWd2lMNk1RVjFURlRnVW1DbkNJckQ0?=
 =?utf-8?B?bTNoQ3c4c1dweGl0NEdXcjhCWDdGeEJCY1BGN2lqMG10eVRUdEVVdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b795af97-0f9d-472d-4635-08dede91d694
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:45:08.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BeEdi0X7jgCtSdMHzZ7ZnCM5A4e69v34g+hmU5Qzj23//daTm7JJH1BnwW8wLyucdn+I+5hN1PsA92TAx8U0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460

Hi Krzysztof

On 7/10/26 12:09 AM, Krzysztof Kozlowski wrote:
> On Thu, Jul 09, 2026 at 07:57:11AM -0700, Ben Levinsky wrote:
>> Describe an AMD MicroBlaze/V BRAM-based remote processor controlled
>> through the remoteproc framework.
>>
>> The binding models a soft-core processor subsystem instantiated in AMD
>> programmable logic and using dual-port BRAM for firmware storage and
>> execution. The remoteproc device is represented as a child node whose
>> reg property describes the firmware memory window in the processor-local
>> address space. The parent bus node provides standard devicetree address
>> translation through ranges so Linux can access the same BRAM through the
>> system physical address space.
>>
>> A clock input feeds the soft-core processor subsystem, and an active-low
>> reset GPIO holds the processor in reset until firmware loading completes.
>> The firmware-name property is optional.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> NAK.
> 
> You are not allowed to invent tags. You did not receive such tag.
> 
> Best regards,
> Krzysztof
> 
Sorry for the churn here - I can fix this instead to bring back the RB tag in the next as you put in review at end of the v3. "Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>"

Sorry it was not exact tag from v3. 
