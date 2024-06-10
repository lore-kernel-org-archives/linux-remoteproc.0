Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2AB81754;
	Mon, 10 Jun 2024 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032672; cv=fail; b=ficmlSGC8xLOH7IHAD1qne2JoOm/L3AsZLIuzIJIfJv7YcvWXN3eIpfsHKhpjmQ9d7xZGiFulUCY3TFQhyD9VkTGlWx/v1q+JSfyDwlfAqDoXn2pZL449v1DJCZBz+j79eB+bYCbcqzPz+bS6K5wzWFAljQaDbXbPSGhgEZZI4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032672; c=relaxed/simple;
	bh=UPquH0Xx5B1KBhKAIEjH60hINXd3/J5QmZNr/K77F2s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=crmHW5PIn5LXmVVxY1BT9Ndv3iFpjWQ1bA5Xdw0d7lGZeFdrs09NqJSbiX/0vxux+sN0lKFE2Obfrqm9KcMO8MndDmhDfUWm+zbwffMIXAH/KmnhmzfwcUqZS9WVRxQ5YURC29oIIdIoKU8Wg3Wa+g3qbsXyMwBMltrovJH4QCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Z28A4Rja; arc=fail smtp.client-ip=40.107.249.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Z28A4Rja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsh/p2jxYN0EK6znYa/jdD6Hn6hhgpi6XBSqO23wAdJIIZcmkLPQ06FX85XEddB0Pt34ZZU1j/dFFAeAtvqBZWJTg3vagTQydF77yhTugm3Lqd7UGuaSsCpWeJXs72jbTi3GZKWhT4JFMKXGZNCNbQfN07b4tJZCXacSpp8VcCM13qSmeuG9sBtY1SuWlYAFTjj4VmI2S7CgjtH80un8NSJBntcnc++xSvihSuPsSXWO++54uxuwoZ3iRKa1yhaXACwOaI2anO5TZLaXRRDPQS6rQjn6cnQXRNnCpWfVVztTK1bIX+Se36ew1Jx31R66tulAssMJbLxTrXbF8Er3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FnKMxcRjOSfC4FvKkOmz8vcKvoSRA4N6QqvD/2qA7A=;
 b=msAQUV63H5LIoBTIySkFIxcFXp6LTzgqry+c7x2OeNEVBVlkVHxACPhiIALh5gSnGov2T3rA1+rHrksVpBRggilgoWRbRcxhj4YD+kmvPhLyftz1O0CrE4zNN4CHf9HoScqaud+csqmzkwJLXVUeYZuQLPYzlt1qC4GYBQTMbVRHZIkNaSMGjGDRIyod83sdWZtxIbzS1aqr1hNvGwCS4l1VyzgXLT+jvJhEjq/Mn1r/mWQnkQBSxNEcZMJQbTr/MxjI8jv+eYSqFqbGvmC7EtfImPTrXbkeA71lUKJldm3FzCA9GNLgZ00qskJo7mobI84C/PWF8B5tp4tqoeJl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FnKMxcRjOSfC4FvKkOmz8vcKvoSRA4N6QqvD/2qA7A=;
 b=Z28A4Rja0QVBvbyyAJF43PYqidHRhAA/vShN270Fth3viPEuursenOoRaVBpcU/yHZ8dh0OPFToynQXT1xZ6QtU3oH8AafTnQXpkKAiVhSr6bBO+7WSqp7He+FT/HSg0ucwwAeeSgUy3fAs6tfFGhUau80Cnn4j8RlERk4j+OkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 15:17:47 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 15:17:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: krzk@kernel.org
Cc: Frank.li@nxp.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org
Subject: [PATCH v3 1/1] dt-bindings: remoteproc: imx_rproc: add minItems for power-domain
Date: Mon, 10 Jun 2024 11:17:21 -0400
Message-Id: <20240610151721.274424-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: e1198caf-cc27-4935-d52c-08dc89607bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|7416005|376005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4+KpHsJSS66vZF/UfMnNXHaHNFIbaoX8ZEjYu1+bofC0CZWwLu8gaL8G5L/+?=
 =?us-ascii?Q?U3WwoTaE44dUCI4lL4LguIFfP+AR5DuRKu8CG75iTtNd5ZTTDfQ7oYcEQW2u?=
 =?us-ascii?Q?pog93aGdRJE3ZCtGhNHiI70Gbh+mUJOixUF1/CdzbGStCnUiU25b2tWsELZp?=
 =?us-ascii?Q?5FzQZpdc7MUB0HTfkujPuwkqM0HyppBqYyGVz+rdgQsAd/MmtMn+7kL3U1jM?=
 =?us-ascii?Q?Sx8UssS6mrl+/WAq/jV9KPKp6w9PbOpaQOLKrWdcnnQLNTWw4B9yv8q+h8b9?=
 =?us-ascii?Q?/6y7c94jQBZWOn693CTA33rMQbUMX9VbowL5Cj7qSuljaLnNCxkptjmw32l3?=
 =?us-ascii?Q?8vL3LZv7DA5V/l2FacdnOI404qTm25DIUkKxq7HYzQ/DYTW8y+ygJv4Jrwrl?=
 =?us-ascii?Q?db1gvYjKB27Oug+Ek6GdrNrw7luu8YABQ0RgKR4aB5fZNaY6E77Xt14gUcNT?=
 =?us-ascii?Q?tN5e30tocGX5OPv6+RfUmduhKfg8Lq1BSC2f6ILWzcwqLCpwFwl5TKmlh/s2?=
 =?us-ascii?Q?oqCsEeMcT2XQB4IN64VN3S/S7TGcKMAOl93Ucczl/x0iMV7oAtniGgXI/e5f?=
 =?us-ascii?Q?51CWnjMzG9Sr0L5lfEcIdjsdiraau3mppXAjw+PIeU0f4tnFafOHY0piCxl4?=
 =?us-ascii?Q?RLCwj+WJJ8PHnQTFaElXwtLQKIYIJqSCURMjpp8LQyNIuhIKWCmo3il8titv?=
 =?us-ascii?Q?BEEDeWcryOP6PsYIazOsFufdLJK0Amp5GB1ETHcHSRENoTsdKNS7xmjNuYt3?=
 =?us-ascii?Q?hSD65+IWPwEwPrKLeAmHuJFEYmJA0CHZSNtvjNT5AyHbl6my/Fnpr8rUnR77?=
 =?us-ascii?Q?rxYr8yj7RkEu3+d5VPpPRyDQD9iwS9knQpUuKHCy+gX5C7Lp63+81tTqtofY?=
 =?us-ascii?Q?EOojmG5OAUqHS1cKgsKzaCuYXykgG2hmPRtrYK+GKxEkUQ70savEshJcSenB?=
 =?us-ascii?Q?Iy04tHhIrPF0KSfh/Lq5SRbtOu7Shm2KxyUWQaszOgFfVWTs5EFUlROR5ZQ1?=
 =?us-ascii?Q?GgF0DhPFRuRtb1uI3FnhIZEtEesWps4yGcg6tA0J+niceab3qTfWtrD99kVC?=
 =?us-ascii?Q?Job7gR1Nujo5LeIXpXQpBvVKoV1GHfGiGlj8gUcdwt6Jd10oRpcMV7vLRl7P?=
 =?us-ascii?Q?TTB4GxYDdqxiLX17kLIYaNcUB9n6kd8MMZMkZNrUDuBs1jIPdlH/S1KNYvZ1?=
 =?us-ascii?Q?i3Jp2ZMwoTJTsQjrg1rdtq13SBcnxxeU5XSliB42FgJPDEVzhg6Mjw+OE8+g?=
 =?us-ascii?Q?/0LYV+8Pwyg+gPypbgkUMx+so8tHLmvO13WVg8CvQtteC4nVPIcXAlPH2CzC?=
 =?us-ascii?Q?wGonS1tKLo1/KYz2XtXDOxrR6BrsfKsf3bGDXf2LqOLnlu8nSSEjX1K0s7T1?=
 =?us-ascii?Q?ZMmh6UE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?35Ym1Nz8w7ebgky+n0iofjUQsQID1Vqa9B1YuyE0kQ/g/bQRi4hbWzFLW+wR?=
 =?us-ascii?Q?sZO8ZSRAisDGUBQ/r+y8dHTGZBiira9/FsXLf7si8WfJdiBny4hRZz3M/QbO?=
 =?us-ascii?Q?E3MXqZDkRvHUpg6r1jzesYb9NtC7AQKJEkeq2OiTFAjQhDtSIA6AaGxO/Z7Y?=
 =?us-ascii?Q?LY/JQFNw38Auiyudj/nEK6FcUQa14vlAguOPu5zJtJBdyVKMO/L5SilM/pjZ?=
 =?us-ascii?Q?RAW5xKvnCOy+W6nsaEIoR/WLW848wnLYYWbaTwP68WqF3yiDP3h9zk4o0PVn?=
 =?us-ascii?Q?2E3pSHBYwC2ICYSk08IfNa8yb4oAfB8pEueFUfMbFF6FdLLr2DdxulDUI1v+?=
 =?us-ascii?Q?U8xCf/9CI3CiYA1/JYpG7CV0nC5jNUmQnsOi6fUi0gsWaQOjd91gcreVQXdR?=
 =?us-ascii?Q?b7f/5Bek0iCFBhgENlxhGlWn3QdX8LHOd/DUvCLkvQJfueqsv9j4OfJiWjNF?=
 =?us-ascii?Q?gLppE/q+rrqvPIp6pr164EHHnRn5jYVTmWrdAGcvbA+NIWyRYZx3+2cs3mO6?=
 =?us-ascii?Q?QX1q+47hF2/bqmJ8D4+PMZxZ+6KKzaQMP3ha3toIdfT0wqXXYhCbK9+vbK9R?=
 =?us-ascii?Q?Hw0D5ehbVrZmfIb2n27JxaZab+Ttk387d32jbUtnIBGmJwv+kAS2rqMPBy9e?=
 =?us-ascii?Q?AmOF42L9/Td1TN3I8xIva5VItI45N7tkBbBDIRFwtGcaofcLxlbgQmNRp8m3?=
 =?us-ascii?Q?ozomHcJPl19mDLM0jhSX/w22a4XOtqw0js/LNEQoLk1lAGdslMnYywbxZFIk?=
 =?us-ascii?Q?5wpP79DfnB6bK/1l59iP6RwBbrjnmZBR0oMpsLp8+urhiVfE3kpc2WDp9pqs?=
 =?us-ascii?Q?IQbDMhtqrBBUrqe0BdXxmt89OpPRC3u2ZG4SWdtaXfQYni0mFVMCmP9SFBoa?=
 =?us-ascii?Q?/DvnubthfzV99t4qFrmAh63QFjKs2CGgH4RtdKHu2FNsR+TjChDfWcmuq2yF?=
 =?us-ascii?Q?dxYKwH2O6xjFa9bA6iHelxly3lBbOsJ27JpVrEr65AN1tB5CbbencoYfnDfd?=
 =?us-ascii?Q?P+DbEbP5U72ney22eIrk2rQauscZTGTpivgfgbAYqWXP9QKnjpwlis/o+2L1?=
 =?us-ascii?Q?ZEBFh8FkDmZf1UwsledpAXkKGclV1OaAkBc3eK+I5jb+Cu5zIV9p2LdwTo/q?=
 =?us-ascii?Q?RR0NiQ9Ar37j047je8FwIq5Cc6VzKLB1Ra4jQA/XKkWTZLfX+czHljFyYwPp?=
 =?us-ascii?Q?/rf7qXkoVqcPJQveU6TYnKTE5RMgH1znS1TwEUocY2dV1/DBUNKBVNqnGQiy?=
 =?us-ascii?Q?/ODBDWqtwtKXEfnMR9L2VEG8l6p2tAcjBSQ3rVSiB6JvRzRk34t8r/EQdfDi?=
 =?us-ascii?Q?LOb9ONTWHJnb5mdF3F9D8pLbdYXdgK13qdEkUPNGq8zu/zjgUZGY909QaE5s?=
 =?us-ascii?Q?PQosgvyKMsFfPrQxuzAVl4HdH8lYLqPCWjNqkGROO4kMCYyUbG6HRc4F7vrB?=
 =?us-ascii?Q?glgzaoncge0E22l3wyYq9Dhpq8Jyt5db5uQLYwBAa6BE1DOytt7VTP/NWfLx?=
 =?us-ascii?Q?6HZ3lsW7A6g76sREDsK+NdaL5uteKs8iNRSHh2ibwAgEXhFBfPm3uTEwqZsG?=
 =?us-ascii?Q?cpvuwz+JuksAX4AE9p+jK8Lp2j2dwK7DDR1tCOYS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1198caf-cc27-4935-d52c-08dc89607bdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 15:17:46.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TlToZKl0dz8g4Yh0EZyw5oeTtfj4tT4wmaf86rCEwVr4/3qXmyGhBGnsRWMce3MSR1jHzK/JIVC/oM6Ehp2ugg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259

"fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Other
platform doesn't require 'power-domain'.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v2 to v3
    - only imx8qxp and imx8qm need power-domain, other platform don't need it.
    - update commit message.
    
    Change from v1 to v2
    - set minitem to 2 at top
    - Add imx8qm compatible string also
    - use not logic to handle difference compatible string restriction
    - update commit message.
    
    pass dt_binding_check.
    
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      CHKDT   Documentation/devicetree/bindings
      LINT    Documentation/devicetree/bindings
      DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
      DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb

 .../bindings/remoteproc/fsl,imx-rproc.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index df36e29d974ca..57d75acb0b5e5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -59,6 +59,7 @@ properties:
     maxItems: 32
 
   power-domains:
+    minItems: 2
     maxItems: 8
 
   fsl,auto-boot:
@@ -99,6 +100,20 @@ allOf:
       properties:
         fsl,iomuxc-gpr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-cm4
+              - fsl,imx8qm-cm4
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

