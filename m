Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6ED3081AD;
	Wed, 10 Sep 2025 07:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488336; cv=fail; b=MvvBYybp5RMCpVcp1eKXNpfrx5QAQY/Lud4XIp5EEczxyycE8GlRSttBsS+KbFtKh6fVZQzpZVqp6lG4ECNACkCqTFPMEyTuGPRKAF2jEshlu7ThrknJfqylJuud2ytwoYXeo283H23VAdm85aegs/JbiQBdEeSEoa9hf+c5Rls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488336; c=relaxed/simple;
	bh=0xjBtSZ5ekf1YIDlcxCzs9KCl1ptx5jQlh2vwMS/eJA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Lna176mZaat4p4OigF8Fo3KX4bvAyIExnfEj+vjfN9kM61dW4vgLU5dgZm6tl7OhXQuCi/x9lHKezR4dwCimJKgSTK8B62UUp7BAkYaZd/mFSNgJwafRUBnLvUHGBk0OAgjl/rmbOgduIVtIYH9Pb2XdYPRfpFzlEjE+g+JltQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WrLlVUEP; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WrLlVUEP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkV/JnpU+HGVLVwjoXvHLf2WI/LVfFtrQA9brU8oxjGd6V2KxWAnHoWZHy2BVVy2wjj6pEbBCRTOT88vckiUanSUFjdC6OQoEIhVQkGecQ7sKq0B1pZSVx/UMX5fDXEuEO1eDHp6uBKahI0Atj+4fJ31F65yR+RkIZ3eGTb0ZNVtxX+vOQ/aTAzZzUQifNtTJo6W/AVoEuG/2AguT4cIaHDVmYtrWJ6zIuq7NMUatbz5QIWnQKUZdieYuqo0cg8jxOzQ0ByoQ/HmzGGodm3cc93JCq+v191o39PCmUZKPSxfypxfhTUJ3ncPn+uHslysqxzI5u/bGgQZ0hDTGqscJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImVb4bVjB/A1+KddeFa65Gs9tgPppAmz5Tct0ypIBag=;
 b=uwIawVMlKVcx8HG/P1stqMYbpQk4+TglI0GlcCXktksZ8fmFS9lPzWrKpst2ZmbxlBQqag8qDbrWmuYeqdEaVs17hKuDxxZgx8yTKrnL1Ynrkmwh4Vvm6NLp8cOxLn4Cq5W3/2tREwD+8nZ6kzaPPwpmwwApqndznaOpZdoYm5dkDJI2uQ6QtpxojNXnHrke0ZvBFUhj4K+2teIcCC8C6hSxjSVQqyym8iCF7ZKDz68qDxj5NnGHEbfu0useN7aH4RNZHUh4Lxt0/xkoDeqEfX+IlKViSOx5YisiSbyiGHbCvU1y50NT/V7g7ZHqYL7IOousth5ALoDxgJ0HPotMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImVb4bVjB/A1+KddeFa65Gs9tgPppAmz5Tct0ypIBag=;
 b=WrLlVUEPpXblhlx2wXJkGzmzxTOwSiRcqrA7wFeWUE7m3R4TlV2y3thD5Z9JNr50SWckDdjS1I4dk/uomNtNx0QuGD7iAjn2embwfnSpYMeBC4IsLlfzACWRDAs+BKeCSm9Hu8Cyl6VX2O7NwYvIfziYsmUjUXDd0h0Vepc0lNPGkIYZP7DUlTv64wPSXnRQrCaB8yP0/uF60+9AtvhmaNC+pTdX54n+vv9rCyP26XevUcyc27iPkQFLxlVjTzIeGRnUSxipaX4Iexn+m09b9s+X8YT+w3EjcIyju/NYMKPjPSlLzYPmm7dRPuKLZ4jksP/rWljS6wONu2ads+/9jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9358.eurprd04.prod.outlook.com (2603:10a6:20b:4dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 07:12:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 07:12:09 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 10 Sep 2025 15:11:45 +0800
Subject: [PATCH v2 1/6] remoteproc: imx_rproc: Introduce
 start/stop/detect_mode ops for imx_rproc_dcfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-imx-rproc-cleanup-v2-1-10386685b8a9@nxp.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
In-Reply-To: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757488317; l=2991;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=0xjBtSZ5ekf1YIDlcxCzs9KCl1ptx5jQlh2vwMS/eJA=;
 b=IlUdYmItO84jZBACOMeQcy/A3SfouTvYnQXQWXlfUckrJWupPAC8K0sVy65lrc1J8gECEV6kp
 Nj07LmUwMsQA48RJb9X8Hmnx09qKyHcqIfI2m+clVQTpTM9DXnlp6Dz
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS1PR04MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: e0263e63-0908-4baf-322e-08ddf0395b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnhoUW5yc1l5UXBTVWtvQWhONS8zQ0huT2RiaFFwUGc0UEtUUlJScCtXbVkr?=
 =?utf-8?B?Y2M0dVFNOVA2aXMxWGkrSVBtYmxObGlUZHBSbEh0VnR1RWh3MGRHbUh0K2Vh?=
 =?utf-8?B?MnJZNDU3WDV3U053b0lBZjJQbWtOZnhrVzcrUk1rOTk4L3I5WTJwWFk3OGpy?=
 =?utf-8?B?dmJpaHZSUHFkM1dkVTFHemxyVklFVmgxY0RZUGpHbFdnN3BOSG8yejFSdms1?=
 =?utf-8?B?V1Q2SzF6VnUvZy9GekFua3Y5NFNzcysxK1VaN2UwUTdUWU8rQ1FzTkNOdWg0?=
 =?utf-8?B?Y3RSUm9xanZKd2pXVGVaRW9WbEJkY3U5S0ljaEJNakFwSDFiNUc4dmZUcUU0?=
 =?utf-8?B?d3haMzFQdE9FZFE1VXhQWVkra1NQUSt0MFVuM20xOVBWRWFhMWtqaVFEMkpx?=
 =?utf-8?B?ZlJTbHJEOFlHT0F1SEdaa1NQcE43SUY3cDVwUDVuSG51bjVYTHNQMGsvMDY4?=
 =?utf-8?B?eEZNUmZHQm5BS3grc25yNytSdkJQUXgvWlN0bTFMeXVPSUNBUUUrYUdqaTNR?=
 =?utf-8?B?bFNVRXA4RFp5T1ROQmsyVUwwQStFYTU5aU1JZWhINXRUQTMvQTVHYUd5TEN2?=
 =?utf-8?B?ZDc4c1RHRG5FeXR0SkxFSGZrMXFrK1p3eFNKN2xaMVJvalo5QzhmYnkwbmtm?=
 =?utf-8?B?UU1ubWVXVGhMR2ZsTXNGTkxFM0VKclZ6a3duam1oMDhEa21GVm1zRFhXU1l2?=
 =?utf-8?B?YjJadlFGS0tRd1laYzc3TkJINEVxZmxub3hEVVVMblBXQTRucXJGQWFTSzdt?=
 =?utf-8?B?RkFHU3ViUVdjRHMrMFRRa0x4aG1HVE9QOFU2SnFVOGdYVFNGdjJvbHorRElo?=
 =?utf-8?B?bDBac2YyM3NQejdCWVZSWVNyVEhWUzU5d01ONXVtZUsvVnpVbUdmWGlmNG9Y?=
 =?utf-8?B?ZVJRVC9teWlCZ0xqRS93bTVIcXpMU2hmcVhaV2FVQmVieHMyaE5vMS9jcnZW?=
 =?utf-8?B?cWRjemVld01BSmxHZ1RMRTBmVm5NTmRtWml0dWJ3Si9EV1JWOEhkcmt1V2tP?=
 =?utf-8?B?dkx6V25QbXBoc2NTazRNNElKMk4rckN5UlQwZW82NFVLRWdkNU4ySFZHa04z?=
 =?utf-8?B?RlgyQi81N256ZUEwakVhWmJ3cFdtZUdaWDJIa2hEeTRQN0tkRHIrOGx5ZUhx?=
 =?utf-8?B?Rk1WNmpTUHA2T0tCOGtoUG81U2s4STdla2pMNEw3cVU5MFZ3djN3cDY3Uk16?=
 =?utf-8?B?RHl0R2tTS3FUY0d3UDRKVEtlRmxGVmRIUUFzNXBBa1RWOFRGUkVOcXJDSitZ?=
 =?utf-8?B?ejVOVGI2MzdDOUtkN2Q2dVA5ZjdRV3lTcUZTMzZCbkNKMnJaYTNDcXNsalpj?=
 =?utf-8?B?NjZOaDJNM3lBU2U1U3ZQVkpMdlV1UTZWdnJyaGdTdzdibkE5VFRTRWNTRTk2?=
 =?utf-8?B?eEdqczFhK0UxN2ZQZ3gxMkxyZFRNb0gxaTE3b2tRWkNXVlROU2hRVjBOVVph?=
 =?utf-8?B?ZGR5ekpGRVQ5VG5pMjFZRmkvRHB0akJNS1dYNU5SRnA3WmN2MFlZa2NaS2Vk?=
 =?utf-8?B?SThjTUJWb09MR045NC9ZS1YxOEYvWW9HVkVxbHVkN2c1dldqN3JGR1U1Mmtn?=
 =?utf-8?B?MVB6R2pZYks5eGc0SWVveml4bDFDeURMQ0ZIeWU0MFRGT2dvTXJwUDhzaHEx?=
 =?utf-8?B?aVFsRjVqNnRiaERBR05XMG1FYnhkTzdnRWo2eTFGUW40SkQ2TGd1aGpGK2pI?=
 =?utf-8?B?YldERWxRVDVzbllTOU1LeHh2dHc2OEc3MFpGOUJkNW9XUm1JcWo0VFd1bHRi?=
 =?utf-8?B?RGwrcDRSazAyVzIxanFwdDNpTkpXNGxxQW4ybUw5dDduZ3hFWWNLdWFVeHZk?=
 =?utf-8?B?YTBnSXpBZXBubEpkWEx1WFA5THp2L2FZaXhTTEtwcnJ1S2NjNmRSYzhKZUdX?=
 =?utf-8?B?RmVlSlFnL0lBVHJlbXFPL0hwNDJsOHlHc3IweXJHOXJ5YXhRd2FuY2ZvcFZU?=
 =?utf-8?B?L0lIdXZaOXFtNnNsamswcjRVcnd5cnBTVmYwMzZJMEhiK1hVOHJsZXZxRmNh?=
 =?utf-8?Q?Rqqbfy6Noh2sjw87jZVD24xMqiWjio=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1JmUnBCQXczckw5aGphbkRMajJmNFhmamFzYUJ6UWxUdWd3bDlOeFFCaDI1?=
 =?utf-8?B?ZFgzK3BCTGFlOEJKSUFMWnRTS1FEc3pybW4rbEpvS09pa3JxODBKSHJYOGli?=
 =?utf-8?B?ZDhhR3UxbDVhQWorU2cyaXhQY3BFOWlOS0dKazRidU80WEZVdW5YUnVtTmVa?=
 =?utf-8?B?ajhjZ0U2QVVLMW1ub2J2LzE3REphR2hXSmpaTTRBYTVCSlJZc2pJcFZCeE45?=
 =?utf-8?B?R3hGaEVJMjV6K3NLUUQ5clJXVm9YMU9ERDhyVkZzNENPWk96KzlITzdyc05a?=
 =?utf-8?B?eFhSMmYzNnpHemY4dVRLeDZKdVNKeE8rQ1JrMlhvSVBsdC9uN3lMQ2RwMjI1?=
 =?utf-8?B?S1VtUmR0NGtSTXpGMXUzM3BMSy9PRHM2NUNrTFAvVDJhUFkwaXEycU83VHJF?=
 =?utf-8?B?RG5ZYVVyVkc0a3pLNVlockFCT0kwcTA2UmVSeHZzRnZkeDZiVmFJTGVjdUxZ?=
 =?utf-8?B?Q1VZcFNJUW0wUnlVVlgvVEdueHVxQUFGdWZmMXRWSzYxWldYMU1UVmNSajVB?=
 =?utf-8?B?WFdYQzcySndMU1FROWt5MjhQa0crZEVYdnN4Uk9rM2lCM08zakxubGlZVGx5?=
 =?utf-8?B?V1A3d0g0SHJiZWxqYS9VdEFqdlFmVW4wczZjM3ZyTFVHc2xlL3JuVUhMMno0?=
 =?utf-8?B?L3lYVTFkeTJNVEoyS0tzTGx0QXcvemQ3VzltMi94RjNoMmxzR0tmVmxCVEln?=
 =?utf-8?B?bFoyZDdseUswUWhyeFEwY0FMRkUwZ0VHNCtSTTZIMDVKVGJCZCtqUlpXVHp3?=
 =?utf-8?B?VFIwWmYzTk5HNmJwek1lRnRtaFlQOWs3QzRrVVpmSVFOZGNMWjA1MWxOMVFt?=
 =?utf-8?B?V3hXaFljK1kwUFoxNW9VRFVYUHJGR0xUeE1uTzNRaFFkb014Zm1XSUkwaUI3?=
 =?utf-8?B?SnN2aDE3d1EzVXVUSERVVjVtZkdTTnpmSVhmREptSHA3VDJIa0tuZkdPOWpx?=
 =?utf-8?B?WGJLcTFKc3JTbTdhM1JJVkxMV3lVaVQ5N2xQRnlpcm53WHRGczBTUzY3Y082?=
 =?utf-8?B?MS90UmJUTndBN0hJWkh3bjAraWVsTnB6VG1HWXBRaGt6c3NSWGpxcW1JQUdD?=
 =?utf-8?B?M1Bma0dWMHZXcXNGQStzaHRndFhlNys0TmNQRE5KVURYdlRHUFcrVXlTemh6?=
 =?utf-8?B?ZkhMTU0ySlZwc1dGS2hCdnRoVnZTbkkzcWM0RmthTktoMXZNd1FSekl2TFRN?=
 =?utf-8?B?NTRHNDFVOHg0UGlwWnliYkllMUN1ZXB1KzNxS1VNTnd6K1lsWXRwS1Q3NmFK?=
 =?utf-8?B?TytDMTVFclZ6TXpuMk9XeTVOZ0NCNXFYMU5yRURkNm9yY1NzTHZ2VlUvTnV5?=
 =?utf-8?B?SUdDbjFBMW9vdmhRa3Q5OUtFMUQ4YnFMMVh4Z2kwU1VIZ2FDOWdBdGF0T2hX?=
 =?utf-8?B?MWphM0JlSG9nVDN3UXJGUnpMSWpPVXpPeEZZbEo1c3VDK0YwaWpxWW5BV0F6?=
 =?utf-8?B?RmpPNGVaaE5WRjRlVVNRckJYMEJKUHpOMHNQakZQcno3TTUxdEJUTEk1TUhR?=
 =?utf-8?B?K2dEeXFCVWxSbmVVOGJZQzEwNXI2Qk4vOGRHTkRTeWlKTzFkdjl6UFR6N2dx?=
 =?utf-8?B?VjBVNEtPWlZHVjVYcml0SVBFcEQxbTZLTEMySk5wTGJUSFVNQzRlK3BUYWpH?=
 =?utf-8?B?djl2UkMwMC9pYlE0NkxVT0M4d0pPRktPcTZPZUhjZXZhUG0xMXlTdjcybC9a?=
 =?utf-8?B?WGZLakw4ZFdZZjdBeFpJNVJONC92eE15UkRac2ZGd0NQQlBiVjVpZ3RXclZ3?=
 =?utf-8?B?V1RiQTRjK0VWeGI2cC93REFibWwxdEV5d3J1L3RqQnl0RjdyU1B1dDgvUG9v?=
 =?utf-8?B?OEUvdVpQY2xQTUtGbVNYNkFhK0lMdWU3K1hGaGZzam5weFZYUFUxTjZ2anpt?=
 =?utf-8?B?MWdWRkVOQ3JwT0lRNTZrZ0NDRXBTdCs5THJHUWNLb3ZCZ2JsQWIwbWpRTVVY?=
 =?utf-8?B?RzRYQVgxZXBGY3ZSSFZEOVNQTVlwc1hPTS9RNjExdFBkcFcwdlpoVlFWaHpF?=
 =?utf-8?B?eFFyOStOcmlyTUMwenI0Q0JvVmxUVlI3bm5HSmFYV3dTaEZuT3F1ZjRFb21t?=
 =?utf-8?B?eWFPZjQ0T1owaVhvTmFWRkpuSTl1T3NQVGp2blBOcE9Sdmx0L3ZNSHFNdkVw?=
 =?utf-8?Q?JV38kIq3HBAfORchlAcrCLtQq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0263e63-0908-4baf-322e-08ddf0395b7b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:12:09.8437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcZEyrpit3FPr62RP+8rD+cDOmCNsrQv4MyVuMKCHMFn991EUwblP1ZyCAeWE4eGbrM/qQJl7z5vq/1u2oeigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9358

Simplify the logic in imx_rproc_start(), imx_rproc_stop() and
imx_rproc_detect_mode(), introduce start, stop and detect_mode ops for the
imx_rproc_dcfg structure. Allow each platform to provide its own
implementation of start/stop/detect_mode operations, and prepare to
eliminate the need for multiple switch-case statements.

Improve code readability and maintainability by encapsulating
platform-specific behavior.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 15 +++++++++++++++
 drivers/remoteproc/imx_rproc.h |  7 +++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..5cdc5045e57566e817170ed3c708dad6108d2e46 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -376,6 +376,11 @@ static int imx_rproc_start(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	if (dcfg->ops && dcfg->ops->start) {
+		ret = dcfg->ops->start(rproc);
+		goto start_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		if (priv->gpr) {
@@ -398,6 +403,7 @@ static int imx_rproc_start(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+start_ret:
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
 
@@ -412,6 +418,11 @@ static int imx_rproc_stop(struct rproc *rproc)
 	struct arm_smccc_res res;
 	int ret;
 
+	if (dcfg->ops && dcfg->ops->stop) {
+		ret = dcfg->ops->stop(rproc);
+		goto stop_ret;
+	}
+
 	switch (dcfg->method) {
 	case IMX_RPROC_MMIO:
 		if (priv->gpr) {
@@ -440,6 +451,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 		return -EOPNOTSUPP;
 	}
 
+stop_ret:
 	if (ret)
 		dev_err(dev, "Failed to stop remote core\n");
 	else
@@ -933,6 +945,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	u32 val;
 	u8 pt;
 
+	if (dcfg->ops && dcfg->ops->detect_mode)
+		return dcfg->ops->detect_mode(priv->rproc);
+
 	switch (dcfg->method) {
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..3a9adaaf048b396102feeb45488cd2ff125a807a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -31,6 +31,12 @@ enum imx_rproc_method {
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 
+struct imx_rproc_plat_ops {
+	int (*start)(struct rproc *rproc);
+	int (*stop)(struct rproc *rproc);
+	int (*detect_mode)(struct rproc *rproc);
+};
+
 struct imx_rproc_dcfg {
 	u32				src_reg;
 	u32				src_mask;
@@ -42,6 +48,7 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	enum imx_rproc_method		method;
 	u32				flags;
+	const struct imx_rproc_plat_ops	*ops;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

