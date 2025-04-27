Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3629A9;
	Sun, 27 Apr 2025 00:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745712751; cv=fail; b=Dpel2OAlOZa41m6XreC819Zt4044IbJG8kU8WE5ORR8OPTpSPXhuXHB57Tw+QSHTUum91GBmqe2l3tOxGouH8fN9k4WjZygR2EUNjBjz7xcNdx2KQg5RHOJ/jlu7A/vNYQGvAgvy2HojjgGsq/usnRGaWjuju73NMml0G/ToDkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745712751; c=relaxed/simple;
	bh=QHEBm1mgcLVX21tvsqJPDugqc5YEarOwzUNVsxDYVAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hFPv2YQUKrQWnwwaM1D396yiZ8WCJiFtQCHkwno7L1IbtQ9/a/QGeaDAurd9rGc1PalltTajNdj2gaAOjmSkBwH4Zi5Su5/b5EZYmywqv2xp3qVsSNljk5WSKladlM2yiwQUwerm2Gi2i0GdkM8K/TYKfp3/1DkQ8eMt855mVuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QN6uSM013212;
	Sun, 27 Apr 2025 00:11:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq192u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 00:11:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6pRhIvzgpmGkXWSwsOocQ+24XeyAoj0e3Qhe4uPmSuT1KHaaA/CnHMy7K3Ec5usd9sElJfVw9oPhdDeoZYsK3/A+p3sC7tbnWHHSliEPEoFstambqCuzo4v8Nqtm0luBqwdawHnYzAoUGbzPdKPjNYaEVxPWy59aiMV2YpVj2fRd0Rcv5mhYZLnTKnmpjQRard2Szqr+MSqj8CSYxmFe59Zz5fQO3UU4NXsuiluDU5UC4DudmEmUGXODCrfZ3D1Xh76jzibzeNaYQxYZ3/ixiktiX+Qy/R22Yxypnv81v6UCsteYlErAKlyZ1x8uonSRhw+sGhfHbTD14NgZ/aIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6ZFY91hGHc/samlPTzy96WMc3mXx3lZrtRBO4dMZtc=;
 b=OhT5MVc/OYqzCiuZYtXNp7pQ01vBBZ35NkCvW/Nz24kSE56FJy5U3iz3xqI4lFBnVTcG0MCr5EPByUzcdIOgEJ+AQSIi3u2tWyRN+asWgH6zE6E5vhlfS28sWRyLZjIo3uryhplhSmET8vXh881VgVxalwycbCZqhbr3jCbMxgLYMV4Z5kYOBQPAE1lFEF24Ojxe/RcrS9wcAl5IUGC9hMwJpmMdpS9b9Al1MVDy/4+z1DxKsiEXbh1d9/y+aZWiWzXkgyeai8cJOaf7oxs5XNq/y2pMjGP1cQr5KHk9QL1zQjSaPwOA6t6NxkSaQrIo0w+Yj3bZ7Iqniv8ct5ktVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 00:11:51 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 00:11:50 +0000
Message-ID: <f6e79b0e-5e0e-47fa-b2ac-fcefda19efa2@windriver.com>
Date: Sun, 27 Apr 2025 08:11:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, andersson@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com>
 <20250426131804.GA13806@nxa18884-linux>
 <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
 <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1d92a7-d5e6-429c-e3d7-08dd85201ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0xzd05wSjBuSlpLUDRNc1BMMCtEVWNCdDRtcGZYZ3ptRVZBakNEeTRVaWRB?=
 =?utf-8?B?WGNZdVgyZEpRTlRmYkcyUFlGckJZaXBnYk1TV3h2VEVJaGI4aWw5azdlMmpw?=
 =?utf-8?B?amdOZGlDV2kxQSsrQUc2aUhFSGhpVkM2UUZwTDJxMFNYWDB6RFF0Z3dHb1RQ?=
 =?utf-8?B?bG5iLzFkcDhQWlplMG1MVU1pekp4YlBzS0pmb2JVdUZYWlNZQzVvNTJOSzVP?=
 =?utf-8?B?SlNySzZIZnNDSlM5aFIxRTNmWW9xU01GcVNHUWV2cHI2LzZHY0YzeExISUp0?=
 =?utf-8?B?OHJ2Ly8vRC9tS0tCVWI5eXM1SVU4RU5TMjhUTFFmYUtFaGYwTGhiWmFpRmtG?=
 =?utf-8?B?cWk3RTJTdXM3MXZJQjg1N0w4NlhUamwyYkhEOFpZNmwzQ2ZZVGVUQXI4MFZK?=
 =?utf-8?B?UFNvQnEwdXlyRFdtUVphcS95anhnOXlTbTJhbGRmMU1rdkI4RXRQZG5DR3Av?=
 =?utf-8?B?TXp2QXJ3VE5CVlltVGVtZ3JqbG0zdVcrcm8vWXhCbHgyT2lJV0krRGl1VG14?=
 =?utf-8?B?RWJaa1RZZm9NK0lRY2Z5bVlXZmdlNmpSZEE0KzNoR2ZWN3Vxdy8wNndYU3pj?=
 =?utf-8?B?b3BDYXN5RUVuTlh5c3g2UmVaNkJDNk1ucDhYcGw1ZzVnZFdEZEZrMmVtOFlQ?=
 =?utf-8?B?amJ3Z24xYU10T01WZjhwdFVGNER3QkZiL29ZR1U3QVF3VUxMWjFQNEVrS3Av?=
 =?utf-8?B?Ym5XWnI4SkxSWHI0eFJUNXk5WGhNdnpjWEFZL2JCWTIrMGNqaVJRSVMyN05R?=
 =?utf-8?B?NGVKN2FKakRkUGxKd0NwWWx1RXNNcUV0UkJuTkRHZGNZK3YzMDlMY2JMbW15?=
 =?utf-8?B?SndSWElSanVOQnhDTFB0UFJDTkxxNmZFUXhBU2JQRWJSYUJETHQybVlFWW9T?=
 =?utf-8?B?aFdCbW5WZURXUjBHUXFhT1o2SUEwNUIxK05CR3FyUVdMMmNjT0MvVVBxSXMz?=
 =?utf-8?B?MERRZGViY3RZQzhQdVB2OUhlVXBUYklqczQ0d25NaW51SWdhamlhcTEreEpk?=
 =?utf-8?B?UnovVytFRXVBUmFLdFpSS0xwbExUK3JaUzJJNXVNYzNGNHh4ZU54UmY2emRm?=
 =?utf-8?B?TXpFNEVqcjlIalJxUlBRbkZudG9TR0dOaWtvL2QxUG02YjROUkdrcmhpdmhC?=
 =?utf-8?B?N0J2eEM0QTNoNWxNZWxEdjlkQ1FrRjg4SjNnQVNSQUUwZ3ZNUjRXMUViQ2Vw?=
 =?utf-8?B?SDZoMDd2TEw4eWo5a3QrNWJDSTJ2WVVjeW9RTFNRa2NheEwrbEFkMFdqU0Za?=
 =?utf-8?B?SGMvZmxERnVyK3Rtc0hpRyt2UGZvZ2NHaUJJMVpDSlZGbDU2dnIvenA5L0dm?=
 =?utf-8?B?d0RmaW1aQks0bEh4SFRsMVVZcEpjWjBPRU16V2ZmbnFUdUNWQ2NwTW1LVnhF?=
 =?utf-8?B?UGpTWU9rbmlPME4yNmN5MTdPSHl2OGxpak8zZjgwZGJubnVyakFuN2NIQXBl?=
 =?utf-8?B?Z204VFpuT1J5amRYdUI3UG9IS2FMSU4vc3Q0VmhvZFZPM3Y2UGk1RStYNFAz?=
 =?utf-8?B?cFMzTHMvb1pBV0dLVG1ZdDdXWFFFdUpYRzFoalZWVHF4NyttT2dLVDNYT0Ew?=
 =?utf-8?B?VmRPNmtGekR4Wm5kQ3B5NWZaRFBsRDFzZ1Q5bVdaLzI5SXFoSjdyaXFnQzE0?=
 =?utf-8?B?YWZzVVdKWm51bGV3OExKMU05Y0RiSU9YeGJHcllENElJVmhkN0huYlZoQ3Zq?=
 =?utf-8?B?bWNzWmswbDFDRU5yZUFqR0pvREFzaHQ3Tnk1ZkV2VkZjNmpYbWQ1VG91cjVx?=
 =?utf-8?B?NDNSN1FxdkVQdkhGN0J5Y0Ntdzc1M013ankvVlQyU1lIaVZ0alhYQVBjWXZa?=
 =?utf-8?B?S29DTEw4VFVsYWtBTTFDUHlDOGtlWGtjR2tzVVF2dWJUUXIwTkZyaVFlSVc1?=
 =?utf-8?B?bWFkUnZ0aWt3NDM1dGhGUzQxYmxaTWpvc3lqVUJvL1UrVXl0N2VqQ1JkM1Bt?=
 =?utf-8?Q?ZQSeYGiHUxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVFxa3FjcG1YQzFncCs1cTRsUFVPMWRveGJNOTcrS3FtaUZPVGhtM3VTQWQy?=
 =?utf-8?B?aWJHV2dFcUFndXZGa3VXL0R4enE2aGlDNG9QRkRsdnRNTTZENlF3a2tIUlYw?=
 =?utf-8?B?VEhNdVZqZmt0WFZEUUlKNzlTRzM0c0g2QlRLc0NNQ21rTWcvT0JiUnF0UlJW?=
 =?utf-8?B?ZnZtcXZ6ZDBPRXluZllZOXQ1NkUxOERTQzJWWWxaU1pkUC8wT1FVZ01VaG1h?=
 =?utf-8?B?eWc3SUUrakhQSVRKQVVTMHhJVm5mRHVBZnRRSkVwUHh3UFZBSDJJcHhiZmxJ?=
 =?utf-8?B?b1R4b3dRc3NzU3IrQ2ZYNElmdzd4QmVHMEg5NldPYjhQRUhsUDVWa3BPMU5j?=
 =?utf-8?B?QTczTkY2bzZZdjlhRGEzWDRLQlJWK2pvMEhKbVRhcUFiUXVuNWNDd256YVo1?=
 =?utf-8?B?UktSWXUyZWFxSk9wTHlmc3E5QmNsaDBDa2hqZzVMYkhsRTJBMkM2cWtCWTV6?=
 =?utf-8?B?WXIxWTBQSUZLVVFXZmI2c3MyL1NaTVJYQi9qRHppYk0vZ3FTeXpqQXY3bGF6?=
 =?utf-8?B?QjVOOG5NNWNKcEtRUTVrWHZuRmozbFdZczA4c0hqZmtRU0VWcUdmUlhEQm1H?=
 =?utf-8?B?YnRVeXFMZ3p6TFQvWHEyTWUvUkZSdmpGRjk2Rm5qeHppTTFFMEFHVmJwLzVG?=
 =?utf-8?B?RWc2QU9BdCtwKzYza0FpeVRGdHVYKzMwRGdNZ1RxT1dpTmFCS2Q5RTl3RlNT?=
 =?utf-8?B?YmhMamhON0NyUjZFcDJmQ01uRXpEQkUvMUttdDJDZjBpa0JTSXlOWitqb09T?=
 =?utf-8?B?UmpxQXRZdUdsV3ZDdWJrNWFPenNzSDBhQzZQNGlNL0tmMDY3Y1RqUTlHKzhK?=
 =?utf-8?B?TFZXZ2UzOUQ0S3RZS3lDWU9IcUJ5ZmJlc21BUUZwRzdYSFBKRWhhUkNrQlpH?=
 =?utf-8?B?L1VCVnhXa3o1S1hVc0xrYUR6QkFXZ1RFbmg3UzhWLzBXUWVLUkNKTUxVcDNE?=
 =?utf-8?B?dStzWld0aFQ5aElPZjVpSWdYR2RYRlRiYlFIamxjbmxRK0F5TFdnYnlySVZr?=
 =?utf-8?B?NEpacDFFUjR3MU1ZU24rVmVLVExYMjk1TmNkLzEzMDRjZDg3Q2RTUVpVUFBP?=
 =?utf-8?B?emZyT294ejBZdm5HWHR4V2I0emUxNkJaQ2hXTUtQWkJ5Z09BNW8vZVYzYlhp?=
 =?utf-8?B?blZReWJYckhvSVdMVUwxUlMxYXJwYysvRGJHcjF5OGVDLzNDY0JQaTNsaG5Q?=
 =?utf-8?B?RUNRUlNoMG9EYWdiVXVkdE5Nd09TSnlOaVB0dWlkT2tHcTRmMTJrVTdJZk1Z?=
 =?utf-8?B?UDk2cmxCQ1Q2N01ldVVsUkZBNUhpdXZhQmlhUGY4cTdhZ014SXU4dmtSemN2?=
 =?utf-8?B?TldhUCtGV05nNUZGLzRkR1ZhTmJscWlOUXRWM0M1M3BjaFZpRXE5a0N3b3NK?=
 =?utf-8?B?dllvTnd6VDNUNnJ0dWkvR2E2WE03ejZ4dzhkbEZmejNyZFp6NVR2Nlg5OFBu?=
 =?utf-8?B?MjZpQlRVZUZJNlEwYThZK1dJUnhHbEo1NWVUS2FYd0FuWnk4TnNQZWFQUnVH?=
 =?utf-8?B?UDNoQ2VmOGdvRUR3UGluNjF2cnFrdGJ1Mzc5dW0veDlaSk5RekJEZE1Od0dL?=
 =?utf-8?B?MmJvM2RnMFhUWkROYmgyZEd3b0IxR2ZyU05qN0x1SWN6T29UNDY3QU83L25W?=
 =?utf-8?B?bUtldEVpY0FmOFZsTS9EZituUXMwTDBCQ1ByUUU4OTRHeDUzd0RaOTVpaVpD?=
 =?utf-8?B?Y3h1eFVnNEF5cklDUllnUi9GTk16OU9CSjhCQ2ZEU0VpQUc3R2pIT3pyaGV3?=
 =?utf-8?B?emszeTlTZ3RSZEt2Z0JpMVpGamNGVTVpVXh2QUtIVSswbUswbG5WZnBVZzVX?=
 =?utf-8?B?NE9qaXVSWjlSUkR6Ti82MVpEc1VXaXZjTTk3OVEzRUk5aEZxRi9sV1UwNm0x?=
 =?utf-8?B?V25BMTMvTHNwOXpQck9BTldzUzZlclBmTkZpRWtpYmU3aVJxY1NjeVVRZlVB?=
 =?utf-8?B?aWFUSXpVaktVamcvdDB3dmp3UXhJOXlzME9LMGRjL1BZNUJOR09EOXNZM0sx?=
 =?utf-8?B?RWc2ZllXQmhUd0VKWFNCUVZ6RWl5MXp2WlRiRXZWMXM4anNFMmVlZWs2eFcz?=
 =?utf-8?B?ZE12UlZyMWloM052M21JTFExN3ZYMDRJb1hDRldGU3A4WmtZUnlWd2k4Qkc1?=
 =?utf-8?B?TTVzcWMrSncrdkcxTldpVlVkMENBVFM2djQ5d0dmREJwMHRUK2dMOGsvSWVr?=
 =?utf-8?B?cXRyOWhCL3JhQzZqdW9rYm1SRUlkbXQ3QVpHRFZsUkczUFd6OTZ4K25lZUxz?=
 =?utf-8?B?MFdtYVkvMnViVm95Q051ZjJrbmxRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1d92a7-d5e6-429c-e3d7-08dd85201ba8
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 00:11:50.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqd3W6mv6KPGpH8VwDah8rqCo1xt8iVBEpz6Pb+bK72eUTKyCG7+QpTsaU5IXPIaVpzIWVdBFNRMyjApENb+/4QvNce2BRCzzmrSsXRGEzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680d7649 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=z-JVS7_KbgrPf22LTiAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e-_xZktUHZZED2qgn2cKgeLwhr1A-Zrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDE3MSBTYWx0ZWRfX1Pou+hhKL+nG u/PNyiQRLnqVZyJva/3AsY2n/w6rTXBKRccZVM8M8dKHRRm2CpTVj1jzWtpbtjDENOgWU1Hd2Bm KOBpUdFEURkVIk+kE9A3Rjj6M8QWgJajIySEH6xo1YGnaPNQaYH+ONsGVdTwkffJ0S/WMCwapaQ
 h95cgC4H4YRpO6yVYWa/iv7NLFqfnSf3CrDIVgVQP5yvKKlmwL+9iGk6ewVbQ/6hwAucw57DSKd HDd9KBScy4u+FH47ULoPUE3c9HOqiV5SKniaoFNU9cVXG26m2W9V91BADy3yDXCzIH3UVvldjo5 fFkWjYAeTC2ZMPi1noJM2aapwswk8IdL04g3L6Sk41d3qphTzcyXUPOJ9eCDxDJpL0KhH+3zn+4
 ozNf1zPgo1B2UFyhNOjREil/lk3Rv1x+jd7xNazQpRVrdAuXU39DH+9fPmdV2kkZxjsjq9xw
X-Proofpoint-GUID: e-_xZktUHZZED2qgn2cKgeLwhr1A-Zrc
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260171


On 4/27/25 04:14, Mathieu Poirier wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sat, 26 Apr 2025 at 07:46, xiaolei wang <xiaolei.wang@windriver.com> wrote:
>>
>> On 4/26/25 21:18, Peng Fan wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
>>>> When rproc->state = RPROC_DETACHED and rproc_attach() is used
>>>> to attach to the remote processor, if rproc_handle_resources()
>>>> returns a failure, the resources allocated by rproc_prepare_device()
>>>> should be released, otherwise the following memory leak will occur.
>>>>
>>>> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
>>>> memory allocated in imx_rproc_prepare().
>>>>
>>>> unreferenced object 0xffff0000861c5d00 (size 128):
>>>> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
>>>> hex dump (first 32 bytes):
>>>> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
>>>> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
>>>> backtrace:
>>>> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
>>>> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
>>>> [<00000000521c0345>] kmalloc_trace+0x40/0x158
>>>> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
>>>> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
>>>> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
>>>> [<00000000e7e994ac>] rproc_add+0x124/0x17c
>>>> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
>>>> [<00000000efc298a1>] platform_probe+0x68/0xd8
>>>> [<00000000110be6fe>] really_probe+0x110/0x27c
>>>> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
>>>> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
>>>> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
>>>> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
>>>> [<00000000db3eb243>] __device_attach+0xfc/0x18c
>>>> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
>>>>
>>> Fix Tag?
>> I will add it
>>
>>>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>>>> ---
>>>> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
>>>> 1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>>> index 74299af1d7f1..c489bd15ee91 100644
>>>> --- a/drivers/remoteproc/imx_rproc.c
>>>> +++ b/drivers/remoteproc/imx_rproc.c
>>>> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>>>         return  0;
>>>> }
>>>>
>>>> +static int imx_rproc_unprepare(struct rproc *rproc)
>>>> +{
>>>> +      struct rproc_mem_entry *entry, *tmp;
>>>> +
>>>> +      rproc_coredump_cleanup(rproc);
>>>> +      /* clean up carveout allocations */
>>>> +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
>>>> +              list_del(&entry->node);
>>>> +              kfree(entry);
>>>> +      }
>>>> +      return  0;
>>> Could "rproc_resource_cleanup(rproc);" be used here?
>> Thanks for your suggestion, I will try it
> Before sending another revision, please detail the steps needed to
> reproduce this problem.

Hi

When I was using the imx95 board, I found that attach remote

core failed during the startup process, and then I found many memory

leak prompts. The following may be some useful log information:


[    0.184904] remoteproc remoteproc0: neutron-rproc is available
[    3.009728] remoteproc remoteproc1: imx-rproc is available
[    3.016002] remoteproc remoteproc1: attaching to imx-rproc
[    3.026761] remoteproc remoteproc1: carveout rsc has non zero 
reserved bytes
[    3.039148] remoteproc remoteproc1: Failed to process resources: -22
[    3.057878] remoteproc remoteproc1: releasing imx-rproc

thanks

xiaolei

>
>> thanks
>>
>> xiaolei
>>
>>> Regards,
>>> Peng
