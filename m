Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011024.outbound.protection.outlook.com [52.101.65.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FB2189B9D;
	Wed, 16 Apr 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790198; cv=fail; b=r3NLK1C9mAEtRXam0l7h5C9zia73Dn7eZSdxB3Sk36xPdFBvXREY4X7NQ/34GT1ZmXOhP0QC6PEPT0ic/Dbm+33uFqIBT/DABx+qIQJTTvTI9kID64Smdc7NlOu1bnJ/Xh3T+U2rAjew9axCNM289Ur7kJ/oGkb0+s9l3cB+6jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790198; c=relaxed/simple;
	bh=P29BVkWMQ0U126e5d4Vmrq/HKpRYSanfYWBm6McUo80=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UD5L8yVMDUMdD3DdltbKvpxqlNLuEmMr/0/KAOHR4OMz5BXec6JrCQ4Sn7H0FuW4cZUS/M//3pzgt79G/Q3qEjDPrcgJXtcLdyGHQqi5Z9lb8pt59KTl8JT8efnG4JGD7wFUhfcs0z+RgFIWF0gyIHnw+qix+2sr0aY1ikAqwF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o/ziyvWd; arc=fail smtp.client-ip=52.101.65.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o/ziyvWd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udtfEraFdYba+jukNfzK7WOXdxPcYVTLlq+L0SI/k6YqRNRfTXFezG0cRpH8arTGKdUztLJHkoG/JRsv+a+89sUsAAFMW0TZHjdARURe+S4lkFK4/73JhQiPufIWwvh/mPw5MAdLYPqjrSMMv2dqPEFe4XN9TrHF04cRIUiOig4ZKaYmt6AOC+kCi/X5C9Pu8/yDrTWt9LNpuWQHiaMlCZ5UiClvevgrAmv8wa0rD8vzCf6beBr4XiSS1aqGW/5GGttlSPlNLVNviqilBZeMi+N9S74R+nFXZxAKT+VOuXSw49czNlrq8zbboktBolAOlbFdrwVOpP/h5E6uJPJXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrK/3gydfyljUWHEZ0Q+GUAy+HtTJBCqJpwAwHAQcKE=;
 b=UOSbCNufTSBXKh0xBcFVKNITu4Yw8rgF7DCCuvQT/0IotRfN9ZzDY8tOMntXmzQAebuYdARGjiQmOKx9e/wAdj1bC758anDhFo9Qf7mWDEo3uj6nKNHrr+6kGHIy5uHoWRU972RLcIshWYc/FNwc+fXWGtyR4PjQ7KbZrMb/VlDyVwXlYv7qdwo5Fg33unO5xJb7BZtgUzPLfR1+k3Tv5JtFNAWMcl06kz6BBD7sWFWI3LeMpMXe0tVHSvIUIEDHmMuluVtg8SRzMgh1//gADN4YzKi/AgW9ZnfB7xibeVHUx2ul/RCqNoXPgWvWHnwCVOArdFBnlkENcJkwo3A/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrK/3gydfyljUWHEZ0Q+GUAy+HtTJBCqJpwAwHAQcKE=;
 b=o/ziyvWd/kQAdmQazxnhlbNsYwtAn1bmeYpy4B5dafPiNov+xo3yqlPUO3PtHWMKQZF8qJilf2cEQOF43xnCAfI6cjlCv7SkGtqtqhMnmtsA+bQPE+0X3POgBpvorJZdZcfXVC28lonJa/MgGtOPoq6i2pM11A1eZkGnPZ3GdlJcKq/SND+TOiTI0i22tzDkCdLFWHebDlmya3SkpoiSgeAS9RbN0WQ7lrc1xUek+Zcn7rJa1BTfleq3LR4oQsFsP2oXcYVdtYhyGOGKrlUxhC2cneBC954R7+KRru9Kzb2aEmtkdkglQKa+ZuKsuKAIzgepvgqgHvcthmQtQf/7mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB7912.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Wed, 16 Apr
 2025 07:56:31 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 07:56:30 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5] remoteproc: imx_dsp_rproc: Add support for DSP-specific features
Date: Wed, 16 Apr 2025 10:56:13 +0300
Message-Id: <20250416075613.2116792-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::18) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AS8PR04MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a53732e-568f-4a40-06a5-08dd7cbc32f1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VQvccfcLfXhLxGHODIt6tNAilR8g+0uF8EwHcnrdFCrfYjMdD8Q+1vBXosCE?=
 =?us-ascii?Q?iQItSLUDjLh88xgjuywLTHbPBuUE3wpTvN7JeeyyNR1On1OPka42cZgO19x1?=
 =?us-ascii?Q?o6Ix6dWDJKl6EI0ggOJQroYGuD75QdKNPXkHGeYtCNPgFJXrR1sduQ4vVUIy?=
 =?us-ascii?Q?TSNpy11H+tqHC2AxhYCe1gFl+r7apkU9ZsLyaTsOWkx5Dso/0SuwMzED1NPq?=
 =?us-ascii?Q?Y7HNz2CpKshJ9Nhta/wESLzaYrIIVkbOnSJSIJbElOQ60/AJU6xZOexP/xNT?=
 =?us-ascii?Q?8ortj0wdAJNKgKKhfzBmhSAa65J7zwd1JBxNZuVBu2nOmzvdGgl1Jr7koodc?=
 =?us-ascii?Q?tnkd0PZ3kJOcBGdt4N+nYRRbmCBncAQ6rRZSCxTUpxDDceDlFQMlsWvehc7H?=
 =?us-ascii?Q?r5er8b9oWuWvJfuPaG120l5Rb3H+kQxGAm85+2bvCYccRrw+SIClUtDloaRg?=
 =?us-ascii?Q?/uE99l1orAEKm9zzacrAuLJEYkjunEdpt9QV2fAS0KEAeJ6MeJ1m9WKmGkVc?=
 =?us-ascii?Q?i8ulip0+jfvMS9PZStJhDlubxf02+tSoGRo6oxXzYMQfzNKw4jVrQlTTqSn+?=
 =?us-ascii?Q?pibhl99nLVC7e/BjFVz6wBJVfv/LVkgM1bh3bnqdCkz/LyxuVxknvOnfsLWY?=
 =?us-ascii?Q?PivIag/dTuajCzoJAvmT/uoolh+y199wcDJ+al7mHlv9/0/Refu76KO9LXPv?=
 =?us-ascii?Q?tLKS+hdN8OrO6GmPDWtiySUOFzIMX/O6mULIYNVtIrutXGA7r//giGi/94ZQ?=
 =?us-ascii?Q?JRncWchyoQiXlxRBxAXPO2THBDtL6LMDjWGnHOoZMGWpJe8dYDQ5lgTRwD3P?=
 =?us-ascii?Q?qmRFxQRPdkRTwTGNdvODhBfkSJTYstM9z4kYYlWabazMjGb6c8q1IZtQwwxt?=
 =?us-ascii?Q?2XjnOdkX9V/kAOzmalIgwGemxnQaUh6Y8UT+vbaIqk8hGy5SBNM4ecTGxfap?=
 =?us-ascii?Q?KHOq9erVrvpQ28knmEmBWUhY426KCdjH0AA3+flCREBxxzYEBTgVeKTVzHZw?=
 =?us-ascii?Q?WAbZKiHNS5WWe31pV3AVIlh+FA5h+7D/pxAwQht52pLiLscn0I1lAZKN/i8I?=
 =?us-ascii?Q?/4nNkTBNpxhaXxxWLhRTYMhCKQOWZgWy12hMW6p3vTmnW98eILhy0RgC8WWa?=
 =?us-ascii?Q?uWXOQkJFZcpmZHoBtTT77TNd0/LrEMu2fHBf8j6BLJF0YnkMrLsYKF8Chhz0?=
 =?us-ascii?Q?AgIapTYe+sCmalzr/p9rKImRv7JMFWeCLz1en2h+BN+ehjOrTFC0/C6P+Emf?=
 =?us-ascii?Q?i0iHMn7Tb3WPHWywvrM+z6xODEvYhOA+YOTV+PGRukkCb9CKmnMqWr7yXqpi?=
 =?us-ascii?Q?G4yagMvupF1tpipswwDLGs7f/DdlIx99To4wGWkSAH1R46BhybPMI+OxVLj/?=
 =?us-ascii?Q?B8f+cMeTQS5crPHC56WE51PzSHxmarTlhsbGtmqBCqWVOjvR7YsgKUmAVNNW?=
 =?us-ascii?Q?B4riH0QaqJ9dHfxdMLxcVbJWwn4NKEdmCuO/w0ZKHOGU8oWxqxsyMdoMJOIk?=
 =?us-ascii?Q?hxmdgb9WBjqcOiA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVw/lXVLBvGU/K/zUAuwebmcDvuLyXDliUhyDFVyVoUfwEGqKS0oTAn1HnKD?=
 =?us-ascii?Q?U7FMCKBzJs3Qx7WuqjgCJlrIkcpy6tm4jLSaaQnWrnGtQ2flvIBW+lfvykjO?=
 =?us-ascii?Q?wz7N6y3C5ueGndnP5NOF1QDARvZ3b8ZZe51p2gs3tRtF6nRk90YfU0DDklEk?=
 =?us-ascii?Q?imOyRP81HFABUunIQGiNCLvr3x5KYjuJ6hoKHe7cuCeE5CMB0u2+k61pklgM?=
 =?us-ascii?Q?EOcu2C2hY5ZBmTGf2NjDmVrAlz9MHyg0fk0DZtAnIwnn2oSqH6Iydv6BiLEv?=
 =?us-ascii?Q?dlw59et83rjB8xSBkQVS1PZMJTerFZkoukuJAUzZzt8HmBOOVOfoUYDOhLn2?=
 =?us-ascii?Q?TEf2K+2Vnijle0/gRjKWpBjSgC4L1lRTxlKY6ZGcsV1qNrnBhR7j8mH2Qh7M?=
 =?us-ascii?Q?6eKsMfphNHc0VAx8U2tKjZCQtQ669r4t7ftMYc8EXxAp9pe9b24LMcNCbI62?=
 =?us-ascii?Q?JVWsJf298yILSJMF6XoSqqynqVobGrQZNoASdxN4WkhNaYuuyQjKOP/M1RSW?=
 =?us-ascii?Q?Lu72/Zk5yMg0YtIkkgYEouCnZMrh30BHyuhjfjyn+prnqdQjERLMTyExmCEP?=
 =?us-ascii?Q?Bvw7IX+uZwFuhFA3sNCtECSgi7OQjPGdkcAw+v4PRCqhfZGcpNTm1o0QNbir?=
 =?us-ascii?Q?zPvZ8sdtGl0b/wrZLrs7TGBaUXmlRccHGuaAO88SuIha3FV/JQwSk9gT2pST?=
 =?us-ascii?Q?S9lWcfZXHvVCr8Zyzx6zAV+7nIRBZR5thsyu4Gg5jVucIscPHg24xasQmtx7?=
 =?us-ascii?Q?gghY1J6Lr6WVrieTqIGCnzlvdcAgrBSSNZaBmaMmqhOvwAl7pMs61BpIPDDK?=
 =?us-ascii?Q?TgWcKlQbmuS7ZryqqW73KId9ZROEQnBARgwcrnuDsefEq7277ZHp+9fkH5Oy?=
 =?us-ascii?Q?KEvRS964KlSURpfIAzjo/q/l8KKJzzo68PGsgpuChSZNXIY8QC8fWkHA1xXC?=
 =?us-ascii?Q?EwUAxobYECetnXAMsF9Hi97PEmiL0e40TdK/if2LtJZqmFsx3HVfQMzn1hfM?=
 =?us-ascii?Q?J+mMIDcYvadR/NpS84SS1NPBNNzIUd64qE0u/SE6m8+sV3bONcHLp3XSG5fm?=
 =?us-ascii?Q?nis6SS2p1T4jfFyAX8GluevP4Xz8+Tt2Cut1cpIuCYbJuMAXrWeHZFOfvP/E?=
 =?us-ascii?Q?a7ixUucQn6pjAxcRqJ2XM2NVHy1WpnY/zKxQXqbr1X2ClMaBLH4XsfSeXAHR?=
 =?us-ascii?Q?ocwgAkav5N9a0XwTqc3PscVdUyyKuptMw5GdNfoyK6U21oQr6sQgZ8EAImTx?=
 =?us-ascii?Q?EXCslIzeniycqK9TcJkIQ/kkClBt4Ymks8CymfV8GV1Ir2Txy8URAg4Na9UK?=
 =?us-ascii?Q?o6lgwavf0oQk09vJDvsUWeqnPwH1X8byY4t7tfiCpQ0EgC6udg0N+98aMAS8?=
 =?us-ascii?Q?T6vbTMkYfZ/xI9v005v4AKeitCBdsVMiUS5plLu3soIaCCdNqsITmsIKuJZx?=
 =?us-ascii?Q?s3UUoFDyjS03IDSXCPgVS1vESE9r80LEJON7pd23308sXaWPiqay9ggB4GXP?=
 =?us-ascii?Q?YGVO8pCTY3GoevHh6BxpjfnQlO87oiw5Mmq8vFshFxcOcrUGQbMjFA+PU+ee?=
 =?us-ascii?Q?l6PyZtgNKBpfYrlVn3o9v3UpnaHFvg8BaWrCwCJNzz6SanN0bPeiom5yb/Jy?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a53732e-568f-4a40-06a5-08dd7cbc32f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:56:30.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzAK4izEFKFC9aWjuyeErJSrqVoVAbFRuBMZ0K/iqXhV7jTlPVlkpMy1+79b2oE/Pa3+oK/8I6kBErWfnP5OYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7912

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Some DSP firmware requires a FW_READY signal before proceeding, while
others do not.
Therefore, add support to handle i.MX DSP-specific features.

Implement handle_rsc callback to handle resource table parsing and to
process DSP-specific resource, to determine if waiting is needed.

Update imx_dsp_rproc_start() to handle this condition accordingly.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes in v5:
- Reviews from Mathieu Poirier:
  - ensure resource length matches struct size exactly.
- Link to v4: https://lore.kernel.org/all/20250409213030.3489481-1-iuliana.prodan@oss.nxp.com/

Changes in v4:
- Reviews from Mathieu Poirier:
  - Adjusted len to include the size of struct fw_rsc_imx_dsp.
  - Updated len validation checks.
- Review from Frank Li:
  - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
- In probe(), set flags to WAIT_FW_READY to ensure the host waits
for fw_ready when no vendor-specific resource is defined.
- Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/

Changes in v3:
- Reviews from Mathieu Poirier:
  - Added version and magic number to vendor-specific resource table entry.
  - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
    - By default, wait for `fw_ready`, unless specified otherwise.
- Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com

Changes in v2:
- Reviews from Mathieu Poirier:
  - Use vendor-specific resource table entry.
  - Implement resource handler specific to the i.MX DSP.
- Revise commit message to include recent updates.
- Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/

 drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b9bb15970966..a16d9c4238ed 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
 MODULE_PARM_DESC(no_mailboxes,
 		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
 
+/* Flag indicating that the remote is up and running */
 #define REMOTE_IS_READY				BIT(0)
+/* Flag indicating that the host should wait for a firmware-ready response */
+#define WAIT_FW_READY				BIT(1)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
+/*
+ * This flag is set in the DSP resource table's features field to indicate
+ * that the firmware requires the host NOT to wait for a FW_READY response.
+ */
+#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
+
 /* att flags */
 /* DSP own area */
 #define ATT_OWN					BIT(31)
@@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
 
 #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
 
+#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
+						 (uint32_t)'x' << 16 |	\
+						 (uint32_t)'p' << 8 |	\
+						 (uint32_t)'s')
 /*
  * enum - Predefined Mailbox Messages
  *
@@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
 	int (*reset)(struct imx_dsp_rproc *priv);
 };
 
+/**
+ * struct fw_rsc_imx_dsp - i.MX DSP specific info
+ *
+ * @len: length of the resource entry
+ * @magic_num: 32-bit magic number
+ * @version: version of data structure
+ * @features: feature flags supported by the i.MX DSP firmware
+ *
+ * This represents a DSP-specific resource in the firmware's
+ * resource table, providing information on supported features.
+ */
+struct fw_rsc_imx_dsp {
+	uint32_t len;
+	uint32_t magic_num;
+	uint32_t version;
+	uint32_t features;
+} __packed;
+
 static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
@@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
 	return -ETIMEDOUT;
 }
 
+/**
+ * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
+ * @rproc: remote processor instance
+ * @rsc_type: resource type identifier
+ * @rsc: pointer to the resource entry
+ * @offset: offset of the resource entry
+ * @avail: available space in the resource table
+ *
+ * Parse the DSP-specific resource entry and update flags accordingly.
+ * If the WAIT_FW_READY feature is set, the host must wait for the firmware
+ * to signal readiness before proceeding with execution.
+ *
+ * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
+ */
+static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
+				    void *rsc, int offset, int avail)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
+	struct device *dev = rproc->dev.parent;
+
+	if (!imx_dsp_rsc) {
+		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
+		return RSC_IGNORED;
+	}
+
+	/* Make sure resource isn't truncated */
+	if (sizeof(struct fw_rsc_imx_dsp) > avail ||
+	    sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len) {
+		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
+		return RSC_IGNORED;
+	}
+
+	/*
+	 * If FW_RSC_NXP_S_MAGIC number is not found then
+	 * wait for fw_ready reply (default work flow)
+	 */
+	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
+		dev_dbg(dev, "Invalid resource table magic number.\n");
+		return RSC_IGNORED;
+	}
+
+	/*
+	 * For now, in struct fw_rsc_imx_dsp, version 0,
+	 * only FEATURE_DONT_WAIT_FW_READY is valid.
+	 *
+	 * When adding new features, please upgrade version.
+	 */
+	if (imx_dsp_rsc->version > 0) {
+		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
+			 imx_dsp_rsc->version);
+		return RSC_IGNORED;
+	}
+
+	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
+		priv->flags &= ~WAIT_FW_READY;
+
+	return RSC_HANDLED;
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
-	else
-		ret = imx_dsp_rproc_ready(rproc);
+	else if (priv->flags & WAIT_FW_READY)
+		return imx_dsp_rproc_ready(rproc);
 
 	return ret;
 }
@@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.kick		= imx_dsp_rproc_kick,
 	.load		= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
+	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
@@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->dsp_dcfg = dsp_dcfg;
+	/* By default, host waits for fw_ready reply */
+	priv->flags |= WAIT_FW_READY;
 
 	if (no_mailboxes)
 		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
-- 
2.25.1

