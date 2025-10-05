Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D973288514;
	Sun,  5 Oct 2025 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673707; cv=fail; b=nJqtIiovr02qXB6rtE9qniuxAoQ2rkoI6/MwrcqLjrO2zvGnUJieBE13RUoFcgm31l6DtAAT1xa+SAmP8N0Z2t7JJ8HbynixpwpiHuHfAOPHrneVTlOCC2IpmoWVOkoYg5bZX5L0Vh/xxj192X+LgsHtUjA9wNDeQlHyxrwfwRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673707; c=relaxed/simple;
	bh=eSHWbpsXz+4hMLeOs9Vx1ZUKZo8i7f6XJf/76ah9gIs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZigvKcfwCdtPqQDjlp5DSPyvNX55muJLeRiFjBXO1fVbooF6WofGcPuQ3uBHX3Vg+5QbEDdyJ/nYyWgoWzulzNPrsIRPai8O8nEvKxJWFQ4rVjqmrjYiKXr58dzRydHI19EZ4LqA3LEAbeljOeaVgc7rKhFAu/duDc+z6KVxThw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DK/SAe/y; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DK/SAe/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvV8olxGBigNaZncIIiZXAcv2+hr1kfuFBiRaY8jRQNdFhIRP9sYbbMPeTrOwKLKaihqiHr7nOE429OqjFZz+nJm/Xnf5/hIiZEDTiNltAYM69ySUhUP+Yl3rrMXQ3WBvrF0EgD3f8V1GghtdcN4xvJKtHaz8B18gbAJ3CH/Uu7sinEaJnRColN8ziJXj2gSGUIHXGtHsyjZivpjgDv1MYDWR9eFoIHi8+mqZ4+jklTQPWftkZSPVoT1PPOch6qG4oXzLbRQuenjjPibTDQfeLmJpPX1d06Dxzd1/laWreGoGjR/Z9e+VhmSeCF+/E+CBbMQPNBRsnBdpvw1LKxHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wziQ6CiULI6gzCZYLiait0jMyOlJyH1NpP4W8pafVLY=;
 b=qnuBZIxjCZUsn2jvN5k6GHAKPEWEr0adw1Fxlq4f+Q6dxqUtm7Cs0iPUlFMPWujrcN+pWf77qNuBALxAkpa1LXPirznOlZW4OVSg5B5+ffRIGwZHpcZIsFjaRhY73HupxmhudDbWjS5UYDNjA7e34K/rUu1+QP5dZGL61Wt92W6B3JoWaKWMti4F27m5yWoM8bE9hCegkCLh4VxLiRZHahbG4pnOHO/hNUnRU5W0Xzcewp8L8rWh12Haxhsn1a55cz+MNTL21pThvqKTzzo7X5x+9qulEE+SSd2DfQJ5WUG4ufcqEXEU8H3ydCUbOVl5bXknouS0gBeDWIFTpjKP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wziQ6CiULI6gzCZYLiait0jMyOlJyH1NpP4W8pafVLY=;
 b=DK/SAe/yqv9YqktFZOqey1J4i64d8X9dtV5EYP0WkhQ+UXRLSDPGFd3fNpumzPDXch/1fNo8dPT/42kU41EDVCMdSYVtJY0wOK+UggCUf7mMvWb3V/J0p8bVHvjzAYjAABnsg5ea3+lyLzJsBX8gDlKPkmDg/oUQpnljsm3xk0aOra5fNAwPUkQEFiHiUseo33r7cKuSVEZgMmCFrN0bF7lBkn+8lKSWAVYtX1uoqTHmtDsMeZ5n++BQm/5YxdDAjVlsPzRxK5EeCzNT/nE8pZgbCswpuimH+RU0yvp4qDbPC6tdD2OjtM7HA3U05Rz8Ro2shNYd/OQO5ahxn/3esw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:14:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:14:56 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:28 +0800
Subject: [PATCH 3/6] remoteproc: core: Removed unused headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-3-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=1240;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=eSHWbpsXz+4hMLeOs9Vx1ZUKZo8i7f6XJf/76ah9gIs=;
 b=c6Gk9oQgZBpgkTQmQT+Lrd9lsI0euuigNNG1zLdCQBnbwx9wn100GsNs/sbFmNFDGTwMuD9gV
 Z5DXH+jWeVVA+xuEM5MOedznELe/kHAgV6JHMuPQ/abzWUo6Kna//q8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10452:EE_
X-MS-Office365-Filtering-Correlation-Id: d80bbd37-31fa-4b27-6386-08de04198fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGJPN2JzbmpIY2pUd0t2Rk9GKzVMc01WOVpaTVluRWhDSjZTNmZsZThieUNJ?=
 =?utf-8?B?ZzhlSS9NOElrS1RVRitSNWtyQ3hkcXl3c0dQVGRzNityWkxIWkNydlE0KzAz?=
 =?utf-8?B?MXBjSnF2MDJCQ1ByRmt2ZWRHZ1djblk2ZlFKLzRzY1oyNmNORE43TTVndCtp?=
 =?utf-8?B?NGsxME16L3NMcnlobDgwbC9hbXJiL0JxNlpLMkxkbW5keGNOYWJXVkU1MjFT?=
 =?utf-8?B?OTdseXd0MVFjYjZ2T3lrQVZqK0RMTVVlZUZ6azVPSHVCU3RQZ0pVaWdKVnJu?=
 =?utf-8?B?cWxETWxxcHFZVkFjY2NIUUpHdUJqZGJIL2h4eVNjWDJYaTBMV2NtR0hDdVNr?=
 =?utf-8?B?Q09zNk1Db2ZRRGMyN21VV2cwa1lUbnhJN3doYUt6bFdEbU5acE90Sys3ell2?=
 =?utf-8?B?bmtkallBcnZnU0Vtdmgzb3UwRGl0K3VDUHdnMzRZYWJjempaRnRzTlZBYTV5?=
 =?utf-8?B?NXpydjdJWlhwT2NyMmt0SnB6VmM2QmlkWkM5V1lTWDdpeTkzUW5lakZhamVl?=
 =?utf-8?B?cUVTanVxTVhWdzJ2ZDFSSURYMlF1amJuV1E1Wk9XRWFTdHRFMVQzc0RxNHBZ?=
 =?utf-8?B?UnU4MVg5VHg4cUhjVHJ3RkN6YVVEWUE3ZlJEZXdiZG9NTS85RGNyQjhkc05Q?=
 =?utf-8?B?NVJiZElYeExoNThaazJ1V0VFYmJQTDhDN3g2ell4dUQrYnRWa0JmU2Fqd3dy?=
 =?utf-8?B?UW9JZWh3V2VUaWJMWUlWaHFQc3g1UVlTWHBWOXdJUjg1RTdFa04xVDBjWFhm?=
 =?utf-8?B?ckIvb3VTS2FRTkdCMnhTcm1WLzZuS21jRDJlcTBPTXgxM2RteitRa2RvQ01o?=
 =?utf-8?B?T0VkNm1MRDd4cHAvSXZnZkRHSEtsSjQ4WWh2c21mbGdkNDBVcDFtdlRKZG5m?=
 =?utf-8?B?bTY1alZZa3ljcm1GdmJOdDBPazM2SDlqR2lZckJ2dXJzamJwdG5wY2owWUls?=
 =?utf-8?B?elN2L3lYakZoT3JyS0cyTTk0c1k4UUdVSzNzd05NZEsxNnRmL3dnV0E3NGlx?=
 =?utf-8?B?cVQxV3kraXJhbHg0SjZpU3JDVE5UZHNUVWZzK0VCL08zaC9reDRHWmRVOUtS?=
 =?utf-8?B?Q1M4UytJKzJVZVFBSlR4enVCeDEwelVXbkZYVG1kRXp1SGhXeVQyczhNeDRB?=
 =?utf-8?B?cHl5N1NFenRVMVovSCtvOTl6di82KzRkdGVxOEFsQVd6bXhNNmoyTFBlcERM?=
 =?utf-8?B?OUxYekJiZnMzd0ZpYlVnWCtZU2hiODFuK1YrYjJqTGpIS3hEYVl3ZThENngz?=
 =?utf-8?B?SGpRTWM2eXFOQ0xkNDB2Mi9IOEFJQThGTEhPRG80WTN0emRTeTYzSHl5QU1u?=
 =?utf-8?B?QVNNQnByMjVHcFhrM1FyQk15S0dpNGFFQ2hlbTR2aVNVZmFzeXBVL2IwWmVh?=
 =?utf-8?B?NFBDSGFXSlJaOVFVWXlERHJSaTBYTUhNMlQweTcvdy9HdnhTcVpwRFRtejNS?=
 =?utf-8?B?UWluSlp6cm53RWR0aDJFRUpzc29yWWdpNFRocU5nbjB3THpIM1RnaFBib294?=
 =?utf-8?B?eGY4cy9GWWxlTjNkbXdoU1FyQXd3dW1IQ01RMWo2Zjk1enhxbzJFZFhuNEd4?=
 =?utf-8?B?MkgxdXN4K2V3dGVoOEJoRGJ0YXlDNGpueTIreXMrT0pndWVQOGpJN1l5WWUx?=
 =?utf-8?B?c29LR3RzNTR3UlNwbFpsMG90S01kVk5xNlF2VHdFcm5LbU9QRXgxSjNIK3A2?=
 =?utf-8?B?c2RuQWUvZE96TW5TbXU4UXhZS3ZzcU5aY0Q5S3dWV0lzSmZOV3N2cUdPQnU2?=
 =?utf-8?B?QmRmOSswamp6NExITGlQNHhZbk9GT2hVMkdaWHRleHpLUXBxNGZLeVB1SWt5?=
 =?utf-8?B?K1pnZHZ1TGNxL09FNS8wNHZDSGdJNTI5R09QMmFYeG1GSDExUzJaRnBMbWVC?=
 =?utf-8?B?OGNQd2tkcVYvcm56RDVEQVdQMEpNR1ZGdFdQSk1OZVJxSSt0dGpVUS9DKzZK?=
 =?utf-8?B?cSsrN25VTDNETmFMcmZRZEo2OFhqU2Fkdy9NKytDMkZzTU1zZXh5ZnNnL2pw?=
 =?utf-8?B?VG11WDJFTjJhenRlOTJ1clM1aXlwNWlmdkZwN3RuaVBFaVV5ejNoeXZRc3d6?=
 =?utf-8?Q?1Sk5ZD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmhiRWVPRTlZenVJWmplcWpzNEVEWW5OMDRwK0RSd2Qzcnd1MW5pRjVmSytL?=
 =?utf-8?B?S0lHQVVxYVV1QzhCRm5rUVBPL3F3TC9kMjZTcnBrbFdYMkVncVdCdWxHaXh5?=
 =?utf-8?B?dlZ4azh2cEJ2ZW1KTHVuNHRTTTdPUS9PSVBzL1I3bWJpNHZsVWlQM0JxQVRx?=
 =?utf-8?B?U0NyQWFZL2VZUDVxdENVdW42M0UwMzVtajRPaTBhOS9xM2dUV0RBS2xZSWhE?=
 =?utf-8?B?ZFVVbEFYb2dOOHB6czkwcHE1OE92K3Z1TUlYSlJRM1FjYXYrRFk4M1kvd3Z1?=
 =?utf-8?B?OTIzSmZWc2d0VENTSGh1aXMxWHpLblFpWWZFeHM0YlRIMk9ENEREYkp5ZEVq?=
 =?utf-8?B?ZTFMVnBxSHB0Z2hOdytMaVhGZWlyN1RCaU9IRkJKMW5iWERzdWVsTWFxZW5r?=
 =?utf-8?B?T0JIeHhLSGc3NFEySXUzem5OYTZyYmgxQnRWZnFQTS93NVl1cU04ekxUTlJ1?=
 =?utf-8?B?SmtURCtKOHpTZ2F4eTNaaXVQQVltSndhTFVjamdxd2FtUW10NW5za3RZTEpz?=
 =?utf-8?B?Ti9HZHVEbkFBbEM2QkRRbWF4ZkZrKzRxSXUzcjFpYXJRTkMxc04vSlVUaVlv?=
 =?utf-8?B?S1o5cG96SVRTS2tYdEZCdzhvdEpwZ3pSOWF6RzFUOU4xSlVkN0FoeTR0SVMz?=
 =?utf-8?B?dVpZVkI3TVpiVVhGR3Y0MHZmV0V2a2s2TnUzbGxjaEl5dXZ0NGFKbmM4MlNq?=
 =?utf-8?B?UjFjZ0VBMDZJRDFDWkZqMmlibmlVNXpFUkV0MXBCa21kVWE1b1pvQUNpNzBj?=
 =?utf-8?B?L0p5S0xocDhYbWNFQ0FKMld2SzE2dWFqSjhMa005ZXR3T2xabFpiekd4WlFl?=
 =?utf-8?B?U2drTldXTjRiK2NlRUNZRk5ra1lFR1JEM2htVWRkeVJpZllBUXRUeGFhbTdz?=
 =?utf-8?B?K29XVnErQ01nTW4vL1QxT2d4eEI2NklLa25GMGhweEdQcERscnhCcWpRYUl0?=
 =?utf-8?B?dG1JZWwxMlJvRFpPc0MvcjRUL211QmZHRnBtRDZ1bmU4dHU3cFlBYTNFN3Mv?=
 =?utf-8?B?NFBsMHZHSzBSb2Fwd1duOXlZNXdZa29KakJFMThGWEtrTzZvaVVkU3NSbFlj?=
 =?utf-8?B?YWdxeG1HN25JSUlJcnVNZnkya3gyUktZMGhDY2gzNzJMQ1dEM3poYjlRR0Zh?=
 =?utf-8?B?bWtJK3M1aVd5N2tLUTlHL0d0bWVaOWFGYzRRaFFpelhmdVJyQkIxd2Yvczl4?=
 =?utf-8?B?YzhVdjkwOG5yd3d6RUo5Mk9SZDZSUWFiMzhYeDZOL3NieHh3VnF5U01pSWZa?=
 =?utf-8?B?MHZSUEpDVnVsWnhoQjVjMnlRQlhxalBnNUl3TDRoRmgrdjBnOWYzczI2RWdm?=
 =?utf-8?B?YzNuZ096NHRtaFIxbDI0dGxGTG9IZVJPd3ltaS8xU2lIMmlkckEyMUFVcmVS?=
 =?utf-8?B?c25lV3ZvaUtxaTBSZ3NCL3REVUZHOG1Ic2FHQ3lHSGc4bjFSTStPYmNaZFpY?=
 =?utf-8?B?aTBvTzlnb1U3algxYnYzWEpMaGRaeURzQUZSVlpsaVdVRUxKMWVGZzNTMnBh?=
 =?utf-8?B?WUxFanpRbkFuRk05VnRNQ01rdkM4eFVaNXRhTFp3ODJxTjRvNkZHNzN6Mnky?=
 =?utf-8?B?b1hBSzVTQWJ3VHBBeE9DUE1GakpiK0J5bmFvc3JxSC9HRDhwb2QwaC9RUE1t?=
 =?utf-8?B?Yk9MbGFORVcrSVVTTFlNS2JKZWg4OWtLR3RmbWNmVFlQSjRMSkE0UEs2eU1M?=
 =?utf-8?B?T2JVQW1ucHlmb3NubytjMXQyNEtDVmlzbHpMR3VkY3hEN1VKM0U0YSttWG52?=
 =?utf-8?B?RmQ2QVRFOWFnVDEvdTkwaEUxa3hwRTZhdStvd0YyMEowdVZoMUYzcXV2NW0y?=
 =?utf-8?B?NHRoNVBJei9qT0szYnYrUnhveHhCMTV5cTNCOHNLc0YzODFnckdnbEs4TVkr?=
 =?utf-8?B?UnliNWlQUmRjb2pFNjF1MkNtSmZJWFFRbHljRUViVHJURmwvK0lBUVJJMVQ5?=
 =?utf-8?B?UTdiaG9mWXlicitiZnV6OUVWYlV5WkYrQ1lQNkdja0RJcnZ3REIwclJleklM?=
 =?utf-8?B?M1hibjl3dHNtWERORjZIUXFTUzN6SVVyTjA4TmFGcnNLbVM5NFlkYkI1Nldi?=
 =?utf-8?B?SUNKL3FBR1plQUdlaXYrbER5bC9Md2lLSitEeW51cW05bERqVzkxdDM0KzVu?=
 =?utf-8?Q?ylr3DT4DTnDNDOnxh+wrXgchl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d80bbd37-31fa-4b27-6386-08de04198fba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:14:56.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEh4aK67JdR7vXbwg6AzhUrfLG5buSv9lLQ5NygEQ3eYdv+Guu06HTo/MPmCEtjcJnfpTgyamMr+8EXluT9qXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
so remove from the included headers.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f7d21e99d171667d925de769db003c4e13fe8fe8..8004a480348378abef78ad5641a8c8b5766c20a6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -17,8 +17,6 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <asm/byteorder.h>
-#include <linux/crc32.h>
-#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -30,14 +28,12 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_platform.h>
-#include <linux/of_reserved_mem.h>
 #include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
 
 #include "remoteproc_internal.h"

-- 
2.37.1

