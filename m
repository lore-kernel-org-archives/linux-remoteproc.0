Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112033;
	b=u5cziSpJNN+XFI7o+ii4uUBMgYMsBvickvVm5tOdYFXCr32FYMi0Il+O4LV01dIjK8KZ
	 wDHSdtN8yjugMd3xvIJW1C4whoqRRnIBJaP7WbYuoW/3lF0TpUSorDvcJqfQqmA1oRPyl
	 hgIkBn2wN1FmZEJFiwwLYJPVu6n6X1lvze3wkwAeHEtrKCWaJ09/xyhzoL3Jr9E+NOQsh
	 1ebF8P0Of1gujHdW6HfaS01LeQUUopV6A1+WUgNiMGvJphBrN4dMFMe9kexSzTosv+w7q
	 gBjylv4NL0De1EXCVyYMq4Bf4JC3R1Qe+1J64j9V8xt1LwjgXAK/MgHEthN1trveoug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112033;
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
	bh=39BlrFBNyvpPZawQJIV2pEDgcfAUas5VzUFFoQl8hUg=;
	b=uvkQq9j6l2Ni4eGP+wiX9rZn+xl6EN4TyScPzAHnuIfVzMWBf2rGyAwikaIe1jA1HjWw
	 kY9Tot++YRLhbVMM/Zf51Z+Hf09/j0RsxIO4PHQbvJn8zDzpQw1DR3i52jolloPTVAorq
	 jfqWjx5VZlSJ3uNaZp1/vQ19D5RYEnAG+9PPiQHYy5hWDoUrKob8jGcI0bohVYb3K7SLn
	 M4gjwHyAsv9+aCdWOqh58baTcDk83J4LOSH+EwK+x7hl/uh1aJEehO2VGYpJpcAHvqWeA
	 O5pQiggHgXZyrfSk9E9VhUf9yYKVXuYTWPpOhpf4Ydl8+jXrIXWn76tLUcd61n//k+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W+dTStbW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.40
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011040.outbound.protection.outlook.com [52.101.57.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B5606A320;
	Thu, 19 Nov 2026 18:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661B5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=W+dTStbW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfpWuLn14Jco+el9YyRqNZeHtRTwjVv7uEd2ZDjiKu7SNHg7xHhyhq4e4ZiDdhOyImWr+ef6eQuvg+1lR1426p4Km6qjuB78aVrZHoT2PM/m/G6V10mH4M6aD5LFaZygYvmF2xk7Pac455MWLUfNx4CRUBPz5DhO+/Uly6BRdZc3ffRhUwbWT0WjUeniPvaZKrsvP3JK318JM09Bcvhp/IrWeEWzCJgYe4t7mvFlrpEoJjPllZZZ+RVXa02tDSudMztDvP+EccjnORcPHKCYl4ijAEFZN78rm540jpHPBq/mQDg5za/GQmDV3VeBtjxmlTTxIEq89hHv8sgkkbVFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39BlrFBNyvpPZawQJIV2pEDgcfAUas5VzUFFoQl8hUg=;
 b=iSEqFAEGP9v5OVEpVm+Z96KVSOYrIAi1hPER1sMtrDiKEcmqN0mUx9pLGijQb8spLax1S75Sg46xpm3iDB0Vs511DE6oOPSDvS06tzJLo67k0IVDrisdZkwqYSz47aM6jY5t18scRn5VJrUiif3nsvd2uU1gUkCVZuf1ktF5a2t096wpcd1/1c6IGRSQGGnhjqnkiYi7rrRcipOqAXtXgGxcPvvDTWY8uTxniYixbwz+5/f5ph0vKGUg1g5ZHmh/QHFDO7/aMQ2pfiKdapqizRA+TtNLrZ93PezrK+E2KrzJvgAo0jO2KqfHfOlcaRW3d2zzohQTOVAJkS+hQETYFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39BlrFBNyvpPZawQJIV2pEDgcfAUas5VzUFFoQl8hUg=;
 b=W+dTStbWi1vFM+poIPq50dE8HtEYqrHVkINoO1jT0qnwMYuJmCuFp/T81+bTBZr7pdRKuToygWioGgyf5eoQc9ajYFGTC9jGLrMoO5qs9bGd3R2AyUnjJ+uIb3aVDI1Rlhn7ryvDl8+0ukSfjihdWwGgDyDH7E9r9Oasjf32sg4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 (2603:10b6:170:116::6) by LY0PR12MB257519.namprd12.prod.outlook.com
 (2603:10b6:404:22b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 18:13:49 +0000
Received: from AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44]) by AT6PR12MB174769.namprd12.prod.outlook.com
 ([fe80::3903:e1e2:f33f:ed44%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:13:48 +0000
Message-ID: <15e3c4fd-7535-4a6c-b827-f6d212427dd7@amd.com>
Date: Thu, 19 Nov 2026 10:13:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO
 direction after PL reconfig
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
 tanmay.shah@amd.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
 <20261105051902.1646651-3-ben.levinsky@amd.com> <av8niGRg4Er7YP8K@p14s>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <av8niGRg4Er7YP8K@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::33) To AT6PR12MB174769.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AT6PR12MB174769:EE_|LY0PR12MB257519:EE_
X-MS-Office365-Filtering-Correlation-Id: efd4d61f-86b7-4169-c397-08df4668db6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261022075727099003|261021123027099003|10067099003|5023799004|56012099006|4143699003|11063799006|261028144727099003|261021121427099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Mrp9xwhom5vbVKZPYrN5+tUlibAz7k1tWQeKTxaS46HskuqYRgdXvdIauy3YNyGJ7QVJZwbV3BfsCCXpugqwuV5thzFIMsD2pu6e7HbokOSUfawNBJD3pgSpIIbH8KnPdsB+xQggZ8nbgrgpp88Y/DX8TXTQQWMVSQIfdMvImHrAgr3uYoHr1KG3rHz9GH8RAllvmNVqJ2GwFcfq3KfSeTmH/PMTQmpXa5XS4HoPAg2p0DkYp/M5bLFBfMIhyyyu6xKCm7QDRO1yu+u+Pq3MaqLEmJ6SupmHHy36sAJsA8mGCgAXAH+TfCYXIqF+KDJ3b0SZWylpuoRhYLzwtIPx8nrOMY3O2T9C4QY3yH/76Q2eEIwP6rro3Ey65GaQ1JumyrhPNENtIebXOuaiIc+Wy0HGncmbjEd3nOFAwu4C/lYFBwB9KjysJXYdRGUW7rfSsobYFPlAyh9m2ambWN6or3ZGX0vM1VWiyJQ/WaJHfkK4uyKvKxWu/jZGGfq2NFmB8y2rN2HwWzsXiBtREkjrRit1jFDURmO1I/VouSgWNYCvMBBScS1wY2vhGGKErk++H3KCvEJwfAGF3xB18l9w1WPbokEVyYA7cXd2IZ02r3s1VQ8HffhgOcGAcQxcbNqOtR60TzlsD8gqCdG5T+YG3sm7j+QWtZDw109Eq1IPrCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT6PR12MB174769.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261022075727099003)(261021123027099003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(261028144727099003)(261021121427099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGRqNVlVRU1ybjN1QWw2MVFiWHI1N2RUMjR5VlY2djlncm1BdVdmZzIvYTVj?=
 =?utf-8?B?ZzlVaU13R1F0c09NYzZqMHlzUCtmd0dGaVZDQ3E3QkNtN2VibTMrdG10cjY3?=
 =?utf-8?B?NzlVdTJJejIrTW9mUDRKMjBCdFpPN2dqSjFPMmVOajRsUEE1VFlOcXFBZDR2?=
 =?utf-8?B?djRiQVVjbUFHem1NbCt0Wml5L29weUsyVURDM1N2dlduVkM3SUkzdHVSZXFD?=
 =?utf-8?B?c2N6TjJub3QxNnB3blFMZnQ2czFCemRscUlIQklNQm8zaTR6cy82aXhOcFFo?=
 =?utf-8?B?L2tkMXlDdnNXM29mOTQ3aHNYYVNvQlJaZktURlZ2c1U0d2dpMHRZVWI4cFlw?=
 =?utf-8?B?Q2RDeWVQUTFFQ1p3Z0MwL0RJVXZqSEJrWTNPQ3M1VDh2enlEK3gxMWNySDdx?=
 =?utf-8?B?cEIwUXR5T0xsNzFmNGV5eEhLeXQvVlBXMTc1N2VNMFBxQWJQdEx1c01Sb0JG?=
 =?utf-8?B?dmJHTXpLakgrVFRVMXZXMmRNc1NsS1ZYNFlBRndXcEFCVXFUZW1DUUprSEdV?=
 =?utf-8?B?M2h0YVZOcWFyOW1vOFdFMktTSjFmbWw0ckw5Qi8vdjBmanJjNXpKWlRac3o2?=
 =?utf-8?B?WjB2ZkcrNk0wNnBIcHMweDNCQlFHSEhLWXlpTFd4VUJ1K3JDY2JNeXBqRSs2?=
 =?utf-8?B?TTJCaUg5RDNPL2NveHErUXVyR0I2bXByOHJhVjhiVGJ0L0pRN1ZObHp3bno1?=
 =?utf-8?B?U2IzSVlNOGtFQ0hhK2o0bEZGRUp5MXZMT3ZqWVQxWlRKOEZXS3I1OTF2OVJO?=
 =?utf-8?B?R1pVdVo3ZWZCV0xyOWU1Q0lwUmF4WENKM3hKNFVMVForZ0hUTFUwTDdkYTNK?=
 =?utf-8?B?TTNtS0d3VUJRejhRVXdjcmlrc2hDRmpSdy9reWNxVUcxL2JVaHNvQmgyZ2lM?=
 =?utf-8?B?bXdDbXZQVGdKT3dlVk9paUxUNEc0d29IM2w2Zm1ETmtHaUd6UFUrOUpsVDdQ?=
 =?utf-8?B?aWNQMEk2NVJ3N3NSS0xVZi9lVUZkNkFFUE1FL25uOTcyRmlENmk0akxTYWRP?=
 =?utf-8?B?eVZtdXRpb291S0lrdW93OWRtek1aUTZwTkxFbEFWU2JXL0ZVTXdJSmtaSUs3?=
 =?utf-8?B?d29LbVRWb25acmt3YlVNTWhtZS9EKzhuUXVhanRiamdkdjVpdmVQNXZsVVR1?=
 =?utf-8?B?aytuSTJlUVFJUk8xY25MUlBjYStId1plbEtZbjVHeGd0NlRJZWM4UWV4OVhi?=
 =?utf-8?B?R0pVS1pSdzNoL0E2OVJZZ2NJZUtmNlJUL3V4UklUeWRLT01BV0h3VGVnTjY1?=
 =?utf-8?B?SjVzbHhFQmErZTA2ODBLdUl1ODVub1pRQ1gwN3BBV05zT3EwRk5kNFJVWVk4?=
 =?utf-8?B?Y1kzaTFYSGlxMGlKc1hEOHU0VlVzLytObVRUOVZvSlNOcGJWL083YlA4WDRu?=
 =?utf-8?B?QkZBanhYdVZYZDJ6azQ3dUt0VTFOQW1iSFRNQjk0c0lQS2x4cm5HMUs0cGhx?=
 =?utf-8?B?bjNGaHAvTnVaZUpjRVRVb2pVYSswV2xBTW1KaGVsdWZhNTc3cDJFbHlKbXA5?=
 =?utf-8?B?YnNheUdyb21YNFhmQ2xyeVBrZEZsRzB4K2RoRmZ2eHZqV0RYeHB4NCtlSjZH?=
 =?utf-8?B?WEJLR1Rrck5Nck0wM3pYSTF0TDJzOEJQNVllRmtyNTRLK3BNN0xtNk84UHpq?=
 =?utf-8?B?ZE9idjI4NU5tZndsUG13cUhwZmJNRUhSMHE5cmVMeDdWa3YwcmpuQjN1by9O?=
 =?utf-8?B?M1JUYlJQaURuN1diRWNJVG5HQ3QvWWppWTE5eHhDcjlieWJ3a294eHFtRlgr?=
 =?utf-8?B?L3A5TnB6bWJ5QXdUYm9zb21RVi9mZEVpTXdrT2crLzJVWmFlR2xBMnJTSUFZ?=
 =?utf-8?B?S1VBQzNZUlNsdm5VSGVEcU0rZ1U4WStqSURUMEpIUEpGUDA2bmdOeEJJQzhq?=
 =?utf-8?B?V2tOL3pRekVBVytKRG5iUVdleWtQeGlYdlVEM1RIS1VNM01TWkpjbndld2xo?=
 =?utf-8?B?cEJ3RldVU0pRVGpqa1BwcytybVo1bHZOQVpvM2JBa3JKemxnd1BuQXdwUmVw?=
 =?utf-8?B?R0FoZzZOZWxVZTNnQlNpaThTTG9OMHQ3NlUrK0xWeVVJQXFiU3A0Q2UyaGZD?=
 =?utf-8?B?SmQ5SUJaSDh6NmVydW12UjQ4bVdQcGpoaFlWUUJxaFhuV1hUTGZDa2FIVWdn?=
 =?utf-8?B?TVR0MkIyeVlsTEV6VzkvUkl6UDdOZ0QrL1c4RUhhVDV3MFFHTnBNQnQwU2Y0?=
 =?utf-8?B?ZFozblVxK0lNUGpPcU1LNmFKNDVzTlVVUDJFbWdHcktkcVJUTTloOUNFdlk5?=
 =?utf-8?B?R3prb1VIbGs3UTNJRE5VSk54dXFYZmZQSk9udXpUdHFZckFOc2pRamE2QzU1?=
 =?utf-8?B?QUVFRTh0UGJOVHZTQ1RqcFp0QlN1TlFhU1VqY05XajA1VWFReFpjUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd4d61f-86b7-4169-c397-08df4668db6f
X-MS-Exchange-CrossTenant-AuthSource: AT6PR12MB174769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 18:13:48.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prnjUccj4crnfIzDW3ADnFv3POmsRJ2ymP+jPl15jXEESygwKn7a6k/4p1mv31i8CVJYscKBb+YCH5mqAs0U4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB257519



On 11/19/26 8:44 AM, Mathieu Poirier wrote:
> On Wed, Nov 04, 2026 at 09:18:58PM -0800, Ben Levinsky wrote:
>> Partial reconfiguration of the programmable logic restores the AXI GPIO
>> that drives the soft-core reset to its hardware default direction, but
>> gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
>> then only updates the data register, so the processor never sees a
>> reset transition: remoteproc reports it as running while the newly
>> loaded firmware never starts.
>>
> 
> Where does the "partial reconfiguration of the programmable logic" happens?
> What makes it partial?  Shouldn't that be fixed instead?

Hi Mathieu,

"Partial" was the wrong word.  The PL is loaded through the FPGA manager
when the device tree overlay for the design is applied, and the same
overlay adds the AXI GPIO, mailbox and remoteproc nodes.

In that flow the AXI GPIO driver probes after the PL has been loaded and
programs the line direction from the device tree, so gpiolib and the
hardware agree.  The problem I described only happens if the PL is
reloaded while the overlay is still applied, behind the back of every
driver for the IP in the PL.  You're right, that is what needs fixing,
not this driver.

I checked this on hardware without this patch: with the PL loaded
before the devices are created, start and stop work as expected over
repeated cycles.

>  
>> Use gpiod_direction_output() for every reset transition so the output
>> direction is re-established, and assert reset briefly before releasing
>> it so each start produces a clean reset pulse after the firmware has
>> been loaded.
>>
>> Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
>> Assisted-by: Claude:claude-opus-5.5
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>  drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
>> index 6cf33c7b7e64..da621f62f7df 100644
>> --- a/drivers/remoteproc/amd_mbv_bram_rproc.c
>> +++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
>> @@ -16,6 +16,7 @@
>>   */
>>  
>>  #include <linux/clk.h>
>> +#include <linux/delay.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/gpio/consumer.h>
>>  #include <linux/module.h>
>> @@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> +	/*
>> +	 * Partial reconfiguration restores the PL GPIO hardware defaults but
>> +	 * leaves gpiolib's cached direction unchanged. Re-establish the output
>> +	 * direction and generate a reset pulse after firmware has been loaded.
>> +	 * gpiod_set_value_cansleep() is insufficient here because it changes the
>> +	 * value without restoring an output direction lost during DFX.
>> +	 */
>> +	ret = gpiod_direction_output(priv->reset, 1);
>> +	if (ret) {
>> +		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>> +		clk_disable_unprepare(priv->clk);
>> +		return ret;
>> +	}
> 
> Why is this needed now rather than when this driver was introduced?

It isn't needed, for the reason above.

> 
>> +	/* Hold reset asserted long enough to provide a clean reset pulse. */
>> +	usleep_range(10, 20);
>> +
> 
> I really don't like random wait times, please find another way like polling the
> GPIO line for an expected value.  I also thougth the GPIO subsystem was already
> dealing with de-bouncing.  And the question from above still stands, i.e what
> changed to required sleeping that wasn't there when this driver was first
> submitted?

Nothing changed.  Reset is asserted when the GPIO is requested at probe
time and again in stop(), so start() doesn't need to generate a pulse
of its own.

I'll drop this patch in v3.

Thanks,
Ben

> 
>>  	/* Deassert reset and let the processor run. */
>> -	ret = gpiod_set_value_cansleep(priv->reset, 0);
>> +	ret = gpiod_direction_output(priv->reset, 0);
>>  	if (ret) {
>>  		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
>>  		clk_disable_unprepare(priv->clk);
>> @@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
>>  	struct amd_bram_rproc *priv = rproc->priv;
>>  	int ret;
>>  
>> -	/* Assert reset before disabling the processor clock. */
>> -	ret = gpiod_set_value_cansleep(priv->reset, 1);
>> +	/* Restore the output direction after DFX and assert reset. */
>> +	ret = gpiod_direction_output(priv->reset, 1);
>>  	if (ret) {
>>  		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
>>  		return ret;
>> -- 
>> 2.34.1
>>
> 

