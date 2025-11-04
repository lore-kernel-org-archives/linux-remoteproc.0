Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013000.outbound.protection.outlook.com [52.101.83.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F248C29D280;
	Tue,  4 Nov 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249415; cv=fail; b=iRqjuPCNbJgRizSniJhAVoBQm/2Kma1L1GCyYs7kuCJbpi2Uqr2Xeh0mykA5v1ZOuHLzTx7/KUnRfNbschdT1n++eSYKsgLiD86E0FL9S3tdaXUwBl0n88SOngIIx/Vc4CaVyqhs9m9aRky78UN0BOrVjg3T1XYkJjs0Se291f0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249415; c=relaxed/simple;
	bh=00YB6Jolsw9D0dXyrsDhZTLBhd+lw3cWR+Hh5yS4Oos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Eg1P4BqWP8gAW9Jt+9RzTYMBZn3w1dz+CxJ2/rnce+FQxhwt5eXLCh2Do2xqI/OKJpEdSxVE6dPmZ0cOtoqEQr5ablaFifJBEkHHjRmn4WzkK6ti+KLOpx6FBt0aNruNw0ciQJ5ae51GBKkJOHDCV0w0HWSoqUK/ulqd+7EUGtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=liQHhd59; arc=fail smtp.client-ip=52.101.83.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="liQHhd59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obLIYRo9EEQHiC1yAkQmnpDepcDKL5sCpsa7PckLBmr1nz2aQ8+lr6WKkz/6aoCfPTRmHroyfFt0VfHl0O86ZoY8jTaDLmFZCL4HwPpMAcfsb1PqnZqKRxLRlOkhCzST9k5rOLBkKbLvuURoKvNDqpWgp9JZqQH09MXxIX2gsgyIT4Kf5ab5Yoy7P49bA75aTzj5rF6xLlj2lEaGfR5c/OCO22fusoi9Y7aBWgKbH07MoFbVQRlpXcqz8RFmtyIm6RYnypjUhskeXg87AU86qV9Aq6drsxAzQgU+Zlr2j37xK5kw2wT0gl1MVcTF3d5HABrAk781k7Dekf5m9GBSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pe30pDpVrPSndFM/qxCstzp2XkvlAs0eyLb3EUhQzg=;
 b=OoiYrEVPWJnvgmMEyrm0TL28RcyhO4aQ2hYZg1szAoRuqk5/UKkUVk4e5wyDix+ArrkPDXpijeV3RDbe45CTJ0ld66SHamMu29hMrlTaKVE6GOe+jAaOcQMDBLCHBJhO9Z/2YNeR8nf+RWUwfAbCf0NQ036D7g7bFc4N4halVtIk9NBVgF/8GltY6+z8Gb3pm+prETIUPz/zTBHPMxTLu5RRb1aB2xs7+yXWnuGCSQxLo1Hu81xZsb3u90bYzdFpYyukG0wzZ++lw7iOjFum3yUkZdtZmjRZso/oYPbNgnOG6So7h/g8jTb6T/Sx2kAv2ORle2cEEOFyLedn5xgu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Pe30pDpVrPSndFM/qxCstzp2XkvlAs0eyLb3EUhQzg=;
 b=liQHhd59Wbxe2M8y4TotN5bt5DyQh09E5MDNQ7yxgOfnnS6ssI2OWrZqwRBRLnNPxtXNKGwaZrQZUWA9L+1DGWdhqdA3nyUDFfinrmrY6Ycz+Z0jZQz6cmbXdirH7rnobAsDA8HswGD5cv4qsh98ncfPeipYHfLHViB8iYiinY/1LvDLOjJda2WfGOOIv5Tnm47KOlRDbZKAiO/M8XxIngJLlkDZOEARQ5+rKqzWW0PvkEYDS5aPtwym58KoqFYNOdkGGdlQxn8mmzS8xzoKENQox4TZnSdo2x2BvEHdDBdwlqQIYdpbqYy6GjBAu6z/XbY5M9sFxXDdpIurPsf9nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 09:43:28 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 09:43:28 +0000
Message-ID: <b20cf557-8bde-4435-8a84-290bba1b68e4@nxp.com>
Date: Tue, 4 Nov 2025 11:43:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
 <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-2-758b2e547a55@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:205::47)
 To AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bc59b53-c7fc-4537-6c5f-08de1b869b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGJoRjFrRDArVkZKVkl6SVRzdkRHb3R3cjhZNTNhSEd5dGRqM1A5a0pVRWQx?=
 =?utf-8?B?d0k1OUJRUUNvSlpiSjJkZWwyR3hDVEt2MXA3cFl4d1AvQm5TbEduRmVVb0tH?=
 =?utf-8?B?S2ZiMDdHV3V3SkpGTVpta0E3OGFsa0tMQ3NCQlFxRmI4ZnlaT3NQUzRsc1gz?=
 =?utf-8?B?Ym54c0RDdDY4M1NhWW1ncnNXQmg2Sk5iUXhxY00raU1TVm5sdEZFZkM3ZHFJ?=
 =?utf-8?B?VDIxSmdTUktIcDMxQ2NGTDI5eEdaUzNWdWhZektPZE5GSlVERlBLZndVNnVt?=
 =?utf-8?B?ay81V0MvSkZtU0tKc1dTTVdNUHJkZEF2cUhrNEpLSTdROXZKR2QwcUx6dnFo?=
 =?utf-8?B?N0tBY1JtRENGbWJlV25PcnZUdC9pY1c2ZWoray9EUzVkMzlPdWVkNTI5NnE2?=
 =?utf-8?B?eWtsTUFXNFNKb1RXZ0RDeE5sRVo5dVpuYVZicTFBRDF5elVNNFlmcFAwWEpT?=
 =?utf-8?B?ZkFNblVQL2FBamdNR1RxcVZreElCUnpsUTVRODNXb1djL0JRb24wOWtEejcy?=
 =?utf-8?B?UE5PWXRSb1NlZnpXYklLVmdsVXMyZkNKa3Y3WWl4MTZHTzZ3dFphUXRGcGVD?=
 =?utf-8?B?dXNSVFc1V1ZCZm4zVDd2SXhFSU8rS1lxS2lUUDN3eWl6Q25ZOExCRExDOExt?=
 =?utf-8?B?cHBsRlc1c3puVkdOK2Radk54aTdveitjOXhEQTYwWjN4NHdKTlN6eTVqRTBs?=
 =?utf-8?B?TlJaWjFwZUNpdGpxUXRiRkdoT3pMRk9vRUl1OWtySnllQTZPQ1h0TFl1OWM5?=
 =?utf-8?B?ZEpBMndMbWRZaHdtZFoyU2h6cHNHL0RPS0JpTWZkNGZ4eEtWc0FtRzJ0L1o0?=
 =?utf-8?B?REpMSG5KT3BmT3pDSVh1ajJoTDZJSjNHektqME9MVmZTNlZhRE1nUEQ5aUVv?=
 =?utf-8?B?UFVjUW1hOFJpeE4rbncvb216QjZKTWhTSERIVFl0QWJSdlBZZStWcTlOdHJO?=
 =?utf-8?B?NENNczg0eUx0TkV2YWJ0clRiQXE5MUZXbStNSnZTYkFLVERPajVXcCt5bFF5?=
 =?utf-8?B?OHFWdE84bWEySUMyQUd5NTdDazJCblNydk9IbUdtcTVKbG9qTzVENStqbzIy?=
 =?utf-8?B?SXpva2VTS2JvaWE5SnN3eUxYT3h5STB2Z01KWldtSnFVNU5ka3Rsblh0bGFi?=
 =?utf-8?B?dHdYelB6NjE3TzRaTTR3WG1nYjh0NS9aOVY2YVZUUVJ1WjdDN2ZNV3F0eVU4?=
 =?utf-8?B?SWpxUkwwZ0IxZ3VpTlFSbDh2RnVidHBQNEs4ai9sd2NBYlpBS0dlZVNPcjBz?=
 =?utf-8?B?RVF3ZC9uM1p1c0pWcWloWWxzRUFVQm5Nd0N4d1lJaG42bjNsbktVWk45Szdi?=
 =?utf-8?B?OWhIM3hsRDJNVlFzZExZcWMzN2xGb2FrYnNvWFdDdFc0ME4zb29pc29GbkJn?=
 =?utf-8?B?MTlleGJxdWRjUVZlMU5jUnpVaDY2andwb2dCR3l0NitWMWlwdlFSQzVuTGdo?=
 =?utf-8?B?aHQxNjhKUWNUYTZLZWdvTkhMRkR5bDVwRU8vWE0wU0xQZVJTclVYNFZCRUd2?=
 =?utf-8?B?Y0dtd2U4QVRxVXliZFVXaVNBTG04QnY4RnJiK08xb0NoVTNPdldkV3ZyeHBX?=
 =?utf-8?B?MXo3NUk1cUlXSXcvWHE1Y2dYVGtuckVSODQ1bDRZZmpPZHFzWUVQS3ZzNU5w?=
 =?utf-8?B?ZTJZZ0NIU2gyQU01RGh4dnhjb2NVdUlHY3RVV082L2tBRkZQTWQ5QXM5NEFV?=
 =?utf-8?B?V1VubWlaQURNbmptUlVzakhkdGx5ME9NVEtzZ1l5YTJkM0pvaEtFZjgxRXNu?=
 =?utf-8?B?cHVsMjQrRXcydUhUTk5kVkpUdmVjVGpEZlkvV21PSXRZOWkyOXpGekJFZGRx?=
 =?utf-8?B?dnpkby81bDlOaHNMNnI3bENwOFM5Sk5rbTV5Z2Vmd2xqWkUweFIrRHRoT2NS?=
 =?utf-8?B?UGZYY1BrVzlXY2J1VHlkcGlqR2hMcHE5UXVkSXRTS1AzWVBlKzFUVWpCWW5X?=
 =?utf-8?B?RWdpeEtONVU5cXpZa0NLZ3paM3locE5lK0UzTWdROGpCbys3MDRMTzNTcE9J?=
 =?utf-8?Q?7Z88Q/6e5U/CAR73oeLSFnG5aOVHJE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eS8yakV1QTRFUFdOU2piUDkyMEZQbUJPcDVFZmpzZFZHWEJZT05XWDNxbHlO?=
 =?utf-8?B?TnR6YlUvWkFEMkZudlM2bDM5blppWGxDRldrT3BmSWk2VFdweHdnclM2OWpT?=
 =?utf-8?B?cnA5OEgrUnFaUGZrM1k2ZXIwc21nSXQvOHM0ZUgzZ2NPenpKNmlmZGhqbFpS?=
 =?utf-8?B?UjFVbWFmVXlNRjMxcnlabk1Mb0ZDK0tteDQ0Y2pXeGRhZzErUi9FYzRBRndn?=
 =?utf-8?B?bk85MS92OGY5ai9Zc0xkWjI3Z3lybXhweldSd1JqaEM5UnFkNk9OUmxQM3hW?=
 =?utf-8?B?SG9Ub21VdVpqdGZ6bW5Ba1hsUjJyamhteTRSaWtJSk1JRjFiL0g5M0dHbjRS?=
 =?utf-8?B?d2xoRFFVQ3E4eEkyL0c3cVBYMkRmS29uRkNVaXJpWG5KTGw0bjVWdXlDNFpz?=
 =?utf-8?B?dDZqM2U5K1orUjhGaWNrZmhNdGkySldlMHptblRwOVhIMzhvZVFYaU5nZ0dw?=
 =?utf-8?B?ZGpFdHlSZWVncXd3MEVOa2dNSW5KRVlBL3VjSlNNbzFxK3VFN3N1Yk1yRnhy?=
 =?utf-8?B?WjZwK0Y3UlZUZ3l4cWlTSkFQOHQrK2E1eVZzWlo3UXpxN2NyanZvQ0pmejMy?=
 =?utf-8?B?OXB6T01sdTZJaXBqL1M2THBnN0VHV2haM1k5YVFmdkc5ODVtaEh4bGowRDF5?=
 =?utf-8?B?cWdyRHhFc25TWnZaQTdlbzFUM3BZeVBjK2RCVlBJOVBsMTM3Q1N4MWVKZ09E?=
 =?utf-8?B?TitiM0svdllLMGhhVjVZRXBtL3ZPZHFSUTlpdE4rVGF0SkR4VkNDckw0TTMy?=
 =?utf-8?B?RGUvREpPM0o0WDEwam5paGxlQ2NRZEZ3WHNQVmVxSlMwZ21DMlA1RHhXQWo5?=
 =?utf-8?B?NUxpTjdZMjN2OHlhNjFyczRWMHFGU2d6VjBjaWJ2d1FUUkZKUDJ3Z3h0V2Zi?=
 =?utf-8?B?OUtSVFUzNTNkSVFNai9VN3lSVFJQS0VEUmVlOFBSVFI2b0xjYmZQQ3lJTXZP?=
 =?utf-8?B?Vm92RzFpZ3RrRVA4cnVYdnZSeDdxNTg5UmcrTG9MTlVYUlJjY2xVZm4vOUR5?=
 =?utf-8?B?bFRXQXdDbU42SitMWk00clAzT0VjclE2TlM3K0twR01Gazh2SCtrRWRkUFlw?=
 =?utf-8?B?N1daRHVjWWp3Rmg5UjFZVW5oS2JEYWpnUGcrZWt2M2pLOGl6MnEvRzNpcEl5?=
 =?utf-8?B?aEJZQjEwS2M4RVVxQkVCSFp2WEUrRVVKTXhNWkpma3hmYmNpNy9INk4zbUM3?=
 =?utf-8?B?Y3hpOWJiVlZMTTlQblErVnZxcTBMNEdnc1hQeU42ME00YXlFOXVnQVFlenFR?=
 =?utf-8?B?eElGTzJ6WmN1Si9UZUhOZEx4RTZlanYyMVc0bFhCY2FrdEpJL0tJOVZrV2Yr?=
 =?utf-8?B?SDhmRmRZbXVWUU81em1QYkpTeEtpTDYva01ncG9CM3pYTFQ1NnN3OGNLaWVq?=
 =?utf-8?B?UHJuRnJ3NnV6WUx0bXVMUGJxcElpSC9nVmJtaktjaHZTQTcrek5vOEVlZ0FR?=
 =?utf-8?B?b2FnQ0lmOE0xWnpqZ3ZLV29tZkJveTlmZ2g2QVErQlVjRCtRendsQldkV0x2?=
 =?utf-8?B?MGkrZkVYZjNKQTRwYytGNUJidytwdzIzVXdqK0c4Uzl2ZDg3dm9OZHA0Slow?=
 =?utf-8?B?cngzb1FRQU8zaU15N2NGczAyRTAzTXlEQWN6V0FZYU9ST2szQ0x5clFhNjlR?=
 =?utf-8?B?Y1kxUzhJUzgwTzBoaVNwQjZKUHd6em9HWnQxMnJkYkFQM2ZPc1IrUEQxTFZB?=
 =?utf-8?B?QWVlRGI3NHh2dHRZSjEwS1UwMUlFME9uenF2QjdCWXM1WkNOa3RtMU1kZE9H?=
 =?utf-8?B?Y210bWltR0kvSld2ek55K245THBOS3NPWTdSa0k2cWN3bFdaMy9xdWdrRFhI?=
 =?utf-8?B?SEdDbE4vREJoRFoyQllxRmFObHY2bCtwR0tpSW9VRmNuemhlK3oyY3Rja2Rn?=
 =?utf-8?B?aHU4S2c0c2crSkNwSHRyMUFWSXJabTc5cmdPMWRvVWovVEVjSWV5R1I3NVFW?=
 =?utf-8?B?M0Nhd25LNllFTEc5SUdEUnFZS0F2eHJvLy9LTDlFaWlZbUEwQlgvTCtudS93?=
 =?utf-8?B?eVovZFZYSEFOYkoxUDVOUXFWcU9JRzBGQXdYK2QxWnFxdmJwSm5HTnFDU0Rj?=
 =?utf-8?B?QTVJbThnbk5CRldZVExOcmpjTDhwc2tUOFpvMEthbnNiUUs1ZTZ3WXBoUDVJ?=
 =?utf-8?B?L3VLdHp2RW5mRENEVnJvZWZFeW9rbzBSRU5ZNWZxZlNPUEd6VjFmenBYVjVO?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc59b53-c7fc-4537-6c5f-08de1b869b62
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:43:28.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1ryw3kzGOmh+mcHCIitV3NOKJoU3MPwhdgKBMSoLq5mj8TG/VH+SoZ7ZvZs+3wRlcuvGH1Cq0j74ubCYVLR1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847

On 10/31/2025 4:24 AM, Peng Fan wrote:
> Structure imx_rproc_dcfg contains a const pointer to imx_rproc_plat_ops,
> which defines the start/stop/detect_mode operations for a remote processor.
> To preserve the const correctness of the static configuration while
> allowing runtime modification of ops behavior, introduce a new
> imx_rproc_plat_ops member in struct imx_rproc named `ops`.
> 
> During initialization, dcfg->ops is assigned to priv->ops.
> Enable the driver to safely override ops at runtime without affecting the
> original const configuration.
> 
> Improve flexibility for platforms that require dynamic operation switching
> (e.g. i.MX95 Logical Machine ops and CPU ops).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/remoteproc/imx_rproc.c | 27 +++++++++++++--------------
>   1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 02e155e967942d745de4ccd96f9008e4211f9b36..82cb8c7866ccb79061c46068d2039f38feebbb3c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -116,6 +116,7 @@ struct imx_rproc {
>   	u32				entry;		/* cpu start address */
>   	u32				core_index;
>   	struct dev_pm_domain_list	*pd_list;
> +	const struct imx_rproc_plat_ops	*ops;
>   };
>   
>   static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -315,7 +316,6 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>   static int imx_rproc_start(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>   	struct device *dev = priv->dev;
>   	int ret;
>   
> @@ -323,10 +323,10 @@ static int imx_rproc_start(struct rproc *rproc)
>   	if (ret)
>   		return ret;
>   
> -	if (!dcfg->ops || !dcfg->ops->start)
> +	if (!priv->ops || !priv->ops->start)
>   		return -EOPNOTSUPP;
>   
> -	ret = dcfg->ops->start(rproc);
> +	ret = priv->ops->start(rproc);
>   	if (ret)
>   		dev_err(dev, "Failed to enable remote core!\n");
>   
> @@ -372,14 +372,13 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>   static int imx_rproc_stop(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>   	struct device *dev = priv->dev;
>   	int ret;
>   
> -	if (!dcfg->ops || !dcfg->ops->stop)
> +	if (!priv->ops || !priv->ops->stop)
>   		return -EOPNOTSUPP;
>   
> -	ret = dcfg->ops->stop(rproc);
> +	ret = priv->ops->stop(rproc);
>   	if (ret)
>   		dev_err(dev, "Failed to stop remote core\n");
>   	else
> @@ -590,12 +589,11 @@ static int imx_rproc_scu_api_detach(struct rproc *rproc)
>   static int imx_rproc_detach(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>   
> -	if (!dcfg->ops || !dcfg->ops->detach)
> +	if (!priv->ops || !priv->ops->detach)
>   		return -EOPNOTSUPP;
>   
> -	return dcfg->ops->detach(rproc);
> +	return priv->ops->detach(rproc);
>   }
>   
>   static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
> @@ -995,18 +993,16 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>   
>   static int imx_rproc_detect_mode(struct imx_rproc *priv)
>   {
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -
>   	/*
>   	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> -	 * dcfg->ops or dcfg->ops->detect_mode, it is state RPROC_DETACHED.
> +	 * priv->ops or priv->ops->detect_mode, it is state RPROC_DETACHED.
>   	 */
> -	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> +	if (!priv->ops || !priv->ops->detect_mode) {
>   		priv->rproc->state = RPROC_DETACHED;
>   		return 0;
>   	}
>   
> -	return dcfg->ops->detect_mode(priv->rproc);
> +	return priv->ops->detect_mode(priv->rproc);
>   }
>   
>   static int imx_rproc_sys_off_handler(struct sys_off_data *data)
> @@ -1056,6 +1052,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>   	priv->dcfg = dcfg;
>   	priv->dev = dev;
>   
> +	if (dcfg->ops)
> +		priv->ops = dcfg->ops;

Will priv->ops ever be modified after initialization in a multi-threaded 
context?
If so, you might need synchronization.

Also, you can remove the NULL check since it's safe to assign NULL.

Iulia

> +
>   	dev_set_drvdata(dev, rproc);
>   	priv->workqueue = create_workqueue(dev_name(dev));
>   	if (!priv->workqueue) {
> 

