Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98312ECD13;
	Fri, 26 Sep 2025 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890052; cv=fail; b=XIASoQWIHHGSHmNTnf2ezX4C+ZuFZ7J/b9rdQxg57/IGcAWDEj1sYthFwHO9sPSILEySOiAjLajmNRQOo+5oCwtpLt66OvrhFDxQRZBnO1LB6ervRMj1K6cLR8WoaDltPdtuHnuPwHhWTDJeamYHCuUj+pIA+QENHJbS/CRIH0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890052; c=relaxed/simple;
	bh=T3yV4D5WDQGzqryCNC4B8NU4PrZDdZgkt6+KEo4gt9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oQa7Hjw/f9B0fZlreeTggWuJDmJL645VAL+zr1ZdpBGHSEM3gI94yKE1eezyjrY8RYd3pd1mhKd5AsNA19k/nYQADITKgQfTplAygiMUoj15oLY+CE+MsRDXKCibn+jGfBW9rMc2OYPrS/CDLfRIPfpfU4JIwK1MWCY1DHrBfZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jnBhhHrT; arc=fail smtp.client-ip=52.101.70.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jnBhhHrT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBrE2Bgh6/ChI9DpJG4+wyPGpaIL/CmgJz3Ec79X+H7GRema3dJqJcXjP4UKju1iOjnCfFXXdKfIAoG9/ZKXwKTzL1YeTYMTtF1wks1OQY0/MfPYLvFg+pV4FT9H08O6SfJ01xmR51z3y7VmdZhS9AvG+NSkz/7xjISLrv3AJMsgky9N9fOZ1cdgSqVN/P9WeWCOUQRsCZyTGOTZtqlYBwZMDdbjvG9SL2iTUxOhnng2srwaBSjiZXs/OS0/0571oj4Wu6VLeE31YyNtn7jgJlewsCBtyLS4tXv+aNOE5TimF6hnleV1iJTyqchDygL/WFWxK7jkZGSndrmhED393Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVkK3LV9sVyjvekRsIOBE/54F2PgxKOpYxxesSxfaUo=;
 b=GjZqp13lnuL0iLvgoEDbbNy2ESmwMHNz0Bo9Ud01lzb3oM43HJW4wYEfkM3+rJqbtTRiHyXF/lYLcogty+JG153Rglvp6Mx8gIiQDfTfFIMaK7xcX/jompOsPzMTy2ncR9MQJVfkh71bddKeVYQlHSq+9fsC0wvkI4xJBZ3cv/6QepSWujuMS0zKydivbKm5KMWYsy9xYaNpadkfNLK+1jviZcyQWkHk91Prqvl60TliulU6EGYaK7NS0n3hmuBTmg55mFgItLcQfDLxPj470ukT3P+Uhu+3OjVtXqQRsz5gjgq4Aqe0pckiXruBA+nLfYRof0xp5c1ovJxFNQ7CKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVkK3LV9sVyjvekRsIOBE/54F2PgxKOpYxxesSxfaUo=;
 b=jnBhhHrTOqYKaOBmFVB7TTfjQOdn3n06iXTiaGeZRH1Qj/z3T6Idin0wwjX2aquJaQ1jBCkFmeWmSYXcOPvxaIuCJ4PqRim76aTnmV5ExIEfE6YyAj+AUwApMEtzl6lXJMynNwdnKLDWJVpjvH0/1slLPCB6YMlW5VJZ6XsIfWXpTG1I6ox7YdhFs1psWvcuz5i+A3DkfkQV47O98jE5eAnXM98bIAk4o+NuLEHDixTlbLqS7NxumoUqhsrCvJSkyyl9v8qFTlQd+yWNylgpifbJeyjPyDdwOJleMtkPxO9FwQjZv/xye9U+d5zqtK3KtZY0A81RVxCGu9BYRkZGrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 12:34:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 12:34:08 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 26 Sep 2025 20:33:20 +0800
Subject: [PATCH v3 6/6] remoteproc: imx_rproc: Use devm_rproc_add() helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-imx_rproc_v3-v3-6-4c0ec279cc5f@nxp.com>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758890010; l=1342;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=T3yV4D5WDQGzqryCNC4B8NU4PrZDdZgkt6+KEo4gt9M=;
 b=4pRAoluDJixQLoot2L3KBMqEqQYxsXajlGaB65PvaT2QqXKJhrHIYqtSagU4cPSZ+Hhyk1sIB
 eeoXkSybMpuB54klQrB+HanskJ6Dd0YZV8PQSo/+EnyFgIkjt4SFU6m
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 933e23a4-d885-41c3-ff22-08ddfcf8fcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXNSR2JDZGRDeXBXR3MxWHVRQysvNlVGQTdVenJxN0tuanBsR0JlZVBBaWtC?=
 =?utf-8?B?YXVNTGRYNFZKMlRvaGRNMlluc2FQcmo2dGJrUjVlc0JOSU4wLzlISkw0MzNF?=
 =?utf-8?B?Q3kyZy9STnRodUpteFRLREhmU3Y1N3NhcEorc3FrTEJ3RzdIbW9GY2hBeUJq?=
 =?utf-8?B?cFY5QmdnRituVUhiVVN2TkFOV1hPcTdkSTRRU3lsbWlGR2Q0Sm1XOFFYSjJC?=
 =?utf-8?B?N0djSG5LUS9Kam1ONVN0cFpNWlRkVFdMU1BWRmxpRkRuUDRyRHhIK1lJcTNa?=
 =?utf-8?B?RG1ZUy9xdWZRQTZuSlBEOTQraDdmL2xtdjFwVU5lSURFZ3RGazFHSGdWWnQv?=
 =?utf-8?B?amd3cFV5Nk1lME9GRmZhWnFNT2E4SWdWMWdFMFJOdDVBa1pUOCtSTzhGdG5L?=
 =?utf-8?B?VUJ5RmRNWUdiRERxc2dsdDgrVXB5cERUYXp2Zi9Sby9iUjhVYVp1L2poRnBz?=
 =?utf-8?B?UENVMzF5L0wzMW1JN25jQzlheVBiN1hZYThUVmZ6ZFBoTm5NVXYzK0FLZEJZ?=
 =?utf-8?B?VDV0SW81K0RQbVRycGk5bFFSMHB3Yk5XVEI2aGlCMmJrWFFBWmlQSjFtTWp2?=
 =?utf-8?B?MXpBVlVHK09hZGJiV3o0d0Y0ek1vZjlnZEhFTW5FY1lOWHRxNHpoeUZCZkJP?=
 =?utf-8?B?c041NWI5OEttc2t0bEhJa1lFZ0t2VGgwcFR0d1VTY3BBanc2NkFkWGkzTjMw?=
 =?utf-8?B?RURMZ3M4U0RXTnNqblhLaWF2czFsSnozTlFmWktDNmhwcTBQSllHVmZ0b0dk?=
 =?utf-8?B?aHpSUTY2VHE4U1FNOWdnay9JOVAxV1ZBQ3lKMWJDS1RScXlTa0s3SGFpSDEr?=
 =?utf-8?B?TTV5RnFjTnpFYUtscmF2Sm5wc3A1aWZSYVVQN0IxKzc2QmNncXM3OGJreXRi?=
 =?utf-8?B?bE1NdWswOFc2b0hSMVltL3MyKys2N0xvOVloZ2NWR1VYTC9Vc3pYa05KbGds?=
 =?utf-8?B?QnlqeWtiSElqUk9tYTk5dTlWd0c1ZzBKb0tzbEY3TjcyNkJOaE12OXFZZ2Zh?=
 =?utf-8?B?SldobmVOcHpueWlOWDY1Qy84SEJsdWRuU2xmektwN2d1Zi9SZUFYNzkyd0c5?=
 =?utf-8?B?SDdZR1owRXppZXpyYzVSWDJVUFVDQVRod1M5VE5vRmVmWXhwR3IzQmpybmp2?=
 =?utf-8?B?MnNMTnNOTkRGQlhRY0NZUFdjc1dxK2NPcGlaTnhBZmRSbk1jS3YwVlJZY0RE?=
 =?utf-8?B?NldiVjliSzlVaEVnWGJLR3prdnU3ZzFRcVBESGQzWGhFTWx2ODVRc3Z5bUtu?=
 =?utf-8?B?Mnk0cFNQdkxPVktlSDkxaGg5VmY4Z25xTDNZR3R2bDhuZXV1ajVXVUNTWWYr?=
 =?utf-8?B?anZ6VEpGVEFnWnlUUU1jT3hpRnRuK3Rnb1hGUnF4bzl4cCtXU1dUN2dmaWRo?=
 =?utf-8?B?eEpmRGVXaThqLy8rQ0JQWTRDSUZJSlpxZU1VUGt1NlRxR0dhMUpQZGhwMjhv?=
 =?utf-8?B?cm5HOTRxRzdiZDZNeStiUEltYlYyZisrSDFhMytFKzNsZVNPRitDRDN3elhK?=
 =?utf-8?B?bHdhQkJWTXNTUmQ4T3JZYytQVzlUVWZoVVc0UlBUSDUxUFVDVUNuUFdYMlBQ?=
 =?utf-8?B?bDc3d3QvQkNFUXlBN1U5UTFuTmZaK0QyNnNPb1JjeDIzMWpVR0FxWUQweDlP?=
 =?utf-8?B?MDBRRjZVc0FBbmtsZTN2VkxKeTNKVnBzOFBuTU1STUlCajhUWW9UZ0xlb3pJ?=
 =?utf-8?B?YWlVMk16NkZsenFhci9tYlB0NnhCSGQyNXNKQW00dFVtcTRGVXNzS0hUWnRt?=
 =?utf-8?B?ZEJBbE1jWGwybFY0djVWdWpJQXR3SDZRMmJjRTNsSW5aWUNxNzIrNkg3dUM2?=
 =?utf-8?B?cFlybEJYVzJsK0VScUhMV1NTZmJiaDE3QUNtVXBDcHFXb3JPdCt5VzBRTm1q?=
 =?utf-8?B?Q0hHcXdGby9kdE9qKzFiSTljdlIyNXFwR3htNzNHMlVzVFFLZDlBTVVsbnJv?=
 =?utf-8?B?QXJxRUlZVmx6b1VUa0FoRVF6dnRGZ1lyUDB6TFFsNGtybkdVcmIyZ3lYeEJy?=
 =?utf-8?B?YlMyN2NtWWlwdTB6V055djdUNlFsQytaQlVSa0gzSzBkMFZZMWZrZHAwOERi?=
 =?utf-8?B?dllzcks2MmJsYTRqR3l4VVdsZEloREduZ3FhZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpHa1dTdEJTVUU4TGNjQjFHV1VEcHFtdVoxRTFnWS9haVhiYUhOU0VEL2t0?=
 =?utf-8?B?cjdSOTV2cVlMVUYzaDV4dmxOdUhvY0x0bDREZzEwTEpLL0RBTHc3MnFXdTAx?=
 =?utf-8?B?RWhPOUdNMElQQjdmSm40TFJwdjZjZC9DY2k0dTNKN2tGR3JhamZKcld0Wk9x?=
 =?utf-8?B?RTVTUXc2RDJ1aWU5TlFIbUJaT21mZ3MxVmJzbzhndUhOR3gwb2x0bGR1YkxN?=
 =?utf-8?B?QTFLcStxeEEwRWhMa0liTGM3Mjh6cWtKZllEWGJ1TGVNeWhrcER1WGxPL3Y2?=
 =?utf-8?B?SVg2NzZ6TFlXS1lBYjdndzNCSU9hWVlEbnc3U2w4THE0RHVjSkgvbmRuREsr?=
 =?utf-8?B?WE53NTZQN0RWelNDR3AyZ3NIaXNROGZLRitoVmZJcEpnenkyVnZuanhkVkZR?=
 =?utf-8?B?QjViakVFdjJscHFUWXdZSmFjQmFQUnlqRVBVL1dPd1JNK0tJdlZmNWp2OUtp?=
 =?utf-8?B?REZuaVNFbTRkNU1ZS2taTHk5T25iaDljT1J5aEdac1NrTkhNWXdUVW9VejlW?=
 =?utf-8?B?ZEtlbE1vcWhwZXc4SWFCaDl6bmRVSUdtZ3ZneGJOTThjWEoxcDZGbFVGajhl?=
 =?utf-8?B?b0lKUUk0TXNEdlNZTmlqSDFqM0hXZmh5UDRoQU9sQkw1dW5lN2FxNk9Ga1JE?=
 =?utf-8?B?Y1I0dnpTSUI1UVlQdjVpZjlpWEYrbCt2bWtTVndkTzBpc0hZNVZQVnNFd2tE?=
 =?utf-8?B?MGV5RXNtT2M2c3lmMWN6aldWOW5ac1d4LzZLUStycW14cTE0TGNFRGxQWUpH?=
 =?utf-8?B?Y1FpcUE2L2V2c3l5aW50TThWZEFkS2orcEhxdGZ4ak5PZ24wMnNWUkdJRjRH?=
 =?utf-8?B?MHdMb2FjdFNvOHlnR3kxbjU5R0huWmpOUXRlSTFEWXdaNWpHWDhxTzVhalEw?=
 =?utf-8?B?M1REeTEzd0lWRlYraS9kNGtRSVlYbWlkdEUvOVYrZ1B3THpES1cvamxyUEJS?=
 =?utf-8?B?UlJFcnRJdU8vZElhQ3g5Z3lmbVRLbVFJWFpTT2JrbHJZU21Wc0JmRnUzc1J2?=
 =?utf-8?B?VHhWNVlUQnE5MjAwYzZWTE9BUUZxUDVlL1NnMUtQS0xZaHNsZ3V0OUlpSmd6?=
 =?utf-8?B?NFhJTVM5YW5MYXU1T3prTnFrdHFsdnFkdHZtL2tIUllIV2xCQUZJQW83d0Yv?=
 =?utf-8?B?SVhVdkFiVlhnTTQ0aHlqOUUzUmZvZUxuVWE4TmJuNy9oQVphTFlOY0d3VktE?=
 =?utf-8?B?bUJDQjJTNldGTDVsenZjV29KMy9QRks5NklVL3lhaE5WUlN2STlEVUhTMHFO?=
 =?utf-8?B?c3R0WUpLTU9ERDlWUkErVFJPM2VyVFF0T2RnZVE2V1VDaEM5L2p6YVFKdGNB?=
 =?utf-8?B?cEl4Mnh6dzY5Qk9XY2xLMUtjdTdsdFM3eC9WeWN0SEJUbHVuYnlWaFZ6SHRX?=
 =?utf-8?B?U2NsMk5TZGNCSSs2UEhvbW13cEFqT1JYZngvcVNtaFdQTitpME5JMTJjQlZr?=
 =?utf-8?B?OFRxZkZiK2ZmbFlQTnc1d1h3YXVucjRwbTlWd3N0RlR0Y0F5eXRPVHZ5Y0tH?=
 =?utf-8?B?ZFAyVWlrdTQyNnVEYmxVZlpwR2E2eVl6R1VESDFCdTZZbVExUjArclo1OGRi?=
 =?utf-8?B?bytSNTVURExTRjJkWktlaUdHaVd5YkozZVFxdzM2TVh6S1NrRkdHL01nVS9q?=
 =?utf-8?B?aTZzZitqSUR6ZTVQTDl5YjNCVm4wUW55MnBCVm9wU1IvNGltZzVLV0g4UWFU?=
 =?utf-8?B?YmkrUnF0K3l3SytORXk5Szg1NC9ZeVg2YXA3RzRYUTdFV1dncTVvS01kZ2o3?=
 =?utf-8?B?Rm45NVJFcGNIbkdwOW9wZk5lYUpsZ1ZuM3V3eENmendYRjZMd0tidjd3U2Qz?=
 =?utf-8?B?aWhUMjBFSkx2WDBHeDhSYWFYL1liVHF1d2QrbjZsTXZEbjE1alRIMFdOemJP?=
 =?utf-8?B?SnZKK1k1d3FZNGxMWFF1Mm9vRkc2VkxWaTdnQ1hxSForYUducGhuak5SSDVC?=
 =?utf-8?B?WUxOdXVzUW1OdENLVDFMajZ0RlpiekV2ZlYwdTFPMHI2TEVId2F5WXFLekFz?=
 =?utf-8?B?RnJDbFNGajFlMGxCMXBkcmJteGEvM0dkZ1BKbHNSMXVodk4vc1hUeHNnNXRh?=
 =?utf-8?B?VEhiblAyYU10WlltK21NdUsxOFM0alM3TVdZSERGbUxJV3E1Q0l0dzBiaUhY?=
 =?utf-8?Q?W/MzDEgsATVj0/AMwlYE0diqU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933e23a4-d885-41c3-ff22-08ddfcf8fcb0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 12:34:08.2677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJkPQ3EyAtDx3UhWnoruXU/MGUASre1aYJCxQQ/msb9FstBlsVW02JOdKZUgyp26LORpcqhe+sqsdCTyk3EXyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
ties the remoteproc lifecycle to the device's lifecycle. This simplifies
error handling and ensures proper cleanup.

With no need to invoke rproc_del(), the remove() ops could be removed.

No functional changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 76feda868cb619b79922bcee4c6fdb3e16fc81e3..68e01b647b66910627fb2256c96c152f3c22c83b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1135,7 +1135,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 	}
 
-	ret = rproc_add(rproc);
+	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
 		goto err_put_pm;
@@ -1161,7 +1161,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 		pm_runtime_disable(priv->dev);
 		pm_runtime_put_noidle(priv->dev);
 	}
-	rproc_del(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

