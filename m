Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD5B324B2D;
	Thu, 16 Oct 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615319; cv=fail; b=dh88WIzcdEeRRJwFE5B37NcK9wOiHgpORjt4MGj0kiSc0ng9IOk5Y6mPMLDNOma+x+a0QIgOYzSI3PA9ht+abeIgrjMb+MJ1+tS7tnFoYgYZ+TbsvbPbYxIY4G8/yY7YYXYEiXatY6T1SMbGQWMTIFcM2iSKMhFU+V3eRnGOV+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615319; c=relaxed/simple;
	bh=vHQ0x9mD7tL4E+XfV9Q4xZkYbIUHCjZ42aW6Bo559z4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n0NPXjsYI/zSsH//zsuqtn3pWjwzPBbNWcZjcwdR0xkAbmoO6Qp5OjRs7JOerKbfrjziagMKJMZZMuDyt7pHOhIvtC3E8MhbSUSVQpoSkGTXi4DoSJJHt/l9J4qKEUpKx5erz5vbybxKKsiPyMBEFLhLO57mm5BMxHHnseJIkzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Plep8HEy; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Plep8HEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnuZipd4TYheiNFgdHT/PHpTrtp+urfDZV2vgIB9Pj3pV1ZE0Z4j35/kgPw1ClgwzLflYdjJCPi+1SamWjclhzNwJflB2ECObEtkFSa4raXLl+ZOjKqBG0vt9aHlxg1WQhlf2eWUvZJpsVD0i/hmYvZXbt0kurCvq+o2ixYTtcf7ESRzNJfqJmjGXtnDtW8Z3vx+HlC8p82lzqfKdK+dKtwn9mCvUJ+2KhEGT3HJbULsRRsRLIqKFF4SMYVunvv86CG5PeIlvs3M/SE9e+8MaAPcDAgRXI5ZS8u+yNZLYMTH9gEPftMxbNR9QAS1PV2lWh4/eEqtux1cYJeollCXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIQ66rbZwn7mBY2xc4++fRuuapPC2RMGtAbsX50ooPg=;
 b=TQ5fFiv8a5rEZjJDMI+jgrJabIyA9fgsS2E9GtbfqTVrHrMg8h34bC3DpCjYIlfwBHDiwBKh8qHhbtBmT1iULkuc7W4uUKx2F+/VyBoBw6QvQuI9PvZ3HLba1h7DVEg91/WNneYP18d+0NI13udnVgRXIsgC97lJCzQQF15x46sOlJLQYySk6IDuMv5g/5CDLSxlJEijubBJwcywVpUd4dXIpY7O5O1++0VTS4VYGKK5dpu1YSsH5SswY3Ccnx3/mxCp5/2nE5X90WkJHIAhSRT4AFMJu6iCVmf1nkAy15eTwpxfFyVYmpLwmkpV8aQoauSdLzz4M85VQF5D+bXBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIQ66rbZwn7mBY2xc4++fRuuapPC2RMGtAbsX50ooPg=;
 b=Plep8HEykMxwn4wbYkSeRpKqcGwLoi77VAqkRXCu8vnNawrdC/BFCmiX7wGsHWfeL3GsT1TGkLEmm+zyi9AXkb3F8I/UUsy1GvnJ/hDCG1WyBiYz+x2uJIEO4TPtC2u9I7laXQiEIPTRnlTLgKZlcS20DEOIpUsz5XgJ9noTndc6yhvqpYMERhkV1J9QzPeVmg4kFog+QuQzYrjlbrLeMP16PsjZwk5tlVV2+nbXCB8n8pgZhmlzTQGWcWQEGBBIYblcFNycXwp+j2XCSdKFc8EhELwGycccbnXNJFbPMmjvoiBGXzSrLzCRO1gEaoATPajk45DVtl5hxyVKDr41bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:48:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:48:34 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 16 Oct 2025 19:48:00 +0800
Subject: [PATCH v3 3/4] remoteproc: core: Removed unused headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-rproc-cleanup-v3-v3-3-774083716e8a@nxp.com>
References: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
In-Reply-To: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760615296; l=1277;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vHQ0x9mD7tL4E+XfV9Q4xZkYbIUHCjZ42aW6Bo559z4=;
 b=agIPaKNhVNzk054ayKzqyKmp1QmJHa3Y7+aMv8ja3ZE9Z/CRFp1OIkAE677nLOfhqWB5BP4tD
 tq7jUlTsnjLD0WFYBuEAwS1wVKY0Smti6EZKpsh3jK/pFWLsuTIGaW8
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: b0851448-7b95-4568-0fd6-08de0ca9efba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTVCd0paL0xXZmtsNmY3QnhLZWE3U1FaOTdmdGdCNW5nUS9lbHd5NW1GcjRx?=
 =?utf-8?B?dDNzLzFXZFlNaXZ5YmNKbS9ndlJSdzBGeHZGRlA3V2lDVVVXdldqZmFscWhJ?=
 =?utf-8?B?SU4xTnBhRndwKzg0cVJTUEloYTFTdkNjMG1DVUZRYm85WFNyZmM1QURYaWZE?=
 =?utf-8?B?SFVJYy9CYllJSnRNYlpVbHQ4c3RUdXJPbFVkbkJ2cWJlY3M2MXVOSldQNFNF?=
 =?utf-8?B?Z0s2RWwvQTZoWjRXa2h3L09zOXNPbWFtbzlweTVzaGhpenlITEZxVEJrOXdW?=
 =?utf-8?B?akxhN0o2Ympac1ZkL0RmdHg5cnNBdmZMRTM4eCsxMTF6ZHRTTG0wUDhGR0RV?=
 =?utf-8?B?WGlvalRaMkFPdjJzNVhTS3VkK0VBKzcwTWpJbUw4Mm5LYURBMXlLTGlwLzdr?=
 =?utf-8?B?MFJyM2oxQlRpa1NNanQyR2FLRHRBcUxyVXdlTVVqL0Z0VFdUd2dULzlpVCt1?=
 =?utf-8?B?L21BZG9RbFFDS0pjbUlOMElqT3puMW4zNE8yMzdYYk5DUjNoeitoYXhJZDhD?=
 =?utf-8?B?aVM1eGgyQjJDcEJpK1czd0drTDdBaW9UMGRmb25EZHJxN2tUSlNPYklkSU4v?=
 =?utf-8?B?SUR1RVZSdWpnVWNvQmJwT0Q0a0E2andLQWo0bWI2K3grSHFsVkdlY29yQjIv?=
 =?utf-8?B?V1BnWGNwU0ZQUmNnM0hyVVNYQmIwUnFpOGpybGhuQ1owNkpHTFRSbHIvQTAy?=
 =?utf-8?B?RmRjdXlwN3J5cFkxOTN6ZUVGYnJKck16R0tza0tWTDdVNENEQTRCU3JQMVlE?=
 =?utf-8?B?dEhSbmJkSG1QajBVSVlQbXFPVlNiYSt1dHZ2eGFYcURiYnNjVFFodEF3aUxI?=
 =?utf-8?B?T2dIVVNSU2lvdUVvQ0RyZk4yRzh1U2NyQmwzTFZKMlZ0WXBhTndjbWZuMnEw?=
 =?utf-8?B?alNMZHc0N2lxRTgrWWcrRCs4WnRnSW5CWXJDZTFUNElJdExsa3dJL0Y2cWdh?=
 =?utf-8?B?d3pYQmVYUnFVank3bnpBZVZibzlSVTBxS1BTSmRkdnhNTXovWWo2WmpEOHNV?=
 =?utf-8?B?dkNCaFVMVjdQUitmblZqYko5QUJwa2pSY2p1b25Edk1Da01BTVRnUjQxZUZL?=
 =?utf-8?B?NENHN1QxU2k0ZFlETVc0Nko3MWNLRVZ2MitnOE9xQ1VHaFJIRW5SSmlaTHMw?=
 =?utf-8?B?V0hmQStYVjVwaStRRzRsbjlXVGJkcG96U05qNVMvS0hvcmU5MVhNT2dXNEZn?=
 =?utf-8?B?WVE0Y1BscTVSbXFJTWN6RVdDNnhlZWg4OCtVM3hORHNVMU0rTVJkSE9ZL0ZS?=
 =?utf-8?B?SFByY1p2ZlRsNG9BQ1BTUFlyR0l3aEt6ZktVN3RyRTV1UytpekI1R2hrTyt1?=
 =?utf-8?B?YnNldkVSMTRWT1VrUEY5a25oTVdRTFRKN2UvTnFWZGpwYWlzb25PTjRpMjNS?=
 =?utf-8?B?TVEyMGhVSit0SHRUWmlLanJ0cDduMDlZVytlSEJjbjB2UjZCSmlHdDc1NnMv?=
 =?utf-8?B?SzRkTXhPWTBzdUdzTjViNWZGQ1FkS2Nzemw0VzFVZVBZRnRBVm8xakVlcVJ1?=
 =?utf-8?B?VW1QSmtCUFY0TXVIRXcrc3pSckwxeXBmNEVhOWlMdGM1NVBJNHJjRGQ4SjlH?=
 =?utf-8?B?RU56QVkyd0djeHRWdWVnVVpEOE52Lzdxbk8wU2hmVEZLVUJ1TGxiYk8rNnl4?=
 =?utf-8?B?dWFiWXlNZy82N2FiL0t3cEdIbkFWUTBTWXFEMnFPVGFiWE1NTzkxMWdqRjdO?=
 =?utf-8?B?Y2QwUjVKbmdUQ25LU1h1bEdlSHRSSmhSYlVVc3R2dUVPNmpPekxyWGJRcWRP?=
 =?utf-8?B?SGlmaDRtZ1JWVzMrR1pzQjZFR3JYV2FjY0JhRG1wd0lBWTM5WTBleFM2M0lo?=
 =?utf-8?B?WEdMUG54SlJucmkvNzV4bG1NdWVYZ3BRODRzUjNBdWljUVRUWnpkR0NnMzNv?=
 =?utf-8?B?Y0pzWXdaODRHYmtRVEdQMUxNd3VNR21LQS8rcSt1NmJ3dTA2WnJRYVdZWDgv?=
 =?utf-8?B?TDhBK2ZyTlV1QlZlazlRUllST1VveGV6d3V2Ti8ySFBqcGoxbC9hVmhPUy95?=
 =?utf-8?B?Sm1UQXQ4QWw4eFZQdjgzckRYZWVmcVN4bUNrU1NUaGdWcEx1OWhVTTdvK1lR?=
 =?utf-8?Q?xo1mhM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1ZYOWphc3c2M2Q0QXFqRm0zSXRJT21vUFpsUXc4QlkrRU5MQzBQT3JZK0sw?=
 =?utf-8?B?WlU2ZHV5WXY1YTQ4T05WWU9uVW9OQUo1RHh2THBoTlo5R2VVSWs0ZEdSNmNX?=
 =?utf-8?B?WSt4OUhxQUh2aVh3SFU3L1lEUG5wN3pvRWR2NVJWVHVwNzlnYWFCZUw4aEht?=
 =?utf-8?B?Nk4rOTNjWkFNblNleU1rUUcwd2J0WFVENkU5QmdHZGs3THR6V3JKT0w2Tzl3?=
 =?utf-8?B?a3JhN0xyeWl1N1lZTkI2azhzQnZQMnE5ZWc3aWszdnllTFdKeEtpblpvRXkz?=
 =?utf-8?B?SFNadmh1c1dGRnRxUDhqK1NtZUl3akl2SU40ZHhOUVFvL1JyaW1QL1JmVEJk?=
 =?utf-8?B?RGZJVjhoYTBhb0NtSHpYaDJiZzlTbzUzbkpYSk95ZTdyL29TbEptaldOV0pB?=
 =?utf-8?B?VldsL1Nyc0tUa25PeHB4enlmVmZPMytaOXl3SFN0aTdzUllsdndKNEZiOUFG?=
 =?utf-8?B?S1BZaDlkKzVIb3UycU5PUkpjM25YdUkraFNsdW9HTFFGQlpuaTVhRWRKSGVu?=
 =?utf-8?B?YTNvRDkxY1V5Y0NIclRMRm5mQXJZWnhsY3RjMDlFUVNnV1M1L1kyRzV2YVIz?=
 =?utf-8?B?eHpLZ0ZUdnNsQ3RWZ3UzR2RzV3p4c05IbnJmVUFKOW1DaUM1Yk5SSmVDcDFO?=
 =?utf-8?B?RFBKYTFXWjlJaXhORk9MSUhUQ3k0WklnRFN1dy81TGd2VVpEME9paVh4WTFm?=
 =?utf-8?B?Wis2ZDd1V2UrNGFxVzQrRjNoV2NDODlnTEZaTjZtL0tHTEMxTUZOY2F0WDNP?=
 =?utf-8?B?UWM0a2hrWFBlMTQ1TTdGSDIraTc5ZzZVOUdtMThSaUFOS1hXSGFIY2czbnJI?=
 =?utf-8?B?Q2lwTEZqZVVmcmZJdEtneHlOWkJBaUJxTEVXSWVBWCtjZnBYSlBVMWEvN2tt?=
 =?utf-8?B?T002cDJKR3RuZXUrODJJcEEzc0xObDhLekd1anRwaHRmUDB3US93WVdROUho?=
 =?utf-8?B?ejVGcll3ZE9sUE5OQytPdUZzQnUrRDF2Z0dUYnBtYkpJa3RuMG1JSUVteG1O?=
 =?utf-8?B?Vm8vaTdZcGtVWUZENXg0MmRoY2FEQ3h4T2EwbGtGQVdZc1JqTkgydmVPQXY2?=
 =?utf-8?B?Q3RGc3lzbjZuZmRmUzhOZFhJOXpEYlZvS2VWQVNaNVY1S09TZVlEMEd6R1dr?=
 =?utf-8?B?MkpEQTczV1dQMG9xVFFzUlNvWEc3SjhDL0dhSDZVc1Y3T3hQaHd2cmh1aDc3?=
 =?utf-8?B?OVVuTjAwVXZubU01c3VEcnJLclFEUlV4cWhEeTNxSHZ0S2VWK2ROT2Fkclcv?=
 =?utf-8?B?ZjNabDNaeUtRWVAzbE1SYUt4TUVvZzVYSXNvdnRuVW9mUmZOMW91amNGbVQy?=
 =?utf-8?B?SnIyd3JNN3kzaE1za2txR01kZGhDNDJZTVF2WFlmT2J3L29lL1cwcENHN3lh?=
 =?utf-8?B?cE5laDdrZnF3RzlYL1VLMjh5OTlkOTh2NWdkR1hxZlF4TEJpRnRseEFpcjJN?=
 =?utf-8?B?OXhPcS85MmN5Y1NtcUtQd1pzd05rNlVib2wzd0l5eGxSVzFaUDRSVlRRanc1?=
 =?utf-8?B?ODdIL0pWdE5tMXl2Yy9lZXVMYnFzS1lzR2ZJQmpHdGdTYkk0M3ZIUzRueFlh?=
 =?utf-8?B?dlpHYVRTSWJYN0ZRNHFxM3pHYTlESTdxRU8zM1hFWGZ6OU4zZWFjMnNYQlZJ?=
 =?utf-8?B?YnFXdlhuYXZZMytKZ3pwbGl2NStzdHFmS0dRajUybk1CTG8wbFRNWkVaeG1J?=
 =?utf-8?B?dnhYWmhEV1NKMWNrYmEveDFWdzhEYm5IV2FqNlRFK25tQ3p4TzlNSEZRNWov?=
 =?utf-8?B?NXhnWm16V2R4dVlHNElBa2dGbE94N0ZIY0Y1RWJmc2lDdFFXV3J0cUlSaWpE?=
 =?utf-8?B?ZEpVbncwaHlqTU5RUTZVeTliVUZOMDNZbHZSL213bCtFeEtsdFJUZzRiNDc4?=
 =?utf-8?B?N1MzTTRycTgxMmF4Z2paRFByc2kxYmR5UWlzSzgvaDNNYkpjVTh1MXduUDg2?=
 =?utf-8?B?aHNycnVmRUNPcFBRc0JUcUUxdldpSUovQ0JTMklUMjQ3b0orc0VFVUZrdVdK?=
 =?utf-8?B?aVdiZHNDbDhKRkpTSWhTQU0wdnJkYkRzc3N0NGl3cEtVdXQzTUl1WktHa21U?=
 =?utf-8?B?Ym1NcXhvVXQ1bkt5bDROaEVnbXVNWDcwQ1ZNSmQyaDNSeFpwRW9qamFkdm1o?=
 =?utf-8?Q?SP84U421iVnH0jc4KAnCMXldG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0851448-7b95-4568-0fd6-08de0ca9efba
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:48:34.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxVJNuAjyasMgCStDxMzo5J5aidyFBIIRHwej6fGa5ZP6yLnxrySZBedKoSgN0VP0AQ1rzLmQGUAm0UirfKoqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

There is no user of crc32.h, debugfs.h, of_reserved_mem.h, virtio_ids.h,
so remove from the included headers.

No functional changes.

Acked-by: Andrew Davis <afd@ti.com>
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

