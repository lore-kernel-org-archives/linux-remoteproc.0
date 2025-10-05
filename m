Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC20128A704;
	Sun,  5 Oct 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673704; cv=fail; b=M2LU5xrh5W8pHjMh7C3WmX595Itr1byifs87v9sw0tmq3NKRWON7rh5MJ7Sm1Cf8JOPERtQjta7pzMRm/DUuXkOd8Zd/o4L7tAldt+qDUnAyBjIEsf5eDrb0lfzAlncbNGqWLMhAn2pl77rl1ywZyvlOqXZcshmeEX0XHGaRMxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673704; c=relaxed/simple;
	bh=H1TADD6qC0zXiJ0NOz4L5Su7sbkZUQ5Rv0bUrA9SWJY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E2C4iWeNXVZH7fzDo4EmGcOXqNKKVbTzv/CpUu3s/msOEi0hZzDkSQvZQ8FdNoHXsbaPYFZCWkpZbzdUud+kAPsdtccG+mCyE1rFR7wrWQTMBMvNQYhA4wF8nHUm/szYbI1HP3qd4sljgCTz2I2luG5ujNIFE6wnBSnMJUDA8xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c5dcND3R; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c5dcND3R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrzrvM8e42sAguA4o1YOYXXVHvOLH0eKfdMrIbD6J7MUFnLd+RYd/0Wi2NezwJ/UotUSEOmdb8ldZeZRxEpOvq6d+uDj/Vd7Mh6J7+7CMGZS5EySklw8aIrpNhZ4o7E5UadxpbLVxwZ5b6lu60L34T/9WrU8HFk7qgzZQ48FKIAvPC0gWzfJyJ6TRG1A46P85O6goosl2XxUqVgf/K8f5txKm4DAqfhOGRnnl12rXc0E+Zq+2JCad7M+uIBlMFmMqTvZcXuJS0dodl38rx9XYzQWi8jY6LNsSxOpXFeHgc1U9jHX2bJHKUGKoXtWBIMmbpiB6bMDqv+BSsAYWF2HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVHCUXxvsZSjqQcEVbQwOLd3PxbXEThkxkJUmEbPy/o=;
 b=k28wjdn4rili1hzoeQl7ENPTDOVSmRCgVe8ME2i52AhjdWr7rhqL1dQQGE206Waj4Lh2LcOMsr13JLXANMeF/fPv0Y0vfUAJ0hU4tZWcJiBiO393u4JefPf4LUiwRAT4qxV0M3qGzJgiTklkEUU3tSyNN16KZgxPB6elR8xS3FvX5ml+8dnGLSfc1qOUUbsCBUUHaeAcXhrWCymaI6bfNqluQGR8xviNZJnKA3gMd2xUrk7CQIrK6okFbx0RtaGLutW5V+Blh/2SG7gMNoJh183r5mfdsb67UcBpUDpc01ixFRBX6Ra1k78peBp6hCRnKsEWlZCqrzNqqZxO1Wwi6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVHCUXxvsZSjqQcEVbQwOLd3PxbXEThkxkJUmEbPy/o=;
 b=c5dcND3RcpzRGKKyzeuTBLCJrKPZ/JzFSWqRLrLKh8La4RloLSjG2z0aHphm2CtN0x9Kjp7NK85OZCwaB1ekIyqHknGxbrd54zrRrvI4FINWkeVZGZ4nrpvtbZg4Kco+rpB/0o4HpUsFYEQDYYlrxP6o+KwXuQER/iXmA8Qmku3WEOG7CaDWjt0rofGD1E0S4Oy7ssPs8oNz7yOOP0NtSD/IkH2rI+074JrEt0vQsT5bQ4frPN8NPsV8F7wJga0dnh0JQxpw+Xy05RloYCTrqvJ8YLysumFI9DYYqjAE/m27a7zD0hIrzzGANMmYQiM6ZS+SVWOWqy941TTLbc2IZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:14:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:14:53 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:27 +0800
Subject: [PATCH 2/6] remoteproc: core: Sort header includes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-2-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=1835;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=H1TADD6qC0zXiJ0NOz4L5Su7sbkZUQ5Rv0bUrA9SWJY=;
 b=kovpQwQguW4Eg5AvbLSVDxW41gp9J31xYJEMpINTWvT/VZVRRt1yM4pTaiEt4ffh4E/lzAdxo
 0W/pJv/RySYBUl9iBJY6j0exsrgVFKYYjiY8VWZ1zQW5A0ueWCqMrhV
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
X-MS-Office365-Filtering-Correlation-Id: 288c4647-8638-4208-985e-08de04198e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ynp4ODVjWVg5aDI2UWM3b01Jd3ZuYkRFbzREajVKVGw0Q0hSTXUzNE56ZkdX?=
 =?utf-8?B?OFkzcUdQTmhkaDFSMkdVc3BPRVJsVGFLd0xpam5yaXlpYlVxcDFDWW9wNE55?=
 =?utf-8?B?bGpWZ0NON05iYzRDandGdXRYcGtvaXJrcUI1MEpOOTIwSEtKNEx3Tm1DSlFY?=
 =?utf-8?B?Z0ZsV2gweXlxc2ZoUUFvdEp1UlQvbE1lWnVZODBObm9TQzNRNVRuTVRrTzhr?=
 =?utf-8?B?RVFlM1BCa3ZOTURsRXRGSVZYeHdiMjBkTzVuZHFjSkpWM3dBcnVQOHpKQnFs?=
 =?utf-8?B?elhUb0ROUzhMZGtsWDZIL29GVWRFVTR1aG0yeTM0SnFPMGN1NkI1eXBJMm9E?=
 =?utf-8?B?MkQyZ3BkNU41aFNGUEhCRE5QanBnMHVNMUQ1dnBnYkxCWnNGbDQ1aCsxVkJz?=
 =?utf-8?B?ZW9TdUdVODRyRHZFMkZmZDRWRmZXRHM5QnJOTXJxWlRUc2hYZjFMZGNmeW5Y?=
 =?utf-8?B?WjYydDFnd3Q2WlAxSlRkSUp3MFZMMkozb2plN0ZQS2hMVFBBYjg5REMrVFRS?=
 =?utf-8?B?Mm9XK1Exd212a3pMZWZEdDcrNFBjbURhMVpjdWJRSUo0UWFZZnFzR3h6bXNs?=
 =?utf-8?B?TVhZTEg5bU9nL05IRWNBbm1qQmEvN3ZqZCs0OXNPOTJpUmxOWTlhdTZ4a3ZS?=
 =?utf-8?B?MnM2S1huWjRRWlZvMndpeUNWYmZXUk4wL2Z1T1o0MTRMK1JkbkZoZ2pEeGkr?=
 =?utf-8?B?enNEUTdPN1FVYW9BTHVqVGgwVEE2SjhQd0VEanh4UFg4TWE3NEg3VlFuS2E4?=
 =?utf-8?B?TlN0Q1NGaUxsanE2U3ZQSUJmWDZoVkxxRm5xQ2NYQ1Y4N3RrMk1OOVVBK0pS?=
 =?utf-8?B?ZmFlR0lNRng3SGZzU3lFdnNWVFhFbzFrVHUxelRQcDgzMVJCdkh0SlNIWUVw?=
 =?utf-8?B?SE5QbEJkaStKVUxzR2hFMFhjMGpQRHpiajk4K3FLYWpublhZZVB1NEVPQ2JT?=
 =?utf-8?B?cGtRVzA0bllFa3hUY0E5dVRDK0Z4TWs4LzJwaGFZVzVpMHQ5T0lwT29uSmww?=
 =?utf-8?B?bHh1R3Z2MlJMTi81RW5JTDVsdWVkSTNtaGN4dmZPRis5T1RiL3NUVjgxMUhj?=
 =?utf-8?B?Y0FZSENQWEVldGtTbUZsUkYwc0cyc0Jxcm83WTFKTkJvZ09qK1Zoa1Q0VFgx?=
 =?utf-8?B?R01WVE54Z2dqVnJOTWl0QzYzcU1uTDM2YTkwNUlkbzJVbFI0Y2ZKN1U5cFdp?=
 =?utf-8?B?QWxDUTZtVXhqZC81QVBBeDM5eGFaZ2x5RkNPUFBOL2oyT3U2S0swekIxZkty?=
 =?utf-8?B?YmFHdTFLQkFZVXloOWtYTzdiTFdhOE5NUlNOMlA4TmlGWjR5TjFhZjd3ZEVi?=
 =?utf-8?B?TUZPZTM0eFFINUg3SnY1ZUo3MWlwUS9uQTRZOHlPdlQyOXFDeUxCUld3eDA0?=
 =?utf-8?B?V213MEVrNm5qa0lKZXpZZ0NuVSs1bDFvN2ZNU0ZlNzgrcXR5cDVIOENSdVNK?=
 =?utf-8?B?UW90UkNRT04yVk15Q2Z6ZlFLWGZNQmRraFBkRUdienJCN3dlanFpVUJ5VTdt?=
 =?utf-8?B?dmJ3UmttbUxiaVlCRmlxbEE4RklBOWtpNURJYUtSNG1LTk1XMkNhVVltRlUx?=
 =?utf-8?B?cFJrY2VkNndpcFNoQUZ0OGlTdzdlSGptTDd6MllIeWg2THo3Qnh2K1VKajE2?=
 =?utf-8?B?b1hiZkFnanVsZDdmS1VuTTBLeUI4OWVvZjZiOXdDZTAwVE9hcmFLMGNuOXll?=
 =?utf-8?B?L1VvQjBDZmR4cUxaSXRrbTFhV1JpZ1ZGbFhlcDNyZm5Xam1aS1FWeExGejJY?=
 =?utf-8?B?UFp6elpzSmd6d2xNZVBSaWF3NkFsQURucG1idTNPSkk5d051SVJ6YlRvdkNO?=
 =?utf-8?B?L3drOXRCTUdUMHZGY2x4Nnk1SFgwenhCYmNpOFBSWWxxK0pBRUlzRFl0ako2?=
 =?utf-8?B?OGYzL2RpRHVzeGNHYVYveVZ0Z001SWs4M1Fqa0hkcnFGbm1jcjRGMjZ6cGlp?=
 =?utf-8?B?MTUza3ZXUW5tWVhURFpDQlIyRXM2YnRFOFhUOEM0YzNRRWttMXE2R3BwbVhx?=
 =?utf-8?B?TlU3VnErSUQwSnlBSWxNa0M4ZVd6MjRpUVYwL1JGeHRmK1Jib0kzY2Vka2xC?=
 =?utf-8?Q?n2a37u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0FndDQ3VnpySy9LYnVzeEh6T0w2SnN0TmhHREhHejEzOHpvRzZJTGVJRjZC?=
 =?utf-8?B?cGYzcm5ZeWQvZlRIeVJ3RmQzL1lqald6Q0FrSXdpd01rdEI3VGt4WHlKblB4?=
 =?utf-8?B?WHFLdS8reXgxWWJRcmg1S1NFUjE4Z2p2UU92eTYxeHdaYVRuQ0FXcTBENnNi?=
 =?utf-8?B?MVJBZmdQeGVtRlFQTkIxMDYwUE05RUJ6NW9hNytXc2l6T2FYNDQxaE1uUXlJ?=
 =?utf-8?B?Nkl1QTZPSzRwcFArVmY4WTZxMkVVNElxUEEvajBvVDVlelNMaHJ2WTdpa1Bo?=
 =?utf-8?B?NTV3VHI3WkVPa3Y3V3hCamR3OUFGTGpET3BHQUxOZkVoWHVPem4vVk84M1Nu?=
 =?utf-8?B?NFQxazRHMGFpeWduY0tSWE11L2pQMXJrM2ZxVkxzbHR0NHNWSk11c2pybnEv?=
 =?utf-8?B?ZUpINnpJNkVTMmZISEtraDd5WWo1V216dC9VNzNrMmZFd1BYSGlRS1RPdzRD?=
 =?utf-8?B?Qm96eldHbkw1OTd0TS90bkpyMXIwNktVZnJDZVltOFBvK1lIYjhjejBkZ0Nl?=
 =?utf-8?B?cnR5Z0ZZZ2tITy9FSWh3QysxckpRUXVEVXFMUSszT250YlFKR3RlOUxZdC9I?=
 =?utf-8?B?eHZuazNCazFyOFErS2NJbXQvMzNaaTI0by9IYXRCQzBwNVZMOWhBZ3ZxYVVM?=
 =?utf-8?B?UE5SOEM1SkRjQ2hiQU1vSUM2YXAxb0owTXNHTmE4YS8xRDRUeEFiQzBnNFlZ?=
 =?utf-8?B?REJEY3J5cFVBb1plajY4THhieklHTjdTdG1NVUk4UWMxMFZTVXV1b3JNK0I5?=
 =?utf-8?B?cHVnQ1d3RmtwTW9GSXdFd1krZmNDN1R6U2NqU3dQT25nNU1zRU51ZnBnYU9W?=
 =?utf-8?B?ZnNQdzZiWFpEQ2F3YWRMZGpRSUNpQ0dKYmZNbGFSUmVjQUNuZS9vOXZuNEcw?=
 =?utf-8?B?RGxPelIyc3kyK0lnOUhQL0dyZFlocGNEejV4U3pUd01TcUFsZGRqbFVUZHVp?=
 =?utf-8?B?c1VCVmRpWW0yd3BCYmFtaTNmM1JIUWgvMjNFSEpzQjlHeWxha0dPcmpWQ1pI?=
 =?utf-8?B?ekNLR3FDTjQ1a0c4ZnV0R0VtOUNJZkJHd2xpYXJzNWhSakMrWUViVWYwcFFG?=
 =?utf-8?B?UlkvSzc3bEFKUTZUWER2Y2RFZUo4VXJaZ0dqWHdibkZCU1BMODVOaDB1NHNP?=
 =?utf-8?B?cVExZlhVZFMvMnZiNjkreFNoR0JUbFZpcjBpNVlCa2FaR1ZnYk10NUJmamxx?=
 =?utf-8?B?bHFXeVorYk5haG5HQUlrS3RjRU15dHVabUo2UExSMDcvVnFHTlFOY251S0lq?=
 =?utf-8?B?UUlMRUw5WEFOc25yTXRiQ3lkRFFBSk1rWVpGYkQ5RjlhL2I4clBaSFdyR1p0?=
 =?utf-8?B?UmxlQkVYTWxuelJqdUwrSHBhWHNTRUI1RmYzYXJYZmV5OW9zU0ZYMENxSHlu?=
 =?utf-8?B?R0JteEx2RlN5NndjWXpCaUdZUmh2Z2U1cHRlYTA0UTAxWXJUSmlrWE94TXhL?=
 =?utf-8?B?dlUyaFJWc2llMzlsYy9Qb2szTUh4b3VwVUQ5WDRwR01teTkzYzRkV2N3MDBi?=
 =?utf-8?B?cVRZNmF2by9QdXpxdkpTRlpsbkFYWVpqT3ZETEF4alRzV3RESENrdmlXV2dw?=
 =?utf-8?B?clc3R0M0UDBWVE42cGNqcUFUTHNZYlFkOTdIS3lvTG9kaXlHQXRlOGdLQnhH?=
 =?utf-8?B?bUF5RHo3OFRFU2dENUxqRmo4eTE1RFgyd2FidFZrRGtaZTE3TGp1clEzVHFq?=
 =?utf-8?B?bVVncGtPMUx0eE1DWlAzMDhVSVcycHUrcHBqOHdtajhRMm1ZaGhsM3hYOFZi?=
 =?utf-8?B?enZBM3ZVR3FLRUg5eVpoallBZkdrOS9FSUtjU1c5Q1RhK1RzV3VXSlhXZWRP?=
 =?utf-8?B?MnZxb3AvS1ZRNHpNUVgwU3MrTUxTVVRtUDQ2Q1YvbWp2c2VEaVZ1UXAxZkRu?=
 =?utf-8?B?VjJNbkt6WXVTUFRIby9kVmhqd3dPblhTdC8zR1B4bEF1b0tITmgxOHMvaWVK?=
 =?utf-8?B?NXZhTTNrMm03am9mVlZrWVZBamRUQjhuR2ZMVkszSlE4OEorMGoyMXdHWDFH?=
 =?utf-8?B?Q0JKYUQ1aEZxQk9XQ3c4UmJvMm9Ja0lzNXNhYTVkZ2dtTE5naW9XMlFlWDF5?=
 =?utf-8?B?QkhaUldHMWgvVEROWUIxUUYxUTZXNno4TlNBbjJaSEZramxPOC80K0J2alcw?=
 =?utf-8?Q?rtmNtUquksEM++j0rmtjRLKQT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288c4647-8638-4208-985e-08de04198e1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:14:53.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQTdrjlBX14b+hjho+9is271OCC4+0eYbxOtAhtCM4kvihLfYVRFAxS5xi+5wNN5QFezbd8/Vy2staKAkAb7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

Reordered the header includes in drivers/remoteproc/remoteproc_core.c
to follow alphabetical order to simplify future maintenance.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 29bbaa349e340eedd122fb553004f7e6a5c46e55..f7d21e99d171667d925de769db003c4e13fe8fe8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -16,29 +16,29 @@
 
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
+#include <asm/byteorder.h>
+#include <linux/crc32.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <linux/device.h>
-#include <linux/panic_notifier.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
 #include <linux/dma-mapping.h>
+#include <linux/elf.h>
 #include <linux/firmware.h>
-#include <linux/string.h>
-#include <linux/debugfs.h>
-#include <linux/rculist.h>
-#include <linux/remoteproc.h>
-#include <linux/iommu.h>
 #include <linux/idr.h>
-#include <linux/elf.h>
-#include <linux/crc32.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/panic_notifier.h>
+#include <linux/platform_device.h>
+#include <linux/rculist.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/virtio_ids.h>
 #include <linux/virtio_ring.h>
-#include <asm/byteorder.h>
-#include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
 

-- 
2.37.1

