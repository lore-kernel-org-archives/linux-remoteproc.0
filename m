Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C53B71B7;
	Thu, 15 Oct 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074811; cv=fail; b=bTN0PFK2xFcqFpshlt+Sxn021ceCKgg4VuordO3Vsif9I7Fd/WOF28DZoR9CZ1h7QoIPROuArNEuYOrQMHCvvwr7k84M+oMCvs0SsUfxUJHXU/gq4OglPQC7ypcJY3GasqX7Yx47srhULWL/uKRkBk6S/0Ac7oNWuzPvSaFBj+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074811; c=relaxed/simple;
	bh=gTBNhNg+xXaD6ns0DB9Igc2epfgE9el0Cs535lvpo78=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j5e01nM65FmiJcAQTnTmnrb3wtlxvqFWhWi2QY+IBatry18DELP22v/OABvuQpVFpuE+NG+qO1JWGbMN6UWLCLhauKfu+c4QLYEP6vEK72J+9K6bJEen16XFclbdspIX+pAuLBtI3nbNV4uUyOx6/ZQyXTorDQ6aFlMPm41g6no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EZ87gUix; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EZ87gUix"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2Xko3TyhVIph2PmH9Gd8xxcSUQ7bf0NqhfI1+W7Aazu7FcR6OLoCQAFOBE+H7WCxZOSVJ83lb5VOjv3sJ9twhNRPajmBEj1DxbOwHz4NGITvvETcagxoSWXTiGF9XhteQM89pM6XPhSlnStnpSKgpq9bivPXbAUcF+T5TcX4lt+8saQ4/XdUJgpKgSA54Dv+5lPXN5nurhAFCIhAN8fgoJrmnL6Hqj1tom7tCbioDHym/f6G0QJq+ieMoyhl7pe4q4bTPIBq4mKrUjnH7Ty75YZ9CVbSyxjMUE0vixX/q07XvGiUgIpzkBLzAChbG7mdBpIj1Jb94v1/kamJH994A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McxygcdXzrl0BstR6g+LSSFHsNxVGiVrH8GioE1lxgw=;
 b=ysuZSimeY+ysTEbNDZI0XQkUjiFFyrn3P9DValdpiLzI+s3vveTdPmFIuw28co/jC1pMS1bmmXLQOrpjULKVQudLD0asirT+7dcIJ62cN/0B+JOkG7uJ5TySmVYiFtTxitaRpBainBKpWs1q3OSCyGUuHHeXwBNgwOOaCEKfsaS7eAiHt4V0VKSyVIjf1RdqwmdYFQaJEA4pfHnGLl/XRMmZFYcwTbXcee96NLdtvunde2LEQR8Phl+BKlbeyohIY/ex/7ZwS3sYwWpvkRsGzuPNZLNVJ56UXdTtZMWX60E05GfnmLGiD1vvBmk+9V95tXhS8tnvL5KCMswU+J+MCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McxygcdXzrl0BstR6g+LSSFHsNxVGiVrH8GioE1lxgw=;
 b=EZ87gUixVRhaOjp/0leFzVDS0zHfMgHUbHL+HDJukyuhctXruo1uKbU/Iu9bmZUIWRG11g489Pc5lxHpvnXEnR6l279w8mqjSMnuM8VgscyxoXY9gjSD4aHvfg2AZbC6m4C/0fTwpBjEHdigbyyYEe24nCgmt4tGvLOrogVXu4A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 MN2PR12MB4286.namprd12.prod.outlook.com (2603:10b6:208:199::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:33:27 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 14:33:27 +0000
Message-ID: <ccbcd4b6-9a4d-476f-89b9-02441c29c8db@amd.com>
Date: Thu, 15 Oct 2026 07:33:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-7-ben.levinsky@amd.com>
 <20261015-amusing-private-hyena-65b1e8@quoll>
 <DM4PR12MB6448FDE3208DB753A37EF3F9839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: "Levinsky, Ben" <ben.levinsky@amd.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
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
 "Shah, Tanmay" <tanmay.shah@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB6448FDE3208DB753A37EF3F9839C2@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::13) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|MN2PR12MB4286:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ec5dcd-8eab-4c7c-6d0f-08df2ac94695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|56012099006|11063799006|4143699003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261009223327099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iTYgMGbZw6U/hVFu+quc5XMrsvENB8nnh1ONuqQFSr+4/52LoIbTMZVwbU4jp5ZdKEyyYEKMgUxdCur9NKJgasHAho4aYwAh0QBYAYopTAz/92cfxFIfRn0GhLOgzEgJtRUVswXOGQkqjBNPa0PQk+NXbVOG9gWt5tcNJGwcUYuR5veMSfj3NvU6CLUTPvdY4AoTHEAnmoRfFi3wr8ep+z+V6LshZqYx6sE2vyiaz+QhUKsn0A3cwRnymPzqB44+jlp9xyv+CoCyD82gDpBH2vA+/SAvD4cca3NBa4Smo0YpcmI8F+jwYILnYvPoiwcnoFyD/t4aEH/DM6GdZDQ7bfRg8HziTEZDDc0+pPcYSX7CvqlEcMxkhQQcErc/hx0rlDYgP6pDw66yQkme+rIJ/gf1xIQwOkuFiML3iDy4Yo/JO1Jhy9GKvKlVfN8mYxBvQUkPLmlDa/whivbBfMoD+NKaybNT27MrSYmOpw/VwGOR7nHXZwU0TdHONpBqcTfTFdWktTzq/yeI7h8CxRmmOw/2cD8b5vhrvvNacmxgEK5VDBg1AyqYsHgZEgDwNjZiG/a6eZoEixzDS2h9Bx5dl09u+LjXu1yGDo+D+G2kmu0osXkmENzXx4XzodanTmX1LpbOpWqDoVhJf0kdOvckJWNNQM8mT5+SxELgjmzYBdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261009223327099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1pIUmhTSjdFakFhaWRyeHhTNUlqaGtyenhDc2h6SElEellOS2NjZzhzQXlx?=
 =?utf-8?B?dTZWbWxGb0lXak01dm5sUDJmNTNhQ0ZCVC9JUjZTZm9uQjMzQURwZVU5QU1L?=
 =?utf-8?B?K3M0elV6dTFVSEZwUkhqWFVvMTVYditheGdWNWkvUWxpU2tBc1p6YTRsWm1i?=
 =?utf-8?B?d1JnUXp5YmVTTThhTDFIOHk5N3pTeVZqRHNnVUZhRzQ0eUVndXBGUFBhTnJQ?=
 =?utf-8?B?ait0dUhsYWIxRG9UM2RKWDllSSsvZ2ZJbzdCT0Vvb2l3b1BWdTFiS2VDTzNj?=
 =?utf-8?B?U1ovTm9Qdlh2cHJrb1U2SkhJd1M2WWYxVk9mVVNaSkovL0RkdlJHbVBsalhD?=
 =?utf-8?B?U2FPeWUzMTQxbmFGWVVvczRKbkpWNk4rK2RSRkJXZE1odmRweWtMYlFqdmhN?=
 =?utf-8?B?enJ1QXdDUWhPOGsyUEU2VjN1VFpoc1pCVzlxZEpMZ1hQSW1yUzFPd0FuMGx6?=
 =?utf-8?B?cHdidFVXVEFBZWY2Rm4xa3g5L1lGNlhUb0xva1VVdVZ3Z3J3VzVrWmpmT1Aw?=
 =?utf-8?B?bXZYQ2pIdWhhR2NsVjBvcWd2QTczaTAxVTVZL1E3UllqcmJhOHVXNlpjZ2JI?=
 =?utf-8?B?ZTVmYW16K3hYQWVVZGxZQUtoWTNkMnVZZG1LUU5XeTRuOU1UMFNzYzlxbTdp?=
 =?utf-8?B?TnprODdCTVcvSXpzak90ZzR0RjhmVjBZeUJxR1RxT3pQWWxoZGp3ZlFMVUh1?=
 =?utf-8?B?eVF5ejY1TGJLYWFlMVJkdys1NWlUVjdJMzVBbjIyajlNcjBHME5sZmJhbWMz?=
 =?utf-8?B?Ym1zaWpDZzFjaTFFZ1RBUzFtUGhIMjlDOXhoVlNQYnlOVnd5d1kzSis1OERK?=
 =?utf-8?B?akFPUWVrb3pleTRTZ05INDF3aHAzSVhsWWhzaGVoWVhFYWd2K3duaUI0VE0y?=
 =?utf-8?B?YTVJcjhMRkowRXRPZVM1N3RYUGF3azBJdWZZb25sN2Q1TkdMNEMrUTkydytI?=
 =?utf-8?B?OUt1cXVmTmZudmsremJMMzI2STlMSVNOeW1ldGIwcFZ1emlwMVpkZkY4bXBO?=
 =?utf-8?B?ZmQreGZnTzV3Ymc5aEdGYUxkTEI1RENSUVNoK2xQSFJWVW9KS3I3QTBsUVI2?=
 =?utf-8?B?b0tpc3JTTnBRYU0wMTRVODNqUUNNbGlvTWtwNVA5akl5RUFXV3liRFBuQVBC?=
 =?utf-8?B?aFFOa1c0TWVtN3pEU3JmZEY5U1RLVTB3akhCYWNVTkdodTQyWENrZ3VKSndT?=
 =?utf-8?B?d1IwamxiNlF5bDd2ckhSNHA0L2xkRzlaRy9ySkVUZURqc3VkQXV4NTZFMkpR?=
 =?utf-8?B?WWxxaUU3aWhwWElXeVhxdW4vdEhzVDZ6Tkdsc2R3OVl5UWRjNS9FajJjazQ2?=
 =?utf-8?B?N01PS0NJUEY1Z0UyQXRWNEg4VC9meEFiYnpQanJhNFZPYy9acTJwbGFnTFlI?=
 =?utf-8?B?bGxLd0pBdFkzUjBLTUNHWHV1dGhabW1kNG9HOTU1WWVSendpOEFoVTVKMUlT?=
 =?utf-8?B?eVNGV3pRdXU1TGtKN2wwVXp0QjhUekJ6VVBNemFlWE4xMXJoMkdreXpNTkNx?=
 =?utf-8?B?YTJ4L1lodStydHRqWEFZY3dQeHdwVE5uaGVZWGVWOExGZEJBUEVtWGVYd3V0?=
 =?utf-8?B?d3hZRzFtdFkwOHlZVXlZbEZnSWdqbW1jQ0pXeFhQWWVDU3JaUFN2MFd6YWVF?=
 =?utf-8?B?dkdKbmtKNllnYTM3VU92ZEY2QUV5d1ZjMUJuaktKZ2JFYW4vLy9zK2RNUCs0?=
 =?utf-8?B?NnlkL1YwU0VCR05iZml3L0R0VjJRVDJyNjhoMmh2a2xpVUlCQ1RBSjE1d0s5?=
 =?utf-8?B?alpIYUEyaHRkMGNNcFBEdUpJeFh6ZXFnSGJ1TFdNNzZOLzh3akRSZ2pYcHpj?=
 =?utf-8?B?Mldad1ZlWHQ0dy91VlFLYk1zbmNtQXBVNEdsM1duSUlPWG5ZQzE0Z21rQVNv?=
 =?utf-8?B?SWl5SG5vV1hxbGgzcXR6M1RDblZiL3VweUZlQkU1aVN5K1RIUjBmMXcvRko1?=
 =?utf-8?B?YUxPZHArajcrbEJManZKYmNTSEIyVUcyVmhWR3JMbjJTeDN3Y0JJSzVBMDhy?=
 =?utf-8?B?cE5WakRERkFmTThXb0tKZ29ERytkTVZvc1gxY1lqVko1R001T2JXdUsyMTRv?=
 =?utf-8?B?ZGlMUWVMUmNtdXBza2tXelh6ZFNQWlA5N0swQnFjaU1Bd2l2VmR3ZkRPVmZS?=
 =?utf-8?B?RWVWK1ovT2pNYUtsQXUzWTg0aWFra2plV2tvcTc1RjQvRE5oaVlvN3QzSjRT?=
 =?utf-8?B?VzRBd1c3c24rLzVwbk03M1VWdGZ1SmJxQWNhbkRNeW0zUVVwWnRQaS9NV0FF?=
 =?utf-8?B?aisvWUptQkFXL3V0Z1ZaUFVwYzNpejhIeEk0d2NlTUxaWkp3R294NVkxNDYz?=
 =?utf-8?B?eEtuQkJ6RFlPR0dlcHBRME04VWg4M0ZVUGZ3ZmJOYmFrNFRiWnovZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ec5dcd-8eab-4c7c-6d0f-08df2ac94695
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:33:27.2040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPCdpiqrEcQN+/KFSvP0p7V56vttxukMkLOYPCSnt6+J8PA3hhAR7lnBrsEracgBYZUBpb9m9VRYfxE8wpFlCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4286


> 
> 
> *From: *Krzysztof Kozlowski <krzk@kernel.org>
> *Date: *Thursday, October 15, 2026 at 2:51 AM
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
> *Subject: *Re: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
> 
> On Wed, Oct 14, 2026 at 02:34:26PM -0700, Ben Levinsky wrote:
>  > Register named reserved-memory carveouts and expose the firmware
>  > resource table after it has been loaded into BRAM. This lets remoteproc
>  > create virtqueues backed by reserved shared DDR without deriving
>  > carveout roles from DT node names. Map the shared-memory carveouts with
>  > the common rproc_mem_entry_ioremap_wc() and rproc_mem_entry_iounmap()
>  > callbacks.
>  >
>  > Use the mailbox framework to send virtqueue notification IDs. Defer
>  > received notifications to process context before dispatching them to
>  > the remoteproc virtqueues. Keep mailbox payload storage valid until
>  > transmit completion and order write-combined vring updates before each
>  > kick.
>  >
>  > For designs where the mailbox and remote processor share a clock, request
>  > the mailbox channels only after enabling that clock, while the processor
>  > is still held in reset. Release the channels before disabling the clock
>  > during stop.
>  >
>  > The mailboxes are optional. Without them the driver keeps supporting
>  > load, start, and stop only.
>  >
>  > Select the mailbox framework, the AMD PL Mailbox controller and the
>  > virtio RPMsg bus, which the driver uses for notifications and RPMsg
>  > channels. Selecting MAILBOX while depending on GPIOLIB creates a
>  > Kconfig recursive dependency, because GPIOLIB is selected by drivers
>  > that are reachable from MAILBOX, so select GPIOLIB as well instead of
>  > depending on it. The driver always needs GPIO for the reset line.
>  > Depend on HAS_IOMEM, which the selected mailbox controller and the
>  > write-combined carveout mappings require.
>  >
>  > Assisted-by: LLM sparse
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >  drivers/remoteproc/Kconfig              |   6 +-
>  >  drivers/remoteproc/amd_mbv_bram_rproc.c | 231 +++++++++++++++++++++++-
>  >  2 files changed, 235 insertions(+), 2 deletions(-)
>  >
>  > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>  > index 5b56b2dcc725..9ebbbf76289f 100644
>  > --- a/drivers/remoteproc/Kconfig
>  > +++ b/drivers/remoteproc/Kconfig
>  > @@ -25,7 +25,11 @@ config REMOTEPROC_CDEV
>  >
>  >  config AMD_MBV_BRAM_REMOTEPROC
>  >        tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
>  > -     depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
>  > +     depends on OF && COMMON_CLK && HAS_IOMEM
>  > +     select GPIOLIB
>  > +     select MAILBOX
>  > +     select AMD_PL_MAILBOX
> 
> You should not select user-visible symbols.
> 
> Best regards,
> Krzysztof
> 

  Hi Krzysztof,

  Understood, thank you. In v2 I will keep the driver's existing
  dependencies and add "depends on MAILBOX", since the driver calls the
  mailbox client API, and drop all the selects. The PL mailbox controller
  and the virtio RPMsg bus are only needed at run time; I will mention
  them in the Kconfig help text rather than selecting them.

  Thanks,
  Ben

