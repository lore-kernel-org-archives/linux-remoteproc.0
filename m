Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4B33D6EF;
	Fri, 27 Mar 2026 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604608; cv=fail; b=cIE0hnMBceBVQMnykwigzNiyTh7kP1/yQyZBy4DdOn4ioHqTGdKCexfUm2G58eJkwRpKjyyj7nyp3Q8WW/0zFWcvkuEotMHUckZD47htuGEgiuejtuYvTfXkc47ZTjTSzEprxdColtsKo5KTDdTmMcPBHlGu1fdrCUJMs8itjc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604608; c=relaxed/simple;
	bh=OVgr3GUpW0f6xzE3kdE/m9KCwiBQ2yOr86yyPhUJJIQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZfPPHiZbdQ+7kbjNcY2MkyXyEwXpojDwcg1AKaXnPr3sJrNbuU9ik2lL7TvqNQMLuEBk4hhW9IXoWVSQ81UZfgLr4/2YrMYUJbdRLlBK00kKvy7JFNkxcBjuZCsj+C7VpAUbCbNsuge7D2mKjZJUp0FHXNImNb3fOrHTNQj47h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pycAV3IB; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pycAV3IB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUMKVvGi+7tV6IIIGrqwsi2menULFruSRWM5OsulpsPM8Wy+6a340o+T4rvDGGps84KjgltXgjs3z1QAWRTReypFql4raEgLEEszqVH2em6wZ232YBwWjIbzCdk6v9FN4zT0JxcOibG6O6DzKOwDb1+MzpfkPO5SRzeMJncLe+9qUe7nM2Tz7wY2C45CROT0nE7y1wROTUZpZGrH3DN9djiUfzvrArQllNjR3FaZtZttxZlh4TZKyuCfEDp+GeBCFdf4ZIKhcEB/bbi6IfaFGzvWqtIMY2idB8dmMga3/nrDeYjTxMkI9nJQcLivUwoN/D437zRdJjsxWr8y/Uwy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVgr3GUpW0f6xzE3kdE/m9KCwiBQ2yOr86yyPhUJJIQ=;
 b=BiiksUaUsqysM3hhIuI2C10yEomKqgm8IaindCJJOZRSd2G447RzVcY7HZr4B1r5323fRlvDKVf5Bv9yPOl57KdzoTb1kL3ZELxKmmhoZIlYcfNa1IxO15EZ/EkbW34i9fYIcSS9laODEXMZVobjZteNfPfomc2tNNDpMuAsu59iEjeJ69aX5rwnpmUjliCKhxw4guRx7FURS6EwWIMfhhI75TEmbGHBFmr5uHUKYeAFVecg0mmJIkhJXyRUxpYCaBmA1gXxyQWxQM2QeAkZzC+Lj9pW1RRJ6+SNyWc+t48twz/GblM0gV/EQLyX++ZtPleOSJIb6O3VuZSc3oZmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVgr3GUpW0f6xzE3kdE/m9KCwiBQ2yOr86yyPhUJJIQ=;
 b=pycAV3IByMeLweHlom0tp6psBCdCgrw/fDR/TeRpAAE+n6yp6AX68TSuVYj//SVVbQ+VvFR4DRh0D7yuTP3EMT/u18jjmLLY63dgWp+1x4hAG26vu+krz5OkqqzIsv1mC+j0MEZ5YLeuBHBWVkbKsQWCG9PqbuBgt03YxAQWyzGCDWJCSDVgWY984jNpEV6DnyV41Mt0Cz4ILlbH5N3uk1a938YffEn4QjVOU4/95HsCu7AgMJGGnt4DCUqoMnPdlME+jwT2oYUGXgfl31svbYiyyFe6w9gBh/md7OU7m7duvUmS6F9Ho6fTZg9Ix3sCuC7Ay9LRO7IgU9O3ZH4pWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by VI0PR04MB11698.eurprd04.prod.outlook.com (2603:10a6:800:2fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 09:43:22 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 09:43:22 +0000
Message-ID: <88f55233-af1a-4d7e-a7ba-c24231b1a32e@oss.nxp.com>
Date: Fri, 27 Mar 2026 11:46:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: Add support for i.MX94
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-3-a547a3588730@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260327-imx943-rproc-v2-3-a547a3588730@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0401.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|VI0PR04MB11698:EE_
X-MS-Office365-Filtering-Correlation-Id: cb48d53a-6574-4841-0f35-08de8be548df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	68gBqmLM3KNCUzMT4W+0XwobPM3VdGact164avtalNEHG5yZmsoD2mcdl+O6ZtfBIKq7FGvG/ctKbxl9cKK9ldTB1xC/nx1eTA+piwL0WOcahxcVEcVglfSOu1BuqMAuS8nI11MUja2v0iSvwMo3gGcRRj9dWVExa6ambsaUI/IEur3A33HDN9xKvIM36h6Mtxnm7HOt8K/CEmQRwbtgeyD5gtZ5HL8uNxovp9rbTmTemazmLO0g49qPQq8W414DFq9VnIeCo5dvvHNjCylmGbFiFIeXIoecN96I4M67W3Aw/JQel4epY5jzKuLL+YJ4DpOOr6NL6i4VauuSaCFjVKyI9Ia+15esgV6qrImazUab8Htk8LE5hMM4tAt9pYra8UXNtumoiaouJTpfDra7cSaSoiGBwpAAMgDuUf3Gim/PGdnywT0AGq6vn7GpdHGZdxFvzEkwdJACIA+U9i7viVaS+jYeb5sKBQ5Te2d4JmRwIM66/Dv2rzu0wTE4vm+vHINC/htefFaFFL5v9c9uVGz/HLDEEezo7BnGmur0I02tQG094PewPt++5EXoV92+IRWhHlQ+vDelrvLjnhaszN2aaIMseeL5XIZWLnPSDBZB6KCXGc82+gAz7veF4Bp26ca9skW/VzdNpo8al3SKZsLJcmLMVGjylynPpWWCyDOMeEWFH1B2N9cDCp4KQ6gFRF2pC7h0j3BOm+NqoeZk8IFoyST5piaZeLyRgOuOukoNjvnrVW7tK902j57MtJDbYtgnhj0zBH18VTWnXL/RNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVnL3BuSjY4TW5YNlQyVGNTdFFjbTl2TFZXQXo5citVclptblA2dzNVVEZL?=
 =?utf-8?B?KzZSWUhGVG9oK0pHekNVczRxWlhzZnZQZHlwa0J4OXIrcFEraTB6TEdTQVdq?=
 =?utf-8?B?WWRxM3o4VUJ1WlFDM2RZNHd4Y1lZdHEwWmpTSFNzUzI5bWdkbjczR3FOeFVr?=
 =?utf-8?B?TmdTNElvbC8rUlBaMnNVWGE5K2NEK1F0TGlkU1RNL3VUN2RhUU53MGZJMC94?=
 =?utf-8?B?N0h4dlNNU2ZxOHhSeVozelJzRmw5cE9xYllKV1ZlNGhqZzdWWk53eEk0TFVJ?=
 =?utf-8?B?aEZodHZLSXk0ZW5MTzhaNlhQaHlOWFBhTkYxN2ptbDVqcFU1MTNHeUtWTE55?=
 =?utf-8?B?MmMwMkhuSEJOZ2Y1MkxTSzZZQVFoN1JRYS9vZWlxR1BidE12UDBCTkkyc2hB?=
 =?utf-8?B?QUVwazBwV2hwR2o0UXhOR1BTMlB1UHRRWEdhVVdyNXRMNG5NTm1XV2xTQSt0?=
 =?utf-8?B?cFZwbnhRYmNzK3haaU84NXp4aVJKU0tpZmFHdWg1aXRLNXFUcEVUUmY1REFz?=
 =?utf-8?B?eC9td2p4OCtZS3ljV3VQMytxQURBQXhPTVlRVHRGb3h4RE0vNHA1Vjk4YkJH?=
 =?utf-8?B?NHRIcC9OOG5iZ0V6VjhHV0hyaWJ4UHF2M3lWUkZzVEhGcUVnMWNjOVd3NGg3?=
 =?utf-8?B?OWNvNnVXRUFGeUZyMjAwdytaZzcxT3VCdEpVR0VUdS9FOGxqNEtMcGpCejlF?=
 =?utf-8?B?TlM5Qzd4WTFKL3NEdWZDeCtNbVprVEE4TGhqaVY0aWRteWxpNHRRVjVCRTc4?=
 =?utf-8?B?Q1d4WjNiTWYyYVZYMkJxM1N6bE4vVE5qMXBCeThCSUdxeXJqbU1seFlTYnJX?=
 =?utf-8?B?SzBPQ2V0QndLbjNMRGIwOHFGTFhxU2JTa25xeHFsQTJ1ZUg4b1V5bEJwT3FN?=
 =?utf-8?B?VkdRMHhJODR6NzBFNWt2RXIrdDZJZUZVVFpxQlpsQS8vZE5tTE0xL21tS1JO?=
 =?utf-8?B?NU9qdmM4RlFzajdJbnNOcThNbGhhZVVTa3k2RmZjUlF3MGtmZTVlWFVYVHNG?=
 =?utf-8?B?N1ZGMGdDMkllY28wMGg1dXlsUHlwZWdJaHc2eWlRZno5LzlrRFRRaDJaVlE0?=
 =?utf-8?B?WERRRkpHL0lwdFZTSExpUG9GT0x1bHcxdEd6L1FmeW1kRWxBVXFOb0pWN3dQ?=
 =?utf-8?B?a0Zqamlka3JoUUNxSFh4WCtuTVVBNThTTnQ2d2JGT3ZPYndFS2M4YlFSUzlo?=
 =?utf-8?B?ajVwSjg5RSt6anRudVJWM0svRHFrc1I5dGtDenpTU2VZRkZ2eWJNcGJpMHkz?=
 =?utf-8?B?SXhYMEpQYTliMmc4UUNDV0MwbUkrUzFEVjN5Z3pVaVlxTG8rcVkxVzBFNi9w?=
 =?utf-8?B?N1k0b01ZSlphYkdGemdyZDhMMzFyRzJSTzVzM1JwM1pkV2tJU3BuK3FVZ1Bo?=
 =?utf-8?B?UEZtY0w5anU3bjlIcDB6UEc3ZXl6bmE1K3puMFhjQWxjU09WcEtuY1JkUlJi?=
 =?utf-8?B?Y3VLUlN6WHFUdW8vU1h4cldtU0puN3BiSzJrcmMveFdkN3h1ZFFLWEg4YUFG?=
 =?utf-8?B?dWdBMmp4MVpndGVHQ1BFZUloZDdOUXhTVnBEUHdjeFJoTzBUUXdlamNYblJK?=
 =?utf-8?B?YVp3dTlZdWtpaUx2RzI4TERkejFMS1JCYjNjOTVkQ1BjMExvN244TGxYR1Zr?=
 =?utf-8?B?WTZlZUZwMk13bnZrajBTUDMvYldVb3l3Nk5XSm9aMXF3aG4rNVFoZDdkbEd3?=
 =?utf-8?B?b25iZVhYbVcrMzRaVHJ1MXZKS29qS0twcC9Rclc1SWJhdEl2K05tZVRHQXZh?=
 =?utf-8?B?OFFmd0lTMFBCNjJUbmNUT2hValpLTXdUdHJZK2owR0JhRCtwM2MxRURrc001?=
 =?utf-8?B?YTNuSzcxU2xZN2UyaUg3aWVwcGJBMkxaZ2ZSM0VYM1c1bXA1UUVMMFRIQ3RQ?=
 =?utf-8?B?NVFWb3hRR1JsRmJjVElpeDJuQTA1SnVaVHJOc1MxRXpJa2NOSFFCYmNLMWRL?=
 =?utf-8?B?WndOekhPZXo3bTBHaGdqeHN4WUoyTmh6MU1XTVIyZnhXMWxBTUljYTJnNGhI?=
 =?utf-8?B?Y3RYcXpHY0hZcGJ3Zmh4Mk5pQkVFYVR3UUs4TGVRUU9uRmlQTTladENLUTJm?=
 =?utf-8?B?NFpUOHdXcXp5S3EwZURTMDZmdnRRQ3pscXVNT00zWUpZc2NWSzFOU2pJUFcx?=
 =?utf-8?B?MEtZMi9IbWhwSkgxcWpleE9ROUZiVlJsMUxqWHArK1BNZmpOcUpVY3VPKzdK?=
 =?utf-8?B?cjZGTGxPVWRiTk9ROGJ2dHBZd1NaRWZFK1MraVMwcFhRTkk5bGRJMnF1MzFP?=
 =?utf-8?B?VHJFQ3VsSWw4OUZRc2lQRDluL2ZsMmdQK1lSWmtkVEVyUG5XT1NNeHZTSjFl?=
 =?utf-8?B?TEYyNkEreVdtcWhoa3dtT0Vhdy9IQXdFTURFYngwOXJZZUNoQStJZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb48d53a-6574-4841-0f35-08de8be548df
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:43:22.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69ax8AyUmrJFoSXPHevN2B4KEBnUGnxlMG8LHn+k0jXRgwMiCtxJGyiWsk5U7l566qWGhFeuZf2W6vu2aU4Hzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11698

On 3/27/26 04:42, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add basic remoteproc support for the i.MX94 M-core processors, including
> address translation tables(dev addr is from view of remote processor,
> sys addr is from view of main processor) and device configuration data for
> the CM70, CM71, and CM33S cores.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


