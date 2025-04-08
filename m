Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E72063D3;
	Tue,  8 Apr 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123012; cv=fail; b=SvAhUZGuXbN98mekA3VsgbwFwxVrnIyn4raGpuCybUWEIn5y/hkQ6cv+m5rY/pCK67IO4RsHWuJv2ECyXnSXVj/+dafA6EVXhAK7IQGwN9c+X9O0KJjHVygvtiIeYPuUOZmklbZmcQrsqMAMG8JsFrTUca+m9ZrlK2YdO4u1ZFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123012; c=relaxed/simple;
	bh=wS88OBdXGP9cr7/P1vXMurpqFmKyjYy13FDKMzvFnIk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jvdHlKjSsFFYWmjztB37fHqud1iXWKd9fNNBAToFOissUC51VTGhrMb4uizva+qavGRLQuXNv7JRnAZomxx32La3aUYDm6Uiv72kjtfqbpFBUdKfixwO4DyOfuL9GOBxTlht2XoqL13PE/TkVfB0W/oDfIBYMrtOp/7PwCIOWKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RxWTYTd3; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RxWTYTd3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e21KoE6YaEGxlZyNg3CZ3+KJfWBdqbVHLQPPPyoYx/zQvPLIJjWZycZIyi6ju1muedEZm6Iy4+btJTVgSVrUL49hYKKYjVQwusICwHKSDh2ye5YEiPZfqjDUT+iswE0El6MLQS00mjbxu2ZGN6CH02XUaTO+sOVIEFEoyjdMxKp7IurnQXFOC2LV+Yvw7FAp0XyTtigDqiW8WPwgrXB1KerK4V44BIwXWk7aubVcv+d9yzmyNzl1bypg7CluVNbLylhMeVtRACBtKy2rNbMNHUSzSZhsADjm10WJKxb14i0llgOdZbiG+VOUFPX4uHHdmWXBvCaggUTFz2ZLkALf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm3czYCtv7nIslB/48sh0AksVzPXQdap5rkOBnOpGHo=;
 b=AUNsLRVZsn6DQTM28WXtvXV5kWlb9M2lxnfvWwvJ7fLV/5g410j49OOn/FcStT1leQTvrHiHzjR7NVFS2fOHvlCKrpnLh+ZO9zdjfR8tDziRXWUTaYInWgm/6CI3OhI3b8K3lJdjf0tWDboydTJAoXRkSS06X4WX8gAqrHoG0GpOV3tIepT+X27gV4luaAVJ2VJ70rLTFKH7HwwrmI1c8tEvw2SDg+Vf9eYMlwWnlgXjT4nyb3giHVSX4m/eX9md+WiTQdzXfLt7+laCmENCCZy7zjg0m1dmr5GDz8y0V2eIrsgklIoVJ4dPXfHeX44N9+bbg3plcw5QX6Vv/hmNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm3czYCtv7nIslB/48sh0AksVzPXQdap5rkOBnOpGHo=;
 b=RxWTYTd34p/r5pNJZY1nbft0zdmFiInc003LvyYgLnONweCQFcrfRYez5+g0GXs4Ueu1L6FctH33YumIElZN29XIhEQwm73CxUi+Xlt/xAEEJT0PExDUOGPDKN2derZt+L7EvG4i1MRDy5HZKPDrEQBheqZrKvXhJ4o/34t9QmJcnDonQaZlJ2T0oQe8F9fbnQg4kuhRZcBwNr6jwI6BOWxGVTEe2hENwag+Urdc+nFlMOAoMgGgUXN5cyJoSaBMPpS6XbMF8kUPqGz6twjnQQXUC3Xl0okW63aGL7mbwU3ZtS4aVF6B7/1bPiy1bRudYnKwH3EfMOO1rrejAT6BBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI0PR04MB10853.eurprd04.prod.outlook.com (2603:10a6:800:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 14:36:45 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%6]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 14:36:45 +0000
Message-ID: <5dcd3487-6411-4bbe-ba20-b2e5279e5310@nxp.com>
Date: Tue, 8 Apr 2025 17:36:43 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
 <Z_P6n5wQfGuSmV2B@p14s> <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
 <CANLsYkzNkgNs03oaEeERxuqrxfjcp3cgs346AnTw1aeOqz5+ww@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CANLsYkzNkgNs03oaEeERxuqrxfjcp3cgs346AnTw1aeOqz5+ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::9) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|VI0PR04MB10853:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d20bc20-6563-48ae-b0a0-08dd76aac99a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWlVTGkybTJWTWxVN0hxNlBwTFZMM0tRM3g0M3V5bnJiRWlTUy8ydVRMdGtV?=
 =?utf-8?B?UHJjbDRSOVoxemVKSStXVlo4N05HaGUvdm83c2JGZ0FlYW1ybFlSbmU2VEpF?=
 =?utf-8?B?cTNwVmdTRGhaU2w0V21xaEI4RzFYNE0vNzdzb3Z2MjFPeUxKZmJURzJ2dkxY?=
 =?utf-8?B?UzM2VHRhWVZOYndxeWVEQzNxTU4vTGV1bm1PNjNhd3VOTW84RE5lMG1yZTAv?=
 =?utf-8?B?M1ZCeDFnemhLOTNSeDdvaklUdUFsVUVkN0pEK2M2c1U3azJteGhyTThHNmds?=
 =?utf-8?B?Wk5OUWRjZkg1MGRSc0RpUmYwb3NiRnM1L0xHV1pqY1RmMjVDZVV3Rk4rRW1n?=
 =?utf-8?B?bVdwVmxFT3FobFI2YkNETmV0MG5xclp3TmxHZVlNb2pNUlRjZkFUemFVQkFI?=
 =?utf-8?B?SWhkU1ZCVDVKdkpVQ1ozdEtxTnM3bXlPa0VSS29kTGpWaWdIa1g3ODU5bEdT?=
 =?utf-8?B?TTRTLzlGNnZRcnN3ZldqQVl5eHZ0V05VRlBRcWJUNmE2S1pPMm9UNCtrMDdo?=
 =?utf-8?B?cXl3azVWSVc4MDBzM3RMaS9saUZFUVVMVDA4S1pqOHVCUnpkRTQ2UWZEWlN4?=
 =?utf-8?B?TURvZ2JOSWxWVUxzcG1ISEx0TDdNTDNla25DWGQ2Qytmd3I2QXNVeDcrZ1JH?=
 =?utf-8?B?WmZjYW55dm1iaEFFeklOcDVkNGZCbUZZbjBuVk9oZjdJMGJXVnJhaGpOSjVo?=
 =?utf-8?B?cGxWVGVYNEg0ekFRMnJ2K1dHQmROQkI3Zyt3RExaRXZEYlV3UWZnSy9TQnNa?=
 =?utf-8?B?bUw2b1BxdXQ1Ni9pR3BHV0RFeXhBaWttSjNPRHVZbzdpUjE1OGxCcjJ6ZmhK?=
 =?utf-8?B?OWdEaUMvOUcySHlIcERwMnNwSy8yNndnTUxaV094ajB0WnY2U28vT3BOalZK?=
 =?utf-8?B?RmhIbkxaVllodTE0YzZ1UHFDa3VFYmxFbGlJWjNTK0tKa0RMS05YNU5ibjZn?=
 =?utf-8?B?YkgwOU54MVdvK2t3bGNSOHYzN1lEMjJheitmdCsrNklVcU12ME5uRERGWlJI?=
 =?utf-8?B?cGhJcjU0YW9zaUQ1Qk5yNHdsZ01CU09YdkVWYlc1bC9BSUJuREphbEVaRG84?=
 =?utf-8?B?K1c4U2QySEpYZlVxYVZiRE1pcFpaVldYdVNSMFZMK0Exdk9SZDdpbkxtWmJP?=
 =?utf-8?B?UTBrcVovdm5LaEsvZ25jbEdDbEVtMUZGSldTbzREODlaT0MvUnhoSE5CdzYr?=
 =?utf-8?B?Y1hSNnBxTjk0cWNTWUlCclUxbXVJZ3hwVkxGVXJmV2RIb09pOXN2QjQ3TzNu?=
 =?utf-8?B?S3ZZVkdWVlhqZEloYWRCSEJISzNEaE05ckwvTVpuTlZuN3RWbHQwU3B5RHFQ?=
 =?utf-8?B?TmRVb2ROT204MkIraXZETjZzZkw4cEt3QWZhcVRCU2RGK0ZWVC9USWdqRlJ1?=
 =?utf-8?B?YVorYXRMV3VnRUlraUtrRnBXY0F6VFg3KzFUeGxhZFdkaENjdEhwNG5wUXh4?=
 =?utf-8?B?TTN0RG5xYU9pVkFDSGFqdHB6V0NlUE5HaDRXS0VSMFp5dmVjSU40cWllVndX?=
 =?utf-8?B?T2VrU25nR0l6a05IUmxlWjFpYWVsMUxOR1d2STFmUG0vYjlmNFlCYW8vQ29L?=
 =?utf-8?B?Ykk0LzB0cUZ1aDVoY2p2LzNnYUtUWWVtMWxqNTErb2NlaTkyUms3ekUxUjVB?=
 =?utf-8?B?QWJiQ3pSbE93c3dRRmF4M2p1eWNQcXR2bldHd2pORXJVcS8zMnJ0ZVRBZUJO?=
 =?utf-8?B?L2tqTGxZZWdwTkN1UHI0SWdNM3pSK1czMWlnMWNCY0c4VW55WjliKzN0UnRa?=
 =?utf-8?B?QkwvcGprV1h1ZUJmVDlYVGx5amF3NGJwelk1UFhwVlpsbnAvYTdjM2NWT0tN?=
 =?utf-8?B?bFl0SFgxVE1sOUZIalFCZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGcvUDZ2OW5iaFI2dGJZWDBQYkVlUGEzWktwR3pKdWlGRWc3YVg5c1l4QnJw?=
 =?utf-8?B?V0dkVU9IUThEd1YySVJZdDBNZDFDUGtQTDRsbDBDTElkb3EyZGNhd2RTY3ov?=
 =?utf-8?B?a2lCTmswQzlqTDZRN21KWWlrZFlTaFVRZ3NhVDlVOFpmUmpCc1JrbWRld3FB?=
 =?utf-8?B?U1VxV0NVQUc1ODJlVmdoTGtMK2lvT0tFMzZEYzlNT2RCTUM1cjV3RmkyYlY0?=
 =?utf-8?B?MGxIR3NOOURkN0diTXJVMWlrZ3NPb1hiZTFvdSs0MFBlc1lEZmR0L1hybjFY?=
 =?utf-8?B?UlNpYkl3RlpxWTRBV1VzaFlGZGJ4OEg0ei84S2dxNXdjNGxaUFZuSGg4cVQr?=
 =?utf-8?B?aThRaFlscFdvOXkrZ3U1RVkzZkZUeEdIbDhXYmFFcUh4OXN3Rk5mREl4NzRk?=
 =?utf-8?B?Y0lnRE10aFdSZDVsbkUxK2hmdU5mV0tuYjNHSnduQjNvVUE1OWdNbXVaMGJv?=
 =?utf-8?B?QUdPanZRR0YxQUI1RWNxamw2b1cxZ2Jja1ZZYmNRUk8zVk9YYzZCcHRFN3Nz?=
 =?utf-8?B?UTk5aWVSRmFtTHNST3o0YzJkRU5oZ2dOKzNvdmJwem84Y3krZVl0SUNJclBW?=
 =?utf-8?B?RWpFU0JVYTVVR25PYTlHTkxrMFhUc3ljaDhmWFdEUGpOanVwYkI2MktvclBI?=
 =?utf-8?B?SDlERFgyM0NvT285YzFSWVJjWXRDSitXeUR2MGlmR29ib0xBdkl5Wmg5SVk4?=
 =?utf-8?B?NkZzUHhuL3JxUk9qM3hZSGRvUTVlZWcyK0p3cmY5bS9YZzhkS3U4UFNMWXZz?=
 =?utf-8?B?REwwTXpyYk84YWhMeUY4VlFkdWx1YklDczRzTmJubXM4VlRsbUVLa3hTcnNO?=
 =?utf-8?B?TVFRVVRRQ0l1L2d2MGdIU1JlSVd1VU40VzhpUlY1NkZpbU1YTDArUzd5Z0hN?=
 =?utf-8?B?TE8rZ1l5ckJMcTlMaXhnOTY3MEQ4ODR5TjN4aUozQ2NJUkx3MDYwQjV0b3h6?=
 =?utf-8?B?MldLZ3NNaU1scmttRldrNDlWZjJ6cGU4dExRa2dmV2Fyd2Q3OUh4TmlkZkxl?=
 =?utf-8?B?aEp6Qmc3bzhERlMxSU1oS1FWLzhrd3ZuYTcrbEhRUXBtTU5oSFE2dXM1NjE4?=
 =?utf-8?B?N284T2lyVG52Y28zV3pFOFFUMDZrV1NBWVVxMkZRQjRMTU5reUEvMzdwa1ZE?=
 =?utf-8?B?UjcxY3hjL0JCZXl3a081UU9SSmRXUWs3VlI4eno0MTlIUHNvUitwNnFIL3Rz?=
 =?utf-8?B?YmpLcWZUbEcrV1J6ZS9lTjNtRS9HRm0rUzlNek10V25pQU16S3BWeHRsQnJI?=
 =?utf-8?B?SXJTdDNudWdvdW5HOUhhdFBJTUpPVGF0dVJBSDdEWWUwbXhTdEZ1SXBuQUdF?=
 =?utf-8?B?eGJpZE5tQUtaTXdieXBSMTNJVldmQklLNmo1WG5zQWNPcmI2YzMwNHdvenhJ?=
 =?utf-8?B?bnZqVFZvdnNEMEIxb1VtUFJJcGJoTWhJRmJVbHNBSTJLdjczSXVKc04ya211?=
 =?utf-8?B?Vml0LzlsRkRXOU8rT2hQOVUyVXo1THREaURUaUpjVFREMjQvMzlydllCWHNK?=
 =?utf-8?B?eGhHWTJoYVN6NXovOVNWUEVFWHFvSWd0UHRscWR1enNpdnBodUlnU2FlN01q?=
 =?utf-8?B?emdRVVJmUzN2dGdhTlNTQXEvbnVvd1hFZUszeXBrSko5OGJrUW03c09iT0RG?=
 =?utf-8?B?ZTZtdkExS3J6MlZ4MFBWNW5XdXhBRTBpdGtuVVBmTGU5Sjh0TzBESmFvOG1x?=
 =?utf-8?B?RFBxbUZzL1I2SzZYOXlSSnNnazFNZHovTWI2OWtmZFE1K2dEMnJvdEhCdUlT?=
 =?utf-8?B?NEdKRll1ejZjSWVQQTRjekxEODBsdlhYYXlHSGpuZEFrc1k4Vlk5MitINE1a?=
 =?utf-8?B?eWpaYlpPL3UxTUp0SmZPNGN5UWUxVlE1eG0zdzN4MGh3bU8xR0RmZUZBZzF6?=
 =?utf-8?B?bnE4M2xFWEttdkQxNjY5UTREVkRLakFmclExZHVJOThSR3IvQ09sYlErQlZq?=
 =?utf-8?B?N1VyTDliTjhWZnpLWW5KSHd5cEw2Wnl5Z1BVb2V3NjdvK1p3Wm0zeTFzUEZI?=
 =?utf-8?B?bHI4Y21FM3NSc0pYeno0dVdLUHlUcExWZG9mNDZFOUZDV0lpdXo4MEVRNjgz?=
 =?utf-8?B?eXVMMFJHWHNRTmhhMUUxRGhGWXQxbXJ2ajZjQ3E2MGd2YVY4NWpCUlgwNzE4?=
 =?utf-8?Q?PZvDjrNBRE/X7ScBuPAXHZjT6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d20bc20-6563-48ae-b0a0-08dd76aac99a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:36:45.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk2JorW9qr9Pjm02Fd7dlQ8sgt1+O4A/ClGnGZGM3P8kqvej649U9zZzW6PkWfjKCSgGAIDUH7Kr+GlsPsdLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10853

On 4/8/2025 4:46 PM, Mathieu Poirier wrote:
> On Tue, 8 Apr 2025 at 02:47, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>> Hello Mathieu,
>>
>> On 4/7/2025 7:17 PM, Mathieu Poirier wrote:
>>> Good morning,
>>>
>>> On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
>>>> From: Iuliana Prodan <iuliana.prodan@nxp.com>
>>>>
>>>> Some DSP firmware requires a FW_READY signal before proceeding, while
>>>> others do not.
>>>> Therefore, add support to handle i.MX DSP-specific features.
>>>>
>>>> Implement handle_rsc callback to handle resource table parsing and to
>>>> process DSP-specific resource, to determine if waiting is needed.
>>>>
>>>> Update imx_dsp_rproc_start() to handle this condition accordingly.
>>>>
>>>> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
>>>> ---
>>>> Changes in v3:
>>>> - Reviews from Mathieu Poirier:
>>>>     - Added version and magic number to vendor-specific resource table entry.
>>>>     - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>>>>       - By default, wait for `fw_ready`, unless specified otherwise.
>>>> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
>>>>
>>>> Changes in v2:
>>>> - Reviews from Mathieu Poirier:
>>>>     - Use vendor-specific resource table entry.
>>>>     - Implement resource handler specific to the i.MX DSP.
>>>> - Revise commit message to include recent updates.
>>>> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
>>>>
>>>>    drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>>>>    1 file changed, 100 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>>>> index b9bb15970966..80d4470cc731 100644
>>>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>>>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>>>> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>>>>    MODULE_PARM_DESC(no_mailboxes,
>>>>                "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>>>>
>>>> +/* Flag indicating that the remote is up and running */
>>>>    #define REMOTE_IS_READY                            BIT(0)
>>>> +/* Flag indicating that the host should wait for a firmware-ready response */
>>>> +#define WAIT_FW_READY                               BIT(1)
>>>>    #define REMOTE_READY_WAIT_MAX_RETRIES              500
>>>>
>>>> +/* This flag is set in the DSP resource table's features field to indicate
>>>> + * that the firmware requires the host NOT to wait for a FW_READY response.
>>>> + */
>>>> +#define FEATURE_DONT_WAIT_FW_READY          BIT(0)
>>>> +
>>>>    /* att flags */
>>>>    /* DSP own area */
>>>>    #define ATT_OWN                                    BIT(31)
>>>> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
>>>>
>>>>    #define IMX8ULP_SIP_HIFI_XRDC                      0xc200000e
>>>>
>>>> +#define FW_RSC_NXP_S_MAGIC                  ((uint32_t)'n' << 24 |  \
>>>> +                                             (uint32_t)'x' << 16 |  \
>>>> +                                             (uint32_t)'p' << 8 |   \
>>>> +                                             (uint32_t)'s')
>>>>    /*
>>>>     * enum - Predefined Mailbox Messages
>>>>     *
>>>> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
>>>>       int (*reset)(struct imx_dsp_rproc *priv);
>>>>    };
>>>>
>>>> +/**
>>>> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
>>>> + *
>>>> + * @len: length of the resource entry
>>>> + * @magic_num: 32-bit magic number
>>>> + * @version: version of data structure
>>>> + * @features: feature flags supported by the i.MX DSP firmware
>>>> + *
>>>> + * This represents a DSP-specific resource in the firmware's
>>>> + * resource table, providing information on supported features.
>>>> + */
>>>> +struct fw_rsc_imx_dsp {
>>>> +    uint32_t len;
>>>> +    uint32_t magic_num;
>>>> +    uint32_t version;
>>>> +    uint32_t features;
>>>> +} __packed;
>>>> +
>>>>    static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>>>>       /* dev addr , sys addr  , size      , flags */
>>>>       { 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
>>>> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>>>>       return -ETIMEDOUT;
>>>>    }
>>>>
>>>> +/**
>>>> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
>>>> + * @rproc: remote processor instance
>>>> + * @rsc_type: resource type identifier
>>>> + * @rsc: pointer to the resource entry
>>>> + * @offset: offset of the resource entry
>>>> + * @avail: available space in the resource table
>>>> + *
>>>> + * Parse the DSP-specific resource entry and update flags accordingly.
>>>> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
>>>> + * to signal readiness before proceeding with execution.
>>>> + *
>>>> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
>>>> + */
>>>> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
>>>> +                                void *rsc, int offset, int avail)
>>>> +{
>>>> +    struct imx_dsp_rproc *priv = rproc->priv;
>>>> +    struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
>>>> +    struct device *dev = rproc->dev.parent;
>>>> +    size_t expected_size;
>>>> +
>>>> +    if (!imx_dsp_rsc) {
>>>> +            dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
>>>> +            goto ignored;
>>>> +    }
>>>> +
>>>> +    /* Make sure resource isn't truncated */
>>>> +    expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
>>> Something seems odd with this check... I don't see how adding
>>> imx_dsp_rsc->len with 4 will give us any indication of the expected size.
>> The fw_rsc_imx_dsp structure is based on Zephyr and OpenAMP ([1]).
>>
>> The imx_dsp_rsc->len indicates the available resource size. Adding 4
>> bytes (for uint32_t len member) gives the total structure size. If this
>> does not match sizeof(struct fw_rsc_imx_dsp), the structure is incomplete.
>>
> Ok, but why is adding 4 to imx_dsp_rsc->len needed?  Why doesn't
> imx_dsp_rsc->len already contain the right size?
>
> The size of struct fw_rsc_imx_dsp is 16 byte.  From your
> implementation, it seems like ->len is equal to 12 and 4 needs to be
> added to make it 16.  To me ->len should be 16... What am I missing?

You're correct. In my implementation, len is 12, which represents the 
available
bytes for writing additional data such as the magic number, version,
and supported features. This is based on my understanding of the len member
from the OpenAMP [1] and how I applied it in Zephyr.


I will update the code to define len as the size of the struct 
fw_rsc_imx_dsp.

Thanks,
Iulia

[1] 
https://github.com/OpenAMP/open-amp/blob/main/lib/include/openamp/remoteproc.h#L356


>
>> I will also verify with avail and send a v4.
>>
>> [1]
>> https://github.com/OpenAMP/open-amp/blob/main/lib/include/openamp/remoteproc.h#L356
>>
>> Thanks,
>> Iulia
>>>    To me
>>> two checks are required here:
>>>
>>> 1) if (sizeof(*rsc) > avail)
>>>
>>> 2) if (sizeof(*rsc) != imx_dsp_rsc->len)
>>>
>>> Otherwise I'm good with this new revision.
>>>
>>> Thanks,
>>> Mathieu
>>>
>>>> +    if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
>>>> +            dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
>>>> +            goto ignored;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If FW_RSC_NXP_S_MAGIC number is not found then
>>>> +     * wait for fw_ready reply (default work flow)
>>>> +     */
>>>> +    if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
>>>> +            dev_dbg(dev, "Invalid resource table magic number.\n");
>>>> +            goto ignored;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * For now, in struct fw_rsc_imx_dsp, version 0,
>>>> +     * only FEATURE_DONT_WAIT_FW_READY is valid.
>>>> +     *
>>>> +     * When adding new features, please upgrade version.
>>>> +     */
>>>> +    if (imx_dsp_rsc->version > 0) {
>>>> +            dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
>>>> +                     imx_dsp_rsc->version);
>>>> +            goto ignored;
>>>> +    }
>>>> +
>>>> +    if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
>>>> +            priv->flags &= ~WAIT_FW_READY;
>>>> +    else
>>>> +            priv->flags |= WAIT_FW_READY;
>>>> +
>>>> +    return RSC_HANDLED;
>>>> +
>>>> +ignored:
>>>> +    priv->flags |= WAIT_FW_READY;
>>>> +    return RSC_IGNORED;
>>>> +}
>>>> +
>>>>    /*
>>>>     * Start function for rproc_ops
>>>>     *
>>>> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>>>
>>>>       if (ret)
>>>>               dev_err(dev, "Failed to enable remote core!\n");
>>>> -    else
>>>> -            ret = imx_dsp_rproc_ready(rproc);
>>>> +    else if (priv->flags & WAIT_FW_READY)
>>>> +            return imx_dsp_rproc_ready(rproc);
>>>>
>>>>       return ret;
>>>>    }
>>>> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>>>>       .kick           = imx_dsp_rproc_kick,
>>>>       .load           = imx_dsp_rproc_elf_load_segments,
>>>>       .parse_fw       = imx_dsp_rproc_parse_fw,
>>>> +    .handle_rsc     = imx_dsp_rproc_handle_rsc,
>>>>       .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>>>       .sanity_check   = rproc_elf_sanity_check,
>>>>       .get_boot_addr  = rproc_elf_get_boot_addr,
>>>> --
>>>> 2.25.1
>>>>
