Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A772639;
	Tue,  4 Nov 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249830; cv=fail; b=cceTRlT2SOC0FueVXQCKu0/3k4HFQHK9LOuWDQFDY8C4s9kFqAmWB9UHknV/gt/fQx6rJpmu0BTNnAoZZJ1Efo9UpwrGlRxVBb0d2xvPlUhID6HpImEfE+BAXdHRS7LbEdlSe0/wh0OXfgvmK3+oCSj+KO7jY7seq8rQHS6836w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249830; c=relaxed/simple;
	bh=U8n+V6lLovvlrKFEDA7Up8+cP3NV39C96A/HKZk1v+A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JllnZ2+gQkYjRGgNPh0/Kn+F8k1BJvdASfKw3pn5ltFWmd3BzIn7QZkdseYvsg36Bf3laazkcpESzR87pukfJ4UcbL2MjNvv3fSu3l1uNb7tWkrDJwQ8D54qwjVX+A7ZW0etfpO6MI0nekMT3hILXLSHDwdbDHd4ND7RzdWXwes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RESad6uv; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RESad6uv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCpuEoJnXlWDdMk34YtKmAw0ymFwLYI8VkYRD/EiEyJSEg9solJm2KaqBQl7kevcfWvEXU9sfsnCUp5p17w0Ci1giSW8iwoKlrrGX3O5QlvK9jMZAzepZEEA2ZMgO0IpousVslfvKvQoLxzE16NVW1VOolL3BJPiZPdye7xqhEylc7v+2XcROzasNoz5GPV5KHZquGYunuHp9kAcqzHlbabC+erBLEbPyAc8tlB2BprOfalzN3itD2d0eo1in7aKgBlrC63T5zAmN3Qls0GpjSCVrZTffHiPVdcU8S9oeChYjsYvdQKsatniWznRYnkfooohAWhi/EWVXniu5JL0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP61yD4iXY5F9xfznkKQWneUu2aad5accjEOB9OHcTY=;
 b=XHzd4lyOKODjX0wckEDaEhUDCpDrTD1zrpSbbSlnfvy0GkEq6cXYIJPUKtPT6bGT5PppyTmwnAXX6Di5VLAUFAykIlqIJwOdLZuLhkiZmsLIjcJl1oBg96LSSJnZNG2ps8LHejJhPI5F4wqhyS/Hz9kFPL4NuIvqxhSUHukfcmRw05Ok4iDW39IqSwm3/sidVzdxJuTtOntYMAhfjn8sHAystFlHooRWOZsYNNOa6KqwTQEgO5eI5ghwWGFtvCASyUdRiW06o5skuSEEciUVg93CXfwLjjj7jpMy2MmjLGYSzuQuItxrkMUPLCDb4zJ+7SKSK1wrgCDOHlCBkGh86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aP61yD4iXY5F9xfznkKQWneUu2aad5accjEOB9OHcTY=;
 b=RESad6uveOxrLLZJ//kzmEzSLrGJu31vdH3GR43vmxVDz4DP2O191tULzHg9fhLfIbQNv9D+ajUEKNhvhK/C+Xvj62hBjGeuje60DvtBe8Sl0Dh5cl8yKTQU1Y1xFpLI05xXT5HsC17OGrkY1vhz1JqqqwBVfKy517ChtIMSCA6y8z+LjWDqOoy7weK6bbDVCPqrP8zuaAzfGUIKv6qST1NqrLYiB207OAX/EBFoSvNmcB97vkdT6pI1aLrBqMSM+8F0C0vh+BYdOXGFl3JwspOOaiE1CKWbCmNSgJMsBaWCE/8MvCWb5cICgW4g6i5rQbph8yfxBk21fqQB7SBQeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 09:50:21 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 09:50:20 +0000
Message-ID: <a2643450-00e8-49e0-bd27-e6680de7b9e9@nxp.com>
Date: Tue, 4 Nov 2025 11:50:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
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
 <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P250CA0030.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::20) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: a1085aef-bd6a-4ad9-54f6-08de1b8790f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWUyWUUweEJaWEJqWnF3MzhvL1pjOUxseU5IYmJRdllTeEROL2hrWGlsZXIz?=
 =?utf-8?B?U3dGRVNkT3lPTlZMVU5ZVGZ3d29kOUVBeHJ0bWhlVFBRRjhqMERzRlBlZ0Ju?=
 =?utf-8?B?VE9yWjFwenZRV2t6bit1QlIxQ3VyNTRKWGdoci9XREVzUUNtRllESHF6NTRq?=
 =?utf-8?B?Vm96bjMwUzlnclJ1VTdTbHdxTXVDeHN6NlBxRXZKYkcrL1Q1M2lDNHcvamZB?=
 =?utf-8?B?eHpnQk9iN0QrTnRnTzB5ZW5ScDFqN1luUlowdHEyQTVWa25jM2FRcTZtTTJ3?=
 =?utf-8?B?dzBLbDJsSU4weExON0c1SitwcVQ4S21zWG5YVStLTEhEMU5aVjNDOXA2Q01R?=
 =?utf-8?B?MkJ5bU9CSmExazR2NnJCaC9mSEhIVElvcTIrVVNUS0tsMFp2c1B6V2NyZVo1?=
 =?utf-8?B?dHJ1YjZJWHUwU0hMS3dmL1hmdWhMWDlYU2k3UnBqQnRMZXUwWk9ieFVVZnlk?=
 =?utf-8?B?cmllQXdoZTQ5ZGNQNGlSaXZmN091cGZWTDBja3V0NWtPamdpZ1JENlE0SG5y?=
 =?utf-8?B?OE5DS2hKSTVzdXdBQUpEVTZHcGxnSlJ2Z0NLSTVDS0tmS0lxNU1ZRUhGQ2hE?=
 =?utf-8?B?TytrRmljTEdwWFpGNk0rTkU5S2hiVW5aMS8vNzNGcFNsYnZEb3Q2YmZHVWZ5?=
 =?utf-8?B?U3hud05Wa2xJbmNFN2F4bEc1QkN5TzhoOWI3c1IybU8wMmNCWi9na1lPTDVX?=
 =?utf-8?B?MXJDaDFXUThsdnBZK084U3FoOFNGcmNLc1kyZmhxUjYzYS9EeUVwUkc0NUZw?=
 =?utf-8?B?NFFqVWxWQm1iWG5kNGR3bENPeXJzTEI5NDNGbnR5Wmw3czBZSHQ1WitVM3JQ?=
 =?utf-8?B?Sm9STnhpSm5MNVNFNG4xSTZCWmMwWDRNaXFuaUhPeVVyK3pxcGF3TjhMN2Vt?=
 =?utf-8?B?VnVqbGlKcDhUWkJoMXZXMXRiODhUWUxYWFlyV0I0cERDZmZINXNzRFpIUCtG?=
 =?utf-8?B?QXJEQ25YYmdDbm1qRVY2WEFxSUxvNHMwY09MOEZiTDJjdWlMNFkreXR3bkFO?=
 =?utf-8?B?b3RmK1VuRXR0aHVBV0U3bS8yTzYvdWN5T1diV2hMam9kVk1yM01jUUNDcDl2?=
 =?utf-8?B?NWFLQ0M5ODNPSjk3U2czUkRzSy92S3d5bElka3hDY0dxMFlHSWNDdDBhNlBn?=
 =?utf-8?B?a0ZnMVZHWWlrcExERWhtS3ZkUHBIbzJJenQwdDR0Uzd0SnU4aEs0eGVlb1pu?=
 =?utf-8?B?TVZhckhCdjFIUzUzYmNCenJFQVlnbkpWK0h0REFwVEpaNTZlSkJjeGVFWHZ4?=
 =?utf-8?B?cjRRWWpPT3NaUXVBaTJtUzNKeS9PV0J3UjB4UWd0K2h0Rmc2NXJOZ01NVHI5?=
 =?utf-8?B?V0FQYi9UazdWTDlYV0FleGxReTRiQUZkRnZtdmFRSnV0cTdCVDFwK2ZHZFBK?=
 =?utf-8?B?STM0ZzhOVW5sSFUwZmJzUWNveFZJQ3g2VllPYVZ4QkMvL05DamFoRzFqUmxl?=
 =?utf-8?B?OUtKNDVscmhPb1AxMkZtV3dFS2JuQVlZYnNzOTdQQURpTTgwWjBHeEJXcjVx?=
 =?utf-8?B?WHRJZG5OUCttZWo0ZXlONU56dGtNZ1djTFduZHZhczdQeVZNbWxrOFBmdzE2?=
 =?utf-8?B?bU9hUzVrcHdZU1BPcmNROSswZ1p3dFd3eXFCL3dqdVRxYmRrdzZQRWFLUHpZ?=
 =?utf-8?B?Tmw0clYwOVNidE1YODh1bks0OUlRRDV0c0NoNHVPL3VuQ29QTmhuOE1wTVJ3?=
 =?utf-8?B?WElRYmV5aW1wanZOMjNnS1lxaWw0WndPTzA5dU9RWVg5ZkZXQjB0SjZhSUNY?=
 =?utf-8?B?dWs5bU5VZkdORVY4YkFlRXdmM1hkZXVDdWw2UXUzR2dUWmRGRTh0L1JURGlw?=
 =?utf-8?B?L2VrU0MxbWtnUmRQai9WUGp5akxGOTFQNmlLak1JbTNXSm5QTWFrZURCTm5p?=
 =?utf-8?B?ZHZHM3htU1lHQUdvK3J0d3VtV0k2U2F5OUxEMWpQbFdySUN4MHhPYjJ2WDIv?=
 =?utf-8?B?ZEF1amp3Z1RIbzg4OWxQam9Ud1hhUXhqYmJQQi9vY01nZzdydmJ5QU5RMTVC?=
 =?utf-8?Q?oWqUEcMQBDSEg4ocIjXUKVbvOFSeZA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlcvbmI5QmdSd1BRdUVHZUxRcWFMQlQ3eDdVUTZOeGkwRWxraFRoL01OaWoz?=
 =?utf-8?B?MlV0NDRFelhrTkV3NUZNSHBrUWs2SzBkYmZ6V3N2cmFvSVZ4dXM5U1pjditZ?=
 =?utf-8?B?SGErSjlNaG9NWTlVaWRIamhsQ0tzbG1HaDMxM2xEeUVjemVQVGk1NzJzN1pI?=
 =?utf-8?B?OUhORjFGblc0dzhxTC9VWmcwRy9ycUlkUHNmWVVmOXlpZFZaaVZTUTZjUml3?=
 =?utf-8?B?MzBXMjlkNkIzNUFjd2FuVWcrbUFTdEZiS1VDMGFZeHBuekc0NUR4Q3o1aksr?=
 =?utf-8?B?Z1g5K0REUnkrV1Jzb3FFZ0RCNTFhZUN5blJzbVBiQXBFNEZPQjRnQUhCRVdP?=
 =?utf-8?B?a004MzRtYmJ4LzhSalJWS29DUnZmekltazNxOGl3bE9KYVFULzNqbkdKcDA2?=
 =?utf-8?B?djRYUEh3czA3bXNIL3hWZHp6bGpsbDIzNmp4SEJ4ZzAyaThNRHRMQ3Y1MXdQ?=
 =?utf-8?B?ZFhSUFNLTmR5WVJiOFpHZFlMQlRYWU1Uek5JR3N5cnhjZitWNXdOSVcvcm9k?=
 =?utf-8?B?bW8yVXJoUVJKYnBaMDdURFc3MFFLUVVPUDFxZTgvTnhVNUFMd2tpUmpwdmFh?=
 =?utf-8?B?S3IzQ3VPSnpXSkQybXByVVQwRWFja0xjdnJKdE9EdVJPK2dadklSTzJYbXgz?=
 =?utf-8?B?L1VFSEo3Tlo1MGlEVFNaZ2h6S1RwR2hoVVF1Z0JyaHpEN3hicXBtSm8vWXIr?=
 =?utf-8?B?aWkyOWdaSjNtZnRVSUFYOVpKbzErSG9jZmN2VFJJRjNKMEV0dHVleERwc1Rh?=
 =?utf-8?B?eDF1S2RUZjRhTWJEbU5udUlKaHRTczFaUzZLalY4d0xyQkFyenpXeGxHSDJU?=
 =?utf-8?B?NjB5eEV2MmtuNzdCMmVOQWg5Rml0Q0xQMjVxK3VWWGw0LzlsbHNBdnV2NUlX?=
 =?utf-8?B?MHkzSHcvSWJiN3RrNGhQcWZtWXh4RHFuZnVUaU5PYUxKTVV1cFd5QkFOU1VS?=
 =?utf-8?B?V0s2WWcxMml3cGVQTnU5M3NWQ0oyYmR5REFpbGsyZTZJbTJ4M2gzSStaeXRk?=
 =?utf-8?B?citYeHZQd1doUlZ6WlVYZEJIUHVWaWpVWGdFaW40eWo2UWNaUkM3MDRHWW5Y?=
 =?utf-8?B?RFBmYUVBL1VGTERaSjdoWVJGSWN4aWhxb0VtUlYySHNYd2tURTd3MHl6MVBt?=
 =?utf-8?B?UXNYS1RzTUVUS2JOSWtXVEpTSmtMUDBaYmFaUFArY3hLSlpRUTBNUFNtZ3dR?=
 =?utf-8?B?d3VyVzY4UE9TYk5wTktWUGJSc0M5OHZZTnNRekJnTkV5Nm13VmlTVkJDWW1z?=
 =?utf-8?B?N0dsb3hBOXBZRFV0SXhHREpaUFl3QktjemxuVFhObEZYTE94LzVadnBnQU1t?=
 =?utf-8?B?T0xObmJsMk5aQUI5NXVWQjRVL25ockRZT21ab0RodWEza2NmNG8xTkFyVDFZ?=
 =?utf-8?B?cXNzMGNsaElBcDBBaGtKZGUxb0FwQUdvS3ppWFJNK2dYaGlLYXRBN2JBdVZ2?=
 =?utf-8?B?WVVraDJOaXlzdzNjSnl2eGNxYVNEaytoRm5WNzVqOVN3MTg4K2Zmb1JmbDl3?=
 =?utf-8?B?NTlXc2pDRDQ3Mlo2ZXRoV0JpSk8yV2lzZUNSNHJMa2dTMUh4eFdRTXYzNDJl?=
 =?utf-8?B?a3dWdkFyWG1VK0Vlb2dmbkdBKzBLN3JuYmFoTlhyQWhaSEpXRXZIYVNPZmdu?=
 =?utf-8?B?Y1dUczc4aWM1cDl5MnJpRUdiRHgwTS9ObXRUZUUvZWEwS3kzYUxEaUQzem1X?=
 =?utf-8?B?UWs2cnBBSGQwNnlHMWp4TTU5cWgvbmFiTUErYjh0TW53LzYwMVZQWTJpa3lP?=
 =?utf-8?B?Z1RpckRXdzJSV2Y3Zy9qWVdaUmNjNUFGVUVHdUV1YmZwOHc3clVCUTJQRHpy?=
 =?utf-8?B?THpIR0gzWlp1OWNINnIxZ3V0eXc4ZmhMczYxSHc0YXloV2Y2QjgvTlozcmZX?=
 =?utf-8?B?enZ4b0tjU1VXd2xvbnl3c0NjRk82YUtqanJXd05UZXZFN1VQRW1WSUtBTGxj?=
 =?utf-8?B?Z2kzSHpCK29CaGVFaUlmL0xkWi9td3NobjRFeWR0azkvSXZNQ2VERXZHNSty?=
 =?utf-8?B?M2FYS25heW1xcFV4alQrYjFzMHcxM1ArRWNYbXNYZUJwUUplN3NOb2QyZk8x?=
 =?utf-8?B?dytUZWpqNk45R2RqNFB4d2tGdEJRZVRBOE5qUjdBcnRvUThxM3lad3VRSk8v?=
 =?utf-8?B?ZE1rdnJ0NHBpcEJiK2Jrci90Y2pxL1hSUy9DNFJuVFBkMlI1SmZrWVhkVXFu?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1085aef-bd6a-4ad9-54f6-08de1b8790f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:50:20.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADPqX4xLQ+bPJyzIpmxHSNfmBE+MKOcOdcOgG8lLNrT214Ywz/ZtrVPXt/SRVPuXanxELJ9RNPMTU132tho9RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135

On 10/31/2025 4:24 AM, Peng Fan wrote:
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
>   (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>   (2) M7 in a separate Logical Machine that Linux can control it using
>       LMM protocol
>   (3) M7 runs in same Logical Machine as A55, so Linux can control it
>       using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>   - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>     is fixed as 1 in SM firmware if M7 is in a seprate LM),
>     if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>     protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>     Whether using CPU or LMM protocol to start/stop, the M7 status
>     detection could use CPU protocol to detect started or not. So
>     in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>     status of M7.
>   - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>     the M7 LM is under control of A55 LM.
>   - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>     permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>     the M7 LM to save power only when M7 LM is going to be started by
>     remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>     M7 LM is started before booting Linux.
> 
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/remoteproc/Kconfig     |   2 +
>   drivers/remoteproc/imx_rproc.c | 192 +++++++++++++++++++++++++++++++++++++++++
>   drivers/remoteproc/imx_rproc.h |   3 +
>   3 files changed, 197 insertions(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>   	tristate "i.MX remoteproc support"
>   	depends on ARCH_MXC
>   	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV

This always evaluates to true.
If you want to ensure that when a dependency is m, imx_rproc must also 
be a m, you use:
depends on IMX_SCMI_CPU_DRV
depends on IMX_SCMI_LMM_DRV

>   	select MAILBOX
>   	help
>   	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 232eb91e0b5dc2432131b1c140d6688b073fea1d..1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>   #include <linux/clk.h>
>   #include <linux/err.h>
>   #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mailbox_client.h>
> @@ -22,6 +23,7 @@
>   #include <linux/reboot.h>
>   #include <linux/regmap.h>
>   #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>   #include <linux/workqueue.h>
>   
>   #include "imx_rproc.h"
> @@ -92,8 +94,12 @@ struct imx_rproc_mem {
>   #define ATT_CORE_MASK   0xffff
>   #define ATT_CORE(I)     BIT((I))
>   
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> +
>   static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>   static void imx_rproc_free_mbox(void *data);
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc);
>   
>   struct imx_rproc {
>   	struct device			*dev;
> @@ -117,6 +123,8 @@ struct imx_rproc {
>   	u32				core_index;
>   	struct dev_pm_domain_list	*pd_list;
>   	const struct imx_rproc_plat_ops	*ops;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;

Add some info about how and why this new field is used/needed.

>   };
>   
>   static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -313,6 +321,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>   	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>   }
>   
> +static int imx_rproc_sm_cpu_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, true);
> +}
> +
> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +			dcfg->lmid, dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int imx_rproc_start(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> @@ -369,6 +415,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>   	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>   }
>   
> +static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, false);
> +}
> +
> +static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return -EACCES;
> +
> +	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +}
> +
>   static int imx_rproc_stop(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> @@ -485,6 +550,37 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>   	return 0;
>   }
>   
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)) {
> +		if (rproc->state != RPROC_DETACHED)
> +			return -EACCES;
> +
> +		return 0;
> +	}
> +

IMO is simpler this way:
if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
	return (rproc->state == RPROC_DETACHED) ? 0 : -EACCES;

> +	/* Power on the Logical Machine to make sure TCM is available. */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> +
> +	return 0;
> +}
> +
>   static int imx_rproc_prepare(struct rproc *rproc)
>   {
>   	struct imx_rproc *priv = rproc->priv;
> @@ -994,6 +1090,102 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>   	return 0;
>   }
>   
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.prepare	= imx_rproc_sm_lmm_prepare,
> +	.start		= imx_rproc_sm_lmm_start,
> +	.stop		= imx_rproc_sm_lmm_stop,
> +};
> +
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.start		= imx_rproc_sm_cpu_start,
> +	.stop		= imx_rproc_sm_cpu_stop,
> +};
> +
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different LM,
> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret != 0) {
> +		if (ret == -EACCES) {
> +			/* Not under Linux Control, so only do IPC between rproc and Linux */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_info(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started)
> +		return 0;
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
> +	bool is_cpu_ops;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +	if (ret) {
> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	if (started)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	/* Get current Linux Logical Machine ID */
> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +	if (ret) {
> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check whether remote processor is in same Logical Machine as Linux.
> +	 * If yes, use CPU protocol API to manage remote processor.
> +	 * If no, use Logical Machine API to manage remote processor.
> +	 */
> +	is_cpu_ops = dcfg->lmid == info.lmid;
> +
> +	if (is_cpu_ops) {
> +		priv->ops = &imx_rproc_ops_sm_cpu;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +		return 0;
> +	}
> +
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +	return imx_rproc_sm_lmm_check(rproc, started);
> +}
> +
>   static int imx_rproc_detect_mode(struct imx_rproc *priv)
>   {
>   	/*
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index e4b9ede656506142b260aa7515823f489a168ba4..c05bfc4528f3b7518d4f2272d15fdeab1a68c2a3 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
>   	enum imx_rproc_method		method;
>   	u32				flags;
>   	const struct imx_rproc_plat_ops	*ops;
> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
> +	u32				cpuid;
> +	u32				lmid;
>   };
>   
>   #endif /* _IMX_RPROC_H */
> 

