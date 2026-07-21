Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6C63BA22C;
	Tue, 21 Jul 2026 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666904; cv=fail; b=Xv7GhTwmuCYrUW9Q2i4gVqNdxIAGpoQBXFI68rpU1NKTxcWiMaaQkdPtf1Gr6CKUz6EoH0v0pdpOvdRFC8DfhzcTjvonRFh33jCMBsDRAyIb67yLhUsykYLoaYgkp4+QTEhr6P3Zy7H4kRMbo/PzP3Ns8wcknLTaJ0nlTW/Mn6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666904; c=relaxed/simple;
	bh=5T4X3XjUQNfO6llP2yIL8XtX63dLX+4AAKV+bmJVAc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nh4gr5bBpOKBbTkZiy4BP2b6JGaFKKG9XQPxXsgZjKDy96MHRUmthyBYE1Dn5zlvmqwZCFVsDNVrRBGnMRh3wxcJ+WM0KCvPI8LopswuXsSTdFnLu9tzMzfTxZmTcNb71KG/kURk+m3kBaExf0V1Ezx8JNoldhjyjjsqOrz9U+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IpWLF7XJ; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IpWLF7XJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr6kHJw9z3k+jYw5lCH37r4X2QpbrtA6vGZVp5ohsmbJc8ESxdL8f37gVMyzYc6yU8pbwbpL+ufuCsVBUtIYBYfnV6PYgPyD1KErwVFStddPdVK4oRios6mtHq+8CQAl1aesAgWKkukSBh4SQB2AOt1rWdJxEc8/64B0L5RlYT31LwaIMDT6DrwbAUpvekMbhDAO2fh3zUd2T5fQrRXg7LM3EmFiLTf76ajavRv1ZDnxQkz6l1/Wja5UH/iIxvkiTpRWOY7c1Ba8O4eTpw13uDux5Dpg7UXYQy053BAZLXQ6qrVgxBBGBoEuDEcfjNbg0NTh51eSDbkObtTKmrML1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p8capPolRuCNktzj/mo4Pt1tL7iG/2JVUU8TctD/zA=;
 b=vFaOc/hmG9JG4f62PWRmEyEDjOi+2JuOfuBkGADjX8e+wrAsy0nHRY/7vACB/6t9YFiujjgSRQKII3sSvgG73II7jQ1ngNsXl2MghwFN9jJFIoNl91Z6Zy+OX/M9uEa72mt0OwFSPBnWPGQgsPKhT+XBYLUKqK+XlsQS82NRZ0Vztwvx6t/zvtRKryEM77uuEP/osEnwTZHly15Iu7xQ/sWtpRZxMDsjbsEMgGpNVHCAbyIwqR1uUjl86KfdHwzjGWazAbHfSC0EqJX1UN0zEbqXunJks4/s95VcXwbPUt+rIQyHAtG/Ov3cUloy8n/eaDtb7ot/ArwmWv0TDOPT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p8capPolRuCNktzj/mo4Pt1tL7iG/2JVUU8TctD/zA=;
 b=IpWLF7XJxTlpAoXecu+LYD6f0K/AkYA8KbJ/IkNevuu/5DrLNHM/NPxa5NP0L8TUVpxXIWsu3BgRIyUJ6XXUw6UpnBdtg1mZh8faJ0X2U2nAelNvz3dXcZ/8EL+NcS+7AFboiAjTwgXWH3oeDyDeHLkqFl96gl2VZBYukbSoXZOYfPkwMHk/WbNeh85puSMB3vWDcRVZUDLWkBjZY4Vrys7lK1p5XLB6ywD1q22h3/Pk8DZH4i1QbkClF307/XoUUb2zfP+MO3+B8g0lmtL3iSo00OWx8tAjPTqPXMQht5gUV/ex7bnZKp1AcC6yZDXmHjGCKD6SXA+zlJKuApG2vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:12 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:12 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v15 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
Date: Tue, 21 Jul 2026 15:46:44 -0500
Message-ID: <20260721204704.400781-2-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::32) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: f6156874-46e7-4726-2ae1-08dee7696172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|11063799006|3023799007|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	uahVwQZvc/U+n5BLeVmCujoYbbLBBEYLP/yhYX2EMxZI54Vs+N+UZatsC1IsB30BoaTEzH2zvtViV8P9pzYkYDmHg8ZK5qT4VXJnNiy3b+PmFT5ZdQnQGXQ88ZtdJpZUf68vRxrr+4syOob3FcCQNBZYBucnNlZbMxQr4u3R2uyQcsTeu+YDeKmCl68O5uJU7GEKlX+lqqu6r6qybIYUKS7v09Tmp87ZR6RTDI4XTWFp0IiIiYsj6OSSE8BQ1GS1ny/NwshJEBFNUA2wSMO/Eoewbcpp2rdvXeG+L1g+DKA3AB1XSzHKWoAxbRPCmwNg55ZWUUJn5FL0yzpsQIXzfu9tD29Tj1mlUCNtTNwwsB87s2GZXGAOrwNrtEwlnTfCNMxIGz6p+RlO7jpQmtc1jUbcEMczp9f+j5x0Ejcc7LXEAgkf3Q1zgE1NYTyHYph4XCAbYsR/ppj/Ymethq5L4MjNZyUXOcliFbdF/9im+kMw/UDMkgyYNCFoh3F3kpbq8QgnM0f5UfKanibwJl69vBeE58zCEBb4QzytCeSU+JuubLWHG3GqEHE05iTD2JnoR4lgU2An0ox3ufwzKM/h+2GKt72FXyBNApMe6diYoqgmUbKRdAJz4G5K8M3rrM0Tdqynhw8EmfwlC3197pcm7N8N/tZUVRgr6dEgugJI6tkZJQKQFz4DiVATwAg/5v86hGp1BQpOhMXLdt7Hu2TJ2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(11063799006)(3023799007)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KwGB9/wrfqkUw/dge3wcWW+bUpNkcSyKuEDR6eaUiUIyHdfkYNmHtEwDDv8B?=
 =?us-ascii?Q?cCHOd2qidkgoc4/ObP0YfuLrmkUwJqIwDTXsQS6lUEcU/LZbaqNOJJ8NAEmt?=
 =?us-ascii?Q?kGRzI8I8Jxkhm5a7eETywx1/kV/7nx+U36YA8CFbradtVd/0jek2J6iokHLo?=
 =?us-ascii?Q?glnBSHa1lf99FfsNPnlomb1Dq1uiqqt34zqJ8RnEjETHH3l5DTGdJii6swDz?=
 =?us-ascii?Q?nYqXl7TGkHc77yAL/M1dB+8TdjpQ1zOGqkoBhvnBn0RavNMC67kjQNkatHzX?=
 =?us-ascii?Q?HemwN8n3HhMyiaMUhNzzsVO2w/J98ql6ovUHXJH5Znh8okaFhqP4uD+bal+R?=
 =?us-ascii?Q?1M2kK0iZbSNV/JIg/E/SMtl2fREDqzE6RuGZAl/orp5oa4gnW4UxvFY1fB4H?=
 =?us-ascii?Q?Ty2VBuIHvf2VoFf4ir49GFKiqKCg74mUXXmPMWMEaOKPgj0fPmIibxFz+xvd?=
 =?us-ascii?Q?nh1ylfYFdPbcjZIPuPtktN5LG6mycufXZDZA0QPbi2GOau8xNktHcnfQRkow?=
 =?us-ascii?Q?LhU/4i5uEvEgeZkzet/skfPcj02HuWULO3gRuR8Yz+yZn3WglI80pNvP9ch7?=
 =?us-ascii?Q?FyufWbhwfsKddObOBzlu1oEDKzPWG+fzMDYspW/WKTimyifCUYX642X7VV7k?=
 =?us-ascii?Q?7f6DVXGNxqlhuAwxoj2G3InUr9RWZi0W5PWbosongh2FzU0a4U+UnIPV15rE?=
 =?us-ascii?Q?S1vNOOhq6xcZF+3R1mEhnEpBnwDnPY9lTqOR1Aeo3FfCsC0YQZljAq3RVO5x?=
 =?us-ascii?Q?lh5BZ9iUsHO3afctFQAWbR6CcTGRKegoF0g/l4n1pLffBDTJ2oxunj+cJ+kW?=
 =?us-ascii?Q?tYYahNO8rkEqoOVD7TkUL3Ha3WK7jC1qzI8TSnI6pcFKipswhIhUVMa9xNAd?=
 =?us-ascii?Q?hPBr5pM7JicNHAvNWhSrgmRgdo8tdMMcDLfdQeUH1CeS/NGbPutfRNFkjEe1?=
 =?us-ascii?Q?og5vQIeI4zpYJqPLk7GEzv9w+EHSu3P8HINpJv3HBvwCJcerbScXU4Ze/c60?=
 =?us-ascii?Q?NJ3fiIET8e/ldMBDIzoxNh9LyZi2OMAfp+uSyot/6hkrjaRU67ueVoPoS8Sk?=
 =?us-ascii?Q?uzVbKCtLpIBJNBxe664GITvuy/25oBG7JLdZ8Z9hJYqd1uXrFe3z/rXs6iVT?=
 =?us-ascii?Q?Xa4kQfaLrgFNozmdkvbnCJ52tiw4zIlnfhCe7xy+JEhikNhKmBY8OUMHLRVC?=
 =?us-ascii?Q?LpTHmjcqcrgKwbIcDkMbZLQRhHyjvaBNcn/2XJMCg/nARu4d23ZxFLre4f1a?=
 =?us-ascii?Q?cU7GYx/r7Mw2yA7D6rVnm0kv51/Qb9hsyukBwXpvaVEpw+Ykl4Qx7aA/nUQC?=
 =?us-ascii?Q?GFIyF+lcgJ0/6ZpG08WSeDgPvKeB/se9PcvGf2fvB72QYYPea15APDgFi5rR?=
 =?us-ascii?Q?FRl/64nfGtT1FNFev08nzqRtfTfyF7zQElmZjFJaWhcn4xl5bf7RPZ2zBdlk?=
 =?us-ascii?Q?BFER93YCDI7jHVu1YM7qy6RU5PKQ1RtB0t7OdrjD6bStlMiypjdmES49xP38?=
 =?us-ascii?Q?1DkXu/bJvCAoQo2tk5kMyVR72en57Mm9gGGSLSK/B/dr60710Kn/nqqCUf7u?=
 =?us-ascii?Q?iJ2g3oHH8QEuBkSlAi8Yr04QAc3j+V8d0rlqsXxRyfOL3rKYDF0hJyhi6oJD?=
 =?us-ascii?Q?iWmdVzKnyQoRBNh+hDosyAlxJ7DQRM/Jqrl6ya7G0vwDM2j6K/7m6mTZMNr8?=
 =?us-ascii?Q?rDUVcakaGfKjrvY27N6xPi2PzpNFZ5bflsjlnV3VIYUUEgKkBtjDHTctXV79?=
 =?us-ascii?Q?3dOUJNmEIOcMvMJX54+knMp97sZAhwBe6TyqEBg3mJB+5IlSM5fS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6156874-46e7-4726-2ae1-08dee7696172
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:12.6749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBKHt5+bKQG0PXSEuLsTvU9HjDGfWONIP1pU3XOqr4fL0R6Gp8sOlojM0aeOvHlSdTTK7TTCWU4HK4Biqqp6Nl3NkTUBF4U1VawBjFDVEkUfos+luD+hikAh7yNMlZuM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

From: Shenwei Wang <shenwei.wang@nxp.com>

Describes the gpio rpmsg transport protocol over the rpmsg bus between
the remote system and Linux.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 Documentation/driver-api/gpio/gpio-rpmsg.rst | 242 +++++++++++++++++++
 Documentation/driver-api/gpio/index.rst      |   1 +
 2 files changed, 243 insertions(+)
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst

diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
new file mode 100644
index 000000000000..9af75cc759ba
--- /dev/null
+++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
@@ -0,0 +1,242 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+GPIO RPMSG (Remote Processor Messaging) Protocol
+================================================
+
+The GPIO RPMSG transport protocol is used for communication and interaction
+with GPIO controllers on remote processors via the RPMSG bus.
+
+Message Format
+--------------
+
+The out message to the remote consists of a 8-byte packet with the
+following layout:
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |     cmd     |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **cmd**: Little endian. Command type.
+
+- **line**: Little endian. The GPIO line (pin) index.
+
+- **value**: Little endian. See details in the command description below.
+
+
+The in message from the remote has the following layout:
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   | type |     payload     |
+   +------+--------+--------+
+
+- **type**: Message types.
+  - 0: Command reply messages.
+  - 1: Interrupt messages.
+
+- **payload**: See details below.
+
+GPIO Commands
+-------------
+
+Commands are specified in the **Cmd** field.
+
+The SEND message is always sent from Linux to the remote firmware. Each
+SEND corresponds to a single REPLY message. The GPIO driver should
+serialize messages and determine whether a REPLY message is required. If a
+REPLY message is expected but not received within the specified timeout
+period (currently 1 second in the Linux driver), the driver should return
+-ETIMEDOUT.
+
+GET_DIRECTION (Cmd=2)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      2      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+
+SET_DIRECTION (Cmd=3)
+~~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      3      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Direction.
+
+  - 0: None
+  - 1: Output
+  - 2: Input
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+GET_VALUE (Cmd=4)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      4      |    line     |             0             |
+   +------+------+------+------+------+------+------+------+
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status | value  |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+- **value**: Level.
+
+  - 0: Low
+  - 1: High
+
+
+SET_VALUE (Cmd=5)
+~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      5      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: Output level.
+
+  - 0: Low
+  - 1: High
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+SET_IRQ_TYPE (Cmd=6)
+~~~~~~~~~~~~~~~~~~~~
+
+**Request:**
+
+.. code-block:: none
+
+   +------+------+------+------+------+------+------+------+
+   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
+   |      6      |    line     |           value           |
+   +------+------+------+------+------+------+------+------+
+
+- **value**: IRQ types.
+
+  - 0: Interrupt disabled
+  - 1: Rising edge trigger
+  - 2: Falling edge trigger
+  - 3: Both edge trigger
+  - 4: High level trigger
+  - 8: Low level trigger
+
+**Reply:**
+
+.. code-block:: none
+
+   +------+--------+--------+
+   | 0x00 |  0x01  |  0x02  |
+   |   0  | status |    0   |
+   +------+--------+--------+
+
+- **status**:
+
+  - 0: Ok
+  - 1: Error
+
+
+Interrupt Messages
+------------------
+
+Interrupt messages are sent by the remote core and they have
+**Type=1 (GPIO_RPMSG_NOTIFY)**:
+
+When a GPIO line asserts an interrupt on the remote processor, the firmware
+should immediately mask the corresponding interrupt source and send a
+notification message to the Linux. Upon completion of the interrupt
+handling on the Linux side, the driver should issue a
+command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
+
+.. code-block:: none
+
+   +------+------+--------+
+   | 0x00 | 0x01 |  0x02  |
+   |   1  |     line      |
+   +------+------+--------+
+
+- **line**: Little endian. The GPIO line (pin) index.
+
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index bee58f709b9a..e5eb1f82f01f 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -16,6 +16,7 @@ Contents:
    drivers-on-gpio
    bt8xxgpio
    pca953x
+   gpio-rpmsg
 
 Core
 ====
-- 
2.43.0

