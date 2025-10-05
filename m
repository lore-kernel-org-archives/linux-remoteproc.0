Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896DE288C2A;
	Sun,  5 Oct 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673702; cv=fail; b=vF9SblpkppV5sTtlrYkE63Zlgdz2nhgKVvXz10gu+gI6duFLn08xmM6q8mraxWvev2nAv6ENm3JQYNksaEn39btISzOiZf5R1OGofjWb8t+0eTZTLpOXpll8j1OcPZL8ZdQVB/HtQqINigzqz2YyWcs08Dcx2L0FSO7QhEAN7EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673702; c=relaxed/simple;
	bh=J3lgJlrgnyE+h6Kt/mR8twuUZfLUWoL14y/SvXjlDqU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gjgkevoPD+zty0Yip3WSnbGe4eSFA7jVrSTgiTuvHZAqWgRP/zKOew/ACl0N/k7DA6rxVVgep8Ej5BdVL5W/7p0a72Sshxsh2J4uQO0Vjt/50KN+tquvU1AfESSmiNdLsVOil328f+WiIU0taOglw5B9XcnyccmGwRHEyzBeggU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S3ZfUwnj; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S3ZfUwnj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsABoNCxGTfDrmO+43zUC+xuSwQTzNFUokzmSSUyLNzfz+Uzkh8i0H7PRfpxE1dPRCbRjRghQjzgNzhX7OUfQ0UvflBrVkryMFJBqr5b5TKxXUFvqqKmZ7iaLk1I1UrA6JxUg0UHL1C/huw9suRS+zemh8JTIYVfLV9jHsPLaPcDmx1McbKSDRFf27mccVCmlMCU7hd0w54FHlWRHS562v23UpiXPO1Hiwnpc8KYtes6X1+yvTBlMam7hiudI/c+76DZSW8aCExPAim47IL4zMXH2Ck/zHNq17tb0EIhsuoWmDrmgKYmvJyajfnRcLvknVNTukrWw4f0177cn31okQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrAdXIXaL0dVnlEFxjWUybCCxLXPgiyPBdqHAr31fHM=;
 b=Nuq+tXm97dAAvPeR8SceYmdaCYEcQkgQEqYit6mIUvs4oFXEV2T75lbfkTVue2HJ7cZQOHEcc1wzCiHq4xg5rIiGZz7JmooqFtEMYgWm7XBRBN8PxxhQ6IQF42LpVKIazA/WkApVeBrmRz5p5h1c0WHQz4/H5ZEK3mpAjESFQjKKCCzegOkA4vP3vxotrp0Yaq3eAOVdWkEssZdun1hrnI8RL3SZ8nuvHgn+pFrWXIxzndPXYLvEvX/Rd9DMqR4NrU+4aqs4yIoFzUtnlFYhr1huO+IXVrVZAIw9UqXm3DFkEC2Ew2dW4GeVAp2H9Wjd/TW+eL7LjUVTIBkdWnTrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrAdXIXaL0dVnlEFxjWUybCCxLXPgiyPBdqHAr31fHM=;
 b=S3ZfUwnj5Qbtk7yRLCc8BcTTCa2XWC4S61qfAymex8S6VQ0FI0VpLJ9y93XzaFMCVjRVs+fRT/7iah6YjqpkV4AtcPpHKVDenx/c9n5KIR4RQUnu3yvmy61DRp/cupqF3VZxMNnEDDHVFjEPLsxI8E99BQEHt+3WYlOcjcavQswmO4SO9E/SK0P5Av1dpz7tCQYXd2vhaAwMJHr/qw7RWit9tlBwhZvECnXG8lPldu5eJ6bdgdDprgxyo8rMhGx5r1akZYvZujCEwydsTO876OIXMEoI6JSCFHLLrP0QkejJcpv4JoDPnioLtzFWCRiuBz1zTvDErDBEVmx5u8Xe0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:14:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:14:51 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:26 +0800
Subject: [PATCH 1/6] remoteproc: core: Drop redundant initialization of
 'ret' in rproc_shutdown()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-1-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=867;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=J3lgJlrgnyE+h6Kt/mR8twuUZfLUWoL14y/SvXjlDqU=;
 b=yUUlJJFvYw8/JcjXGKwtSvt+ucQM2AdJFZJI34ogA3Yuq4O/+e2FEByYB4ftgwFSAWpBkWAEf
 N09uYfU+COOB9nQrx6WaifiJgsTNHesblKPPMafScqS6y8pV7pIr3Q/
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
X-MS-Office365-Filtering-Correlation-Id: 78784b05-e252-44eb-27fb-08de04198c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXNPU2VOWGVsdXR1T25mNzV5ZWx6dHFRODdDNk80dmRYaFVGQ3FzWUU5ZUcw?=
 =?utf-8?B?T2NDOTkzQW1TMVhtNzBOU3Y1N1VFUEFzUmQ4WkRHMWliRU5QcE52ZFFjTUti?=
 =?utf-8?B?L0k0S0laRUpzQWNDK2l0a3lzNkVwV21oTXE3V2dId09uMjIyMW9xYWFZV0Z4?=
 =?utf-8?B?Z20zTzlxdmpHMzJyNEJ6UmtNNFFvaGJHTVB0VjNaaE5sbmszM05CdXZPakwv?=
 =?utf-8?B?dU9odFZVanNmMi91aytwbmpiTGM4bDFqSE5qeThYRW5hMWhGamwvY3FhdzA0?=
 =?utf-8?B?SGFFNk0vemdHTmM4QUZQWitJa2kxL0Jqamd2WUpYMmdCRktpRUI2SFJaQkYx?=
 =?utf-8?B?bmNZbmYyZ2ZWMFNLWmtHVmc5WTlJTGRhbkdiQkpwc3B2VzNTcXJZY1lHN2o3?=
 =?utf-8?B?a0ljMkozTTdoajZWNnhBT0RkRXJHTDJYSi9SNnY0cE5SSXRvR2d2L00xQjdn?=
 =?utf-8?B?MXlqRFpEMFBpMitybEcwTXhFK1JvUEs5eE1LNmcrRE9abzBGenI2K2ZEbzYw?=
 =?utf-8?B?RnpFbTNBMTRTYktzNDVtL08vVFowVFVrME1mNnBTNGM3Uk9PbWdYSG9RRkhy?=
 =?utf-8?B?NWF1Q0xRMXJwdDNHdFZ6dTVaVkJ6NjdySGgzYUFvTE5jWTBwTVFHejM1NndG?=
 =?utf-8?B?Z2FHbnV5SFVLNTJ0TjYyVHdibERySm1GVXR4YmRLUndWMHBxK0hQQjlvZklD?=
 =?utf-8?B?STh0TWU1V1pSMG12SmVvM05nSXl6T3VKTGFRemRTUFNPZStkdXE3eTVESFZv?=
 =?utf-8?B?WlhMVlJadGtJVXBud2hoQ3N4SUhjcERDQ1BuUlZCTU5pdzVManBzUHJlN2ps?=
 =?utf-8?B?V2ZUcTZxRVpYRFNta3ZBMlVzWW02dUhRbDVZWnY5cTFyQXVhTERadVZVdVhx?=
 =?utf-8?B?eWQ3dmM2eU4zRnc1Nm9lSVNSRUh5M2VTSXh4dDA1VldlU3E1ODVHdlZNditT?=
 =?utf-8?B?SU5pWU1EK3I3d3pMZjBoMUpELzd1N1dyY09Pbkp4L1RqUTJXNmhRRjR6M0h3?=
 =?utf-8?B?K002Y0s2WlJZLzNwOEw5enE2NjNRYUpYS1djUENzTG9oOHB1eGk1TzRnYkRa?=
 =?utf-8?B?d210L3Q0c2hITDdrd2F0UGFjaUIweDh4TEtoZTI4VGtVRm1uV29GK3Zadnlj?=
 =?utf-8?B?UEg4c1BTSG1HTnZvVFZZNTgvOSt6RjlEZGVlWWhMRVBXTXBTWUEvRHEyajlB?=
 =?utf-8?B?UjIvNWFrcG4vZDM1bVFNTHpNdlI4ZzhKY2JJWElDdStxUUlYZm5VMmRHY2pK?=
 =?utf-8?B?cjZhV1plUWNYcmRzdHRLOXN0NG9lcE1qb2trSENLZGxFUHp0MGxBT2pKR1JI?=
 =?utf-8?B?L1lpWkgwRnloVUFzWXpiYml4WFB3MlFaRUV2RkhZNTBGZlh0V3kwT2pTcVFi?=
 =?utf-8?B?cGhtYnc1bXExUEJJMGZjcGRqOGQ0Z1lEOHhZQ1V2cUF3TThqcExMcGw5aVJ2?=
 =?utf-8?B?RUlJU25xalJhR3BxSGJma1F0V3dlV2tPTGFLSDVHVngrWEhTZXorMXdjWjd1?=
 =?utf-8?B?dzFJV2FsemUvUDFOd1c0cEczbTJrWXFBZ2dLT0VBTk03Ump6UEtNVjZ0b2Iy?=
 =?utf-8?B?N21QU0lDYVJCd2NqS1BSOVJ0Sk9BRDBPTDlFQStrY1pyRmEvdW1PZFRTNjk3?=
 =?utf-8?B?ME1mOHBwNG9Vb0krMWZDam1FVUFPU0JtcmNFMkdlSWNzNUdXQlZGT3NFRnVq?=
 =?utf-8?B?NlhsQjJlVlhPZThMWUhRUjJXNk8vQmhWMDdyVVd1R2Z6ZlpJMDNYOWM1TWVE?=
 =?utf-8?B?Vis0dGwrUWtuQzFsajRHS3hSWGp4WU9RZ293SUl3T1FwT3RpR0p1MlZ2dmp4?=
 =?utf-8?B?bS81M1c2UjQ4ZVBXYTF3ZS8yV1dZekJaUG1RRVJLeGZWZDJxcm1hQ1pUZTJG?=
 =?utf-8?B?ZkNWWi9FZkJHZFdQamM4bmxiblZBb1grTUJ3MlArSjBacy9pSDFQZDNrMEZi?=
 =?utf-8?B?alFqMVdka3E5c1BCelpBQ2N4N2MxUmdjdDJuUkVOREZBVkNHMFZMY2JENWtU?=
 =?utf-8?B?NW1oRmp1QllYOEhLZTdtdS9pYmw3bU1ZWWtGWUQ1ZTRiSENNZEwrNTFqMXVW?=
 =?utf-8?Q?3vzQ/a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm44QUt1OGl0UnJsckJMSkJXR0JJUG1OS21NY3hWdm5LRDY1c0ZUdDBrMWI1?=
 =?utf-8?B?SUFXRjRMMzZVSGk5U0NDdjZISzdxODNTdlJ5TEt0alh3WHRzM2pOS24yMUZa?=
 =?utf-8?B?RGo1VHFlbVAwNG85cm1TREp3NEQwNi91eU9qdHlJSDhMb3J4WndrbjNEbzBn?=
 =?utf-8?B?RlFrWHVWVzY1NlNSZ3RwZ05GZU1xbVJaZldaUWttTnBuUHBucC9CZXZ6M1ox?=
 =?utf-8?B?WDdBd1BRMHpoTjMyRWMrOERieDdjOCtSL0RtQ3lPVlBYd04xczhoRFEvSmtU?=
 =?utf-8?B?SlVRTnRZR0gweVgwL29xak04MUJqdWFPTnloVmRUNFp3QzZtZjQ0SjFFNWxP?=
 =?utf-8?B?eXNtczNnUWk5ZXZyc2w2OGVvSjNUT3Y5SllienlwMmtWVnNqeUdpcS9oMHl5?=
 =?utf-8?B?eDJJckQxYWlNYzQ4bGNRbTZPK1FLNE55TGpEb3JIaVlhTS85UklwUmo5UXRm?=
 =?utf-8?B?M2JId3psUTl6QWlES0sra3plYnZqZ3JCSFlzNE5mUEVHM21mTURaV2hGOFFN?=
 =?utf-8?B?aHNHeDUyK252NzVySW1TbytyS0w0S2I4Mk5CMStSOE4yZHpHTHM5cWJwdEZP?=
 =?utf-8?B?cGV3eGVQclhyRzFvODhCaW9pVlhFUm9icjB3eVJKcGdWc1dIQVVlZ21Pb1lX?=
 =?utf-8?B?YmhVZklaQ2k0UldIcXRRNFBVMGdaTTRuWmNMTmZtaDFMbzViSW5CQ3BaY2pZ?=
 =?utf-8?B?bDBHRUQ1N0hxSmNOSWt4dlh5cXlhRGxjL3hEaS9jNnhIYXdmWVJFaUh1VnhP?=
 =?utf-8?B?eXRTemNQS3JOdFJtcStVUzhlUGZZSzNwMVRaSUw3bm1sdUZMaTBJaDd6MmxJ?=
 =?utf-8?B?VFRKUXhrTlZWcm9wbDUrL09RWVUrbVZXbnN4NTN0UjdXZllqYzZtVTcrVWpT?=
 =?utf-8?B?VDY4a3NLbUUvS0Eybmp0aENkNEs2QXhTNHVFZjlJWUVMUVBRb3hUY3NMaHMw?=
 =?utf-8?B?WTlTdDNmeWg4bXdrSWdhY3RYakEyQXFRNmIyYU91Sk9aNHdlQUtkL0dPR2hq?=
 =?utf-8?B?aVpmeXcwUVZScXlaazkrTWcrWDFTY3E2N0hSWFNvUjFWM2RFWGNKd0RwQ2Zp?=
 =?utf-8?B?OC9kNkJzY213WmZoeEhiVFFIeU5IbXRZcGpCRXE5bER5OGxKM2JQbHpEZklU?=
 =?utf-8?B?VnYyMzltUE1YREhXd0Z0eWxuTnBxdTJjbnBES1ZQQmNLUjVleEtDeEdRWVZj?=
 =?utf-8?B?TjBwVXE1WWlSejlwQlNDRE1HWmVuMkxzVjJ5QVdUc2dROHlJZHRPNklQNmtK?=
 =?utf-8?B?c1oxeGxyOUk3d0t5MWNJUmRYQ1BVUW1yM3ZGQU9od0tsc0dVcUdiWnR2SDI2?=
 =?utf-8?B?cnRQc25DYzVlTVhnbDZzL3JJaEYyeUEwUk5xSStuYUpmbXVoa3g2UWtsMHgz?=
 =?utf-8?B?dUFQWHpUWXZsRWh2VHhlWW9wWlNudDhkSUgydzhmU3dzV0UrNmVjUDFaZnB2?=
 =?utf-8?B?RDg1dHdJWWpDblNOUkZ4dis2aG1UQjhuUXUyK0h3MUhKWFFKaDBXTG5NRWtR?=
 =?utf-8?B?d0V6VEpYTU5CangzUzN5Q010ekU5QjZOc2s1V1ZOeHBqUnB3ZFNNbFdYQ0l1?=
 =?utf-8?B?TWFYM2oyUlBEQlVOelhFemNXR3lMWlAwQnYyY1lBakpYblYrZjFZK3B4cVFj?=
 =?utf-8?B?cndCVmxHK0JFR2d1TnBHTjBReW85a1dmbWJDbCtCQUhMVTFrc3RmUkl5Q2Yy?=
 =?utf-8?B?WXpwaEN0Und6L0NJZlVoNHlwaDducWFSaDBQcmMxb1gvd1NMT2theWpPaUZU?=
 =?utf-8?B?MllkVGxtaXJsUWZjUFlmV01OY25sM0NHMTRFYmU5MDl0bUlPU3pEdEordG4x?=
 =?utf-8?B?T1p5M1ROTEVWZFc1dEN0Z2Q4djJVV2dpZHN6cTA5SVliL054VVl4dVlRYXNZ?=
 =?utf-8?B?SW11am1DbUdWZStRQ2FhUVl1dS9WWm1MdnhYY3F6TUk3UWVpUlBZQVk1WGMz?=
 =?utf-8?B?dmNZWCtSdmVsZ3lMelNQQ1EzSnFscG1Db1lseXhjbjBNTkxYeUkwVUtlZzlr?=
 =?utf-8?B?Y1E2R04zd2pMdkVGQVhBbkpaeTl5S3B3MXlZb0t1QWxpdTNPWEYzNjd6eE8x?=
 =?utf-8?B?emU3SGNRWTE2bzVCTWg4THhvZlptaUFDaVlxdEhXaWlDWWNhUVFWYSsxSXJv?=
 =?utf-8?Q?lP006dJd8qgTAHMxlE7lAbyIR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78784b05-e252-44eb-27fb-08de04198c67
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:14:51.2476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+U3pi2/eUesOC/XZdNmvbqOnBHiOt5w2amDNf4+qFF2FZr8TzF0FCIIjKbPy+NQw04/1iLtYHZoi9QKtl8jKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

The variable ret is immediately assigned the return value of
mutex_lock_interruptible(), making its prior initialization to zero
unnecessary. Remove the redundant assignment

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 82567210052893a501e7591204af1feb07befb22..29bbaa349e340eedd122fb553004f7e6a5c46e55 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1989,7 +1989,7 @@ EXPORT_SYMBOL(rproc_boot);
 int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
-	int ret = 0;
+	int ret;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {

-- 
2.37.1

