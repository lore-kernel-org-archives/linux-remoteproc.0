Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846285;
	b=enka0g6qlWZnS3Gib5zU/QzMP+VIsI9W4zZAzjV7S6KXEZqGFAL9CdlJylRXJCz3UMaq
	 9Ly8mq0RdqNQfy8JjwLHA73Ob0bca5s7miULxj8nLMj0fsysKw5ntG+E5wtsA3RySBund
	 sst4U5xTxCCjI3XXQVw1onesZNG+qQktI1TuesYOEBXW1y4aSNzluQ5SKkSHflExG1pc/
	 mBwmXvMi6hnKzTgGfqBtSHJG5VCjWYPDqwACcPPX5K/aYObrt8QMi+1aORgxKOvUGcB4p
	 SGH0lZTGWOI7ie7tQIxPb4YLS1qkmuwbXjtREEJ/HZ4fqMy0dSP3NGRGFdcEmWOvT9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846285;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=WyrZloqWvdHzttKLSu1uy68TEaU0Ku8rUWT85nCTBpU=;
	b=TESZt8v7M5fWoem1c/KuhXYbn8AjfGW3hg7JJsUEchrKuPC9Yy8DFkx9mdWCpOxpsD2n
	 ZmUGra1Y2hw+Gy8FBcEMeH9mxrNtWXHJvep3Re48gfuclntIt60w+Em/SJOe+ueb1xrCa
	 bvrtHdzrbmYVQWE9nGQ2IJ9FC19MuHrQeHfpSoR/g6gUgw/WZ5F8kqyXGOJyoAbBK7ARQ
	 tyMvjxFy0cRs+7bkz/Fs2YgtuAiV9M8BGDYw8I2urzDvOx73aB+74kQSeotjBNIKSOlR6
	 NuFbZy9GpoKmcBA4DNZQLGExs2aseBgPYDY59IYk0zJCji3/2DeySFRbz3Rzt7Q0Eeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hia+GqxI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.11
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02B606A33C;
	Thu,  5 Nov 2026 02:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A02B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hia+GqxI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYty7ICFiyDx4GOGV3V8DC+6Z7uWL3NHNWODWj9cXsCwBZQljaoCuCtQF9eJvUyFVOw2macedGB8ddwReaqzqJ8oD1oNRZdzSDdPrw3/iyaMCZf+2ynKNgswzjgaouXoEI6LWaJM/5ZSWGeGLtHw879ou1nSA9Gwj2UJwbilOIcOEJNvyXYbWWW4ruAZqMatbXwjbHyMSOzkaw19s7VKrnyl4aBlUJdoh8QoKDdFxqN//Rfp8N+8ZZR5RFDkeSuG+R/e2kBKdy1fU5mdz6a+zsFgJZsND5RIqE3tUagH9Pb+siVNuJiCwPtAct+qxYJX6SIuKhh/DvPlB9clzBWVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyrZloqWvdHzttKLSu1uy68TEaU0Ku8rUWT85nCTBpU=;
 b=EF+O5iA8B2QjggLA49OYBNI8nu89L21e843lSXX1PXz0v/xmNX0zc142vTVy/TRirDHyCvViXPBRQFk3S9fRxQLYcEmJicTCNMy1E64Zjh9zqD/woRGzsDHWFxrQWi2wbGmamtLI3aTjlrY3qiZadUAoBkXls6rfB3GaAc38AmBBi4aC04AAoozFF474LGKiXmeXFKfwxYpbU5Jnn0Oe6He2vIdi7Cmb+w0n6hBpYBCmrVkBB1A2y+7rRSCx6CwUde0SU30cpFwm74u+FpldIbF3+qJJRVzIPurtbLZVjwtuNShesLaAzXZg/1jMZaZfMgW5x4hPKYCmYZeUezvkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyrZloqWvdHzttKLSu1uy68TEaU0Ku8rUWT85nCTBpU=;
 b=Hia+GqxIOmBH4AKc97ixpUuVTS7Rl7LKbhnWOeFDIZ1GsYpDjiZv7/n8y5GM0RgmWHde07V+kgqKsOwH+IxRv1qjOipZ5s0w2qHhF2H2g0Fa5qHJ9R7TKJdm0Ly+giRf9F5pwia7J6Kr96n23DFxeTIxZIW3fLWl0ah5Vo6NYXmuteRJbVZ3xVvIROyfuxp3efQ0hIVXJADOcUS9p2E+CCYO7oL4rasPvngQX42jH+wYV1iRwn0PZdaWJWcrCLDMNLKtZag9p74HA3JTH0idSC/GwqrZgs7oL1h/76jqd+cFzoqf6ZwO9VxQnAbdZmOglMYCFryiCj+3rdyjNI6Qdw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:38:02 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 02:38:02 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
Date: Thu,  5 Nov 2026 10:41:03 +0800
Message-Id: <20261105024106.338791-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB12060:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fc7c2d-e7b9-438b-6362-08df3ae5cff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261102123227099003|261026121527099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	XTnEYEiZxqxRBKH7/mFtrnVQRqsWy25yslpH0k3cxqGiOgp+EnaX0B6PQDuiUYSGuwcFGFVEZX6vnOicgOiX1i8IyEmtPIcI+Z6aQM8bgP9rM/fCYPN5f+72VVqP+uhOsUWqYZM0fIehbUmUZ+KFVBmEQuoptsOcoLfdnJrzhVPNCA7FfKs26MIMCsCYDYt+6B7CEtDPki2QkFGgjBlClJOjLbc1sbURZTlVc+p2YszH5K7fYcbERf5jmH1g36fT8S1YR7bp+maOKU60fMhlee3bYI3RnUhakO3ugJgtlVUGnFBcMJCPSDPC2iOqeJApOG2wXyOQSylUic1mF+SnLk12bk7ZjDrtG8U5D5dKl9Wpy2mr0JdOcfgAxD2pkEgzrNJea0/24PlKI58UVxWA1vVcS6OIpmgEr8j5ZuImBZvSsIxsu5Exu6lxWW6hf0/EN8lRWbKujYnvrx5kECy01kn0Ga5QpbiHIGrfjCrCvFS2PzACful3p3xGC3VB/mc4yS3ZCUzP4jLtlEC7E5jZFvDvczh3iq+5c3omYOBQS/rxZZCJA3+37FmcFc0PAzh5zolQ+bPA5EPndf/WHiUKwYxaEcITEluCw4bGzoA8svGVHEu6sJYzGZwHWa+lLa/bG3D9BZIeXi+EwmDXmK28vTPSSB5XdEEQsnJ0rDwS37TZN/Es179JxYtBhfeO/9BARf9aByMLZLdx7u7u09Ihjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CmwDCi0yGD6oOm24fMYecavCwrauuRvQznCck8mL8dwSydsoFi4l8TWqON9b?=
 =?us-ascii?Q?O/A4FsKvbH238MxqDInvHVrIyk7sff4Ce8cTvo+BnSHNZ1c0Jf/u6YyL5Qxh?=
 =?us-ascii?Q?x4JhYUW0vcX1moEbEEsKRIbcY+ME1c7EFZqPLvEYQ7jwQpnZp6iHlNALe6YY?=
 =?us-ascii?Q?T2p9Q76urSWoqmIaE6NzQLLHBmnwVIrocND9K5fkTN5+tcXeLVw9PguLq1MB?=
 =?us-ascii?Q?l3VVaZKuuHpSl5kQroiKHxEP6jwe6bx4ACHsFUQC+HK/na7iZcr9+Wnz69le?=
 =?us-ascii?Q?fGQCDngsb0hTRSoKGb1FOT54WKoDAjUEQNiD+ajnfX7557aV7wQ2LFsp6cwA?=
 =?us-ascii?Q?EomP0YHscezMEsAzrDw+93Ffj20p2Nwx0lYbGYzc+ECuLbp/ejv1YGppXbve?=
 =?us-ascii?Q?wOoqX9R04rzLRwcvVGqwq+0g/SxZd7m+MvGvL3t+dLxhBpTCw4hFgTquhT9k?=
 =?us-ascii?Q?38iOpXPoewMuJSs5LEoJe+wWThPqoQZyOnWeuYsCcwdSMndejX91oRQZWw/e?=
 =?us-ascii?Q?6hrKWSm77dq6mPiU5PAbUoINv2uJMXLCIKgm8ubN9/FD6vPe+GJ4iKr6Q6oV?=
 =?us-ascii?Q?L5UmgzRNExv2Mk3geB7oClt8zfV9f9RvhKHSgeE8O67Fq1on+NcDPeh/3SzO?=
 =?us-ascii?Q?PS4Dlq6GYWhs5kqLBHnGS6+bH31IxxE3kAUXZOwsx4YXT21Vcv1m3rGSYbM1?=
 =?us-ascii?Q?HEci6802Y1W5p8Xbtn2TxVE1wj1u0ng5i5oFnBa+VZKQiEVSiXKwvUzi03f1?=
 =?us-ascii?Q?dwohrzb90xaeMt/r/Lhc2fTMH39GDCP8JbFf249xW+UvKAwK5n5z/+c5Ofg9?=
 =?us-ascii?Q?1lvcCA1uTPSRHrNR6/vFvAV/P0pyQdnXz5qtnsj19sLBQ3gVHAJA2udgX/hg?=
 =?us-ascii?Q?1gEZP5i2unDEXUj3CrHiRanRHG9PuLvulOcrbXw8ExbZ1y1C0FGwVNUEXwwi?=
 =?us-ascii?Q?uDgnJ5HBTffGPO8zX3RF0FejjmtoWFWyNy3kZ6yLUkFwP5qoMRB64PgG7Cti?=
 =?us-ascii?Q?3+3q4BQq+ro6OlJ4hZgmD6Y+DUcYSjTUIt0jI28txalVnPJmz0AvEzTs26lU?=
 =?us-ascii?Q?NkSUH92gKwlgc0hgnr6yHwte8fm5TgIqx3jmnAlM9R+tR0p0T2fvZoPlUcoj?=
 =?us-ascii?Q?Ptsmg0j+5yYnROnDO03z2tspz9Os1JlkaFRKe5KrKaAxXTQPVX80Ie6RLFpE?=
 =?us-ascii?Q?6HiOa5+qzt8MRPFhgXh8dDHRGSRSh7x0mPs4t1qUUVFAiqYqZq9wwJCby+Pr?=
 =?us-ascii?Q?FEP74U8zZL5qy9F2vmTLFOXzHi7cSDDO8q/uDyv/24IrcvgP0LdZUe2ILgjf?=
 =?us-ascii?Q?0GDaJNRAy5yeORz+GH/Q9fLMCGF2gdtzOwLMygLDAMgOpT7+jR/EuVzd1tmL?=
 =?us-ascii?Q?UR7bTapVoWkQFh6oq8mw/xgHRKW/qrmVSCIH82trsptRZ3vG+qsXnu+ya2Vp?=
 =?us-ascii?Q?zF70df+qvCz/AE8001mnsl43rzF63dnTtI2QfLYq8lJgkWFoPylDHCwVjjLY?=
 =?us-ascii?Q?bo4Hy6hSnFRcRyVXfRUbKFjSdmS4OsLIvigpTpOVXK2eWH0HNjRWGNifMTgf?=
 =?us-ascii?Q?xwIFF/fvApDjOcSigODJZCQW0yp0kWEzvDxuRZApCl0KX+1zQGil5s1MsDpl?=
 =?us-ascii?Q?5cslhceAfjWK9LYC2viYdOCW8a6NnLAOhSweIST0A/yrGq/32zMSs06V29Gt?=
 =?us-ascii?Q?F3cVlbds5HN2cpyb+/i4MA1O521pdOuS9weh5L2mZcTZr1Mqbaob61lEDIyL?=
 =?us-ascii?Q?dc+5+/z58KDshx3oBdf2VlXwmHAV9z7hJOm1X2okg6YsXABHqIPQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fc7c2d-e7b9-438b-6362-08df3ae5cff1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:38:02.1679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hVGmR9BcDawEkEqN08z5pUBnBlrXfsZqrWtJG631ICOdu9u8vBbEqdZtZqSjzvkJ+zcho7uOYZCy5oOYqVhOgkEqgTuLALQqfN5/HuaBWVAAZwDKHtqPOKUMmAdwkYL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The HiFi4 DSP provides a separate reset control for its debug logic.
Keep this reset deasserted so that an external debug agent can access
the DSP and perform debug operations.

Also require the reset properties for the i.MX8ULP HiFi4 DSP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index e610b7636a08..2f4c8623ff21 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -84,12 +84,14 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 3
 
   reset-names:
     minItems: 1
     items:
       - const: runstall
       - const: softreset
+      - const: dbgreset
 
   access-controllers:
     maxItems: 1
@@ -183,6 +185,8 @@ allOf:
             enum:
               - fsl,imx8mp-dsp
               - fsl,imx8mp-hifi4
+              - fsl,imx8ulp-dsp
+              - fsl,imx8ulp-hifi4
     then:
       required:
         - resets
-- 
2.34.1

