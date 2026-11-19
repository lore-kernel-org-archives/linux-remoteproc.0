Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112174;
	b=okC/GccxE1O7qu95zhLNuXlldJM2EN6ff+XUrg+Zx1MYf1p+pU+ELDqzYhYrE/0IesuC
	 f/RFHpepvquAnt+sMCaAzJZKoJU1+9fDGpCmfAsdOKEwksLcLyvJVeOeJb/QSlPZJfpAn
	 GMMOz2EARhMvoxd3mqts3nC9pmEuTc8iNByN3lSziBPanjPWd9v/rckFIfyVFCiFAUz/0
	 /9VXPEm0OAivKmiPA+B2F821DmQ9HjKbiDASQC8SKq0OqJUGsPPRolFXE5ozmBcMFt8dR
	 IdTckacRqDACmjzr7xDBgFbcMXIg/K8FmPsUBRLgI8nWGRYf39WdGHExJSwlRLvaaDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112174;
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
	bh=GjPjHBMAmZfM3O+f2SZaUjFD7rFo9MVIeGz6nUbSYM4=;
	b=naocQLVNgo9zCPXGUKiCv+0n2HYLW4kzERgEwqn/tr+bhNpiqAAU6ia6YLrtNnuvcPGF
	 SsoU/ED7ycrGzmh/hGCoLgz8LmWkFRYvSoirFUfQY2oPWo+LEaHWOdAlN0VEgT64Jthcl
	 yf9NkxalVyN9+cQEorGWJuyBVhJqDP+PeC0klhOII9MOFrzyKI2xCW+Z8wnAjqZI6k/fW
	 nSJ3EO9XGINtnS4O+Z4mqOU8BlySFDzG5Tz6KZvAqJdxpxID25mNnUcf6XgMbccVZ1qfG
	 lACrrhC2aSG+Xjt+GPKQJIZCe7uDJWUDoYjO6oTTHjfh3KK6y49w7Yasm/J8cNMH7ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="3KcN/Sj3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.39
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011039.outbound.protection.outlook.com [52.101.52.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1567606A326;
	Thu, 19 Nov 2026 18:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1567606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3KcN/Sj3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1Kw+SuxeKFKilH6jtQyUbaituGvNKcvNDIpcMkPX/VyDXcS/WUrigEhuU6d+VEYM+6vsA3nL6+ePyZnNN+mihGjAwnNT4CDfxsPbMQwN1qM/us7c/cOYtN/YmEfs304Fd59khIQuyRoRPNNPyyQexv5B1Sxt3B5bxG4tSeE10g71x6XiwLsdsKsr7s9MDhxW1zMCiZTZ58rsvKzqzI00tnx3sypGiAugsAU4I4iRvEa5EZ49wqzUQxLgvNVGpXl85h0CTrT+uz0rD+dB8HfqvmMgEhShY2ZOBMRJXoyWcTZYggN52Og38iYxKg9eiqG3kk1GrfNIdOtTQ+T2vhe2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjPjHBMAmZfM3O+f2SZaUjFD7rFo9MVIeGz6nUbSYM4=;
 b=MRrWjh2LWit6rQtujwOyUUe0ggEbCAAXrtc7fKFjNEboE/6s60PrN72ABoneN4zWTdYkWdWsPPuCZpig50SBjtfYMKSWI6s8inwbuxspK/PklF47E+NZ/f7GY86JPlB6Dxt2Y0lFGPhBzt4sD4YyDHoX9Lz7nrm4gAnWXKdpGE5e7nrO4EO5XEI2iaktUVNDd2oOuDp9g/61EKe52FBNRBYP7BrLQai46Xi3GQ6jRPM5KiLf8Kx+sGIN5ige59rgMupcQP9pbQ3kma4rqTFw635rw+URntOvna7LQOU3GQnM+tmqOgJVDrj2vIN9Ykm2Y9xmNCk9c0pr81Mt6QNN5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjPjHBMAmZfM3O+f2SZaUjFD7rFo9MVIeGz6nUbSYM4=;
 b=3KcN/Sj3zN5NIRRWyLm+o6TFAzE5YVuzRWTzG37EVUc0ITfk+D2lgZmihtmzsTl954HR5dnEeoBkC6+AU+ADhpdEDA7LyOh+AQ3n0okChr+Pldd6mdXWZauqY+bJFNe82akfP1ZWrQxxzZm0860KMjUBspa+nBpRPWYC+vcd174=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6) by LV8PR12MB9269.namprd12.prod.outlook.com
 (2603:10b6:408:1fe::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:16:10 +0000
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44]) by AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:16:09 +0000
Message-ID: <91438414-b8a4-4cde-a7b3-6f14b65da5c5@amd.com>
Date: Thu, 19 Nov 2026 10:16:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-4-ben.levinsky@amd.com> <av8rBP9x0I-ikEJy@p14s>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <av8rBP9x0I-ikEJy@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::28) To AT6PR12MB174769.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AT6PR12MB174769:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: 86443194-d255-468b-977b-08df46692fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261102123227099003|261026121527099003|4143699003|261028144727099003|11063799006|56012099006|261021135927099003|261021121427099003|10067099003|261026140227099003|261022105027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	COKeziELlNskAPp2ERCCX/Y6J8vXxc7LwklSUUMaK+AXtolpWuMyW0cZw2QfK2IxAPxzjuaa01yyry9BwfzcE5M+WCV0zXzrhxZ54jGCXFK8sci0LEzL+JvXd0nIRAXp+GQcDEnSiSk3RQsdEN8FiFmYePAmr4t3mxq7T0ZBaYDIzhPaBs5ZEtpF0y3iH/m+sbIA1ZixXweTY4hR2mZ1Ojq0w5OlpSVfL0XEW+fhQd58svSvzNGLTyp5YRcgfXYGSPlWgXnmke3fZ+HPYgNchVH9Mom/Y1t2AybXtnIPBkkoVz0bVmnr3l1u7ygaMZo+HMdFtoIQv9WjwD3mMmNDgeb0Xpqum//sE6qHahX7o9CFvdFG+j+68MRvByT3gn5ucqqTcZnBwYAMvjrovmVTFfD/MiaH0V1ERtZu2/v/udK6VqbK308EZ3jsemIYWucvSWWJLP9cTW0OdikJGoU8U4xcLZvbN3M891frSJIQh3XAShbInFAUb2pt+vgIXsKHNsmckA09BQSKD40dnrSbsRkEdDePJ+lgT5iJmk4n3ylfILEg+gfCNMVdBry5s1XA5OHPVPqo35AaVhImbM51rwljLsL6s6PVkI2Fv+czXvEBlQlu0/G8cs9QBWMqhy39
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR12MB174769.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261102123227099003)(261026121527099003)(4143699003)(261028144727099003)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(10067099003)(261026140227099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blZzbEN5Mlh1Uk01MTBhRWtHNEwzWFZveGpvb3JHREZFN2NRTDRMWlpRaTNF?=
 =?utf-8?B?RCtuUmJPODRtbmtYaXZJNHFSSXdTSUlhWmEwWE9Ubkt1REtaM3lnTGZiMXdY?=
 =?utf-8?B?VUg3MkpFUHZia2hSM05heGVkczNIL0ZqY1RtSjFVZndtUUl4SUxseUhOUHJp?=
 =?utf-8?B?L2p2R2lRazZGdVBuK0ZPbGJKRFh4RHNGdUF6U1d4bXlzb0VVc3QwSDMvR21H?=
 =?utf-8?B?d2R6Vk9GMmhaUWVVeHdtMG1oY0xvYTljY2hlZTZCZ1N0dVI3RG42VzJxODRD?=
 =?utf-8?B?ek83c2VCUW5XQ1JDWVh4UU0rWnlSU0g4ZzBiZDU2NldvUURnQUtOazRjUlBK?=
 =?utf-8?B?K2k0bFhNck1sa2tWSlc5dDFQdms3ZkxHZUhZclJlUjdPK09rdVlGQ1JidjV1?=
 =?utf-8?B?TDdLWHQ2RVMvT3oyMVVVVmNVd2s0RXJwWWxtcS9tN3BlYTNlRm5zNVZYUm1U?=
 =?utf-8?B?ZHNvVGRMdVRsSUd6Z1V6b0YwR1laRmwzNXY3MW1WemR0clUzMlo1WitvVTF6?=
 =?utf-8?B?cDVmaDJuWm1qVCtkYlhXUlNrVGJJSFJwdXBNWTlTZWRCZ1ZvaXdUVFBvQmhi?=
 =?utf-8?B?RGtyV2xGTHhTdktxcHJrVm9oMDQ5N2daeW5ZNzFmZ3pQODZGTXlMZFdPelk2?=
 =?utf-8?B?R2xHL0pFeHNHOFk1Wk5EYStyZjhrbE5odlFnVFFFUW9Ubk1iL0NEdHo4eHEw?=
 =?utf-8?B?VXJIdTd3YjF5eENURCtManEzL2ZMVUZzazRlaWNBTnFQVjBBNFhIRk5NUEov?=
 =?utf-8?B?WVREdVl4RkdTWnlRM2pFZ3JMaTVVcXFDdGRaTTg5Q3RRV0o3emExT1BJbGRJ?=
 =?utf-8?B?c3lrMm5YWW02QlU4ejdVZm0wNkowTGlxT08wRW93ellEeGF4ZTVDVTBjRFRN?=
 =?utf-8?B?NEFVK3FKV3pEMWoxMXdIb29Ma0hGd3BSM3hBcE9iTjVnMU5UZWlrbDlaTzND?=
 =?utf-8?B?azh5MVV5UkhqRjJjd0I1Z0pFR0QvemNPUTJwdnR3VitEU2ZsalFRTDBMalZV?=
 =?utf-8?B?VDZ1SUxRVUtqVkduSDRGODFpendlaVBBVlJhZy9pSUZsamxLUzE5OHRXSml4?=
 =?utf-8?B?RnQvbVVrUnQ0MWQ0REJGV0hwamc0My9hUzJPT2pId0FvQ29OUWJ2Y290VnBo?=
 =?utf-8?B?bkw5VEtsRzY5bnpld1d2WFlmNFlYNFQ5b0w5ZXoyQWlMV2hPeEo0MG5CRUdZ?=
 =?utf-8?B?UVZsZVE0WHRWbk5PdnhoUUFIWEFIWWIxbWVwNWxTWVk2bFpFRVF3N1huOThH?=
 =?utf-8?B?bks3RjZ3ZmtQRHIyQ1UyS0QyU0ZxRW9QdzQvS2ErRVFKcU9CUHFsL1JkWFc3?=
 =?utf-8?B?MW9DVTVkYk5rZUVxQjV6RTFxc1NHdDJSTmpIZU5KcUlKRUM4QXlrVWRscURY?=
 =?utf-8?B?eG5nVXBFQm0xVzRTWU5idnNYdDhUNTR4cUpHOUU1bDNpcjYxengrUzB1NVZI?=
 =?utf-8?B?MEhqZXRueHRIa3ZCSnIvL0hBa3orV2JOdmtOd3RZK0h6cG9sakkya05tSWlM?=
 =?utf-8?B?S0VINnM4OWVQeDBVMkRFY0M5N0hlODVpWEpXMVg0N0kyem8zcjQzekdGK1hM?=
 =?utf-8?B?Mlh3MGN2d0RMYTQ1bzI3b0pvelcxZ0dYWk9XN3VWLzYvNG5wYXZwQjNOY3lt?=
 =?utf-8?B?cUpmSDdoYmxvRDN5MXMweGhEUFNKajBwYy9wYmYyYlFDNFZGdWJzZ0RlbFNE?=
 =?utf-8?B?TFlqVm5zaUp0WTczemFBMHlHT2p3VVVmRUxYQjYxMXlYRCsyeHJYYVcwZjV5?=
 =?utf-8?B?ejFlcUxTcTMzbVl2UmJKbHlSMGpOakw1QkdkQWdhVnBwcFpTWC8zRE5SVEpJ?=
 =?utf-8?B?MllCL2lSdWEyMUliRDVSUkZRSDFLNHIxeTNybFNEZmRiU1haQ3BRUzhDQngx?=
 =?utf-8?B?dkI3YXpIL29Ld2toL2JKdVluTWt2aTJsNVBoaW9yaHFNS1BvM1hEMDNrL3hx?=
 =?utf-8?B?WTFEay94ZTNuWnAzbjZGZlRlTy80Nkw1VkJvdFV5NFNwemNnT01HMkZtTUtF?=
 =?utf-8?B?ajdUa202V085aStCcU9pOUJxRUVESDhPK0pOTjB4TlhiUjBKMldLQlZzRHVR?=
 =?utf-8?B?ME9BMVB1RW5ZZGpNUzREd3dSTDROZlgrMlBLYTRtTXBpVlpEZWpreUxoZTla?=
 =?utf-8?B?bFIrWU40VTN3d2IzQ1ZaMmNQM200Z0ttOHdlcHh6bnhTVjByNVlGZTRYZjdx?=
 =?utf-8?B?TkRNUWhoNEhtRWtZYmR4OVltTm1xQXdZUHF2K2Q3akJLQWR0di8yYTFhT3JX?=
 =?utf-8?B?QnkyMUE3b1Z0YmRpUm9YVzMxRm0xV1gzZUtIakV3TjI2NDFTcUhVTGRISFRH?=
 =?utf-8?B?R21BTEZRbVloUkRicno4UFZ6RUFIN0VLSWZzL3FzYmJkTDZQRmlqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86443194-d255-468b-977b-08df46692fd2
X-MS-Exchange-CrossTenant-AuthSource: AT6PR12MB174769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:16:09.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUgNYuIkNk7QObyJ8VWEtk4Nca6ujq4Ie3SHD6iObTKcE70t5tw8MoKL/4fKtoBM2i19eyNPW0naVT8cj8EFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269



On 11/19/26 8:59 AM, Mathieu Poirier wrote:
> On Wed, Nov 04, 2026 at 09:18:59PM -0800, Ben Levinsky wrote:
>> Document the AMD programmable-logic Mailbox IP used for bidirectional
>> FIFO communication between two processor-facing interfaces.
>>
>> The Mailbox is a soft IP core instantiated in programmable logic, and the
>> same SoC can carry different versions of it, so it is not a SoC block.
>> Like other PL soft IP bindings, use a single compatible that names the IP
>> core and its version, amd,pl-mailbox-2.1. "pl" distinguishes it from the
>> IPI hardware that can also act as a mailbox.
>>
>> Define the transmit and receive channel indices together with the register
>> aperture, interrupt, and interface clock. Describe the FIFO depth chosen
>> for each IP instance when the design is synthesized. It cannot be read
>> from the registers, and the driver needs it to size received messages.
> 
> "register aperture"?  What is that?


Hi Mathieu,

It's the IP's register range, i.e. the reg property.  The term doesn't
add anything, so v3 says "registers" instead, both in the binding
description and in the driver.

I also shortened the changelog.  It now only says what the IP is, why
the compatible names the IP and its version, and why the FIFO depth
needs a property.

Thanks,
Ben

> 
>>
>> Assisted-by: Claude:claude-opus-5.5
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  .../bindings/mailbox/amd,pl-mailbox-2.1.yaml  | 73 +++++++++++++++++++
>>  MAINTAINERS                                   |  6 ++
>>  2 files changed, 79 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
>> new file mode 100644
>> index 000000000000..dc16a2e1142b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/amd,pl-mailbox-2.1.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AMD Programmable Logic Mailbox IP
>> +
>> +maintainers:
>> +  - Ben Levinsky <ben.levinsky@amd.com>
>> +
>> +description: |
>> +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
>> +  between two processor-facing interfaces. Each interface writes messages to
>> +  a send FIFO and reads messages from a receive FIFO. The register aperture,
>> +  interrupt, and clock described by a node belong to one processor-facing
>> +  interface. Channel 0 represents transmit and channel 1 represents receive
>> +  for that interface.
>> +
>> +  The Mailbox is a soft IP core instantiated in programmable logic, not a
>> +  SoC block, so the compatible names the IP core and its version (2.1).
>> +  The "pl" part distinguishes it from the IPI hardware that can also be
>> +  used as a mailbox.
>> +
>> +properties:
>> +  compatible:
>> +    const: amd,pl-mailbox-2.1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  amd,pl-mailbox-depth:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 16
>> +    maximum: 8192
>> +    default: 16
>> +    description:
>> +      Depth of the send and receive FIFOs in 32-bit words. The depth is the
>> +      C_MAILBOX_DEPTH parameter chosen for each IP instance when the design
>> +      is synthesized, so instances in one design can differ, and it cannot
>> +      be read from the registers. Must match the synthesized depth.
>> +
>> +  '#mbox-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - '#mbox-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    mailbox@b2060000 {
>> +        compatible = "amd,pl-mailbox-2.1";
>> +        reg = <0xb2060000 0x10000>;
>> +        interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&pl_clk>;
>> +        amd,pl-mailbox-depth = <16>;
>> +        #mbox-cells = <1>;
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1e3f9f2751fe..3722a66b9960 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1306,6 +1306,12 @@ S:	Supported
>>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>>  F:	drivers/gpu/drm/amd/pm/
>>  
>> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
>> +M:	Ben Levinsky <ben.levinsky@amd.com>
>> +L:	linux-kernel@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
>> +
>>  AMD PSTATE DRIVER
>>  M:	Huang Rui <ray.huang@amd.com>
>>  M:	Mario Limonciello <mario.limonciello@amd.com>
>> -- 
>> 2.34.1
>>

