Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5077C258CDF;
	Tue, 14 Oct 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434391; cv=fail; b=XpiiilD2wsvV4PGUGVx2dnZYGpFI/VVtQ+Mh+zDyLPp4LqFfSPPCd1nCuXllBwnMKKa0RRtzyrS+AfUpq2g61A5d29tJQmVrI5iemjsTyu56PX7+/lHh6TixBn9T9DafNK0LMyYCQ01zSHbOIGrGotu7G+z8akbeTsPge2hCGnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434391; c=relaxed/simple;
	bh=GxNpgViIlvOolgiT6SCLkjXmmYJbEVXZ1/zC3hlamd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Vj453eljZjBlxhl4cyPOogO8Iwf6nO28r/tksYxNpv7M37zZ/QPoXEYIuGFO0al+N1J5puzfNb2ywhXOdLlLMJmbypheKQtCF8YimeReZ0XyqL38UPPWjle0vdAnFbEgsfZvmJmJLu0YuEoHkUffIGsDJgu8bQa3VU/eQhYJqRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zyiu/FyM; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zyiu/FyM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STceudTEPotplc3tYbCMRjLSaioatGH8IdWi4rOfbDjgw1twcQJWJnfiPq/rMtCL4HI0ttl+O/XqDcEfPYenolbowTcbLCyjOHk9+cilh47aPNqNOaiL9nPUpNenDIEDP4h/Ck26wSRPjhtrMugJO17dvoVHg0gq9VLy8uYT40Z9QHNwttFioZJ4Wdg7E93N+CkAXlWatUc/8XgAKpBl1sXv4hEAE8UP1+YfHVZt47THcz1R2Ci8Y5l8O0kvn9fhA24kfLwSXXIBN8sO10lpkOfqKGpvwd2NTIFRCYEvYBrdCRx4rYb2d1Am7dMWAV4JN9xaIWVAPbMrP+HY+Agijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCCXIM5T0TOqfqKvegOHXMkLhGmMz0hMvJSxOkBBqzQ=;
 b=ruIc6NCfrHLECuYxN9pVno92iON04IxY3DEiTpnn+3ZZDyK1Wutalb/drM9E0RT31E4Fp3sfPMD/XFpR1FzS6TnuLMCNO3B54tApL1AQN0FR0aRBb5j2lHCLLYnv0icgjtC256rsYpRw2wQVF1u1O0x/nk2nDCvrOsJPOhIbAKWTKpDkyB2es26YtNY4DertGdIIgGjBBVs17ibtVs028E0TJ7fuvi9Uxd3Yw6g3khYEZZ/hIBorDTOP+y8ubU+Fh1bIzU/hjJgwhPYoqeOuvInIcq1OFHSNOFRijS9eGeR0nsQM7X6k9pCF0pHdqVzxUvscY63xQYatHYHPHcaznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCCXIM5T0TOqfqKvegOHXMkLhGmMz0hMvJSxOkBBqzQ=;
 b=Zyiu/FyMlk4qcJwoo/hXAfz9LmBVCAzbWN/tHWCQHTvLauqVIgRWkkydt1y+wzE+ukddWfhu+wwc8uyzRnCEBrVPFT0svZTWGFz8KJaD7Hm2Ae6oxXxRIzSg0HpISISQHDby7uyKDmnSpoXL6Jo+VJ0kOXG5ifHQTNe5TYHBLHIjxwdjFRaXuqNUD9nzxS15d0vtd8tSVJudQBKCBwWhloljf8ERTBMs9beL49wm0F+wvk+ejhD5HlXSyc4cSYrIWQOwblOab3xpNrOojUpjedKl8D2Q7AqT60Yhd5b5x7X0nNTZZ91OsTooeOBZJYC4Zm4UfbnShdTurr6/YWsSdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11174.eurprd04.prod.outlook.com (2603:10a6:d10:172::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:33:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:33:00 +0000
Date: Tue, 14 Oct 2025 18:45:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <20251014104511.GA14479@nxa18884-linux.ap.freescale.net>
References: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <202510121908.7aduLIkw-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510121908.7aduLIkw-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11174:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3c19ca-3b81-4341-0c68-08de0b04aa62
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AADaUHozjHEwJO3gpab0tYvIi4K6rzxskWSRDuTGSWdK1NYf1Jq/Xkgc0Viu?=
 =?us-ascii?Q?cnA8iztmyH0vYUxrg8H7LA8SboPJV7WPzb2pI76QSYQhPoBZBJ4Nf9QZmduv?=
 =?us-ascii?Q?PmI/PGmZXoxmCzVcDRzbhy9c617YiTvTLkBj9dB81fSNNGDQTkAuAjH121wX?=
 =?us-ascii?Q?7SP44ca3IO+LGXNA+/9T7aMfp2X7L51rAz6G0vmIiJxi821Y3wBA3c/1HcIv?=
 =?us-ascii?Q?tU70sKCmnpSYjASW783fxfdik8mkjrgTIjntucV8A2DzjDRw9d/NKwsZKYQs?=
 =?us-ascii?Q?H8D6gVQ1v0grL7oMO2vE4oCzZPB6pkJHBuVCYu2f8wkC7zDqIQ+KskkhnRKq?=
 =?us-ascii?Q?8kPzfd094HhXUeuEAlH7kW+M4CAYF/TakvuTVu0p9SRCcVaGPn9fCdYwRexb?=
 =?us-ascii?Q?ltWxAyCGOGxB5r6DfEAM2bUc23F58W21f/BMSIFSsYf5eWH+TnJYKogj2q7v?=
 =?us-ascii?Q?8adAf/jEWh6vRQHsjSp5tdci8qLRQewYLIG31c+sClZ3uBK607BlyisIMuVF?=
 =?us-ascii?Q?aHCvcPeFlcbk4+faGe7fDjyIk0R3VL8/PxIuPhZAksrxIMyf0Sqms2POZOD/?=
 =?us-ascii?Q?2tYyamJsTht6sxP9jjMQI8HsksrshvA/dyIlbHcCvkpg9oaMgRFvfCXcFuVX?=
 =?us-ascii?Q?y7+vbFJ43LlpDE54Cwx6nGGsCZc2hUGHf/COejCYOz4cCnIxNMLf6dVg2Sj4?=
 =?us-ascii?Q?t5falaRAgtpsE7nHTHD57tvQPSZpaJ5inY9h7i5YG4I6hTPWt4tM0uZBKGgl?=
 =?us-ascii?Q?f8MYMZLX/sMYMEeHkZw7L/z8921k0KCBlG/WqE4DXLf2/kVQxPRX+hGDSlYz?=
 =?us-ascii?Q?dy4u7xW+jDrp2PItA/Og2WUWzKmzMyRRSeYikqg661perMK8IJwClRgakq/8?=
 =?us-ascii?Q?a9CGRHWOK9/5+HQMsLOMmNNyG+9G/4bP6lxQ/i8HVjvTddGvR8zvFsrk84IW?=
 =?us-ascii?Q?JYE/OTb4ccTCjyWQzGEqrdTZ1tjtS8I37diIDq9mXumO+7KDYOrzl6gViVHM?=
 =?us-ascii?Q?5EdfgELV5J2lSlvuqTSTBmswABmJob1GlCDj2r2SoKZNZ6Cv9wq0ZJTgIpj+?=
 =?us-ascii?Q?5wbUHisw3RT8ckIPG+Qwqs18PexVSM3Mo9g6b41Kv/Fg8heU8QT3aukCwrmL?=
 =?us-ascii?Q?T2DCOtUN6jDZmxP8UZmBwY/+YicYxHI2WVuoHY0zmqdEo7qN3O87fNma1Dmp?=
 =?us-ascii?Q?AR4aqKkkid9AxmeGfZCgir6kT8glTatPmatnmnPx9ooezJuMCf2YrozCWuRF?=
 =?us-ascii?Q?p47138TRmQaSpqYP3wsHslQjr0STmKgYHc4ntjVTIzCy8s4y77Ky8KyrKv+c?=
 =?us-ascii?Q?Jj7EvKZlegShYk88a+PI8mh2FJPMUOBkKqTv6cQqeevfjPzjjTs4lftxxo8v?=
 =?us-ascii?Q?0mOEmj6N8qm+wqFmxcsVT0ULdO66M5fqsn7cRW6jaDXAMeuVoa51p0C2L300?=
 =?us-ascii?Q?oZCWXAwBikMAOSD5NlW3MjUevV5ZOrzDZ7kHz7YY4BaiOEyNN0w05PfPY6+i?=
 =?us-ascii?Q?zeYznTFdv/9sNjiVPQ7aSgTDZ6NtpcR6gm0q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2bq+rDXYVQGHNBmHHomg86LUd7J64ZIYgOaHLYKGAWwBUObjAGGqa3SkjcVj?=
 =?us-ascii?Q?isUIuxdnGGN/c62REkXvallpq7GqcoHxzW3Uwc8H0o8K7/nadnvz/RQFKNWw?=
 =?us-ascii?Q?hfWPwslBv64aJxACCnUqb2gz1Er4e13qPMbTxpvRAhgeRd+X4QArRQZqwhGN?=
 =?us-ascii?Q?GUrIABB2N8m6m/FpRsV6iugbg6v5xT1t6X3Dv/JpTQtxkdT1AzrUyt9rf6kF?=
 =?us-ascii?Q?l2U3whjTQIh4nsUFhkYTGHnHDPxJp8FvL1aj1s/kzou4+uyQh+H9f9xE6BY4?=
 =?us-ascii?Q?+EERPkkWhD5nCWw3Quzen5r664fP6b4KhATLVo0SEGculY6Y9DO2TTgStBMh?=
 =?us-ascii?Q?yMOdTAziRPdEmV1R2HgSIDzOnXTcMS9KWBaefQKgNrtq7OKOz3tqiM8AtH/v?=
 =?us-ascii?Q?2+3GZTf0iJE4GyahtROIFScaaZLtLwfE+bIawWnYGCsxpaJVnMfgfw4Ez+44?=
 =?us-ascii?Q?0IDtbShnvOs/b1SHkMMu7y4KP8bRMdwqd5x71pPQg+7tkIuoIXNUPGnoaDt9?=
 =?us-ascii?Q?BnKEPtugnrawaaadZvtsylYfx/THCWiNPalG3W9rR6QLs1Q8pWJGGNKlROUC?=
 =?us-ascii?Q?oRmkHlVFUH0i4qnLLoqNbaoMGVCug/UiSL/DT9CmOV2iyLUBfXu0YK00qYna?=
 =?us-ascii?Q?GRYAAvfG5FnFH8TMoP1JpuWYWumjBAMVX2SK5JIiriXLeN1ZiVCqKCQbB2xD?=
 =?us-ascii?Q?CJk4KRNbZZWPbZ0nmWhzfDd5qOemhsdzWGE1lTPaUfgTBuSSAMm3cvHGdcpW?=
 =?us-ascii?Q?K8MKK2HeNp8NdAYryR6f2sqeEoMpF+CyzTpy7bRrj6iJqV+f5cLFnoyRzsRL?=
 =?us-ascii?Q?8b5T4kP6bh94sVoqENBrUvIIbyVv/imms5YI60NTj8KVjiDJIsVujXeuyiJf?=
 =?us-ascii?Q?BG3YwL/5vajCGEvw0bXL4NZr3KnBDOTpfwdVJdz4VTrwdZPYg64wBahuU1O0?=
 =?us-ascii?Q?2G/TCcntYMzZ3LeLDFjykWG/6buGoCqkvq3wSI6qviubeIDZXffD4t5zhZAr?=
 =?us-ascii?Q?vF7Lf8eH+giG1z/CzC/CdrcT9lNXHUJo+cSbUBXu4L2/1Almba1DwZsRsw9V?=
 =?us-ascii?Q?jP63qLz6lwdT6gIjo5tnUgCxLwxGgNubz1kn2IpmEQPoSavTnpYj8qw9WYdU?=
 =?us-ascii?Q?xN8gIGn9Ud32GS9e5Fe+hzmdVBuPFfsK/36gP12kO4Pb2c8eOZkA6qnGLafv?=
 =?us-ascii?Q?XFGnn0Q87WMoPWHivtliX5/I5kt7d8Xv+zPt5aj4N+e4JD04YLXV82kPAhLT?=
 =?us-ascii?Q?12ky5wucq2cj1yiJHfWaM8CVhX8GUmUwCIGkipeA6wRZfBMZgxwnS3bJMQP9?=
 =?us-ascii?Q?SbuAw1qvZsHkh53NLjPOYqp4F/PQPTCfKD7PPvlIGfho5CSeCIBpI58FkrWU?=
 =?us-ascii?Q?XbmrB5+3BCRgxcgJqge6bKp1gZegoxbPJogCVFE55FEk70B6MxBAt72wIyAN?=
 =?us-ascii?Q?3Pb/7NUU+CVq+8vHo1tdAw1ELS0Ac5V5IVov7abo4PbEh+ME7Wd1jlJIwan5?=
 =?us-ascii?Q?qr2Cu+wUu5JfWrunZPXnTLc6OfNWewlLtaVINTVLbxBBNfHe+v6EcO+FUDzd?=
 =?us-ascii?Q?2S2j+dryFJgLtcyosudcIcBRhyyVuIuj2Odx4HEt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3c19ca-3b81-4341-0c68-08de0b04aa62
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:33:00.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfiyguPahPqP1WKMX8Js2iJ0lB//cpLRv/TpJKE9f0PG79DrH+DUJLXOjYGsM73rarjYEu4HiJZM5a47cL5zcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11174

Hi Dan,

I am not sure, Is this false alarm?

On Tue, Oct 14, 2025 at 11:39:41AM +0300, Dan Carpenter wrote:
>Hi Peng,
>
>
>vim +/ret +1841 drivers/remoteproc/remoteproc_core.c
>
>70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1829  int rproc_trigger_recovery(struct rproc *rproc)
>70b85ef83ce3523 Fernando Guzman Lugo 2012-08-30  1830  {
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1831  	struct device *dev = &rproc->dev;
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1832  	int ret;
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1833  
>c42baf6f84c7694 Peng Fan             2025-10-10  1834  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
>c42baf6f84c7694 Peng Fan             2025-10-10  1835  	ret = ACQUIRE_ERR(mutex_intr, &lock);
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1836  	if (ret)
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1837  		return ret;
>7e83cab824a8670 Sarangdhar Joshi     2017-05-26  1838  
>0b145574b6cd2b3 Alex Elder           2020-02-28  1839  	/* State could have changed before we got the mutex */
>0b145574b6cd2b3 Alex Elder           2020-02-28  1840  	if (rproc->state != RPROC_CRASHED)
>c42baf6f84c7694 Peng Fan             2025-10-10 @1841  		return ret;
>
>Please change this to either "return 0;" or "return -ERRORCODE;"

ACQUIRE_ERR should already returns 0. This change does not change the
assignment to ret as my understanding. Please help to see if this is false
alarm or I miss something?

>
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1980  
>c42baf6f84c7694 Peng Fan             2025-10-10  1981  	ACQUIRE(mutex_intr, lock)(&rproc->lock);
>c42baf6f84c7694 Peng Fan             2025-10-10  1982  	ret = ACQUIRE_ERR(mutex_intr, &lock);
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1983  	if (ret) {
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1984  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
>c13b780c4597e1e Suman Anna           2022-02-13  1985  		return ret;
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1986  	}
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1987  
>c42baf6f84c7694 Peng Fan             2025-10-10  1988  	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
>c42baf6f84c7694 Peng Fan             2025-10-10  1989  		return -EINVAL;
>5e6a0e05270e3a4 Shengjiu Wang        2022-03-28  1990  
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1991  	/* if the remote proc is still needed, bail out */
>400e64df6b237eb Ohad Ben-Cohen       2011-10-20  1992  	if (!atomic_dec_and_test(&rproc->power))
>c42baf6f84c7694 Peng Fan             2025-10-10 @1993  		return ret;
>
>Same.

Same as above.

Thanks,
Peng
>
