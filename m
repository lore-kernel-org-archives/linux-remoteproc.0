Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9181C01;
	Sun,  5 Oct 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759673709; cv=fail; b=PzFGQQo3X02ldm7hgUfEuXXA0QJX67KkgOC1DKD1Bi61wxL1jB9dQzke8FW+gARw4FN5S9hcFv305+eKnaX17MhnRwYBSGGbFvpyZzsAsBNJe4pgQPeHOFsn4JEh0wtOloDbXpZJtsvjFELvYLURoi1SLBMsy/Z9qeeHLL6nGIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759673709; c=relaxed/simple;
	bh=1eP+4qoxC8Ik0Xg73as5YgroQlDFbM1tbRFuzU0Qkz0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GsuGj/3AtlIM4Yo2cfngR1ZASl8x971q1BIHq1NRtK4V6kL/iCkagZToNGMpC2rpPIMJwM/S7lLmTMBUYLXMwJALw43b1dR70BuvVR2ftQPm2lqtlUq7PxfmCkCqPRhk+5MnDwo27xXjoW4ohIZXa6ulnp0psqfX9daTfqB8WVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eDFF3hYQ; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eDFF3hYQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K68KB/S5v27kefTv2lWOW4SDphkSDzKl3L5pOlM1xxSDkAImceBaCo12deBlyt73MtVtrMDJc/mXbWHWuHRLGX0WJwKDMQSM7utQvmgqWtbWXnh68cwqJaT6EMKFb0Y3rJKZ25iZO5x6STLsfHIdopJsNY8fjanoHQh0hTuhClu4UgiqnELAZQ3NHCPuoNtoYmGlJDjroivXv6W+OD7Cmb7xPP2cuMOFh+A0g9eYhBZObQoXipgjujxUcrDm/wIMf6aSL8Q6aF+ImV5U9jtGAwIq66WMRuPul/4yVY6s50glvVhUn7lRseBh8UcHAEDNfZuA8inglb4IgIUxCZCnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJ80CsSvf9wQD9brbGU07Hx8SXlWZcis4JATqA362Y=;
 b=MG908whCDfQxxQGMJofq6sIjLZhHYZlTH5GjvOXhrEZpljmCB8mu1RtIj2xGng3M1JEK59ubE6g/AyOesoMwNDKEiq3jPibdTF8iPrgCoLI9WB1K37oy1WC4j8q90mpo9gYCjr7lHVNF/9fXWDBpyJys8pFZXDXT9Xcj2XYeAArmdXkJrp4tTBo1drKIqonDahla4M7WyTXLCA6gY7jScNUwvDqgjlY44Xce41XGyRzPA1lRfI0xwMn+5Nu5lhsWYYxUcy3vlcHQyNrZ9SO1O/O4fMFvehXtTTFH8+pOBrVhyCoUhCTGZpX55eLmgK5FqJv1Dcdv4AIkzivE4wwn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJ80CsSvf9wQD9brbGU07Hx8SXlWZcis4JATqA362Y=;
 b=eDFF3hYQAExYkDGXjyBSoTKlfvDw+RfTZIFSw9UmfOsbdygj8KANVbLoKOD6VhtInZT837WmyCbIl5n5SiHrW08D9ngECBFk8dfrfdTCM1Ds1dfsvdRXrtkMhqLgUQJ2mtld5MdgqYv6WkufsqQa6fRT5fQZKqt8hPvpSJUuA90/YefDhCuPA2i8tfD/djzBA0bZnr9IxKz8kWSI2m/wLB0xtMcA1SM/lFZ7KZo7oq5BnWAwSesjSikfzinXxUJhfgvn15xCaO35RSLI0rs9sCSCGnUI0OuP84hJoVv/v15HiuoRdd0AuyogifAr7WDJRtumPWer/OhM1A6gGzAVcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10452.eurprd04.prod.outlook.com (2603:10a6:150:1e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 14:14:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 14:14:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Sun, 05 Oct 2025 22:14:29 +0800
Subject: [PATCH 4/6] remoteproc: core: Use cleanup.h macros to simplify
 lock handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251005-remoteproc-cleanup-v1-4-09a9fdea0063@nxp.com>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
In-Reply-To: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759673682; l=7837;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1eP+4qoxC8Ik0Xg73as5YgroQlDFbM1tbRFuzU0Qkz0=;
 b=6B4pkHJ0/xgDr0w5OD6jKg5sma/rPNixbecnFMe1bYeCO1SYeGxJaDVnyVB2mUL0fP5jmM8ul
 Vs4+3VICMdNCcwNznnzUesfzNoTHTK5VCu+uMt632Ju55mY9BkgUz7b
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
X-MS-Office365-Filtering-Correlation-Id: 32574960-2036-41a5-e440-08de0419916c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHUrZWh5WEYwRXlwY3kzL3MzTFVRRWczRkN6VnI1bHF6MW9ibVBiV2R3T3pY?=
 =?utf-8?B?bFl6NlJIV3g0eVM0dlV4M2RpTXBuYng3Z21MZW9jVVVDMzdyMUtXYXNZRXZK?=
 =?utf-8?B?TVd3bUR6SXRhYnN6K3F6M1l3VEEvQ0U2R2lxQVNPbWpHRHBKUGVXd0JLWnUy?=
 =?utf-8?B?V0Mrbk1QdG9UQUdDZis0elVjKzJOUTc1QUJwdlZ5Nml3UCtZNmpMQ0RUK0pH?=
 =?utf-8?B?aDUwaHNFc3luc2xjaUpqQ0pUVll1b1VpeGxBMkVmbTNYVGFOWXBrNlJ6M25S?=
 =?utf-8?B?UlRKSXhNMXZpSjgrVUllaGZHaWtBSHdKMDh6d1hhWVFBMDNLd2M4WUV4a2hB?=
 =?utf-8?B?YXhTVU05N0Q3QVI0THJOTWRWYmdNTzVNU1UxNndaRmJQdUNwSWZ1dnRoUnYw?=
 =?utf-8?B?bURxSjJvWW54dVZkVUIreEVya2VaWUVDYloxZlZRSE4rcUtjai90Tlc5bzN5?=
 =?utf-8?B?dmlndDZQdDRuQmdZYjc2WUFUQjAzQnRRM1hIT3k0aFdtTnRFNnZPMWo4T1l3?=
 =?utf-8?B?Y2ppb0JFQWJ2U25ZdVc0cTdVeXNvd0YwSDg1bEVQaE5QZTh6dHpDcXhiTzUr?=
 =?utf-8?B?azg3RUtPTTk4WEZTT2V4R1RsL1JaZ3pJZTdnelhRLzcyV1ZZblllblQ1d201?=
 =?utf-8?B?N25weCtHRkd5TWREckZwM1hsWEIyZjZjM1ErVFoxU1RxWkZ5Z05NWll2ZFYx?=
 =?utf-8?B?bVVNeU5rL0NvLzZaTStwVmlLdHFSZGVJdDZxUnFPeDJ2RmN4UDFLVGVFUzY0?=
 =?utf-8?B?YVhENWNUemV6TEJtSVdUK1ppQTFZZDllam9sZkpTS0hNYWNCM2RtenFNR05r?=
 =?utf-8?B?VWlPS1FHZGFmandwTzFFTkh4ZzdJU0JVNVI0a0ZxMVVjTHdlQjV4aEltNVEw?=
 =?utf-8?B?NkozaU5pR2d1UGw0OFNJOXE2d1V0cllYMTFWMEMrVFFvNHkxL3lDSGpNRVFy?=
 =?utf-8?B?Z0d5bW44b08xeUk0VWJVMUtDRWlOUXRINXZXNWNHT2l2a1VhVDlQcWpxOHlT?=
 =?utf-8?B?ZXBpNTMrYS9wcjEyU1FLUWJYbHFqM1FTUGJwVzg4VENuMDVlc3kxSmd1ak5m?=
 =?utf-8?B?SVhjRW9CV1ZiU011RXJqNEtyZ2VLWmFZMXBIYTE3R3VaMWdOSURsYjErdmZn?=
 =?utf-8?B?K0gveHNhVDN1WFY2S2czOTZFMFpHMXZ4b3dtUXNOQjRaUmhZcDFremVtcWdy?=
 =?utf-8?B?eGl1RDJIV25LazdDS29nQ0tJOGZZOG5yS2VwSUlQZnF1M0huaVErdkR4Z1cy?=
 =?utf-8?B?T21VakNHSGxtNEpYQllGbDFhcmlaeFdpSDllYUxhVWhGbWtVWlRNZmlWeTdm?=
 =?utf-8?B?NHJhcDVqcnBkVEdwOXBUdC9Xa2w2WEp5VnhWTWUydm1NK25ITmY0Z2tOVmsr?=
 =?utf-8?B?anFhZldJYjJ0ckpKNk54MEZrQzhsQ0EvcFo1dyszYmFkTUd4c3FjUnp1UEZS?=
 =?utf-8?B?OVN6RlQzMEE2TDlLbHBzaFlNY2dRUWNiK3p5ZnZKUXh0T29KWW03YWVsUWp1?=
 =?utf-8?B?N29zY3d3ZzJhclp2emZrWGY0ZzVLNVRvc2FrdlQzN0hOQW8rS2dzMU9KR0l2?=
 =?utf-8?B?THF5aWI5UTdzdUdxZHhkVDVNVzVORGxWUUlHQzdLYnJGVkpSald3SlFlK2dZ?=
 =?utf-8?B?eHMwaFhRTjR3NzhXQklzaFZnU1VUZk1KRHZvcjVjSVQ1SC85TkVVbll6UmFt?=
 =?utf-8?B?Z3g3M01RREVsekd2ckNtenR3N2RqdzBuNlFmdWVqd2NjWjRIU1BvNFlOSXBH?=
 =?utf-8?B?SVhqY2hnLzFIVHJOVWI4NS9NaXBpK2IvQkx2YUZaRlhrSjBPM2NEV01HckV5?=
 =?utf-8?B?NUN3UUhyOFBGR3dGUXhVUEhxa3RnODF6eDFmSXYzSnhEcm9zeDRXYlo4Uk1O?=
 =?utf-8?B?NWFNVFZKWGpSZDJYdFFKZ0ZXMkI0TzR4Z3IrYUQrS2FFQmVrcXdNSTdWZEg4?=
 =?utf-8?B?RCttZ0ZucDQ4K3ZRYUJwelVORHRqVXlpajFTQ004R290WVQ2bDlNdXRXTGd6?=
 =?utf-8?B?d2pMNFB0NU5jV1lDcHB4MzVqYnlYdVEvSmtzVWpUSElJZWtPRU9BVW4wNzlu?=
 =?utf-8?Q?HbpDTj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZklMajJNdFdWMHlQZzByNFE0SlJSd3ZHUmY1TXV5bktQWlhuUUtDaU81Unpu?=
 =?utf-8?B?Zi94UjZKSGRpNmtBZmIwdUVBS2hsWXEyRWd5TXQxUHFsbDFRS015OXU4OVdS?=
 =?utf-8?B?TlpxUHhJOVBpNWt1ZFJkU1Nhb1luSEppd2lvTUw0LytJbW94R3YvMmNxNXhp?=
 =?utf-8?B?RTdjSDYzTEtUOHVzMFg4QU1iL1gybHRVeU93bkFUS1hHVW1ySVNHbGhsZ1pm?=
 =?utf-8?B?Q3M0THFGQUI2ZkQ2NkpIVktxRXZ1azJVV2xvOHRWbFRHWHVONXBqSXkxdDZx?=
 =?utf-8?B?S3luSDFqVHhHRzlrZjA3dXdvRHpsdzhWUWt3ZVdDRjFZbEtaMVlCT1NJVTEv?=
 =?utf-8?B?UHowbXRSK2tHMUM2MFZPOGhvS01EbGZDd0d1ZG43M0ZBUzlZcGpzQ3k2QXIz?=
 =?utf-8?B?SXVZRW1YeS9yQ2JoL0N6OXRBYitqNVNtQlFpamhFWXUvZ1NUdUtWcGx5alg4?=
 =?utf-8?B?aCtBSXpHSHk3Rkw4WjF6NTdvL2xqRVRPWkE2RG02VFFjVDNnMC9ZaUIyVkJN?=
 =?utf-8?B?TE1HVFJ6elg0VlJvSStNeWE4L1BMaHdGbGczZVFwaHo0OU9KQktubEZrMnQ1?=
 =?utf-8?B?TGwxV25NRWxVTkFUN1MzMHhaRXY2Qk56U29zUFZSMkdma0g2Mkg5NkVPditj?=
 =?utf-8?B?V1NkbGQzYnZZZ1JjM1Blc1NxNTdObFNhaVJJZk1XNUVMK3kyMDRxVnQ0VzIy?=
 =?utf-8?B?ZUdaVHMwYXpVa05lclU3bi95MVEwWmt4Kzl4UTB4RmxhRGVjVHRJWkdOVEtB?=
 =?utf-8?B?QkE5bFFWRFdDUi94QjltVmFCd1FnWWhMT1BrR3RMWkVvcktySVhsT1hRTGNi?=
 =?utf-8?B?V0JaZUR4Wm5UQXV1a0FJTXcxU1dEQ1h1ZEM5UmI0dlc3ZkE4MlVPZHNZaFc4?=
 =?utf-8?B?a3lzVjlCT2RCRlZkWGJYT0M2YlovQ1NseGRUSnlObE96eDc5R0pVblhSME5u?=
 =?utf-8?B?MVk1b3M1dGxyMGlSY3d0alowd1N0cHZ6czZxa2l4b2EyeUNzM3NLdkViNUFX?=
 =?utf-8?B?UjdZK1QvdzFIUjgvS2JYZjNqYXZKdzZNZExkWER3S1RvUDJsZ2MxZXpSSHdM?=
 =?utf-8?B?SHVETkhQUTlrWHYrSUZsdGt6NHoyZlY2VjZZK2hkMFR6UXFsaXZET21uZ0l4?=
 =?utf-8?B?Z0JUZkJTZ3FBZ0xBMGw1OXJ4MWpWYnR2b2p6d2tQZDJxem5VNi9MaHE4UnFD?=
 =?utf-8?B?Z2F2c1EreDlnNDczVW8zc29qdVJXVkdvT0VjbjFmVW84L1ltRHBHQlFHUE1P?=
 =?utf-8?B?YllxLzJJczQ5b28rSEpDMHJ1K0NLUzhIY1dXUVE3bXF5L29MOEsyc2tMdmZN?=
 =?utf-8?B?ejF3M0xaU0tSQ1MyWTM0TWMzOGFQUUV6ZWlCaGxsL2dpdkxZaE9NejVwY1pK?=
 =?utf-8?B?NkJuRCt1Q3NhVTdsc3ZXNk5XVWdyMUVBSUFvRWhKRW1FTWNHV0xYQzJhT1d4?=
 =?utf-8?B?ZmNVZHpGbzFlTjltL0daZStWZE03UE1iVWpqVEhvbVVOcEZDUTJGTzAwamhV?=
 =?utf-8?B?Z0ZNUWNKc0ZoelhUQ0JuV2ZOOHpmYTQyTFJoNUVRZDd3WEtGUVJSZGNjZDlR?=
 =?utf-8?B?UDJpeGUxSHlKaWdsK0d4QkRuL0lzMnIwamVudFZvZnBlMHdhTG5SU2NDMVpH?=
 =?utf-8?B?R1FUcFlVT0xCTFhtYTdyZWFRRUxETnNjZDVBajVKd01HTDgxc3doUEZ0aElx?=
 =?utf-8?B?aVcvU0szbjFPMkxyamlpM0Ztek4xbW1Fa0plcklHdmtWd3QrUnhwWHh5cVNo?=
 =?utf-8?B?ZWk4RjNTYWZhN2hWSTdzREJmOTdrUmtuWk15Q3lCNFVidXNabzFpZjk3dWFy?=
 =?utf-8?B?NVRJZTRXZkNIVzE4RUlhM2tlREZDRW0zajZPOHp1Z1VMejBSczBNclZORGhV?=
 =?utf-8?B?dG1oam02bTNjMDVtWVBhZHJzVGNKSTVyT3RGUFpLalhwc3VOZ1dyTzJlbXlt?=
 =?utf-8?B?UFBXNWYvcWNsc2drQmhnejhzNm55OGZwb2xEcmRyVXR6eHZSNlYyQm9jakNR?=
 =?utf-8?B?b0YrWG91ckgvWWZPTGNJUzk1ajhweDd1dG1sMjdYUCtFSFJCbW5hWDhzMGgr?=
 =?utf-8?B?MjVLL3Z1d041cmcwc2hrVm85YVRCMWZ3bnk1UVJoSGorOThQWmR5RWk3dE9v?=
 =?utf-8?Q?uBYWUgGRWWHwioGVnFddink6Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32574960-2036-41a5-e440-08de0419916c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 14:14:59.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB/SFgsiOIiPBYg4nJRFJlbN1+zclTdzR6MG79c/JxaMxRfii7xwcQ1DWCXz0Rwdf6LCuf+F2aPngfjja/CywQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10452

Replace manual mutex_lock/unlock and error-handling patterns with cleanup.h
macros (ACQUIRE, ACQUIRE_ERR, and scoped_guard) to streamline lock
management. As a result, several goto labels and redundant error paths are
eliminated.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 113 ++++++++++++++---------------------
 1 file changed, 45 insertions(+), 68 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8004a480348378abef78ad5641a8c8b5766c20a6..dd859378f6ff6dec2728980cc82d31687aa7a3dc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <asm/byteorder.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -1830,13 +1831,14 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret)
 		return ret;
 
 	/* State could have changed before we got the mutex */
 	if (rproc->state != RPROC_CRASHED)
-		goto unlock_mutex;
+		return ret;
 
 	dev_err(dev, "recovering %s\n", rproc->name);
 
@@ -1845,8 +1847,6 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	else
 		ret = rproc_boot_recovery(rproc);
 
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 
@@ -1864,25 +1864,19 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	dev_dbg(dev, "enter %s\n", __func__);
 
-	mutex_lock(&rproc->lock);
-
-	if (rproc->state == RPROC_CRASHED) {
+	scoped_guard(mutex, &rproc->lock) {
 		/* handle only the first crash detected */
-		mutex_unlock(&rproc->lock);
-		return;
-	}
+		if (rproc->state == RPROC_CRASHED)
+			return;
 
-	if (rproc->state == RPROC_OFFLINE) {
 		/* Don't recover if the remote processor was stopped */
-		mutex_unlock(&rproc->lock);
-		goto out;
-	}
-
-	rproc->state = RPROC_CRASHED;
-	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
-		rproc->name);
+		if (rproc->state == RPROC_OFFLINE)
+			goto out;
 
-	mutex_unlock(&rproc->lock);
+		rproc->state = RPROC_CRASHED;
+		dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
+			rproc->name);
+	}
 
 	if (!rproc->recovery_disabled)
 		rproc_trigger_recovery(rproc);
@@ -1915,23 +1909,21 @@ int rproc_boot(struct rproc *rproc)
 
 	dev = &rproc->dev;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
 	if (rproc->state == RPROC_DELETED) {
-		ret = -ENODEV;
 		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
-		goto unlock_mutex;
+		return -ENODEV;
 	}
 
 	/* skip the boot or attach process if rproc is already powered up */
-	if (atomic_inc_return(&rproc->power) > 1) {
-		ret = 0;
-		goto unlock_mutex;
-	}
+	if (atomic_inc_return(&rproc->power) > 1)
+		return 0;
 
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
@@ -1955,8 +1947,7 @@ int rproc_boot(struct rproc *rproc)
 downref_rproc:
 	if (ret)
 		atomic_dec(&rproc->power);
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_boot);
@@ -1987,26 +1978,24 @@ int rproc_shutdown(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING &&
-	    rproc->state != RPROC_ATTACHED) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
+		return -EINVAL;
 
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
-		goto out;
+		return ret;
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
 		atomic_inc(&rproc->power);
-		goto out;
+		return ret;
 	}
 
 	/* clean up all acquired resources */
@@ -2021,8 +2010,7 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
-out:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
@@ -2052,27 +2040,25 @@ int rproc_detach(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
 	if (rproc->state != RPROC_ATTACHED) {
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power)) {
-		ret = 0;
-		goto out;
-	}
+	if (!atomic_dec_and_test(&rproc->power))
+		return 0;
 
 	ret = __rproc_detach(rproc);
 	if (ret) {
 		atomic_inc(&rproc->power);
-		goto out;
+		return ret;
 	}
 
 	/* clean up all acquired resources */
@@ -2087,8 +2073,7 @@ int rproc_detach(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
-out:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_detach);
@@ -2192,7 +2177,8 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
 
 	dev = rproc->dev.parent;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return -EINVAL;
@@ -2200,28 +2186,22 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
 
 	if (rproc->state != RPROC_OFFLINE) {
 		dev_err(dev, "can't change firmware while running\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	len = strcspn(fw_name, "\n");
 	if (!len) {
 		dev_err(dev, "can't provide empty string for firmware name\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	p = kstrndup(fw_name, len, GFP_KERNEL);
-	if (!p) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!p)
+		return -ENOMEM;
 
 	kfree_const(rproc->firmware);
 	rproc->firmware = p;
 
-out:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_set_firmware);
@@ -2316,9 +2296,8 @@ int rproc_add(struct rproc *rproc)
 	}
 
 	/* expose to rproc_get_by_phandle users */
-	mutex_lock(&rproc_list_mutex);
-	list_add_rcu(&rproc->node, &rproc_list);
-	mutex_unlock(&rproc_list_mutex);
+	scoped_guard(mutex, &rproc_list_mutex)
+		list_add_rcu(&rproc->node, &rproc_list);
 
 	return 0;
 
@@ -2582,16 +2561,14 @@ int rproc_del(struct rproc *rproc)
 	/* TODO: make sure this works with rproc->power > 1 */
 	rproc_shutdown(rproc);
 
-	mutex_lock(&rproc->lock);
-	rproc->state = RPROC_DELETED;
-	mutex_unlock(&rproc->lock);
+	scoped_guard(mutex, &rproc->lock)
+		rproc->state = RPROC_DELETED;
 
 	rproc_delete_debug_dir(rproc);
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
-	mutex_lock(&rproc_list_mutex);
-	list_del_rcu(&rproc->node);
-	mutex_unlock(&rproc_list_mutex);
+	scoped_guard(mutex, &rproc_list_mutex)
+		list_del_rcu(&rproc->node);
 
 	/* Ensure that no readers of rproc_list are still active */
 	synchronize_rcu();

-- 
2.37.1

