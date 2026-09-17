Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C03CF1F1;
	Thu, 17 Sep 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669212; cv=fail; b=mP+tRl8L/R5e6QfEW0OOu4C4Kyqucu3npiAPU2O9LDjmhbc5S6o9gsdnj2MDpm4cuqmR0imDCsgaoNQozIqmiQFfXE047BI27Hipvgqa8dpln9b8+czmvhq/YKUyZ6VOLyosOrN85vVLKmetI667Bga1VldVol8nvTVX7w6nOaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669212; c=relaxed/simple;
	bh=nBIAJJ7PyDerpCfBQ6DPM0jZVU8UubhtfkrBMH5TTCI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E/c8BXHNMGsPZWl4YXKGtC6qPlf7IAAZiLX9hOB6ZdfDESFzl1y7zxAU8cvMZf474YOcqZNdX60+7QnBqGqWevaeQRGR0EjG5OncDh1hsvjP6A4H0FNI5dUi+VSWs60l5zE9WBRwIQRPIFj3Cq5FIKt6Qa5/itVuv1cBYLnr3Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hP8M0/qu; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hP8M0/qu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdi9GftLHY5S1Nir0XJa/RC2GuIdHbHo4k8aasnVS4eehTSOHu2EfpdE5caoaEZ3fDJuhUBNybN9l27la63Clztc3fgfuKtIqJDXQ/XllfVgWEN9XDxoOCK2SEC7lIfWGZdyhtS2BMkQEXFa4EqvBLBApo+/nvEbaHWRLz7LmBrh7g2PkUaai5d/zUUzkJHp/Urof2EXVHW5SIrnqxPnsSuyuDW007Buhm6EmzyqcONX51AEo2y7Kq6iuJ5VL14f5arRH/8kNgkVZJAPwn8gJpXk8DFMKr3Cl+N54ted+sV+RqlLDJvBi2wBvo1PJpy8fj0X20ZZhau+LJs+iVL8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntLapWR4HbXDC1TQrn6MNrVSRp/qmi4SjqgrjBlWGXU=;
 b=Q3IllskeAkUZ2dSW87Gi4fPKYfB3/Z+vsxihx3OdxNchIK8iJ7rZir1oP0CuieFSgq9mAOocMMZDHBs10Zmmogzo8k8BVqq2ESeky3SVJ1BP5JgEBkA4VDHz4lkz8lJ9xkun1lJOz4SBF0hgxPXNN26569qZVyURLra/jazo8Jc++nI9jwD3v0MW+guv66uaD32DOL1uNd706W/0YKR/2aBby4McPYrZPJZIWkl/21OBlbqe4W/7rGz9Be8iKtpLdrV/e8zwGAZXxvkwA/p6BOBhNoC5cBWL6IabM8T6G8kzK+QhBr2sQ8gy23yS5mQhbSTi21qex9bPMl18wi0KfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntLapWR4HbXDC1TQrn6MNrVSRp/qmi4SjqgrjBlWGXU=;
 b=hP8M0/qu5G1bDNehuGfvBpGbRy4sRhk+A0K3H3ZZipDakuCZiv29eDXH0D7Ml29/PkYP2JM30jkmUyLfGJ2tvHqIi6HxL/Ld+EQBX3SeIxGvXQSrkcAfe7/9rPgdtwJP5LFRO0aPB9fBmZRhruxwwvs8DhEj3S0QnMFpxYHepnC7hCrqIuiWxjpIpbnpwa4CiCDXIjkVO50Izovjjcw+G8ohdAFCTB75Z20J4Fm9ZBCdzLMs1mPvCma7sYj3CwGWXLQCuE5sQ2evsXOj4enqcR/C4d8Lc+6Cpu59rYdvSPmaxA7VWl9Ch7iByYWcaQNnYjH8AERFm6Qae9hbJlKTnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:20:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:20:07 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 14:19:42 -0400
Subject: [PATCH v4 1/4] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid hidden ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260917-memory-region-name-v4-1-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
In-Reply-To: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789669196; l=2366;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=m1W3YpzwAIllPnPqvIqAPLOI2BRSoGtHcSxoS9gua4g=;
 b=M03Kjab2bfugLX/qT97ApXJo6PEFL2fp2Ir4mMUBwgfwqJ3pC288SovSPlaNt86Vuv6nG5i3O
 EPFvFr1rw/BCOR6b5cIpQVoaktHVTxldf+HGmdcvhxHMWSmg0yYMDmC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY3P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c2ef32-69e6-4bd8-5d39-08df14e84d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YY8s1P3DgpWVAwERXyjUvJTkCAOtsOt5Wvo78fgnRK0O7heB4AKAPQy6DbrK1gkxjHcIBo0BgVY3cDDX8r/esjm7JwMX0hwP22Cat9CIT1tFRRED/WjTuNq+iurUePVjkqdbHK6yUhwwSP3d+jG4YyO5azCs+e6kbOpEuc25ZyVxramQOQp5cgsjKNb3xFMFrEzLnZwAA9BVkTp/UlFE0fehlqwOlcPeqNniQsNQyfadsIHIQVoG8wl718iMdCKze1Jb9p1yD9ScpTuWWRb6k8F6LlzUnx8GQaXsR3FCk0f6AQ+C3JyEwSrkjVdrIBkuiQ4aCZTclP/SZ1DiJ0yhQbt4voH8lfdWVnvh97vCiwRQiU2YwW2V+ojBPvWtxKBaCpSL5qfbLQ7tHiZX0ODaKlTGUB0TzV3fp6QzbpscHXrGcKXreROtBCNF/mWhx/6mZApGFvMUGsAxgfbFpZZpI9jpnTc0TA3eCgs/WrRAbjCyz5oTzAbxt2U3CmCjygUuiiTMSLzN0I8wcLXyOLzCemthVM12Xe0mOQ4nTj310B9oWn32sH68m6cNT+SYevO1sKlpYQMSs/GzW8HPig4WDSaBN2LDwMB7DCGZ/qDvCpVgLh4MbXgTMwM2NOhDHBdZG0be6FUejZ62e7qZlIu0JRa/FEHjrIIHc4FUc7HO1o0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JrWnpnWU1nUkJtMWdjY0w5bGNDUGE2TUEwQ2JOL25JYStHT2pYZ0loa2d0?=
 =?utf-8?B?SU5MVVkzNDlLZTV4NUJFanVyTFZiaWxjYVp6WW1MYmk2R2w4ZUxuTmY4N0ZY?=
 =?utf-8?B?VWx3Ui9yL2hWRTBmS0toTnMzUmsyOVV6TFRqTGpnUGNBbHU2clZWdVkzRDdl?=
 =?utf-8?B?MEdBdzcrNEMvS0M4bGI2Njk2dlRHeE5WYXlVb0lUSDNWVTREL1hmMGptUDhz?=
 =?utf-8?B?NTREaTZPSENuRElRVURYVVNBUzVpUjk4Nlp6RytWUjkva1hZMFZFK2N6RlVQ?=
 =?utf-8?B?N1UrL1lRVUZQSlpuTGRRcElRQWcrdHZKb0dBS0RQWUtVZjZ6aVExMXlFZ0Nt?=
 =?utf-8?B?SG44bkhUMTV6QWtETDRqUDdDU3FEV2JndjNYa0NhcGJxUGNQVEM5bVV0MEto?=
 =?utf-8?B?K0tEWXNtaUZSQjh6S0pyWFgvN0wzZjJzeVYvcTZYZW9NZTBvdnlVUUhzbWxJ?=
 =?utf-8?B?UGFrNjlHaTJGMS9XVWFCVnAwbVBGL3BaZ0xOTzNrVUU4Qm1jbnhYSHl3Y3NG?=
 =?utf-8?B?SXo5U2hpYWdGTUg4N0VSVW1Sd3MwTEFNbmM1VEUxRm54Z1BwdmlUcEY0RnA0?=
 =?utf-8?B?b292T1pmTW9sQko5MGNjVHVHRmZmZHpFRStqYU1Ga3g4TC9BWjUvWFE1TG1X?=
 =?utf-8?B?dDI4OVl2QjNWdCtQOGVnODd5emtTRGFIZFZSZlN0djNwSjBZZW54YXFUclRs?=
 =?utf-8?B?QUY2YmhvZnk1dDYzOWRHdlRaUlBzamVtbXA2U2N3aU8vMUtJeUhvay9WMVpE?=
 =?utf-8?B?Qmx2QnF0SzdPRjIxcEJBMmxIS3pVOUpETXc5clcwTExuVUlnck1hM3JnNUtJ?=
 =?utf-8?B?Wi9VbzF2Vlh3UlR2S1BaWS81RzVYY2VxTFFOSlNhbXlNRjBoSElIYjFNbGdJ?=
 =?utf-8?B?RTVJZk52VTJhU083UzdrZ2ZwQUl0eVY2UVFNTG85V0NRalZPNVltS0ZwcUUw?=
 =?utf-8?B?SHRzeWVaTmhCQnR5bitzeEdhRHpPODBXK0ZFay9GNDV3VFFsM3RhT0QrUTg3?=
 =?utf-8?B?TU5xY2dqcDVJVjlOMVZiUlJOd01jMkNzN3loOTRBTlZqNTlZV2NvK1dwVE1a?=
 =?utf-8?B?RTJuN3pwZHRRSW94MGRxQTJHREI5OEZ2M0FGclhXYzUwN2Y0Q2F1cmFkd0Fk?=
 =?utf-8?B?S0FhQ1lxZ0NEVjNvamgraFE5YlNYZGFkeWNaRGRydExTL2RZR3RHbVo5TDd4?=
 =?utf-8?B?bmxWQVNFY3hBYUVjWFJIZkZZQzhuK29rcmNHT1RzSkNsaTNUdWxGaXptYUdG?=
 =?utf-8?B?UHM4VTVSSWpiemdYTnlOS2tSRVJjTHpTd0lZNkZidzlRWWRyaVFMait5T284?=
 =?utf-8?B?Tzdjb3hmbjhjd3oxRk1vLzRQTmxCMGYrZklhOTNJbFpzQmpRZnp2ZWd3STlR?=
 =?utf-8?B?Zms1aDc0NXc3bm9sNUFTRHdHT2o1RVpvUXM1ODFhbGhyQlJRY1JWRjE4Rktm?=
 =?utf-8?B?WFFLRGdIZGJPTUxIam1MLzRMd2NxL2p0WmZFOGpxZTNIVzFIOXFIQ1hWWnJP?=
 =?utf-8?B?R2tNc3dMRlMxM2o3d0NaeEZHRzZYVnIwWEk0WENuc1BlVVlDdmxtTVRHRUpG?=
 =?utf-8?B?Mml6UEV1NW5RS29HdURtTERxT0RzSkJvQVY3cU5WcEVhWjFUUXpPZXVOMmpX?=
 =?utf-8?B?RlB1UUsrM0FIdmMvR1k4KzZkVWVET2N3YmlpT1VTaC9aRnBJdWtiZXhIdThU?=
 =?utf-8?B?OTIxbUdKMFMvQ3JuaCsrMFkyYmxmQ2pHMk8vSHlYdGIrWjNkRkxyQU9IQXhY?=
 =?utf-8?B?WHhYeFB2MElZdEttTGJpWmlEUi82V09jV21CblpMUFNHaU1pM1dMTEVhNzBy?=
 =?utf-8?B?c2lXcmpDZTNCTDIzUElxNHBsQUo2V3JrQ3dTcUpROU11U3VRYWplYjAyR1lp?=
 =?utf-8?B?bUxOSzZ4OGs0RTJQWmpCazJQMHhPaHlXQnV6WURrQlFQbTAwT2FBSDhuWDlS?=
 =?utf-8?B?TmtVd0JTT050RzBraGdTam9zTFFqZmh2K0Y5Ui9vSjdmdU42aWhEZ3lHaVdE?=
 =?utf-8?B?T2NsVTFCZkxSMERKSXh1b2tTSUFSL2hlWnhwcHluWGJFMVFBd1o4UXJIZ0U3?=
 =?utf-8?B?U0xxOUVqL2UyZDlxYlRRazU1UEhsT0JOU2JScXRYNmJHQlFzSEJqU21lWHhW?=
 =?utf-8?B?MFJjZk5DdXFwbXpmdml3LzJIalY3NlczTEFHeXpCdGNWRWcvdXJWS2l4QzRF?=
 =?utf-8?B?eFp5WFhYWXNGb1BCR3dKQnZGbHNhZ3M3QVRUV0FoVWtuTEgyL2szNjNJZDBY?=
 =?utf-8?B?aWkyRkttMXk5bGpycGM1Y3dHeHpkWGlXbHlOTEgxYUZQOEFreHZQcnVMZXdZ?=
 =?utf-8?B?aGVQTDI4ekJ0NHRNZm1JYlBHSlpLK1BlVTA4c1ByQWlSVGtxYWREMmdVWGFM?=
 =?utf-8?Q?dl8CMp2vDwuMabb+t1qBAnlmM1DCianNw5+Az?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c2ef32-69e6-4bd8-5d39-08df14e84d30
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:20:07.1783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDDEwWJi8d0ggS2yu0Ap6+bHDd5ukdPULeonILn2IAKdPZ35PVWwkmmJ/QP3F+YWNNoG38qdn1ddY/Xgpu6fpqgcd8yB4BNJsuQr06a0ASZLzcxzC88AyiVBcxdh6RT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional memory-region-names property.
 
The driver currently derives the memory region type from the referenced
memory node name, creating a hidden DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Add memory-region-names to explicitly identify the expected memory regions
and avoid relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Use optional property to keep back compatible with old platform.
New platform should use memory-region-names.
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b648890..5d98d21035f8c 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,15 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      anyOf:
+        - const: rsc-table
+        - pattern: "^vdev[0-9]+(buffer|vring[0-9])+$"
+        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"
+
   power-domains:
     minItems: 2
     maxItems: 8
@@ -134,6 +143,7 @@ examples:
     imx7d-cm4 {
       compatible = "fsl,imx7d-cm4";
       memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      memory-region-names = "m4-reserved-sysmem1", "m4-reserved-sysmem2";
       syscon = <&src>;
       clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
@@ -149,6 +159,7 @@ examples:
                 &mu 1 1
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1", "rsc-table";
       syscon = <&src>;
     };
 ...

-- 
2.43.0

