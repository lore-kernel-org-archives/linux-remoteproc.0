Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63B3D3CE8;
	Fri, 15 May 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840783; cv=fail; b=J9c8p7zs2Zyk/Ycwjkt01syErAjFpYZhZmttsHOPpczvg95DxD5/XF//0P5u8oVsq8atsSJIRRjg86KcpZPO79wxFcC6Fhsers+i75HyLoiX9aH6w9vTsmsS/uSSwnYPWfIj8ygHBMO9m9RTLEWxMJlb+J72/Xh9VvICodcmidw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840783; c=relaxed/simple;
	bh=SDmqboDBp4i5s3lk/kkrgZyWi5pXiYNROsuUMcNd2Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VbN32/nKUzGGwbrmkkHfiSYh+8twGVd2bwBiSVYZQF0El67JSeUc9AA/Mq+DBXTYpUicjB3Zl4SPwdaW5a952X/bMCEd5KNNItX7OhVl24lNTuVE6OIID+xSjAu2mB2xjWPTtOu/fMifIpJFOZ4p37PfwRHf7SVY7siNOM0F8/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUmPv0GOmwGlrtAw2OUWWO0fXiTK04YV1m8m9ZM+3r6VB7nj+e0e1nOTKQmORPXNC45gO18qD9oevOIRx4vfkNWYLiI2G2KtqtCDb6TfJ5JpmocozNp13TO9PXzshbIJODOTYlWrQU+l6De1Swyhy3VztRAy8IbfCJG9qHzuZ32u9KwVZ0ePsJJ5Hosp6oSB9RZHzx8F0KwP6EJ7Ng4s0GKnkhvU3i/8coA/zsWvq7twYEwk68mm0LGyFDW6pF94DEfh8R/YvgSmme0tldABzm/S3f6+dd6VQw1HCqK51U4qCciBEUlAHqajo4yxcyPkMe2T1uLnatzRSr2yQU5Hig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i58Pc5CwVd8OQPk0LcuS4wk2Mox8frr75P7uPZuLeRI=;
 b=E6DHQc23q6UEEJXpykfcdeTK+wgTJmlXBlwg3UOvg6mcYJhG79Z36SlvJrEyjzL4P+mlIZTq1k4C5Qd4VyLhPMcmCOCxcLsmBoyvqmok95S1APFlqKDUo9goQz94DoK3h2dM28niYrWjP5W2ZFtOyoOB2o3lpoN6sFgyXpQ4fzI7ZHsbw8Zqr7zSI9k45nBSOLHnbVBVPTeNxE93dKXF1OOTrCJ7o8LxnDp+bv6kx1GtowKDPDUuvmok9t6QW8yz6KDQEII/97iFxGs8Qmtm8pBBeH5kvKWNCAtmmfsya5+rL28islLz/UfkXia3oXU50k208TPX5Q9Wyd+DJe4AUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138) by
 NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn (10.2.8.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Fri, 15 May 2026 09:54:06 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9913.012; Fri, 15 May 2026 09:54:06 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwlock: Add StarFive JHB100 HW lock
Date: Fri, 15 May 2026 17:53:56 +0800
Message-Id: <20260515095357.75998-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
References: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::7) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a45dc69-e683-40ee-d012-08deb267e75c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	cYfqpK1flH9119U+4BzQZ6Y98Hn53GwG2Q30pgpVWMKtlvRyBLH49UcIbGtH6GTJdXYOYJNkXuFcX+hbNoDY21A2COCkTFU6aoaUaf5MR7jH+cdOVjDaiEIPfAvaqy2n6UesAMbgtC4vnUQeoOLN5OKHbmRarA4BuRWHmruA8VJNmJSTjxQus3x+d3e/ncplG4bM7n5JFesN2CrUx7ew6gadbJiX9xQCnuAm4iFU5a03rcpooaGI9ZADt4mZE/Ul69FVGk7F2qLs7l/2FE4bahJM7ctzpp9HOVbZpxnj0MQBfm0G9bLgPCNBBjXQ4G7+Ov3LGHFHmuy3/SM9eXJHBHXZebKp8vYEphZuHHbPhUweqWIUKH/IlM1//ZL0eYA+a7V2J+sY0NvcgfvArG4PTpZ3NIw5tNj392gwFjBHwHf39WMbzwpBCm9rP+GkjdKs05cPiFvvPma/s8cl6o4k8vYPun3hzf5EoKceLfZZ91+vATapB80DywveHckSCUVHpYXy5Y02T1EuFNZ4DclrxSDLUSOczDge9ZBDWRS1SkzJd/DadYR8ZRmJP6PqmPoR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qMR9BND2vBaJLxZPhTnJietu++V2felyTLHKb7dzxFZNc5F7nku07L+WflpM?=
 =?us-ascii?Q?yoxYCgiH23wdqIyM0cciTQcXxlIQo5ysOjs2H5UAVGq3H0rUJ9JkB/3ofybv?=
 =?us-ascii?Q?PnSu2AoNi89yIFMkCzPqS2dJK80lTRI8KZ4ulCuLixIdfvnQx9gB0KRzjolZ?=
 =?us-ascii?Q?+H5z9pXXLXJ2ZvJWAuC7FRhmF39KxhXWLQfNnNr0CemQo7aal7YiYPadqZ69?=
 =?us-ascii?Q?HUQmhgTcWVDJaRKX4YYYTvERYawVYAgIrsTHYOeGWdkpAlR86okOIu5zzG4o?=
 =?us-ascii?Q?TTUOGMv9J+bsXBFU4TqmOSXc80R+SaenmQtYLiM0z7e9B/ncU779iwDsXXDT?=
 =?us-ascii?Q?I3UhRIiUiM/im0CwgWAiihlM70BCOJhAACUI06T+3bs/yOvCClClxLrbVGpU?=
 =?us-ascii?Q?6XZb1uu9oamUB9Ud+88Qvn4ljId8e3gITWpkwcT2yCLx6nOJ96L2aJ59PyId?=
 =?us-ascii?Q?0Ydii6GP/h2Ld5VRW6CF7S3Nh/YrvgXOvodXuI07p7cd5X2BSsPbLCV7DyvL?=
 =?us-ascii?Q?Hf00IA9aOhDzUk7/eQK7vPU5u9uGsDRKtqPzm4ASeGm9nfGGInH35sRWEqP/?=
 =?us-ascii?Q?PMRpDGouXBqZI+7kJJtUNNHq/cqmDBIHSrxPOshTXv0tnImlIQrpqQAyW/JF?=
 =?us-ascii?Q?5+J5+KWZlKcC0jBYgZELVA0YNqg+f2m8JAxxQcPsbEYDlSfle9OWatyzP4OB?=
 =?us-ascii?Q?mY0BtPE43TV+TU885qm8wpxEx01Sfw978YvQ9E9nuC5K6ajGdH9jdwb2F6i5?=
 =?us-ascii?Q?H39T1v0jB2cJF31pxZ64KhIBVRkj9r4aFZUHkEfb/2xwfURd4tDnztLVrnHw?=
 =?us-ascii?Q?Uf8vq6dVgtj5giCcHjbjBlCVacZmmXl11FyTeUQiglvp56HzeMJR6I4CcB+M?=
 =?us-ascii?Q?IbNz8fRdhSynfzF6KG7+II4oOBfExSo0U3MAQkzy++EkgQOMLuEbfxfvPPWG?=
 =?us-ascii?Q?9ZIYnllO30d6ZjPT46jnFiueTy9WRa5pU+lbDP4Z20X40h7L2E2OOC0z4YEa?=
 =?us-ascii?Q?4y53Ys6wWyEcP090m//pNo2kYLTMQzTBXz7ZEVokow38UW6o+DgQB819beQr?=
 =?us-ascii?Q?wVH2AmOeib2C1UeE4puL7Q6rn6ou0RzksNONpRUEA/Ht07KLmav7s+odMn92?=
 =?us-ascii?Q?D4WwECxcj9cW1l8ITtKL53yyVOTrzR844ZkZAIkWN+qYdwYjODZ44McGeHsQ?=
 =?us-ascii?Q?DJCtgB4dXZ0816lu5bGIn9K1IoSJ+IhOz8gX4mcNQGQdDjLFEK2OnNjUtdaP?=
 =?us-ascii?Q?xEFgz38Md4t0P8MeHZ4R0m/X3JVle+IV/NMmp6EE1SqQGw65Ux/zwMffFwoJ?=
 =?us-ascii?Q?qLdf5iVkdY1PzjtgMA4eXLvE79dSS0+oeEHrACBp7ltQcEIW/nK9TjXW0BAI?=
 =?us-ascii?Q?EwAHz4railP7hChR4OGxYCOfzQTs1Sc+0nomE9crA95nKp0pBWXS1PfcV8aj?=
 =?us-ascii?Q?vvS0vZUbFoe6QPwgnNmWMh5U68RinaYW0y+3teJSjAzgu9r51rZkPNmeEa80?=
 =?us-ascii?Q?VTqu1eZuvKloSabJAZ9d7g7ngVvKfUPZC0UQRfSx35n9WshqpRIUqZ21X8DZ?=
 =?us-ascii?Q?RX1iakDqb1qsS29CiQFM91kadZykkEasbRg6RnrXIOFLV3Dx2zO5Kthl9Jm2?=
 =?us-ascii?Q?sqk+P5PP2BdzjbKPRdlKsSOKMSVyVf0zB22K2vUcpHecUJph+SzVnIitGiqP?=
 =?us-ascii?Q?evrjl2GKiFIPaAOL+lMEhbY07AkjQ6gkWGrVGva+Bi+0eHLTLDiKDnMcZ7q9?=
 =?us-ascii?Q?zEBEnRgJdig5ZffCgS0FEYQ5B9AMncA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a45dc69-e683-40ee-d012-08deb267e75c
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:54:06.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ4lXe+HK/VEerWbKKLLUa1O9GXdCNkJyE2v0aWhqGzyqGQD20RyLg5ClIXeDLZSIhmqDeYk/nVePluD3bRK6w4YBDv5586th200Z3xm7+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002

Add the new documentation of hardware spinlock for the StarFive JHB100 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../hwlock/starfive,jhb100-hwspinlock.yaml    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
new file mode 100644
index 000000000000..af09aeb072b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/starfive,jhb100-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Hardware Spinlock
+
+maintainers:
+  - Xingyu Wu <xingyu.wu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jhb100-hwspinlock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#hwlock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - "#hwlock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwlock@13012000 {
+        compatible = "starfive,jhb100-hwspinlock";
+        reg = <0x13012000 0x400>;
+        resets = <&sys0crg 0>;
+        #hwlock-cells = <1>;
+    };
-- 
2.34.1

