Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8A485CF9;
	Fri, 16 Oct 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162978; cv=fail; b=dVcmfFqbrmFnvzgaHfUa+IhICxcs5xSRwE22gGep02KCTfRgMEOiLflaNbEdIRSOeeB8f0zVDnj9wD/pM1QY33+jpXtOsYWaKVqb4TdSQ/mEz8pKgToDP24x3RfoaqfEkAfMTcJnpDJ6J0kAW1iLktVojER60oe8T449m7wIG8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162978; c=relaxed/simple;
	bh=F+OwiLm6nf//+Of18Jv7LVwJTz3XfZ88idyRqdBiCQ4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZE8IYLN1ZiCBEfKE2SMLh6eQdRSPemDx5So2Wg+eag6q6jmIKN9C1bFReaJf+np0SQitwx8bRuYIf6GDL3Dz4zlQwYNfLUvng7xOKrDXCWewqkoBOhYwFmejAMbJHrChdwGDfEAXjBp31qF/Ft3Nmx1ptTlp39loVAwzsicxJSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vJIlPuc2; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vJIlPuc2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqcA0luBhJvbglQMoRCdUFntkncQQ+47KkmozDF42rqNJu+K94vCchjhxwQn2KfN2lDgR3A322+CRIMjE8sNWPCrS9HJDlIRQZfrZGPguvu0etYBVQY4L1QvAKQ6emwDn5Cbu1VViedjDkc4R3pd1yAO1mgcjzyUEgEvmMuz9dkzyPAz6LX9USGaBzhh7WNyt4ylEqBpzwDs8d9JFnBy5UUhJSqK5WrRPfhP9yQQDB+HROBF7+qWBlgcOIM4yodmZsHU7rnR73sdntwuQvFpPwLkT0Xx2e1kkxYPKCOdH73tR01veCrW7qGN0gNnqM3xUshJ89j5/4Ug7WO3p85Apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc22DhCR5XedJweYazdf3YRWylHrbaJAaVnfeNECM14=;
 b=d4Sjm7EV1n08vg1yGC5U0r/ScKJbhRXhh36YVMgOGFOiTsWhmAAdhQDlpUpYXC//L3I72B85i+e4VC8XzOUj6hlwHL53gH7RfxsVsfP4Nks/yugD7Y3pNSdnWFX99OY7jAGk6xS1GkiGwMa4p6a0u1XYbvOtyZM/NJiNvSxd5F2sEzfn824hPgJjFOMU0sr4vlbU7eQ60Jn/gcjb0H/C3TB+cD0fyOexD9F82GolEDj/opPHyM4vlgh/QFJY3J79CYnTEe7mSEiQipbDrVN6TaUftAgR7UpxOcBphtMDcfbVhCFZL6Weck/hUxwB0o4IHAA7eObNtQV481i7Qs8rBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc22DhCR5XedJweYazdf3YRWylHrbaJAaVnfeNECM14=;
 b=vJIlPuc26BViMeubaFGc5KAwSJHbgDUWAej5lkGUAzzXkzSsaF3m5aLMidwah/5B8kQD94/Hu6QRDLSkAJMAqBECBvHcWmk6K2p4HQRQUa2vzMquhW4WJhcpvCdo32hcoMhtALwy4oO1/X/au0Ypez3zdEPHUUVfK34yJqqW87g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Fri, 16 Oct 2026 15:02:52 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%4]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 15:02:52 +0000
Message-ID: <9c95afa2-d580-4a24-999d-fc0ff8d46038@amd.com>
Date: Fri, 16 Oct 2026 08:02:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
To: Krzysztof Kozlowski <krzk@kernel.org>, tanmay.shah@amd.com,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org,
 mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
 <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
 <0ad96f34-97d6-4998-9cf3-4b09ab6c94a2@amd.com>
 <48ac1f6a-3de8-401b-a348-502178f7ff1c@kernel.org>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <48ac1f6a-3de8-401b-a348-502178f7ff1c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 06360f9b-21d4-41cc-1b22-08df2b968d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|56012099006|11063799006|4143699003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YQ806f1KmUqtuxZyZAgbrQ39CxJfjpWKF58US5QltjA5gZumgyHzIQQ8K9feKJBGYxNuJp/R4zDxtX6JaP+WjjsS9D4MLgkWlaHR8yCeBxsC+ID3buIY3A80d2an2Sx/3x4QMD1+yjilUtVlmdGbvyPgj8wuAWueI73c/icELD17WKiX71s9ePKbOkWUn5xIzUoPo0AtyH6+oyMHDjDx9ZRWBOeSj1o96ZQXcGAvIgkXVZBkV0VIhFL7sCqqEGUklcYX2Of5YRsw48dtfmWUAqovYv1vhC5NmGZL8161bmvRXsh+DzS4S2RFgSkKIkcWydVZosf0gHXvQrLPCTjUbmj4C3Hs1hRjs0ttqJDmodvj3WnzjB7M8aY2ur0XrlzTAwHo7hl0nPwATuiMkIjPzaUQFbs6mGkBC9j4v58Xi7fx0q3+lBuLX5xbomJEsCcbQkCEvcZ5SwE16wGyLMWKWVE/DgszqhVOKwpi1sh2GUsepWis8nkR3R+5fZkR5KvH5tJvaTsFyJ00tOAUIgKCfT5zrfolzM6ydseJjfhUts7xrCObBZkwYxfQBlo7iiHFVcbK/spyRN7/Jzhw/AU5rm711AESBFDw4UyUu+iMJsUcs1Geui0xGQPFEyCmHNQtIr3liIsocDVqTj1dQgpTedF0n8kyF3GOMyVOtRestHo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXIzbmMrZlNRbDg0ekNUandCVmVqbkVCS0VYT1Y5dWZtZkU2R01OTEhHekVJ?=
 =?utf-8?B?eStoVkx4ckx1SUJ2czhENUxTNWQwMEJqMXc3dHl4bmJHdHQ1QXZyaGtlVkUv?=
 =?utf-8?B?T1NLMHRjblY1U00zZjJaeTVkQ0pmbkd5TVBuU21YV2NhWDNXZkxJWks2aFRx?=
 =?utf-8?B?N2JrN2Z1Unp6YjBUcXJKRG05V0pad1lJcXpiOTI2RXhuSXhjbkh5UVFmbFJs?=
 =?utf-8?B?UjJZSmJZcUlUWlY5QzhCTmZQbUZlbTZWdWNRNUdIZGJRWmYreDBtam5Ua2FO?=
 =?utf-8?B?RlRYdUpaTVJvLzkrcC9YYzltYVZBQ0JZaGgvaFovcitvSmpHTjlwZVMwWmkx?=
 =?utf-8?B?Z3RGYWdIQ3JvWXVSOWZzMGx1MGFZTEVqNEUwdW5uNnJMSjlSRVphT1NSY2Ry?=
 =?utf-8?B?RDV0M0E0RGxNREMweXVJYnljVXJ0N052OUsxNGc4THZwWlBTbi9wTjcvVXMw?=
 =?utf-8?B?MThZRXA4QkFaS3FQWnNucm13MFdPc0tjT3pHMXRnUmJzb09OeWhvKzhYU2Vm?=
 =?utf-8?B?TllESHpSWXFtNHEyaTBVQmZGRFhtNHZOK3ZyTytmZldYNXU2RFNTbWJtWUZZ?=
 =?utf-8?B?aTFKVkpHSGpUaDRzdldHd0pML21NWFJCa3VpbEF6UWh1TkgrTFRkU1hJNjFw?=
 =?utf-8?B?VkJacFhMNlhwTEdxVnpIOEREU1BVNnR0NEtXYmlWNC8vUGJiaFN6MVgwYVU1?=
 =?utf-8?B?eXNVQTJSZWVmdmovaEVQUkpmYWtLb2RJS1VGQ0pRSTA5ZmtHeHZrZ1NINi9P?=
 =?utf-8?B?bXYrMDJJZmN4bHhsY1JzVXJBakxYVnAzTkd5YnJyM1o1dXFNRzIzUm5kK0hG?=
 =?utf-8?B?YncwUXIvY1VSVXBJNm1uanJuMW5WNEQvZERXVjNZN2YrZm8zTW9zWDk0NHNs?=
 =?utf-8?B?d21qU0tBV3RjbXhnZW5RZHV3bGh4Q2JiSzdLblkxQTA2UU41bDhGV0ZhMCs4?=
 =?utf-8?B?RjRva3d6eks2bytZbDZ4dFVBbnM3RjVJNzYvQW5aOEdSTldacTJwNEZHeVcz?=
 =?utf-8?B?aW1nZXpwUndaeXdIMy9tN3hFTkJLd2lPOG1iUTAvdlIyVWxvamFkT3d3Vzk4?=
 =?utf-8?B?cW9NMHNYaFJTY09RdStteCtBOEJyL0ZFY3VBMjUrN1h1U0RjTDNYV3FERlVp?=
 =?utf-8?B?RjhSamsydEZRSjErZm9MVFU1djdBUmhBUGFjeWZISVZjOERGeUJoTkswdWVJ?=
 =?utf-8?B?NTh4aGRla3FTZlF0TmY4YkRMZDg1aVRLMUFvY0JwdEN3UjNBNmdqVHN6SEM5?=
 =?utf-8?B?ZU1BdDU5TWxIWUlGRFdlTXIxUUxLVUtNOG5idzJteTcvSHZjZWlPWGsyYWdW?=
 =?utf-8?B?emsvaXZnV1hTU3BmZEp1S1NWbHgvaFo1amhGL2p1MVQzbWluVVJCaWdEUEs1?=
 =?utf-8?B?YkswYzhvSnUzU2J1NHpCQk9aVG5zRXp2QXJ3bmVWa2FuSUhPRFU3ZWtERE1z?=
 =?utf-8?B?YmFLNW5vTWlDTU4yS0ZJUWV6WEE3RUwvbGpkUHlxZDk0cWtBRWR1d0VtZnVZ?=
 =?utf-8?B?d2JQUG43VUdySDhUbjNHRFVIeElvR3NKOTBRTU9jYnRaNXEyeVhrTGVtSlUz?=
 =?utf-8?B?THNhWXlNaU9xam1ITzBjUU9IQzRwdFFiWWxaMDRFNFVsSmdmOHRhdCs5K3pG?=
 =?utf-8?B?ZGthc01ZWjA1Y0RUazFRbjdCbFZlNVhRdGc5TEVHZHk5ZmdUS3kzY2V5MGhq?=
 =?utf-8?B?MlVobUhJc3VyQUVGU25DOGFkcGJDd3NkK09Ua2pGRkRNVTAwV2lwVHhJT3o2?=
 =?utf-8?B?WllsTzZKeEJ4ekZYbEFrbWxCVTFhNXFRbm5xdmZuUFoxWFBDQzQxNFVBc3J6?=
 =?utf-8?B?M2svRTNwdnhKdGtRSXRNRG14K3FLMTNtQ3IzOG52ZEdFa0o0cXk1K0s4Vzd5?=
 =?utf-8?B?bjFRM0IwS0s5RkliSVhVVjhzS1JvWlNCV001M2VjVmJSbWY3ckRqWmhlZnBa?=
 =?utf-8?B?cHJxQjBVU1QrYjNZbm5Ic05qN1Y0bUVsNHFnTjF0YXByN0RRcFBGT1IxaVBB?=
 =?utf-8?B?VmxaaXY0UnNRU2VoeUJ2Zks4ZHAzS0llc2V4V1YvVmVTKzBaZXNaM0JuUUNX?=
 =?utf-8?B?VitPaUxrUE1WVHRQb0JRV3haZ3JxUjd3UkVPWVJESXl1SjZhaDZucHZWMEpF?=
 =?utf-8?B?TlBVSmtBd0MxK1Q4RWtmR1U1Y3ZVOG5PTTlKMk91NVpXdU9CS3ExOWFXL2pF?=
 =?utf-8?B?a1VrRTFMVE41dTRPaDJzYzZyQ3MyQmRXWUZWMmErU2IxZEx6NlVMRDkvdkJD?=
 =?utf-8?B?Q2dnaEdOSUxtRTE1WDk3Y0pBNjhVSzA0ZTc0Q3gyQXY1VnlDNE5scG5Ia0F0?=
 =?utf-8?B?c1hzbnVyUG1NdFJCMk5tbzcwRnJ3a1NJRlVWUGxGTlFMWWNublRadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06360f9b-21d4-41cc-1b22-08df2b968d1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 15:02:52.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mi5Igm0U0pkwjz89h/JjTNQyNvKRMzEyMt6bAx0mI7ROhGHBiwvF7Ty1+7Nye6UvfezAucnO6n6C0tL1kmuKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192



On 10/16/26 7:56 AM, Krzysztof Kozlowski wrote:
> On 16/10/2026 16:54, Shah, Tanmay wrote:
>>>> +static const struct of_device_id amd_pl_mbox_of_match[] = {
>>>> +	{ .compatible = "amd,zynqmp-pl-mbox-2.1" },
>>>> +	{ .compatible = "amd,versal-pl-mbox-2.1" },
>>>> +	{ .compatible = "amd,versal-net-pl-mbox-2.1" },
>>>> +	{ .compatible = "amd,versal2-pl-mbox-2.1" },
>>>
>>> So all of them are compatible? Then why do you need all this?
>>>
>>
>> Hi Krzysztof,
>>
>> This block will be used on 4 SoC - zynqmp, versal, versal-net & versal2.
>> IIRC we should list each SoC where the device/hw block is available.
> 
> No, you do not list here every compatible device. You only list
> fallbacks. Please open other drivers to see how this is done. Only hwmon
> is an exception here with its own reason.
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks, understood. In v2 the binding keeps the SoC-specific compatibles
with amd,zynqmp-pl-mbox-2.1 as the fallback, and the driver matches only
the fallback. I also withdraw the xlnx,mailbox-2.1 proposal from my
earlier reply.

Thanks,
Ben
