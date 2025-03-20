Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAC32206B7;
	Thu, 20 Mar 2025 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472530; cv=fail; b=BVovekron/ZoUv2tkDNovYotbgaCT0HthVRETGrPSDlEm27F/tKxu6VfqK+OUcJ1ZHdurlkHQZrDo+WDoXqvUnKu2bYpyz2FScxLenrfiud9NoDcOlAZpvIwKTryGxJDYaF/kgmdZJNDYVjfVcdqb9pQdb6EPUnyif3tBHFNJiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472530; c=relaxed/simple;
	bh=qZ+s6vDz0K6OcStSwsIXOaQgzBYX6J9DzZ+wo3Rnngs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nk+kfQCfGkxb+BrsWHPc3tMyjKijL4Z5t84jR7rjuUrPgAgo7At0MtIGbirPksoiHwY2yZaEjk0cRbawZhvn5Pbue31GpYbd2JJnA+WZXIBEbU8aM+wCjzl2/YAA6t3ovqRBr4SwnmozPdlFW7Zf5HMmTpAnhdR6K9RheCIXimI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EbqYa9mS; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EbqYa9mS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NToidgKnWmD1V8+oMLDomlv6FkVvFyxzTFiJejZ1B8ja4aMSUJxQhLVtgUbsA2O8HFq/7DjUWgtjQ8GewmJTViXDtdoTlPEfUKTixonr3zk5wtrpa+nX+69i0jQGfZokcDh/SXBzx0+j6VihCkFITKltxZig3ms0ujdKqZOGoo1B1XNRC+RiZa4FQgYt9SO2hfLOtheYYxcYsqs65a82vJ9Npp+1MrnTh5yNSsC5TCl4o+pB9+clceyg4NzqcGPIa7lBNO/jpCszGxdp0wLRyYYHf9lN67FMdekZtlze4QvsrOQf84ALHTz+DXDR55HKn0m0Se46bTEvSxUtv0Wqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=PpyLJ4RfoMwpjfH/TuQyx9lS4hbvnKnBNBS3vlCgZn40z1mIQO9haP3PSJy/rP/w9D91GRDG1PTvbwLiH5FuTNL/0JchCive32SmGLJPT/WS29UwzOxFyrSZ5lkTNWBVmBOrCKOazh/n0WkwHtarnH+yyGCj70LtilpcwHp2IdVMa4hXwE1tVfVtYp/6XiwrTzTevdQK3wStE+d5c/KVdqHGJarq/6RYyD192eliqg6vPQJRp8a4nCRQf2cb5xbmK8VMzLmkR8QFLr6zvSiZBrkYhT5JzHpw44jPWR/puiV1ekI8dLtuWMZZ6UqN2VtxWosEctTHPHMStlAgBtdMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3+fH83iPv9PCT8MQLfOAvDNnnca+vfKU4j4YeGLRt8=;
 b=EbqYa9mS9gzzff46mlwP04jOnBDZ/6+HZQsVKRhxCUWfaYFkGxC37IhJBFwtwXWgLhdQc/DNhwmzli21/EAwBmlm9z5luGr47f8F18M5BS7+q3HxLvt+ajJQspMqlSxKzxSBZDFq52g0YQUqmZu6fvHb2M9EOrAzBJ5Bll3bkeMZZC56d/tGfmnJPTRU4TD83Ag/reHZROY7AR8+6ftMRz0oYxiBJCfWyS3o5QqfOW5Q1UgKbjAfWTJUHpmPLsr4Ric5AgAnM/RAP8CdF/5zrllZM9qIS/zKK5q+55BYDhqXUvxiagkc0K7XNVcTsnnU2xKLqqkhMMUkGc2NWFnuNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:43 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:43 +0000
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 1/5] arm64: dts: imx8mp: Use resets property
Date: Thu, 20 Mar 2025 14:09:51 +0200
Message-ID: <20250320121004.2542314-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-Office365-Filtering-Correlation-Id: 6f611b80-5ee2-4ddd-0fa9-08dd67a7f593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rwWzOWAwcW7OVngo91vXrfmf60YNaGgNQPbS1bh3rDAVxB8rzH3/XuCz/OCN?=
 =?us-ascii?Q?JlSH6KjDKzPmAeF6ZNyst+m4JSAKurs3VVxifxIykRK59y9DyCavYVLCoOJj?=
 =?us-ascii?Q?W7OpgisBVGmjVjkTlQpJwZTckBkOaT5kzGvMnjNMvbhDi675s7uEytXDGkWw?=
 =?us-ascii?Q?dHXD72mytInDqXDo1XnOrDpJRZWS9TfNK+Si+KTi4n2kmdcSrVMKIHdAhsXJ?=
 =?us-ascii?Q?ZgdG57dTvr29zhbQBwez4ccwemMhAnZKdTnPDMWrJnXeQvDXRtqGPVoma8/l?=
 =?us-ascii?Q?legHHRBT68ftFKQ/I6rWn8oVPKN2bJgdywePRkoR4JnCMEEBg2xvYdC4xrcu?=
 =?us-ascii?Q?VnuUY5VqaGiW0eqpcktcQt91RLV6aIDO2Zi6OwYlaS984h4jgCdCviTzSql1?=
 =?us-ascii?Q?eXJG27fmGCrW89c+qaAgYRm6H8z6v/2Q/INAscobYLG3+6LPUbkZpBXaFXsM?=
 =?us-ascii?Q?clyjouROXRQ1gRQjZuPMTGAJyH3N+Xq8yxrHiaoqOVuAR52R5gE0NLFf8k2O?=
 =?us-ascii?Q?lLGoHj92zaNM8CJ3qa29u6ya2VSqBtZ1uG1LxNhr8zDqH080qvCZ0UxGbqNQ?=
 =?us-ascii?Q?lmqh/61XUA5nifgg9BhE+mMypgtRoeDaoIjtLN7qOkwu2FEr1xexpDbRdyqO?=
 =?us-ascii?Q?tANSEAriP6aL9e4UJZl8vV0nOusBMG5jD1FhAmW9fuzwKe3DRjIQ5WGIXNQj?=
 =?us-ascii?Q?gQKb6un8Da9WlaKgV81SiRwZVvQjfMztxOtFLcP9sd7tWAQpDlntb1r4wSOv?=
 =?us-ascii?Q?zrqrYG0GjYDwvor3pd/+/HNjXpfPsAOxHROUvMciLmZZiBWDEi5g0dJG45qb?=
 =?us-ascii?Q?+mXHnjPeh1kqtcKbOETUETSMrTED8W5nas9eenaJ41EjbJq2j537LqlkDZOj?=
 =?us-ascii?Q?4KONhgD5Pi6G+ZYQWa8e2eOsIRc5Bz05ubsXhFFXjWePMkTU5DQiGSGswKag?=
 =?us-ascii?Q?vufXYs8GJp4lO79ws71VJE5Ox9wLQK5HQvnisDS8g6Ks4DQ2U6p1UNeVK44S?=
 =?us-ascii?Q?2GQdm6rpA7tqpj0oAo1SsB63sOd1hX7nB1gVAmSlpyjLF5sBfLPFcBHB1CG/?=
 =?us-ascii?Q?3qhtsW7wFFPaFT2NHYPtYH1Ck11lMGIYWcodk4OnPSzzH7e9KA+FuDgCxb4m?=
 =?us-ascii?Q?U7HjC9+XbklwmK/ONXauvF6JNFawhVIhoRcwQYoS1cKlytq1XwM6ns9vSAU+?=
 =?us-ascii?Q?hQjS4ZWxg4SAGmtm/PuBcjelri15BS+dijjgRLQSjIXsXCcqAVZL7NZWnfos?=
 =?us-ascii?Q?D5UL2E41cRfMG82CqGOpZMjkbgo5f1xuLXf8zjzzP/o6ByIOeAybTwmNHz5d?=
 =?us-ascii?Q?uXIBW5S7cvoXyh7uVY2TixcZtNdTsMiJm7mXf/BgSGWzqW1inngyYGap5kri?=
 =?us-ascii?Q?Vifwu4O+z9khtiqHdhaoU0IZYRzJf62tGzRLqRMdH8f0mhWgTKvjkZp5Zu5S?=
 =?us-ascii?Q?KR4Zwcs0Atu15gJQWHIQLHKTPJRGzhly?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fxv9K7u6wOUQHmY+EFEeQD/0A5xRSJ+b22R7VgH2eXpjsCZyd2awu8SwqGyO?=
 =?us-ascii?Q?SZc0KRExTNx4yW452tLXf4bvyp3WPGfsMyafXYdydOzwEoHN7pkodV010tTW?=
 =?us-ascii?Q?z5g1pSBlJEvW4zIm49eWAbnvpxZNoKkd2RUor6ANSO+WhqHYzCHFT08ICYWP?=
 =?us-ascii?Q?8uff4uLx/RhQ3SemJxYy+qq5Wr2KHqlgrNwjhz3ls2etVKVy68Ft+nKEv2ny?=
 =?us-ascii?Q?Q++OZUCTCy8Tdnhmou9+pQGo67SN8kskw9UDxeUbVzW0d+ip8tLzBPSB1XSu?=
 =?us-ascii?Q?hP6UjuYZhbRCiCHIdtc2UVIyoaJOIKwq9zpYjoN15fqAg+VcZOzVG/51c9MM?=
 =?us-ascii?Q?+9OmKfnszVrhxuXtOfs2QrBmDdn3ha3VnzuoK3emim3hAvp+zg1tF7/pXw1u?=
 =?us-ascii?Q?wPOjWZhw0hQo0NDeoAlKqwffLZA38gue6ES6dUiTpuX8JfQ77ngMmI0TzdV6?=
 =?us-ascii?Q?TPXLLjAApf+xuGloDSRmtl98cnj/qn8DnVrENB6NboAQ9X+xY8XccDINM23F?=
 =?us-ascii?Q?harzG1CMNEzzVv2+wnH68yvzEjml1FrV2lYjdt9JGFTpz/DmysYL6OQXS+1X?=
 =?us-ascii?Q?d+SlIILe4ecoAxW9RHQDi6PcHXb4mG/C+j/t4mtJtPVkVoBk8R0eKAcpyq42?=
 =?us-ascii?Q?KuDqD9plIzV7L8mfy9IgplY4TkpqD2eGUrNDsP9nbSLi5Jq8pH+hSGCEzTQx?=
 =?us-ascii?Q?WQqZl+N8sm1ieHN3PQyk4VmZUZPh7vNjeiBs6ACmiUMN+yf7oUeJbFEHdrvX?=
 =?us-ascii?Q?3qMYP7JQFwOf+kLI3byjHbkmduuNt1gVwGkqTCdveXzVxRVTXU8pCDodA1Tj?=
 =?us-ascii?Q?huqD7wnJo0ViSnpe0XIiShuamnE++/YO8BWVEkXPymGdU654akeAMTAsjIEG?=
 =?us-ascii?Q?JjzSwUfOw3eJjinV8Nb4Afg+R8i5V+EKYWjlPBI1aE7FgYufZZwAnofFfmHK?=
 =?us-ascii?Q?hufztQo3Qml0qxXH5hhVqVVOfgvSQMF2cUF+qBXjrCddtDVpQ7WotFKPuG0C?=
 =?us-ascii?Q?XuxRj+5QgeD6YOg9yaZPkIl6gPOHbDjaLTzULRQEiypTSzmwjA6WPyoludjx?=
 =?us-ascii?Q?btqoSOYr6zHBURWYOevHY+IyizkM3HxuGq8+Lwk+I1OaBM5keX8hVuMtopdJ?=
 =?us-ascii?Q?6b56ITo9apnwij9yCh8wAqhCIUhA2EYB4qph7KtvtnIgXSazi9AiJI9Phrsc?=
 =?us-ascii?Q?l+Q/yUuxoL5o1g/Pgi6uZ8rQoOHsWSHxT8Sks2vYQePMnEhmsfhkdCCWzA59?=
 =?us-ascii?Q?Ild3bfcO45rGXapC1jBKExlS+10si+At3CYI88Lxn6WYacyggAdBV+Xv46qk?=
 =?us-ascii?Q?0bZFVdaoGNoFZGiluJZdzOCuBJpjKA0AVmFKsQH9EkcZ5ONc9ciLp1S1MABi?=
 =?us-ascii?Q?JydMlN7IcmviirL4rAYJ5Lo+PvlTkmIy2ws0mAAVYseJEw/XSLASrYLKiztp?=
 =?us-ascii?Q?mzR8GTsYhJCkwOep4z9uakXisEgGF/vj0cxovvytdEM6uKGA5lfCWQ/p6o5U?=
 =?us-ascii?Q?THv5fn85jyPW6mZr8mGwFE7YpKsoXxA6AFyChDGldKQv74PiIxzqGmrTZRse?=
 =?us-ascii?Q?Hgre9J15qRC7FdvOVwEhXMh/lRxFyQmQxT8qWcbH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f611b80-5ee2-4ddd-0fa9-08dd67a7f593
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:43.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMgZIBj078qbOTbgsaR7LszV0GVOXj3vcuqssEE2V+FVaP3+BNx1UzGkVR6SyAydH+bP2Falh6zfSIwaYE+W8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

Add resets property to dsp node in order to be able to control the dsp
run/stall bit from audio block control.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..3b725fe442d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/power/imx8mp-power.h>
 #include <dt-bindings/reset/imx8mp-reset.h>
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interconnect/fsl,imx8mp.h>
@@ -2422,6 +2423,8 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
+			reset-names = "runstall";
 			status = "disabled";
 		};
 	};
-- 
2.43.0

