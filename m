Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE453C3C7;
	Thu, 15 Oct 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074582; cv=fail; b=S0z5uGWx83MagBpApTD7BbIjzBu7dIwW+1nR3J6cNXzEhyBV+wniINbqFd1GJavR8L4ukGU5rnKfuOlQWseRc4EHIaGcycxHmX6N2bRWFCT6G+rZ3eNzkredCvIj/D+pvAShHy0b9/X929jDgJKQZTMpXy5Ehd1D1i0gJ5Usr50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074582; c=relaxed/simple;
	bh=/ArZ3NRV1ANqQc1lwBiXNyeAeRBwEYCAX/YZ4RI4Mno=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZYmcbFTJtzQD6V7xRani/3oHRGXlXoY6ddWDc81JvgVYagalBCvODATLTa3oGd2LEUACXbD5hvdsrO7ojOq7oIfHPIFxqE/DUykWN7mEeXRks43X6av7ZFmRz0Cchko3LgoZ/FagjscJa+T8ElUyxjGaIeDdv+rDhbIkQ1j63dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jpdBdLoq; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jpdBdLoq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxQ2yaKcFBbmbaLyoVjW9j+LpTy61tfGoIKjGZDKarHwRnRwD6NOYlHqUrY2fnRJqppDSILm8vm2bxzmTly/T9D03fyyzOIocZZ9XOQ6uLFEn1878u8Am/Nfn2Tp9mQDjAXp1VWVLoaaUsdjREUSqvUrc7NAKr/dcg4sUuXuTfnFw975F0IE2vDQWf1k56PtUC5vz8gcbJ/is07beNEes63zRrLexvTl/lbOkkhAdGELjZhTB8JGnprgzGiXHXEMMCGMAIsX3nNZF+CfS9oQr2x+sM3kUt5UxhC2QTk6sUaarPT6/craubFmBu7zNMKUH4S2TxWX6uenX7GJ8TiHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7pc6QFLyVmArACgdho+4Eix+qscTwLyg9QsmeV5C0M=;
 b=d+jbacUwq1BeaMB0qeGFgXYhogf0oloc+1uUnUYCY6p/KFwrdMuzpJOxtSduUvA+mgdFBQmf5jEKpdhc7UWYNvieU9ihnf6on1SH94PvdNgKM4yU80zhs4BwsvSHBO9SomJvMmlMUUpJzGTEtLn6zvdBJgOWtIemFDMPMTHCSuWkBjM69OSaUYG2cqfliM5Y0wpzkBEUk+e99dCrMl3a46g2O2wqBzDqgmSQWVEl6OC7C+1mva9INcSgUygUJuxbKie1PeNrmadywfPYXt64PDk6bZYGPCA9bcBx4xEK8qSDKFjfOTSxYkhKvXeMmveua/XFoqLzNA78fsPytBUUwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7pc6QFLyVmArACgdho+4Eix+qscTwLyg9QsmeV5C0M=;
 b=jpdBdLoqPjW+RVK0OM2XiBdyrN+7GjlKLuzzJbHh27nx50O7hQWRqSfaePawFPYg653obRi78zJtUlepIMGoqxqefdGMBSeUqgxQiKUrUftgRm4OAl9D743hnCyZc68ehfFTFJmZgD5bGQqDS42jXfEyfaQmqpHsHUQ55R8cPFs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:29:35 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 14:29:34 +0000
Message-ID: <7067e343-24b9-4e3e-8e5e-42c98239ccae@amd.com>
Date: Thu, 15 Oct 2026 07:29:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-4-ben.levinsky@amd.com>
 <20261015-humble-eager-mushroom-9db4aa@quoll>
 <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
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
 "Shah, Tanmay" <tanmay.shah@amd.com>, "Levinsky, Ben" <ben.levinsky@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB644859F1CA3A936684A3338B839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0102.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::12) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: 55000ca6-7a31-4441-5ed2-08df2ac8bbfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	m9Msp2ftlNcdlxVd36duxYXoLxWrsXCUAdue2Qs4juW5uZfWCpyALJSbLzNhXGorEj2W6uXhUJb9D8jJvdF+/rQ8vV+6/igVasvO4MAiQG1nIOuEDCvMCAbWKfO3U8/oKW+UyudGC3vLzOegSwGqboutYcCBNvUAj3kzkJj0qZ2uQ+5UytsRptIZoND079xOPzsE8/pAWAB6HVO3wmnddEJA4OkQP7wwI/IzmqAvgDvYiaaX5MqgkCyli6jCyB07SjhPNnhZEMhV8/xShXOR3LC5JCs6JgEFBKI5TY2+fZxgGq93kcRXa7LVUZDJlIMQW/j7NFJviiwniH+pUcMbR2AYcYEElq4gPq1omC5AWz5NrrkEvGOvpHwwTz7A7l3Pyleyye1jJq4q4QiCWBW0OTozcpsF+HzrnpYX6kW6cVNxIZnyxG7eYcoRGuFgGo9ZPaWpnA58BEE3Kvna9RnxA7Cxq4PfdLl1/pqgqzHZso5SGG9FOkUbIRm73o/t39OtVHn7x6aINEAe+igHKwc3AD9mcT22sy5RnhGdAzZrAMGmStkWHR5nc272D8218thvdOxONEPz+M8UKRNf4jkTh/oYKmiHgB/8pjy28gFTEbDtiAXvt/qFKMqJJlKXzS9O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNmcngzWHplZ3JJR1NFbEFxQk1BNEViNnpwK05leGl1a2V3T1p6ZFd4c0lj?=
 =?utf-8?B?d2pOOFM4dExKc3MvdVF2RHRMSEE3NlJhcGFYNWw3aDlyT1JDRDhKVTJEVzky?=
 =?utf-8?B?VWJPVDZkTGs3V1EzcDBqczRTOW9CSTVPMHhuVVpvMzRwM001SUgyQ2V5UEdG?=
 =?utf-8?B?dlRYSElJTXVLeUd4NmE1c0daLzFKMWt5SHg2YVVpeHdONEt1ejR1SkFYaUJW?=
 =?utf-8?B?SEdYQUp5c2JmUkFqTG5IRjJqQVFkM3ZnUWNhTUtoRzJSbXRxSE9rWmROaUNJ?=
 =?utf-8?B?ZXdTamJYS2xWUmR1Qjk1b0FzOGpOajlLNmpEY2hMaWVxS2tlVUhxVjUvQ0NM?=
 =?utf-8?B?b0F4WnVHR0poaXVpM1daQzVPRzJUbUVpUi9GdWhhbStSY0g1OTduaklBOS9O?=
 =?utf-8?B?VmNSN2E2YnR1eG5CemxGL2dWaHR2NTM4TTkzYlVvZk1SaC9wei8rZ3pxcUZt?=
 =?utf-8?B?Q1lqa2M2K3A3Z1lkd1VKZEJlRFhwVlZHYnU4UFVRWGxNVXdzTzFHZENzcm1T?=
 =?utf-8?B?T1hVN0hLNEZPNllrdVpYUnYvVkdFRkpHQ2FPTnVsbHd1VzcxNUhuUWxESS8w?=
 =?utf-8?B?ME96bmQ2elNVdENyUGZBNGxrMitHZ3pHUndxdG1DREcydCs5ZDBXd1pTcGFa?=
 =?utf-8?B?ejF4aUxpWGZua1lZN2pZTWdnblVITlIxdjhGeEhCMzBsT0dZYlo4NUFyMkUz?=
 =?utf-8?B?U1JYYzlyZUVGU2d6cFZmK09IdFZxMUgzc2xGYTJkOVpwZjdPVG1aTFNOWSti?=
 =?utf-8?B?UDFNbDRSSW5CRHYzeUN2T2d6WXdsR3hVSys5SVFoa3NhZGR1REp0Si84a1pz?=
 =?utf-8?B?cXplM0JDaG03NmRJSTlua1pBSzBkSnZ0TnRCNTYrZ05HRlIxaVVxUWY2Z0No?=
 =?utf-8?B?TTNhcFdxWXA4TlZkVlhqMDQ5QW5MNnNrcjUrb0FrbkpITVkwbEFvMklwbVlP?=
 =?utf-8?B?eGxRSWRzT1pQTEt6L0pITkRudVVzSzNvWm11MVpmbzRzbEo5REp6UjBIWStq?=
 =?utf-8?B?akxGSktJcGxhbHRKU3F4L0VlbXdvZnJXeXNReTduZnFGWnd2dVA1Mms2U2tH?=
 =?utf-8?B?VDZzOW10VmtGVExBL2pRVmZ6dGJUKy85VXl4ZVlsRC9UV3pPelZ3a1pTbmsw?=
 =?utf-8?B?c1Q4UXBETzBNbzBqT2NnSFBZL091N29TbTFNeG1LVXJkWVVKU3h5K21VY0Fy?=
 =?utf-8?B?UHltQ1J2LzZXaGZ2TEFEZDJMd2x6MUN3YkdxUXo5VWpqZU1GWnN1dXRuVlo3?=
 =?utf-8?B?bmw1NS83WUg3VjV4MGt4NEhSYTF0bW5PaDlJR0lHQlZkLytSVmhORmd6dCtm?=
 =?utf-8?B?UVVOTkcyV0xGTmRvbXpBSFd4bkRxRjEraitRTWlvQ2pvVjJkM0R4blI4SHl4?=
 =?utf-8?B?aHlNRjAwcTNqQWhaNHZjZUlFelZyNzU1dkJCdlFJWlZqQmlENk9uZ3U3MC85?=
 =?utf-8?B?dUI2NVFjYzZZbHgyZzJXdDdpelMvYit1YzVCYzZhbWpIT0RjbzRDNjBOTDU1?=
 =?utf-8?B?VkplUmlvOXc2U0xaQ1BtVWxoNmpIQ2dOdHVhdVI2VGNXbWFXbHhtbllLSWpm?=
 =?utf-8?B?c29IOXllc0hpMzAzVzAycGJuci9PVk12YzNuUkNBUVQva0FOZjVZSWhVRWNG?=
 =?utf-8?B?QXQ3SGFBSHA5R1puYjlFaHNodXd2cEVSQVdFL20rc1dmRUwvMjFmcko3YnMz?=
 =?utf-8?B?U2J0QWZrbGl6eENUcGlFd2NRRmRRSjd5ejYvdG1PWmprWS9yOEQ4aWZDVnYx?=
 =?utf-8?B?YkRXM24waXZua0NEbVhDOTBLQlBOMnhncHVIc2JJNitYZ0s5cEM3azVFR1l5?=
 =?utf-8?B?cVQ0dkw5MExJZmdQaDAxa3Y1U09IVDVRTTF3WWNtT0M0ZktmNU90aXZNUVNX?=
 =?utf-8?B?RkRsbG5XVFdJWFNYa0k2UEswcmg1M00zc2Vjb1R0c0doSEtlU0NkSUZlcHR4?=
 =?utf-8?B?UmRBSjFLeURpUEthcGRCeG1tK2tMbXNUNVJwcUl0WmdqdWRtRDdubWZOdEF3?=
 =?utf-8?B?cGtQNmpVM0owNVUycnFzVXArNlNqK0Y4QWdWRGhKd1BwSTUxYWdBN2ZBZW0y?=
 =?utf-8?B?RGZTK1pLSFZ6SHNCVEVGU2hOQndmNmNqa3hCUDRLOGhWNGpCdEJrbTRQRnI1?=
 =?utf-8?B?UVUrcWg5M3BhQnBYcnY0Z2VVRmhtSm9YZlFSN0RsU2tZTlNqcXdYZVVZQnl0?=
 =?utf-8?B?aFNrOW5PMWs0RDlmL0JLYk5HMlFHSjcwWVBMclA2a1U0blVYSHNhY0JLWUVu?=
 =?utf-8?B?L1ZtSFNHc0NWbkRJTkdzSXZGenBRY21oMkFxeklmZkdFNmlFNmh6WnFKNkVs?=
 =?utf-8?B?aDc3K2taR2xhMSsxQlNUcHVkRTV5bjUwUHBMTlV2YnZMdHRtUk0rQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55000ca6-7a31-4441-5ed2-08df2ac8bbfb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:29:34.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufUs8kY6NI5gCp+pRlA7PipaEGOu8kU/Nmau/CBzanl10ThrMSvVISvenOjqrRjnOcPMMr5jzF70y1EyDUUviQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286


> 
> 
> *From: *Krzysztof Kozlowski <krzk@kernel.org>
> *Date: *Thursday, October 15, 2026 at 2:46 AM
> *To: *Levinsky, Ben <ben.levinsky@amd.com>
> *Cc: *jassisinghbrar@gmail.com <jassisinghbrar@gmail.com>; andersson@kernel.org 
> <andersson@kernel.org>; mathieu.poirier@linaro.org <mathieu.poirier@linaro.org>; 
> robh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; 
> conor+dt@kernel.org <conor+dt@kernel.org>; Simek, Michal <michal.simek@amd.com>; 
> linux-remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>; 
> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-arm- 
> kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux- 
> kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Shah, Tanmay 
> <tanmay.shah@amd.com>
> *Subject: *Re: [PATCH 3/6] dt-bindings: mailbox: Add AMD PL Mailbox IP
> 
> On Wed, Oct 14, 2026 at 02:34:23PM -0700, Ben Levinsky wrote:
>  > Document the AMD programmable-logic Mailbox IP used for bidirectional
>  > FIFO communication between two processor-facing interfaces.
>  >
>  > The same IP is used on ZynqMP, Versal, Versal NET and Versal Gen 2.
>  > Name each SoC in its compatible, and use amd,zynqmp-pl-mbox-2.1 as the
>  > fallback that drivers match.
>  >
>  > Define the transmit and receive channel indices together with the register
>  > aperture, interrupt, and interface clock. Describe the FIFO depth chosen
>  > when the IP is configured, so that the driver can size received messages
>  > to it.
>  >
>  > Assisted-by: LLM sparse
> 
> How sparse assists here? It's something new. Since when does it parse
> yaml code?

  Hi Krzysztof,

  Thank you for the review.

  You are right, sparse was not used for this patch. It was only run on
  the C patches of the series, and I applied the same trailer to the
  whole series by mistake. In v2 the binding patches will name only the
  model, and the tool list will match what was actually used on each
  patch.

> 
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >  .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       | 74 +++++++++++++++++++
>  >  1 file changed, 74 insertions(+)
>  >  create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
> mbox-2.1.yaml
>  >
>  > diff --git a/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
> mbox-2.1.yaml b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl- 
> mbox-2.1.yaml
>  > new file mode 100644
>  > index 000000000000..2cc0d106b888
>  > --- /dev/null
>  > +++ b/Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
>  > @@ -0,0 +1,74 @@
>  > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  > +%YAML 1.2
>  > +---
>  > +$id: http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml# 
> <http://devicetree.org/schemas/mailbox/amd,zynqmp-pl-mbox-2.1.yaml#>
>  > +$schema: http://devicetree.org/meta-schemas/core.yaml# <http:// 
> devicetree.org/meta-schemas/core.yaml#>
>  > +
>  > +title: AMD Programmable Logic Mailbox IP
>  > +
>  > +maintainers:
>  > +  - Ben Levinsky <ben.levinsky@amd.com>
>  > +
>  > +description: |
>  > +  The AMD Programmable Logic Mailbox IP provides bidirectional message passing
>  > +  between two processor-facing interfaces. Each interface writes messages to
>  > +  a send FIFO and reads messages from a receive FIFO. The register aperture,
>  > +  interrupt, and clock described by a node belong to one processor-facing
>  > +  interface. Channel 0 represents transmit and channel 1 represents receive
>  > +  for that interface.
>  > +
>  > +properties:
>  > +  compatible:
>  > +    oneOf:
>  > +      - const: amd,zynqmp-pl-mbox-2.1
> 
> What is 2.1? Your SoC has different versions?

  2.1 is the version of the Mailbox IP core in the Xilinx IP catalog
  (Mailbox v2.1). It is not a SoC version. The IP is synthesized into the
  programmable logic, so the same core is used on every SoC, and the SoC
  names in the compatibles do not add information.

  In v2 I will use a single IP-versioned compatible, "xlnx,mailbox-2.1",
  and drop the SoC-specific ones. This is also the compatible the Xilinx
  device tree generator already emits for this IP.

> 
>  > +      - items:
>  > +          - enum:
>  > +              - amd,versal-pl-mbox-2.1
>  > +              - amd,versal-net-pl-mbox-2.1
>  > +              - amd,versal2-pl-mbox-2.1
>  > +          - const: amd,zynqmp-pl-mbox-2.1
>  > +
>  > +  reg:
>  > +    maxItems: 1
>  > +
>  > +  interrupts:
>  > +    maxItems: 1
>  > +
>  > +  clocks:
>  > +    maxItems: 1
>  > +
>  > +  amd,mbox-pl-fifo-len:
>  > +    $ref: /schemas/types.yaml#/definitions/uint32
>  > +    minimum: 16
>  > +    maximum: 8192
>  > +    default: 16
>  > +    description:
>  > +      Depth of the send and receive FIFOs in 32-bit words, as configured by
>  > +      the C_MAILBOX_DEPTH parameter of the IP. Must match the configured
>  > +      depth.
> 
> So you have multiple mailboxes per one soc different in this?

  Yes. The FIFO depth is chosen per IP instance when the design is
  synthesized, so one design can contain several mailboxes with different
  depths. The depth cannot be read from the registers, so the driver
  needs it from the device tree to size its receive buffer and to limit
  transmit messages. In v2 I will rename the property to
  "xlnx,mailbox-depth", after the IP parameter, and state this in its
  description.

  Thanks,
  Ben

> 
> Best regards,
> Krzysztof
> 

