Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8179321CFEF;
	Fri, 24 Apr 2026 03:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777002815; cv=fail; b=te0F0yL0YzmnA25G2i9UgKUekZd314de5KhxJOrhJlQMFVmL//n8ZwuiqlSw5CCBECswy6nlGiYKqvkZpsmnoV0mG9jv2jVeAeYcDT8bcb7S3zOL6BxR7Ux9vTuOI9TFGLCUxRC3wzy4629Jaul4N2kGQVeXKRtBi74O+UxpGzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777002815; c=relaxed/simple;
	bh=aBSRmCNPBWQ2iGIufCy8/7TtmISQCQpoyf6jPRnJhrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dc8NukDWrKsRXgoNBXJXBnDKac8bIzTYJFCseZ2rXOnXRx/6ipfpaGYuLZOQ3G6bLTuCR5hTLpve/VugyTs/9cp2Gu6jPRjpy/y0ezATuWBKqC1Tbrsh3UXdGGMI5mz24fvD497nrPUocxzn1tblKorEsrjaCkz2JfBr613tkiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDfcCNY2iJzehLW1fknOryXFtjfqhWARK4eCRUaWiMCt0dsW+akIvvf0jvbwwePhAS9LQZWpipUSKkkbig1QNlVFpetl+GKGLFj/xkh1UA+b3Ye7Jr3zDJgT5xvNbPJIqAKh/TtddjUkid6w0q/2JbcDTqTbyqMQVoZHWXsm+I0ypClUisxwUlWt1o7QBM7feoFvXs+3/166TIoXfQf5auog3SeZfeAqp6noWeB57sMYyKkgqI62+bu+SPIWi7XQqna0FMYnORMfhTrehF1nvyD4/+WqjhSgA4e8XVctHk12rthLCwVJMsYhDL6bam5pRCWOudB6mUV78RWhsQsKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsVmp6o2aSuX0+CndiSOqIUGHbXJkDs+TQnKMWbKw5M=;
 b=W2o0nzLdzIblu8XRNq+eW+/AS/u0O22/srm7Ol5oU1jtudLRVvmp5uVVjac6UD2C7siEZlY8YjKb4RescIR7d7fxyrMhtBSdrurH0lRxv2yrs9Y6qMnsX7yrqMBqWlxwyON6X3Ic8IE1n91v62NXeOYdal28fwvw6YDGI0m5i6xN7jTaxTrixA50Qqv/TdCID7K7YKY/1qtI2gloGeJHNpBMFv0Kg1AN8KKWBafbIZZmo1LO2JHECY4ZyEjbuRD8+2lsWbdEOPzqg5zNLxRa73hVV7xegvxEM38BggjGCh5MSKBMSXrH+GMu3fm192pNncLkenD0FweINUgvG2TfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0970.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:20:36 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 03:20:36 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of HWspinlock for StarFive JHB100
Date: Fri, 24 Apr 2026 11:20:25 +0800
Message-Id: <20260424032026.62301-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0010.CHNPR01.prod.partner.outlook.cn
 (10.43.34.150) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eca41e5-3526-41de-7d31-08dea1b073bf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	5wTc5rI9BuEm1Wr6Wibee6L7umDekXy5Fw+fL3/qr+kowytExH1yw+TbnVRnotJIkrZkKAGNzvzTDYN2PdDCP6x17+mgEi7W4oIV11NhGWNN9BxXJ2WvGkYcwLUBOy7oK8zVnp92sBAqfNS2cWUjJWko61ovT/8YLlGJexNYZ+RfU8bLPy7P/LJTlP2KwAr6KpQMnWlIs1UZOsa/V29ES5sQr/rfUT/TQOB7IgvNXLGmjOqgDRNDV2VXCoRZ2VzLYZTYKmOCtmL7gO5HyxnjzXugkNEBgSQ6iwWeYOjgMd2BF4CTIzy3ezruNZl6dcLNoFEHQgRAegdjoXwBzHJr9oRJgSjxhY/DqV4kyygEycR1bO16A6oZCnmMlQIVFTpTaPOR8gcr5Fvghucgy+ELduHvsH5m4KguZVMc0i5u5DvYmIqr9eNXL9AiJHmq5C4Ymty3bD8WYpQr31m30rY08tWo+uZBcGycRUR1qQiQmoe946dzn/Fyzdu6vbVIcRCwNeUg290U48bc8DpYIjMG/KrQZaDUeAAijSfqs/VBp/nBgDPSdX91FgJwGVWaznkV2xKt5Bu6SG03u606uMAeRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GHvyIhV5Cqg8h16N0vvmMt1FPYqFNfnwlEXu62lAoXSxNE8aufWe+qQgIKGv?=
 =?us-ascii?Q?/iiJ5kwM5KADrwaM7XXD17CWi+NxYztJT+j0qttS9Jv9SRJEkkcL3wn0CnPi?=
 =?us-ascii?Q?RjJJx29X0sIPDUE2K1aYaUyrG/SFDNS6i5Opk/je4VaCJONIoYMcuUU28hQA?=
 =?us-ascii?Q?oAI05+/lilyZVY1NPDMG9KaDqhcwMVR/iuQR7sT51kPaMlqp4nD4lvhSwCoj?=
 =?us-ascii?Q?tz/nOTBrYk3snZ3fO4CKGuua3K7M3V6nxoWOYW1l07E0q1LOKC7p5qZ3P07V?=
 =?us-ascii?Q?Qnhr6fPoB7rkUA0pjsvHprVRpg3OaLu6rxxXq3BEiKHvmabAbPM+vSpzmGOx?=
 =?us-ascii?Q?Ja5Gaq1nLx0qsNAIeX7zXREbZWMw5sR++jSHQbGwzo2nQ2kka6Tg2hYcitlP?=
 =?us-ascii?Q?iGF99vEv1NWAK2rh0+UnFCSfRns3XDugGCcmaM9XSnGWQcbdArVrhKhsEd6C?=
 =?us-ascii?Q?ld+g7iwtLoGbmApgCG5vlU6+9QfO1Dgxy4DHiz3EeCmR7lOh0hEqeZRTurah?=
 =?us-ascii?Q?uGjazWtjnWUZ5YowulbdXG53ocueIjhoailckewIUE/0e6AXLTWN5CpyHJae?=
 =?us-ascii?Q?yJJABxJqQugd9AkuVkQjcVknTv5TCG+jQaWgQDp7hsPZ9/6qJKS9xiy9dMHB?=
 =?us-ascii?Q?2G6xPyAXLWik/K8JYngKCLRH0BE5groIbHlANkyAplu5LB5Vvxf+xPysORan?=
 =?us-ascii?Q?37M0mJvkDOqynIKVf+ZoZ9ytq0kkpTUA444fFB0tYER4H3vQiSQIlD4kbuZl?=
 =?us-ascii?Q?xyuPrjIpnz0mid68YACfyshIz90tChSscvZoSijL+xEmbqWFwwpTBHFGCYcI?=
 =?us-ascii?Q?cb+7Ff3E/anph+yVLVK0NP04kHkL3MpwbfnLgOcLGcaG5NO7YgWOGPmxiz2D?=
 =?us-ascii?Q?iclaGSohznsofNI+tu+GqJi/67CFEpXGB4H/BcXkmN80YH2bsc1cUrJSLLcR?=
 =?us-ascii?Q?drxOpY6EjyyKIGZ/AMcKmdRcEYD4BixR00YEQaJrD6TRPt0j0Y0PvO3fA3Ak?=
 =?us-ascii?Q?mDGnxQBjm08Sxd3XMKOOv3U6wWTI5hndG52OSgjSfWse4GnGqjh9huJlaADw?=
 =?us-ascii?Q?AxxjkQ5P8u6z+Ts09cVfY4W++wQ6BLoJmRLGjgfG1RYApNoulWy1OsFmqVsf?=
 =?us-ascii?Q?BJONQtdiMvC7iVdGZgzo+z5uAb93ipQpA/4TO2prO+n4U3QyupQY5GHrqF4W?=
 =?us-ascii?Q?87YwmzEUpdqxHHOrClnO2A58RSgEAcRt/tEWUwhi2tFOApnEYH+eg9v2HJns?=
 =?us-ascii?Q?JmzTucUHHCBtIzfqad5W8PmUfrEYVgpkEBlLuU937mRa7RThaznlfSsrCF1a?=
 =?us-ascii?Q?6UmQMnfr6xSFWjockwDlX+TD6zmu7HGXZbOIxhkhLimYv72zx9gUK58BtL6K?=
 =?us-ascii?Q?6xWzgf9z+Lqs0gNEHKrfEAJ5X1zza+1qzXHGDaVuf3eBdXaY2+FeNc6k+mOP?=
 =?us-ascii?Q?aX4GFPKyftfSvJQWAJR/+GhwI7NH62Gpwn5tlfomcZyu/f+f+bn5BL9sMUJb?=
 =?us-ascii?Q?jsJS8dVI4maF0UZ7+k3GbOUgGQ/8VhTCxMXjfG9Sj9RTiTLwyC3BAGct02B4?=
 =?us-ascii?Q?CquwOTcKECMtS2/woExwxFaFxhpoOCcK6/fN1bMifIHFs6JNrYgt3vlnot+a?=
 =?us-ascii?Q?U+LwinjpyAchR9xZOZG83RJYzxtgviiclSrDJxdBfyFpFWK9aJ07sSF/mWat?=
 =?us-ascii?Q?lGQoWknQg1kbmdrwdclotC5eIWZi5uW9cqrAmEtqcV/oijkaatEKL8UQPuwU?=
 =?us-ascii?Q?yXkdEoGVc7eH9T7Fy6yXQdTGMXnQ6A4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eca41e5-3526-41de-7d31-08dea1b073bf
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:20:36.2903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOOpbBH2IIfJhf0UgUPV90V9gQXDs4n3GRiNviPs4RbHo69Q9kT/+EOSLmJApHzWOddQ9Xq5XxpZL5bxeehCGg8AU+5TE9PH46Uubnam3qE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0970

Add the new documentation of hardware spinlock for the StarFive JHB100 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../hwlock/starfive,jhb100-hwspinlock.yaml    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
new file mode 100644
index 000000000000..b1b27fafe9bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/starfive,jhb100-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Hardware Spinlock
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
+    hwspinlock@13012000 {
+        compatible = "starfive,jhb100-hwspinlock";
+        reg = <0x13012000 0x400>;
+        resets = <&sys0crg 0>;
+        #hwlock-cells = <1>;
+    };
-- 
2.34.1

