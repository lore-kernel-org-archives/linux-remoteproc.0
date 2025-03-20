Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383D13C695;
	Thu, 20 Mar 2025 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472526; cv=fail; b=leWSzm4bm7dSqro6jKzQPtuetXAuBlIhVk4WhtFf/lNouO7+5StP00cpcX4Vessc2eBUAU7A+K7L2vWpHD4zmtKb+MQGU7uL8VnnyKlliYJTGy3FGIq1BtbQKgD8TAXctrpik3Pz8Ll++/XOEhwj8LnhE4ePXol2knztbD4A4OA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472526; c=relaxed/simple;
	bh=Trxd3/SUAtBqmMTIY4azN/PExb48nUfS78JoWbV8eQw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ux8XbOyiVxNQhHBwMt9e65ZPIj/gMJtkLmsm6nFTSmUsabCBqo2hvMDW9GATGKJtQ5DMTpC3CDGsR+wFZtpymWO4XeERDb9ENgkPyVV8wsu3uGOYbBm6hPemhK1OXN2ufzzEQe8a6nkQYesKVkGpwiY+Yj6WZzKYYTLrQVoVdJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EP5mSZeK; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EP5mSZeK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJgH+C6+LRJDn33pCSsgojuag5fTdaa7eqkCw61k0/mw312Px6JqsLQQAiY6ueioyXwvNKLf6cUdhZmZ0GSEylv1Di0Z5buDS494FduQ6omt8MNKiGF85lNL4+QGJftGjukMT+U90kpshuqO3Dz2xEDFi8touJc+iXkx5dZpzIB9eYUv2Skoo/DfZ2xsgsZOVNoPzKXZnuQyEcYAOj3EwaQTwgzRyHVbGkB9dPKC8HzKxLuMxu64frwJgNVy8uJWdFwdx/wr44KhOskfOzTfnlKC1DlaEFiBnG7RxOKTmgqKCLGqtc1BZjDQzlHzTYGBe93Z0aRaad7iAsHcdiQrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdAOgP3gNkHvLFtV3A596Wkv2d+7FX+7z3evjIioM2M=;
 b=eINHsR6nC9xpSY6p9Wdgj9l3we3OI2ZfrCb8YQuoo1wfm/lU0Dl9kKWMkNgBx83F6qfmCQYBLR3kla8WZnq/IGqsxljOHsN0nvT5QQsgFLUtZh7/KXdWQKvFHe+pEqrvFYykVkDFRqD7QOwRT/Z/achRR6No39WeTmJBvwJmx0lw5nquut/a4OyBaXeoFlN0r9tZNAh5gm8rJ3K+0Exlm43ror02oLTqBAnFFTpJz4no592qB/vwFrLQsSkGZqF9radX4QQfzmbtJSAUsgq1T3ncfVmRJXW+G98ckG63C3wGxmOgSEwGJ2i0PmPz85WlTERCjxa0XtENolA8DS0yQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdAOgP3gNkHvLFtV3A596Wkv2d+7FX+7z3evjIioM2M=;
 b=EP5mSZeKKl3IMDPjEQhqMRBD9hZqrAOB1RMOmx6P5zCOboBq4NmjhVWOPdFsELx6ThDWW74Iw5QZR/yvmXWqdGPQFTp8gYURJJFRvCXe0eVyJDhH1q+cgYhbRLCKvw0AxrD7Y68hc7ss3hFH17R1B7B3FEJ0PoM82aWoTkKH2tn3LOQgLWXfC/LgeLICA/OqsooFDaU4y5LkZKRw5r8CAG72VCfkhyxp7BC6fHMn39yylvlI7biULjoawn2M8Npt7eIzD4QXP6Shb+LH5bRrMbkf2oiOGp+l4zeUZqip8OxDLh7vqClg6VgubXMEMHC8gEXXqFvYJ6jNnVulGOqWBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:42 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:42 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v7 0/5] Configure imx8mp dsp node for rproc usage
Date: Thu, 20 Mar 2025 14:09:50 +0200
Message-ID: <20250320121004.2542314-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::44) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 315059aa-6c34-47db-7c47-08dd67a7f4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ung1SVZlQkFGMzU2anRLdTVpRnBHb0k3WUZFZlZwVjlENkJDR2RTeUsyRVZ2?=
 =?utf-8?B?UHNhUHliZ0FkOFhyRWV3YWZXeU1wdUVYN0tKOWM3OTQ2Z0Q5cWNzaDFBaUJN?=
 =?utf-8?B?RDJ1cFdNV082ajFOQVNlWXVHOWp3azZ5ZzhKZFRmVTEwR1hSd2xIU3FRdU9B?=
 =?utf-8?B?VTVNK0dDNnN6MzFKQUxsUG82M2xSZ3hHMXBsc1JFTE44NUc4V3FTSGJZVGFK?=
 =?utf-8?B?Tmx3SXRwbG1jUE5DMVRVWkZxUllFVHBMd2dpSlpUTVE5TWpqa3NwSmJxWmhk?=
 =?utf-8?B?YnhpR2ZVSkFHNXJ6UTRWYlY0UHNwdDR6UmhhRm1ZYjN0RG9LNkxvTFdYM3Fq?=
 =?utf-8?B?R0w3Lyt6T25KeUdmcE15TWlxNHFKdC91SzBBb29zV3RoNFhTNUVmSWtnWXU4?=
 =?utf-8?B?bzh6Q2VsRTRMR1dxc09TdUxXR2ZYM284d25ndHlvSlkrZk5rZmJLSFRVWjVI?=
 =?utf-8?B?ZlB2bHdaT05qOS9WUzFybExKWnY5UzNYN3ZxRE0wbHRWejlTUVB5aFNTOHJE?=
 =?utf-8?B?aTc3N2J0MFVVN1B1NTkzR3RQZnhCd3hDUmE0NUQyZDYyQzZEajQzeGdNQ0JL?=
 =?utf-8?B?L2hCVzdnZk5DZnpJckswa2J0dWJIMFJRNkgxdHdhM1VaRGwrVWtlYzdaaHo0?=
 =?utf-8?B?L0EzYnBxT2E3dEpwbGl2L24ycUlMMnUvVFpJR3I3VXFWOWQydmwxZ0E2RGdv?=
 =?utf-8?B?R0FMWGxxdVd2c2RHdERKUUovb2o0eXdWV25QM205dk44c2I3eGY0aUUzdEJP?=
 =?utf-8?B?ajVFNTBldnBlNVdJbUtzWXordFplaG1iMlNYd05CYllVTE81VzJXNEFvQXBF?=
 =?utf-8?B?dUFUa0pXdjFnYmRnd3FNUjlIQ0FheFNVemZwZkg1Tldic3pIUlpub1hxR1gv?=
 =?utf-8?B?L0ltbmM3aytLMTZESVM1UUF6VE1KWDJxczlSMm5GcDNSV0FwaFd6VWFTOXhr?=
 =?utf-8?B?UnVnd0J5SWxMMGNMU21nTmpIeFBMV0YydTJVbSsxYndEL3NkWUIxVzhhMG5j?=
 =?utf-8?B?MlhzalM5TVRvWU1CV2hNOWRrVS8wazQ0RzhRZ2RzWlRocEp3NnBXVm14NHlk?=
 =?utf-8?B?ZnNGYlpTdkw4VlFmaUlFT0IyZmRaMkZUWlllS0QwQUdpKytpQSsvcUxMcVZH?=
 =?utf-8?B?YnFJdFM3S2U0cURsUkt6eHdBVWl1QmNpL203NUFLc08waXpwVW9ldi9ia3cz?=
 =?utf-8?B?bkM3RkhzaG54MUxSc2RUcTZkZzQrNkJrNVhvbnBVbFdtMEtZaTgyVGlCVGxj?=
 =?utf-8?B?Q0dGUGdDU1U5d3FKZ3p3VVFhVU5KTUgwZGxKa0t2R1ZtUlNnQko3VUhGak51?=
 =?utf-8?B?RWkzRjEvR0loK0k5VjlLU2xzUzFTSURBaWNqemtFS0NEb2lWc3VleDVDVWNp?=
 =?utf-8?B?QTZZcFREZ3RSbGZicDh4bVhKUVBLVEp1SUdSQTVuYms1QXdFN09hdWJ3eHNH?=
 =?utf-8?B?VzI3TzhjeGFhRmpMT0JRRkFzamhiY0VZbnc5a3ZvR2VtYnJGdDRPbGhtUDlt?=
 =?utf-8?B?NTNQa0JqQW1NeWEvdkUxZFc4MlhEdW03S0FFeUZGaFNiUy9RSUFCWTdtdFJx?=
 =?utf-8?B?SlMrODJQdVgzbExlSHhRbnpzNXpaSFp4eGFzZy9NQXFFeGNsOVRHY0R5cGtw?=
 =?utf-8?B?YTI3RVlHcWFDR2hJNC9CNkxFbDJrb0kwZSt1WjNYR1FPVmlBR3I2ajhjRjIr?=
 =?utf-8?B?QlZTaVpiQ25mQjhzWVNHZEFsL3F3YlRrNXFXRTZscFZRbjF3MVZ4VitzZmlu?=
 =?utf-8?B?NWlpRytKT2tzRDJ0cEc1WFliU3hrOElxbVJTcWZ6WlVaTVNOZzBzVUNuR2VK?=
 =?utf-8?B?SlFWN1VzWFZhemcxaThLNG90dkpYUkpqeUtDYXd6MVBhS1djS0J1MnlGS2V0?=
 =?utf-8?B?SXJrdi93SEoyUkVQRHdwM2ptUkptOU85b2hQR3U0bXNDNENHK0RuckdDaFhs?=
 =?utf-8?Q?oeZsnjqOOVxEDcl/bLOwZW3wSNPnis1A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVlkL01haTl5aWhSL1FIRlI0QVlxN3lZQXM4dTg0c0pLY1JKdUJ2dk5MOHhY?=
 =?utf-8?B?eGd1bHdqcmFVTWR6RmQ4VUNIUCtZLzNzWTlBQTc5N1hxWWx5a0szZlduYW5m?=
 =?utf-8?B?ODFEZXlqZSt6SHk5ZUJEY1FBZ3ZMM1RKT1dOQ3JFODVtSEpTRFpmcUNBNk5Z?=
 =?utf-8?B?RXBXUmowcFhFdDdZSUN2ZW9McGQ4Yk8wdWlmUU1mTk1YTnRadERTWVhLOVQz?=
 =?utf-8?B?ZHlIN2d3anBJYWM2eEhLcjBzNXE4a091ZTFYYUNGRk1WRnprSWlYMG9MTlg1?=
 =?utf-8?B?Z3JrMjhYUmxXOXh3Uzh4eWJlME8vUmlIejhRa216bThHTVo4clllclJndit3?=
 =?utf-8?B?bmtXeFVWeU5raUpWUzZ6MFFTYWt3QjFBWEUvcHFiT25EWkcyWjEvb2lzdmlU?=
 =?utf-8?B?Z3d6bE9WekR4MmM1dUVLZ2JZVGhVaVJjSjViNCt5dDJ2aVRqSVFBWE4xUUpW?=
 =?utf-8?B?OVV0VXdqbnh5M2xERzlPS2VrZDE3WVFvUFltVGJ6MWpXKzR0MkNFcVhJQUpj?=
 =?utf-8?B?ZFNtQnVpU3JlTE83M3F1L0FyVjdDemprRnhlQXMyblRDbU9MTXpqK2hPdEk1?=
 =?utf-8?B?bzhPOW12Z2VDb3pFd3R1U2VCMEVKengxdzJTeGNLU0p0dmo4d082UEs3OExh?=
 =?utf-8?B?S3o2cllyWGdhKy9VOFQ3WVdIelBPaDlmYldQQ1pPcHl5d05lYzU4b3J1cmt2?=
 =?utf-8?B?TmpvNmdpSHROTlNObk1vOWlwWjRGZm5KRm5yQkRWeEdYQnNTSHZPUU1TQmgv?=
 =?utf-8?B?ZWVCQm9XZE56dHhnTUMwSzk2czJ3c3Rwc1dZMkZYN29odXFJY3BrODY0U1B5?=
 =?utf-8?B?bjZnTDZOYkdaSTJJS2pRRUlBK2xTTUttTTlrRmpVaFB3VnVnWkU5OGpWUGZS?=
 =?utf-8?B?aW44VXUwMzRUSmF3OEswK0QwSWVpTUIxdXFMRU43TU1aSzBTSk1TZU45K0E5?=
 =?utf-8?B?QlZmWDNVd0hXR0tkdEtsa1BRUmQxSmN3SWFaUkZybTJiaW5YMzU0VytHNTlR?=
 =?utf-8?B?MTdkdVl2dnBvVUM0OVE5cWdJL2x5VHR3WjlpS2FGaUhhaUJzbkJ6WDkzWGJu?=
 =?utf-8?B?ODhYVFNFSHNkWjBNRUxFWFVBcGRBRGhSNU9WTTZHSHRyb2JPWEtJUVJMK3I1?=
 =?utf-8?B?SDJkZ3MwS2QwZTBiUDFLMENlUzlEMkh4K1RkNGhTY0t3RUhPWk1uVjNpaGhl?=
 =?utf-8?B?Y3ZGNFRnTDBYVVVxWWZJVkx5dWFMVGdYNWoyVXF2Y0VFNVdaQ3FvYUxPL3pX?=
 =?utf-8?B?eDF3K0ZPL1pYQ2RiNlhTMzVBVWliclhrbldwbFM0TGFsU1FGS1lWZHRPbGJ0?=
 =?utf-8?B?UVFwRERsL3huSStWVldscHJ0RjhPSExaUVlKWWQxdnRuL0FpUm5jV3Zua3pU?=
 =?utf-8?B?NVkvSnBCeUFpZjhOVjI2WWgrYVByZVdvUHVTS0dIRFpLeVhFLzRMZ3E2ejRu?=
 =?utf-8?B?bS9WL2plZitmQ08yM29BemRVVWJXaC93T0FnQk1UNHQ2aDBFVm13azRJTUtJ?=
 =?utf-8?B?M2t0QWRjU1loV1BNaWNHNklwcDdSTGxyek8reHVzZEkvdm9hRzV0cGh6endq?=
 =?utf-8?B?WVdobUlRQzFKVSthb01wREpOcmpmcG43YkNGenhMdW5iS2UvOW1RTkI4WHdu?=
 =?utf-8?B?REJOMHJabXB6eHlzTnhuWWNoQTY5STZkT2ovcDFOajdreiswM2hlRkFRWlk3?=
 =?utf-8?B?MnhabmRyWG5ZdXp2aGdaOUh1OHFJVEJFTmYyWmcyTFdlK2JpZ1NHSXdlL1dK?=
 =?utf-8?B?UUhNU0dpVHl2MmhwOGhCOE1IMjVyRXpMc2xkOVg0VkFUMGs1SmN1VmY1UVBT?=
 =?utf-8?B?L0lqM1NwVlZFZHBHZFY0VkJhbnlDWXhtVzYxUmVaYTc4S1B0UU1EMWZGZlpa?=
 =?utf-8?B?THhCTkNBNnlNaEx1V1dpTVdtT0hJOW5JS25XZStReHl3ZnpYMUZLalI2NXFp?=
 =?utf-8?B?ZGFYaUFWSWpsWkc5eiszSld6aWRiY1o2MnJmeVZDZ05Zdmo3MU9sM0lPWjVD?=
 =?utf-8?B?ZU1ZeFF0Ym5wUDNENXlTRDNJUFExNXppWTZLVXhrTWxpU1UzWUkrcjROYnZs?=
 =?utf-8?B?QWhjc0xZbmZxUnJyZWZBNHFEQVg1QWxwUG92M3h1aHFLTlI2NlpGWGt4M1VD?=
 =?utf-8?Q?SZNSVSlLK9n8/7R4hMJvsQjTS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315059aa-6c34-47db-7c47-08dd67a7f4a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:42.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJjUPmvmGTZ5v8rL+bwZA4w6QhkDmNgYlilYV1pJJnbVj+2J5Kqs2ozST67/1HhxBXOmZRHwqiMiGteILsfRLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
enable various applications:                                                                                                                                                            
        - rproc/rpmsg framework, used to load for example Zephyr samples
        - Sound Open Firmware, used to enable various audio processing
          pipelines.

Current dsp node was configured with SOF in mind but it doesn't work
well with imx8mp-evk dts. SOF controls audio IPs from firmware side
while imx8mp-evk.dts preffers to control audio IPs from Linux side.

So, configure 'dsp' node to be used with rproc scenario and later will
add a separate dts or an overlay to configure the node for SOF.

This patch series configures and enables dsp node to be used with rproc.

Changes since v6:
	- addressed Alexander Stein comments
	- enable mu2 separately in patch 5/5
	- put "status" always as the last in node definition

Changes since v5:
       - do not enable mu2 node by default
       - fix dt_bindings errors

Changes since v4:
(https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)·······························································································
       - after comments received on v4, we implemented the run/stall
         bits using reset controller API (changes merged ->
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
        - drop patches related to DSP run/stall/reset via syscon
       - picked up patch related to using run_stall via reset
         controller API.


Daniel Baluta (5):
  arm64: dts: imx8mp: Use resets property
  arm64: dts: imx8mp: Add mu2 root clock
  arm64: dts: imx8mp: Configure dsp node for rproc usage
  arm64: dts: imx8mp: Add DSP clocks
  arm64: dts: Enable DSP node for remoteproc usage

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0

