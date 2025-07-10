Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992F2505A9;
	Thu, 10 Jul 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752149429; cv=fail; b=O23vwtIVERlAI89Fo/0di4EUTqBYr68xP0ZSJIgoBiMi6K76paeCFJXCmuFEPA1JO6zip8ODDrm5dQCZ+gcwmEiCpNsATWkIswygFxuSW3hG25LmtOCqiqcVmw7kExR211DUpRSQ7aqIWQP49otHGrKmGKsGSD8rCcMB0E3Fsd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752149429; c=relaxed/simple;
	bh=fCL7moYQbdkvbvLyDEalitARc9QsKI3F8LDECqFbZnU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CKVbvFDYCgd1xuBDGZcQUOSzuHk9AmpWHOiftCqJwefdUO/rdELXyOh9sw2XpsRT84CyXGoSzfTqvlJi0miHmyr2+ZBWvIClWtWIE7SQv0pjfNS/PE8r9ScgNYAyjfLD6oGsM3KTZl9Ip/2eBEVT3A08KWelP7hSSfbElgrxhzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i3MlIruD; arc=fail smtp.client-ip=52.101.66.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i3MlIruD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX0BaUqhM2sDdMnCZb89WBKzrx25V10gBDuukapJX91GjZlewdwtnx91Iy08ZM2a65Lblp9mkGsTNzZf+vm9LDh5Lirc1f66AX05dmfbx1klc8sNECX+0j8NeWCPZYrjU0tktembADte/itHm+9j/hH/ob4v8Zprsllo/wxMYbZpdhwhozp4O6WEbfEbZJ7mq27Il7AWYPn5DZ8gAKFA2YrTWAL9GUw74nw9z/j4+DFClnwNuRE3RW0wGYBeprcN4gziYAYAKI07kAMn7VleRz4A+Qtp9xLBiLSA558mlMv4NuPrwT5i3+23ANOSNW/WxQsn4JYOyiyS6JxA93DJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBvBSbwS0gQcwqLpm+ETOEqPN+fHt4FKnalJpFwqOOg=;
 b=OHapYa9dAe0xW1ApuWMGce/ZmKDAFpzb2bFeztMibYk8z3XP8hS/IS16XdFAyyDaQ+JzxafzZ7gD+2dZYVdAI3sbTlPKZmCnSiHsN9/9BYKoWdrQqmAVg/FtSANYTpJtmkm77OIcRSO59/g6RxrmHQs+1K+SN3lFJiXNuR1trcWgGudBChpKdEj516zqpb2fmD5fehv0ozKeyuHyy7IU+EAnOAArnDRGgajtikPrWh93aAj16kPQoP8oeGEsMblygrtu5Vl7CV0NhFs3fqIxPBIlZXl0gU6K4ur93gUSo+eTKoqh6iukWtB79SF68iIlJQXUxvT+ZeIE2hZeaxXHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBvBSbwS0gQcwqLpm+ETOEqPN+fHt4FKnalJpFwqOOg=;
 b=i3MlIruDKUePuxuxedkOGNvM/t6FAXlcc0fXRQclBuh5US3NNlPJs94y9RvZ+aHo4/Nfkr/utYcWqs7ZLDD9iDPPqxqCjqlCI0Ysbik4qrwhKoAWjZFTd9rVZstJV7yG/6L9X90zaUKjfLgNB4kJoVbK2UUDJtlJUrJUT3zOV0KjCfuf8f1UfS7Byo/76J1zkYbVSaqSNpxaej1sWUeqdpGPH45f8MCMp3Zf3UbjjLBFtPw0ZAnmHqpZl5r8I6R2ScSk/7xPbisAvY03pNHM3WN/jHjPrQPR7SyA8IL+ZLwAloS+GAbpClinYJTNSxeFmekMjIVSZ1AwAhg/mKBMIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB7983.eurprd04.prod.outlook.com (2603:10a6:102:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:10:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 12:10:24 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 10 Jul 2025 20:08:04 +0800
Subject: [PATCH v4 4/5] arm64: dts: imx95: Add SCMI LMM/CPU nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-imx95-rproc-1-v4-4-a7123e857dfb@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
In-Reply-To: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752149291; l=882;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=fCL7moYQbdkvbvLyDEalitARc9QsKI3F8LDECqFbZnU=;
 b=2m3Ki7AefyLnEjjFG2/V/3xuORGfoF08/RARoESX+aqNaAVCauDA4nmnxdFwEzqqdUfmu53kG
 cUgy0FtQRhBCXGUtZCQQabcxg9G97GIPEVvU8AGOIJ5eGATa43E07tR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6f2bf7-59c2-455e-f12a-08ddbfaac032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N05SZHkyNTRzdUxMcFFXbUZYSkEyL0d4Wjc5QzZCNTJwVGhOYmd1ak1ZTXNs?=
 =?utf-8?B?YTgwcER5dlUyRGEwVnlBcVF2ZnlXUDlCRmpESXJaeFVnM2RSaWR6VWpvbGpV?=
 =?utf-8?B?VUlEdnZXQmlhUzhDcjN2bXRGbktGb3FoN3NFenltdjlNRGw1ZEoyMnFPZmw4?=
 =?utf-8?B?YSszNWYwYUdIek5LU3MrREd6ZVVrMHljK3VwRTFGUTVOT0tGMUIyeGxwT2lH?=
 =?utf-8?B?K29ZdEYwazcwSHpqK0VJc1NMOTFoWFFkWTZlckhOZ0FMYTU1ZEJtcms5TUUz?=
 =?utf-8?B?T09pdkpwS25FUEJKbXRVUGpmckJZZ3BPaHU3ajN4VWZtdFQzelNtYXNScVhV?=
 =?utf-8?B?VU1wVG5DSEVxSCtrV3B3blEySDFRdUNvS2xoUUhJa0tWSVV5V0hZcm92L0VQ?=
 =?utf-8?B?N3RxNWNsMDNxN3BrRitjU1dzWHdTMnhGOWgweUZVTnkxSHlZVlNlQVU1ZUh5?=
 =?utf-8?B?SUNZRXBuemVGMnhmT1NJdlpPL2pEazEyRlZ5SGplTkdVa3ZwSkVaSjd0QWlM?=
 =?utf-8?B?QlFCR2ttS29uS3M2MXNIdjBmVU5IZitQUktsNFRtcysrM3hmeWFaRzhwMDdt?=
 =?utf-8?B?RE93MGYzNjk1aHF0dFRsUkZNdTZDT1Axc3k4VDdOQ0owYUV4ZktJNDNnNzNI?=
 =?utf-8?B?ZnZjUFZlMjM3ekx4OUxZdTIxMU16ZGFYQzVtQnpybDZFRy92MERmRkdFbmxX?=
 =?utf-8?B?ZlR5SFdveEdINm1JRE1PbEEvMlNJNTBDdkNIN1NEMnVsSUhLQW4zeDRTQ3N3?=
 =?utf-8?B?d1hGbWlSc2VFSDd4NmhrMEtOczZiT29Wdm9uNmFuVytHc1pqV3pwT0p1T1ky?=
 =?utf-8?B?UzVWTE1JSmRBL0kwTFJRUDdidVR3TWVxZzRUWFFKYm1NVHMyeEZSUUhzMUEw?=
 =?utf-8?B?bTh6cHhGSFRZUFV6MDd1L0d6WlpJMko1WGZkbVU2WjJvOGJHdkNUT2FmbVFM?=
 =?utf-8?B?K280MmpLWTZ1K1Y0eXZ1azJkRXNWbWtVSXB0TW5lcGs0WTNsajFDUmpLYnlQ?=
 =?utf-8?B?K3dlMHhMMCtHQnd4eXlIMEMwbExYZ0dBQ2ozSUdmdG1pVHhMUnQ4SitpOG9i?=
 =?utf-8?B?ZTcvOVo2OVAranArNjZ4cGFUYW9lTE11d0E0SlNXYVJycno4WHU0YVlSSm8y?=
 =?utf-8?B?UzAxNWR0TkRoZ3dMR0pGTWNvVUl1OVBrMTdVMDVINWNIT2N2VmxTUWlpc1Qv?=
 =?utf-8?B?MmpvNXg2ZXl3R0hVWU8wVjljbFNVUjdqWDkyWEkvbll4Ym9yRm5LZXA0aFhY?=
 =?utf-8?B?a2tFQ2JzdXRzL0hta2xQOWNiUmlhNEp3WEh6SUVybUJuQ05uclM4VEdzM2xE?=
 =?utf-8?B?Uyt2RGRLZmk3QkJBN0RKUEUyRm9Dekt1bmpzVDIvL2NTbnR2YjYwUTdtbDV5?=
 =?utf-8?B?eXFkemUwdVhwOWZMWHRnMHVpVnVKWERjWmtoWjBIZVJaTjdVczBIamY1WE51?=
 =?utf-8?B?dGVwMlVwT2gzeEpqRFR5Z2QyZEs4aFN5bDBvU2xZVG9pUHBKaEQxNEJROHRm?=
 =?utf-8?B?Qk44aGhBZnFaNm93UjdNY0lOdGpiQ1NPaTNDZkY2b3VtZTdhMlNWTkRNV0RU?=
 =?utf-8?B?T1dtWHlKZ2xSWHFNQWdibUdzc3NTV1hZMlFzQndPRlBuVTBvZWdpZUNYcm9R?=
 =?utf-8?B?UmtFY2xNYXdWR3l1YTlaTDFXK0lIYkZES2RLa3ZlSjJFWTJDK3dQejRGa2RB?=
 =?utf-8?B?Ni9DZ1MzNHdrVXVpdDFSZXg0eVFORkpjTGdyVllUVk94M3Z3aFUvaW5nZU5h?=
 =?utf-8?B?RGNjaUp3QzJvTERCTUxTUnBKdkxHa1RLdHVhQnBZMDhaSGZYMVQvcjlrS2tN?=
 =?utf-8?B?T0dVUFI4ZUcxdk9QQjR2TGM2bVEwTlN2U2JXV1hvSXkwZ3hhdStGTHM0OVNs?=
 =?utf-8?B?VHFoOXkvS2cvTlZzNEE2N3kxUE9HMjNHeTdrQldOVFhWNFI2TU9JQy9OSzRq?=
 =?utf-8?B?Q3NCbW5TWXNTK0lhcExYUklhWVc1MnB2TjV6blF1ZWlqSzZSVWRUcXB4bEJX?=
 =?utf-8?Q?Nsj5Tha2uVa58yO5aiLSY3QRoNRx5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVduWFZuSnF3aEVWTjg5WXRmQ3ZRTUZvdWd4dGI3WGlrTHU5UnhuYTBtWWM2?=
 =?utf-8?B?UVcyekRFWjN0N0IxVUFmTzlkNDJvSUJ1VFJTdXN5MmcwN3hFeVlWWXVkMURW?=
 =?utf-8?B?NmZvbXFvdHg5VW1BTFVJUXB5djF2L2dTZ0tDYS9iN2YwNEdlYTFUekxzZTdk?=
 =?utf-8?B?aG4rQ2YxUkxuN2dsSkJmZERmWmhUd1hXY244YnF0TXpmV3lvYnNQT0psZklj?=
 =?utf-8?B?ZlNYdFIwWHIyVG9MUGFmT3VvbEk1ay9hM2h1Y1JWN0RLb29jOVZHTTdKdjRF?=
 =?utf-8?B?bm1IR2ZwL21JaS9BZWw1QmR6MDFaODErV3NrV2xlRzF6Z0ZwSlBmVTBWNUYx?=
 =?utf-8?B?REhEZklmN1RobFdpZk9WRmF1VHVRb2cwN0lLR2tvd0Z1a1k0RGJ1dC82OUcr?=
 =?utf-8?B?N3FLSFlQMmZyNGRBNE5Qd0Z3V0s0Q25UNEV3VzRlYnF0SUVZOGxjNEVJdEdz?=
 =?utf-8?B?T3c5Y2VYRldnMlo2UjRYOXY2WDcxaWNYTVFDZUFYcW0zLzI3QU44dnljaVp4?=
 =?utf-8?B?cHBwUkE4N29pbG51VWdtNnIwb0FMYjJDUnhSd2wxRjNMMjdmM3MrQW9LLy9x?=
 =?utf-8?B?YmlsSG9ONk9oZXlZNThPbHBxRnEvVnNWanhKaGZUVXpwMlBURG5lNU1vVFhR?=
 =?utf-8?B?SjhiSUVJQzJ2alN5ZlNvbnlWMEQ4cXVxZFVLaTBUWTR5d2JDdm53YUFORFpS?=
 =?utf-8?B?OUNCcTJieEYraERjQkVOT3d0b1U2dzkzc0lET2tPaDdIejN1SWkzNTIrNHdD?=
 =?utf-8?B?ZkdwK0JMN2d1Syt6TmJ3SDlra2xqVVp1Rmd4TXVkSHJZbElxSW5zbzQ1MUo3?=
 =?utf-8?B?SDFSbmtKQ1NDNzdBZlhra2lpamdmUGxrLzg3SmxxUkdqMlVTaFNCMzliRkpC?=
 =?utf-8?B?ZW4vcmJlcHFFZmRYb01PcklYWXd3TXgrbTMxblYwcnJqYkVvSXRIczR0MElP?=
 =?utf-8?B?V0RqK0xHS3krbHRYYnM4YmZHNUw4UG5hYkI3dzJnb1RaMWJJbVkvL0UraEZv?=
 =?utf-8?B?REdCTExqSzlvWWkzNmRjaElpcnFMOWhiUEUrRlc3RXVaeFJEQ0NjS1BrWXla?=
 =?utf-8?B?RzMwMk1HMWp2RzZhU2dQM0p4MG5oQWdMU2FrTGZSVzJ6c1ZTYVJneitya3ox?=
 =?utf-8?B?bXU5MC9uTm82QzJ5eUUyYmE1dUJkVkRQWkJvTURwN3JnaTcxd1Bnb2xEa0V5?=
 =?utf-8?B?b3dTajVYT01ZKzRkckx4WmRQMmlRV243dHhNMUhRS0YralhTQ3pVMmpmZ2Fy?=
 =?utf-8?B?b3Z1ODdlTkdJN0gxOWlaSWZyVmFML1hhZFE3QVF6ZjlodWZJUVV5NFQzWWZm?=
 =?utf-8?B?OWV0K0kyZ2U4UFVmZ2w0M1pHVitCZXlJdnBUeFBTMDlyUzFMcnQ5dFRVUXd5?=
 =?utf-8?B?Q3B5eklOMHBmT0psUGpKb3JNeTY3Nkh6Y2VTZDZtSkc3cTkxQUJSSlRKMkNT?=
 =?utf-8?B?RXg4NzBSMUZVeHhxTzRETGpDcHdvMFRnZlduWmVWSEhldHpGZnRXMkV5NlVv?=
 =?utf-8?B?WitiTEM2cGxzZ1hKeDJnSWEwdXZZaVVORThESzUxQkpoc29WNXZ5NEVFa0ZI?=
 =?utf-8?B?dHUvUVpKQ3lhdWc3dlJqQ0hlWS9BRGJnMmtrVzgyR2ZqNU5BVml5bEdycWFM?=
 =?utf-8?B?cEQ3SEU3dlVjR1E0ekJodUlvazF2MU84eEVaaFhPc0tiQ3VWeEVJdk9uRmpB?=
 =?utf-8?B?dUo0VzJqMUc0cGlZS3V4cUNuSGFRM1NCdFZLZTl2TTVSa2xPRDNpam12TUk2?=
 =?utf-8?B?NTdSVmh1NFJlSFR2TXhHZExDQWE2VWNFcTczZ3QvT0JZZ1BiMXNTc0lHV2hT?=
 =?utf-8?B?UGNMc2tHa0ViTVkrMDBHVkZJRmdGMVU0ZXJMV3VMMDNwNUprOTZEUHYwRzBG?=
 =?utf-8?B?eTZ2Mkx0Zmc5R3ZoREIvTE1uaFBPalVRNXdLcXVWT3JmNDVqMHorZmw3S2E3?=
 =?utf-8?B?YzBROWJtM3ZyVjgzaGFrL1VRUk4wa05JZU91Wm5SY0dlQk9taE43ZitzY3VG?=
 =?utf-8?B?cU5HRkgzRytQanY0WW9sUGw3Q25ObDFTb0tzVGpmcm9hSWpzeFRZcXo3SDdQ?=
 =?utf-8?B?aW5qbTAyY2RzcUsxV2YvTGVRY2hPT2FxYnBxeFphOURLN1V1d3p2Vi94M0Jn?=
 =?utf-8?Q?fJ1Els7GrJ7T3hxPwL2dJIESg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6f2bf7-59c2-455e-f12a-08ddbfaac032
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:10:24.8517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfVB0K2AOdc81tw73Tv7LNAJLpgrYHEo6Ke+7wyGz7TPw6qulS453G/2m0ckguVUo/bGKDfp9oOnrx9IEv3j0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7983

Add SCMI LMM/CPU nodes which is for remoteproc to handle remote cores.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 7ec30d54d4dfef0f904f5242dd25590e5d2fddd2..ccfe1823178be7c5dcb1534d1a196ec48f61ecbf 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -350,10 +350,18 @@ scmi_iomuxc: protocol@19 {
 				reg = <0x19>;
 			};
 
+			scmi_lmm: protocol@80 {
+				reg = <0x80>;
+			};
+
 			scmi_bbm: protocol@81 {
 				reg = <0x81>;
 			};
 
+			scmi_cpu: protocol@82 {
+				reg = <0x82>;
+			};
+
 			scmi_misc: protocol@84 {
 				reg = <0x84>;
 			};

-- 
2.37.1

