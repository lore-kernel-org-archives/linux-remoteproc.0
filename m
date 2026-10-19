Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436171;
	b=2cMiMhIPBbjR5mmlnYNBfHMVK+pZEVPwbyXKfJFhb0mqa7zxQB6YWFCyGM+Az5b+iGPi
	 DF9B7zoplQhWRpWMi8Ed5Oi0grg9okUVpr8Mp8YW5lV+mz2rBj8ezTBCzYbs/0ZGP+E13
	 RlTPkIopCxxxXaFgUTYNKBCP6y5WJOBdBf8s0ZtQfFP8fnLkmD0z/zXkT8xi97XEXzCQ8
	 kOsz9Iy+IzDzXQCn8vcXyD0/6woXIsyTy982QT6D9X0D2Qi+HGr9DNbcFDlOFYVzjQLPx
	 iQw/vQEdUvA2E7yb1aBhSEcp/fcbd4V4XVvcQgeulv7243gIt+tVPhrp0Ov0X1g8HUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436171;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wh4Sjr+m9wANJwd35UDCkQlCRnURGlrHGONDBL69HV4=;
	b=D/C6NeuZAesEjiJbvL8ZmQFE0UFaQqeGNy0k/C3Pa2kfgOf8f7sFC/+uKsvbKK0FLAsP
	 nkYnu0Ls3fDPu1RjFJQhQcgOU+lySOYhnvTEJFkyEi+UK/mMJN+E79glBg+xdbibpHpA8
	 CJxJAjbGSUrlBCZzlMyFEqhLpsdQb7psTD2sKZ+zUfa+0iSEQhUHBtfKEQwvNTKITVEnF
	 T+NE1/LC21/4mQ8K9TO0Oi70882bYSuUo7CXsOXkrGavfxoKNqKUXmWxmItxQ00afGu5N
	 FTIqcXCaeGBqqiPsFgchs2CPjl6c3DT1p4sMSJmC/U1LsAIew39gJ8yLs8iYLlsQ4dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rlKDa3oB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.9
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9554606A31D;
	Mon, 19 Oct 2026 18:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9554606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rlKDa3oB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nunpf97FD1OjUboLFYSJ91/x4CrdzEjS5768g4Hz6IWoTSF2g9iiTyGK6sDb8KKPK26uCmztnCPlE4bfj0I6sPaLHrFMRKFnDG6E58/lNBbBVsJbGZd72Zjc40bnQyFKLyULCUpUbmagVPgq/iUXHX7nzpB0xM6yl1mRL6/i4n/mu7MsBadyh4llnbTpmkaadTgpxEhfh8WcG9aF0GKBjSgJB8EwLIUhCs7Ly6Z3C04/HTjzqjtC9kq06wI0QLdq3rSFL0TK49zUuovuoLqBBbhR7KB1tBPRNEM3l3IVcFuBAPgMa04bm+2SYOOLROId06V6+cEAfQ7PE8GLgRv0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wh4Sjr+m9wANJwd35UDCkQlCRnURGlrHGONDBL69HV4=;
 b=OL6dTOpaAjtLY2QaSPVqXKBlpK+H4uHlWWR1L+2dsUt+ui7RFpqYvcLTM4d1hABnLyXV0ijNSMNsXNZNQCtOIsQ5GIeYGdVHHtUJhAP9m4kYTcWGTQUZQJeocD941UHOC4lQDSU5f2LjNdj18Da2GxZx6Nzi0vvF7y9IFPtwEAuLcFNvHoovWGyjGYkagX4ZRm/nBXHFB5GikP/Nsu3MjCHEnep2k/oCZQOt5BhzxVMR90QpuWOlL60O4L1oRy7X0Th9R2UK6Oa4/svhcehwUvPhudwVGqzJcSBQuXmxyc5y6VQK+DVFkqdEPzQuWzli0clDbLmE35drdAMTwcgWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh4Sjr+m9wANJwd35UDCkQlCRnURGlrHGONDBL69HV4=;
 b=rlKDa3oBjm4faSHnPzCE7TtvX64hfHvYCaBzcQDMcDLBrw7n45ygjSMly0NY+JlpB2ynAKL7OXr9fxi/uWw+l9uUF3yZ24o1y+CHLzPl0z1+6W3sReyTLMNsWYWOLXCFjr8dm2Lb+Ng2CaNyFmer39AnsM7UlWKAIv+4RiFSs66o/3Xn9OG91TsDkWv52nHlFfYYY5Cgkt4lRdejfmAX2qPtn8FUki1gWzl/eWwjPXhvALWV0UrZNaKqZdzkHcHQuITd1AnXJ2jqBbCvMSHzX+1O56YhioIWWHF0AIDnggiM5NqbM1k/oBDuVE5FlG4x1q0e0brkOSUhFRQwzGzwQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9320.eurprd04.prod.outlook.com (2603:10a6:102:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:56:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:56:05 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:55:49 -0400
Subject: [PATCH v6 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
In-Reply-To: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436151; l=2705;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TlfSh89coOhOhqIwKJP7LzYTsKt5NbnqLx8zyv+qYH4=;
 b=yaB6qjwbYqTYmhG0IZE0d6aVLhPFUCQyIPmSldoO2hGILCt6dixoNL4e5Vo0BNSGCpkU4fe8q
 6n438hVAY5QAHq6osPgAkajKocnkEtLDpg6TKk9NKDotthAUppb+LSq
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f3af1a-34bd-4c56-b7ea-08df2e12a115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|5023799004|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sMj5wCUjLiOI5mc2nE77SZgqHZl4WuB1rrcou9I8vwMP+rKd7BJez4s4a+fn55409HRt3iGrdLGWZxPRoCy6VPlMygfbBNY36UWQnv/+PEG1wO4CF2xJ/981k0rDKdS/GRzEnakYQbOheBWu/7R9RuiOSz8kJSuAusV3t0Y8QAPdy48Fi8L7uCbCORkL+8ynx1xq3zNsnEHw9E+OSxl7ybZUN8Oro1FgUlsMfPj7t8t/CCoBqnRM9STFbIwt/kZIcLSRJUR8Md0IHHjU7puwTszmayZ3iKHn/ugZ4J/T65nFUFgMFrVbaKhDNvSxVgHqs+/U+Kj4dP82a1AQbSJp2u3V3+mIEQ2x9d/DQPiCqhLChl2cmCZr4DfkxXnD1Ikh7j8OPmrNiIWOLzlg6OXuJIwG00/kiRy3bIGIUbnmXBidi0zofSDmiCHEuhAXogwPJ9R5aGfN3jAgvdoYLvHfgfZ753fGxarWOkh/fjMvIB5xU6dzi26kWwFMOE7IGEhltAFnHIFlT5A84y7H/6IUowWEoB0OBH9IDWTqIKHVUEEn8D5t/DGzEYU09J9Qht7xup0fnq+VpHcDu0aqgai07c8+9tDl4nexnfYYJ2IsZF1gSJ8qzdaaDVoPlzEQYx0o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(5023799004)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTErM01Bbm80V0JNR2VJb1puTloycXQ4Mk5VNWUwL3AzbGQ2NEVrN1hNbUVt?=
 =?utf-8?B?TXBYS0RnaGxCWVpCYUpGaGY5K2xhYmJWWC9aVEJkMXZ1SFVCUGovdTJNalFn?=
 =?utf-8?B?Z1k4SXUzVnBSKzdsTlgveFZ1UWJ0aWpob2hFbjR5UHhZVk5tRnhtT2ppMHJ3?=
 =?utf-8?B?N3NUV0ZOUTBEbldMNnZINFJ6R3NCRHpYRG9TT0dRdlhodUV0d0xTQmdCbDNq?=
 =?utf-8?B?eklSTWVhb25mRDY2T3RzM1ZDWjRxd3RYVjhzYW5KNldQZXdta3NBVlFrb1li?=
 =?utf-8?B?bFQ3QW54ZkdEU2F4bjIvM3l4S0RqdjZLdHdtSExObkdWV2lKeHVUZ3VqMGs3?=
 =?utf-8?B?Q1huSFRFUWwzM2V1YjIyL3RhcWpBQnNWd2hhQnIrYjRMU284d0F5cW04cXJn?=
 =?utf-8?B?ejgxVUZCVVkzNGNaWTRndXU0TW1EWFNkbFVWNS9pcHR5T3hHbFZ1aGFPbzRi?=
 =?utf-8?B?N3o1RnpkOWhROU50emtoNFgzYlVRSkRkb2VobXdLcElUeE5WUVBKVWNmb3Vl?=
 =?utf-8?B?U2lzRTY5d1o1QnV1US9WdmExYTRNMm03WjQrc3NzcHBuaWpEeVkvSXlnMXhm?=
 =?utf-8?B?NExIenB6Z0s0UFluR1dlRFN0NFJEd3NJYURUVS9rTktpV0ZJWklVMjJQZVdz?=
 =?utf-8?B?OGFLdjhpVzdxRWVOT01WRnNudDlTb09jT0pQcHFndU1jWWVmdEJEekp4b0Nq?=
 =?utf-8?B?clZJbWhyc2ZjMFl1NkxEdkxwY2YvenNGQ21ucDlPY0VRTkUrTTVFcHpCemZs?=
 =?utf-8?B?SnFCY28rcDZta3BoTVQvZDM2NWRtZi93SDBEazF0MXJ1Nm8vTWFTOFJENXQ3?=
 =?utf-8?B?eFEvbFdvd2IyUk1uUXBBdklSMUZ4c2tFS2kyaUtxUlZHK2FMcjYxeUIraEg0?=
 =?utf-8?B?Y3lVL2Z3aWwzTHJPcVBWZzRwbERaV1cwTEdEK2UvUGpoZC9GdlhCdXlqUnBp?=
 =?utf-8?B?aVo4WENHYTAxZUQxOHNvVlA3TGs3R2NCU1U2bll2TFhvci9xRzJpVGJmUXcy?=
 =?utf-8?B?aHFWMnZRdjZlSnhrVGNyM2dUMHFLdEdjd3AwaDNERzBSUXJzYjhSZXJhb3Ny?=
 =?utf-8?B?cG13alNuZitmMlJLaGtaaXZIbXFkQkRFMkp2TDhpek1GMTF3a3dRSmFJcGFI?=
 =?utf-8?B?M1VsR2R0dG0yb0N0Ri9wbW41Mk5WYlIyT1lnekdDZ24yS0tqSHRETlJIVUtG?=
 =?utf-8?B?ODI5YjJ5akNiMVAxc3A2c0VHWG1sZklOY1ZkNUxHMCtRemdscVNJdzduRTJH?=
 =?utf-8?B?enJPN3gxM2krbWFBVjVKd29ISm01R1VLQWV3SGtQbE9RLzhvRmRYQTVPdzZy?=
 =?utf-8?B?OXBjVmJwWXp0aHAzTXFKTEcyUC8za0RxbGZqNk5Xd1NlN0x2aXFUL2FaeDlh?=
 =?utf-8?B?LzNTVjRkOEIvYnY4TlJaeFZJRnV3L0FoNWE1ZXg0YlZ5OEVUeDhGTVJ1Yi9P?=
 =?utf-8?B?Uy92eGpnMmNJUW8wb3RXM2xZVFQ2eXg1SDF0WS9VZGZtaVc3YnlkY0dxVlRF?=
 =?utf-8?B?dDRrd2p1MjdyT3BqT0t0Zk15ZElrQ3VBU3VDeDhyQmFwMGI3M1gwTWhjTEZU?=
 =?utf-8?B?MWJxa1BjNlFsUTJDd3dnV0hzYlpIc0N0SnZWSVZYREFsZmdFekNuQURUTzVa?=
 =?utf-8?B?eStSbVZ5eHZWNVhqdkUwLzlGVWl6UWIxTEhVK3ZuZEhHUjc3cEhKQjI2THp4?=
 =?utf-8?B?Y0xVTkdWcWo5c2FOSGxvc3RTN05La1NVbnlsd3JyZWxUbnJlZWFHTENveXhx?=
 =?utf-8?B?UExKNnhqU29raG5MYXg0RnRIWGVIckFHWXJLZjN1TmM1bU1JakhQUk5ZUXRl?=
 =?utf-8?B?bVZHVzM4YkVwQVExTVh5RDh0UE9BRDRMOTUwMnc2TFhWbklldWxXVExpSDBK?=
 =?utf-8?B?eU9WR1h1U0owOTFocENiRnJkQmx1YXE4RkhFTFhFSzB5c016czV3UXpoQ0Fl?=
 =?utf-8?B?T2hRTU5WV0lrbWs2MjBzOFVQN3EySzdMcElHSkJaWm8xS1VEVkpnMFU2RDFs?=
 =?utf-8?B?KzJTK011Z1Q4NVl4bTZSOTNLWWp4c2RaNnhTdTVGQXFMd3VoaENzWmlpNkpK?=
 =?utf-8?B?Uk9vVURXbDdjcG5hcUFQdXVKV2tBbEJZemNKS1ZUMzRGZ2RRZTZwSTVwa0Fv?=
 =?utf-8?B?MUoyN2VOU2RwMllEYlh4endXb3p0NjZxcjExZjVSckQwa0lza0VBSmhyUmVP?=
 =?utf-8?B?OVkrc295U2o4eXJlQjA1TFlOMGxSa05jd2FZajNGSjV6ZTN1YmVCQXlmblRZ?=
 =?utf-8?B?MTVUTDBtRE45eFl3ODQrOG01MG1uTm8rNDZ1N0VPdExlUWxQWHFISnlzb1Ri?=
 =?utf-8?B?ZmNGNkpYaGE4TEdrcUtaK2N4VWNOVHp3d0pwOTFHSENxUlZNZkF5NEp1cTN4?=
 =?utf-8?Q?BTHp1Tm540d9HmFNse/OwQAdbKhbbIgZV/cf9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f3af1a-34bd-4c56-b7ea-08df2e12a115
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:56:05.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /q2q/gtaKxe3DgRI3rKevkk8RijnLSUkviktCKng2t8gCxwUc8uhPE3bD5jaFJUz0JRAg9+QMrOhGNilMQi7mI8plWo9fkiV5k6lGBoGu77dL6dDgz5Ojdq/lCkzL3Yo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9320

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Parse memory-region-names to identify the expected memory regions and avoid
relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 581bb07f5893f..714c3615d1884 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -28,6 +28,25 @@
 #include "imx_rproc.h"
 #include "remoteproc_internal.h"
 
+static int imx_rproc_rmem_to_resource(struct device_node *np,
+				      int index,
+				      struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
 #define IMX7D_SW_M4P_RST		BIT(2)
@@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;

-- 
2.43.0

