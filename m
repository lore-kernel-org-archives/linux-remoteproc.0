Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66036683B;
	Tue, 30 Jun 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827246; cv=fail; b=JRITB5+AVJ6oLrvJPESDBG8eiNAPepJbji60y/GomgtSIYkaGTjXlR8JR2Kd4s2JolReV6Qgn4ZV4HFcX940HNGvkmGsxlEjldwvpc8HljOir736wO57CTC/8B/+8MDeYbMkQ+SiVMw9hRjJNbOGA2ftHlsmis+rsIan/covd14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827246; c=relaxed/simple;
	bh=dVNUtUc5mxbzHjIu3Fsz8iw2J5wpKj0byBbLav5bEYI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fb8MZZmdiTQ917HLr+EeTMAFPkL4ZtRyZb34z/bPclmcTUU+CnuEnrKo6++zf5SjiQSOAP7AuCCwufCo/KKEcs2dezM/4fXEpny9CRsYZSyTDDZ5eukiOXKFxZLPZTQjEhzYbevL2RUooZnmuV12l8aM62Wj+OWVl+r/E5p+pbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bf51ACAA; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bf51ACAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjYnIXeaHueSsnzt0SdbiCtp0YFW8DdB3BW2FKX3/i74PjYGvJNp5Bwgpz3UvGMT3w/MTMk4D/BgttrFi9hl9YvaclSbM5DnqjOewcnz8/h9xmGW6NIkUsPVt5R2H5SBmKwLg24sRbNWOzWnsmfSqPzeT88kcum9O+qUxqIG7P5x1xUU+Oqz4h3uWXvaJRyuXg6ETjMhy6fwqxw+tXahTDwpYR2RKqut9LENpIPerfU9Nk9qyeMijFzm65CE5QG5IcenkbTa3YxhqWmFY6z0ung8MdNe31pZ+95+km6bJO4xlnYULxq0aWKN4kI6NqACmS53Ak1U5Qb8oh/t31sYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad/GmsZtOtMwn1ggZBlBdlPtva+LRVcLtjF/Ahx7cps=;
 b=Z5bCkmkGLSjzkhdnfBbNLJrLxkvcFmar8w45FJLwRjFrlFrPWt8PS70MxaWzT9JnAOsn9WbrhkK7twhugBiKrz96oK1iD9kZFnHLOdbCRc5dLzgIrBPPV7PuHs3JoL65lLpk1A/hq/W9jHCopwSqZxUArqTfYdHKgQhQUM0iygJi9pdWnOTbWRF7OrVkZ8WT8LilyvPax1atqKtX+r86Y2EpENuofkBV1wALn3jkEwE86alqN1hcQGyQ2F0irDpBKXsZ6g/voDzlZmdK8SYU+8WkD7k99KVDB2qeKSQ6UlQ6NYfmccDZUW1F0iPDfqlmAts/FfL+WJmwQ458Szgxmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad/GmsZtOtMwn1ggZBlBdlPtva+LRVcLtjF/Ahx7cps=;
 b=bf51ACAAw3gHePw8Dsd7gTW/zzP3uo6lxlzCjx8nZr6eKTm0GBlbd9yKKW4T6J53MLgGOmu978RAm1Iv5UIwj/I3LJx+bJ28qoN96ZK0rG/lA/AnLnURK6kYj2whSBnUq8xxMC3P7vALu1RCHSPJd0SCFCioKiUxTc/v2j+f304=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.19; Tue, 30 Jun 2026 13:47:22 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:47:22 +0000
Message-ID: <ff690a87-1929-400f-b566-74458c3c7da5@amd.com>
Date: Tue, 30 Jun 2026 06:47:19 -0700
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
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <20260630-porcelain-skunk-of-modernism-2bf87a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f43b5ad-4107-4e5d-7a2e-08ded6ae1c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+DPQh+NPHc0sctiZx7TsRf2uIvKinGMf+nj5XAw0Qvi9ev2JeZk4JjhZegLsBgBykjcztzrV2KGAskH65ASgAOhgVGiUOx0V23ntqWBU66cb5bzsdEh3B/xaanPtGP9GMylqIXa5O17SPsJGlKLFPM4bkaayKyiaYk5iqtMZvva8cL4Jo9biJSg0NE8JYWxF6V/BGNk/QxCThRO6+NqFw18Skujw+LJKLxZ8pengdb+zgMDJZz5Asj9L6Tt0z7LMJJ6HC+o8LptWie/ci+9nUwB6Nck72pqs8LVvZyxHunsS5nlM4jzFqgPo+Zc/l8bHADpmRuuyQGvm4hzd+6rA3a6I46nhu9PkxEfHN458+vnY7LHkRQtLQN0Tu8HJY5KZkIfje5Kb5UEwQV27Q+sw7HLLu3uEzkFPkKCdmRL7Am6/76qvordZRu34vcJUdDktIPD2jYlmglMkfS4hpNLsr3j3uu9Ky9QHjRqswm0MblLMMH+GFCcSVkGocxu1ybnZUJVGQh1XGBm264fomjWCO/jLDDwL+yl0YwxHQMBhOQ7pf8wPuU3zypEZ2Gm0YZgQIneRK2LqEaDZSsudOOb0T6VNedaY2qD1TFwxsJGCyXh39qZar3aeH7hOZJzu4wOJuCdfClSUoV+Sh36QIr2ay/2L/1pFZckVDOZzt9rBOY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnlXeTl4bDNiM3g4aTRqRVhsQ2FUOTd1Vjd0Ym9LOG5GRkduSnJ2aXlxQnl4?=
 =?utf-8?B?T0h2ODNTMFRsdDBVZGdFRnF4a1Q1SVZNak1WUlhNZ1o3Rkxsb09YOU02S0d5?=
 =?utf-8?B?S2kvcDMxSGVkaWVkMEhUdEdMQkxabHZ5M1lEelBxbHhoNktnaFZ0TUgwQi9h?=
 =?utf-8?B?RmdlYjhOTUVNVFVCczQ0ellrVEJoSVowcUc3dlUveFFML0dWaFJsZGNPcHBk?=
 =?utf-8?B?WU02OVJEa2NGbSt4N3lXYjhiWE0rL1p3S0RkcldCZnc0MmtGV2pFRWU5NG1L?=
 =?utf-8?B?MWVLTW9Za1RjUFJSKzBpcVMzbGRKN0pCdkRvQ1J1Snh1U1BBNXV0OW0zZjc0?=
 =?utf-8?B?eTBWSFkzTGFGUmRTUjR3dW42a2Y5YnVsbkRNbDdNeU00eHJqRWZiVyswc3FW?=
 =?utf-8?B?eW56U1E4cm81bU1SWUZRT3V4QkhzS1FNRXNoN1ppaHNLeGdpaXJvYm5wMU51?=
 =?utf-8?B?cTAwOGpwZ2JuVHk2clcrcXd3M3pGS1JYK2djclNIUC9WaVgxc2grNmdJUFBM?=
 =?utf-8?B?SXRhdTlnQ21wSTFzZC9vOFZZNEU4clJSVENzMjZ0b1YxR2dYQUM1NEQrb1p3?=
 =?utf-8?B?eGJmc3Awc0NBNnZYOHc4WmNiNDZVWDNyc0dDTDN1Y2lSbVhxZUNsMFYxc0li?=
 =?utf-8?B?SFc4emhMb0Z5cC9TNHcxTnZMZ2htVEd4SU0rY2FjMjFpS1A0SmZoWUJhNlJo?=
 =?utf-8?B?dHRENjFVSWVLeGlHc1RVdXRsS1lUSmFlVEZjdS9zZUlzcmRtZ0VLUEN5MGFK?=
 =?utf-8?B?a3Bod01lY0dKWC9UOElVZUFJMmVuODZKb0N1TlpSL3JXN0wzS0dmelVtc3JI?=
 =?utf-8?B?VnFrV0NIME5BdW54YTN5VGQ0UGl3aVFDVU04MTJPRHBlc3VzcVlIRHVmZWdI?=
 =?utf-8?B?QysvVUlqVzZzZ09qRTZoZjVCbnJ5Tk5xWDNiUm9nYmZ6dmxUOTBLa3JUQzRj?=
 =?utf-8?B?WG1HUlV4dzVoTHdURE9sT3Nub1JTQVg1U2d3N0xGeFg1MVBTaVRwMkQ2V0dM?=
 =?utf-8?B?bzBBUU9rL1NaVWlWb2VHSTZmNVpZQmRabFNIcEFqSTlyd0cyMC9DRS9IZkhh?=
 =?utf-8?B?M29ZbHhzTTdsbFVvQVNVYkJqQW9VSXBnaTZpT2NLUk41bkhEaFBtQWd3Rk1u?=
 =?utf-8?B?enBmSVBSOXMrQk8xOWZLTi9rdGlHQlZCWXp2NmkzTit1NXo0UlZIc1Rtanl4?=
 =?utf-8?B?OW5pMzhIb1pQTk45M3JQZWhzRzJDeHAzT291VEo4YUM2ZG9aUm1UWGNBWndt?=
 =?utf-8?B?Y3ZUcVpld2xZa2J2bUFWalRqa1lSbzZDUGV2K0dMOW5taThSWnorV2ZLeVB3?=
 =?utf-8?B?a29XMGgwZnNsM0YrV2puWndpeFM4UWdyelRJR1BrMzg0SUxGb0dkciszUFN2?=
 =?utf-8?B?ZGEzZlpqeHFFY1h5dUg5eGhmQmgzN0hJQ0FZdExyM3RPdFRlbGFTdC9BR3cw?=
 =?utf-8?B?b3ZURWNVVHF0d2tOSUR5eVo3dnFCcG40SEtxSVdyZUh4NDFqQU9zNHFrb2F5?=
 =?utf-8?B?dG85OWtCWEpNMlpTVjZpY2tpQUpFS3lMcklia2xKY2xRWThTN0JZMTNONVBh?=
 =?utf-8?B?c0pvR2NVN0E4TmFkcDVpZWRXWEJTS0VUempudEF5ZUVxUFV1VGs2MzQwK1lE?=
 =?utf-8?B?akUzcnJNQXhYcWZZOHMzdkJBWUgxbmFFNllQQnVHYkdaeHZ5REwrdUg5N2pR?=
 =?utf-8?B?NDVFei96RXd6UEgzWmpTZHV5dGxQd3J3cmphZ1JqUHArWWtlVUYyS0RPOElh?=
 =?utf-8?B?OTA4V2pFR3FlMXJLSk05ejU1WUdJRE1NbXluNm93ZzVoYjBoVmtUTGo4cys4?=
 =?utf-8?B?WU1WZDlZYmhCZ3dxNTBGeGhXd3pKNGI2d0Z2ZDdEVGNtQ1ZFNXlGcjM3Y0lU?=
 =?utf-8?B?YjJUNDlITkUvQ1BuUWVhVktRTGZqTnJyYXdkVmdoM3B4WSsvY0hwM0xiRFFY?=
 =?utf-8?B?M1ZPYnZ0MUpvSTJsck5tbE1pZkpSNlhha1VSVDBhNDg1eTRMcDliTG8yazJP?=
 =?utf-8?B?U0cvMHN5VzlXUzZDZGtraDhaY2RITGxPSXlnRlZuUWk4cEhVaE14MTVvRzRq?=
 =?utf-8?B?SkkvQm9raHNZbC9wVWpqWS80K3NqVm54YjJhTU5UTUYxUzQwY0R0akRuVUVL?=
 =?utf-8?B?clE1b2xmTkFLNkJwYUlEMGN0RktEZTJ0RUh5ekkwVC9oZExMeEhDSlQxTnI3?=
 =?utf-8?B?ZUNlYi8rNnBMbU1PQ0RyOEwyQUwvZVU5bUtvck5waXc4SWJGdHNySUxNUlFz?=
 =?utf-8?B?NDJBNU5rSitoelkxUG1FNm1LRjhKQVhGclVhcGF5Y3B3eDRBVGhEemlZRzl1?=
 =?utf-8?B?YzFTc3dMTWlrUC9ZSUQ2UjB0Y2E1MTZkdElOWVBZR0hYM2JSayt2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f43b5ad-4107-4e5d-7a2e-08ded6ae1c35
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:47:22.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8CbsNaO1yjJgsKx+tYWehBwZbov5QkokRywwlWQKAAcHlzaKNG6b/qNJNmwiXCfRq07s51zofKwApoe80G5VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

Hi Krzysztof,

I apologize if this came off as my ignoring your emails.

In the v3 you had said: 

> +          - enum:
> +              - xlnx,versal-bram-rproc
> +              - xlnx,versal-net-bram-rproc
> +              - amd,versal2-bram-rproc

If there is going to be a new version, this should be sorted by name.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


I was uncomfortable in adding the Reviewed-by if that is what you meant.

In this v4 I believe your review comment to sort by name was addressed.

Apologies for my misunderstanding.

Respectfully,
Ben Levinsky

On 6/29/26 11:53 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 29, 2026 at 09:40:02AM -0700, Ben Levinsky wrote:
>> Describe an AMD BRAM-based remote processor controlled through the
>> remoteproc framework.
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
>> reset GPIO holds the processor in reset until firmware loading
>> completes. The firmware-name property is optional.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> 
> So you are going to ignore my emails? You know, it can work both ways.
> 
> I drop this from Patchwork.
> 
> Best regards,
> 
> 

