Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9252F2918;
	Tue,  4 Nov 2025 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288494; cv=fail; b=oXkHu8IEpQVX5SJkKHMBIRpeFqlt0W0vb43r4ya00Zqivq+AYVrNwzpa1eNsME1ptJ/lfO2BCzxCfN2z91MgvKhtG5g7krwNpCntARpPLru7QSIKVR4C6nw2hnhieyKJ2zshS2zYHWKNY7Ysm1tVvfLVU0j3/+tA1ysye1YJAYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288494; c=relaxed/simple;
	bh=vGLhSV9HOD4MlWjPO5ELI7rFfhHl/ceGxaektFvV2mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ldf/hL42CsJHQbOvNzTFVNeSqlEbFQDQgfAkXOvcVIp/zOozKvI5PxEkuHr/ZWDEoNTFOyqIzfg+9ajEoFNgmx9C3RZlDLIyiIkqfLRv+QBmdNa5Tb18vU/qnVE4iYy+PFNzehlokplGBa4Gpg4sgiT9EqYRUbWVmraCgd1bRbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KWmn3O9p; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KWmn3O9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+SVSndWhb1Emr51akawWbbV7I3MTbG2k6FXuESfKc2W84hnpcXWu+yF417j1be+RPaPXUcvj1kSVm+4kSLYHWepL//p1XxQnCN9b4RpZuploez65tOEANAUeqaqOji9Pyc8bRy/s/SdaBY9IkdEQm5iozm2GgqovyL2JetiLmPZJvBlL0W+qkhXwgaMIWnTAERH4mWDal9BDz20d9/tEyIXPzoZVz0l93Y3ijB9sTN8bAOQ2SvpwibNsjE/q5rqCpjMB66KPslUIxyJqqj+ENIbYTOTDQ/MNoJqNJ0HhSdnK3Z/haOyS5XGpDhFQ3Mtx2n0r2seSwjpqTJ48eXbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=xXgBlcKsSyH71UH1N1/fewY8iKDZjGWychr2uc0/Ehaa0fC1vVQdUIPeoKPSFQzEZx2g3JzMqvu5VhO09T1H2BS9BX3OP57lbIzUMFcDh4UMNmeIRHWK50RiwvFA5ekniObAF/H9gktxzpNXAF9wyU0rUYCp9iReawvHesgzB8KSm33+LdAOlqMEF0BSE4kjcAUYEIkyYoANuZjrzTp+mKJAGu+F1eKeLEC4XE/qXMke7es2jShm2yNhUggShTXIBnlWL3ocjByJepdBGMGTBC6JFaJ+xpVY+geXNsw9LjH+/gSVhy+BKeaJDR+JplSRixjNuPB46VYEen+IzAo0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2HiVBIMWSRnhCNOweRn6OKMCU2LmeoFk1QA712toKQ=;
 b=KWmn3O9pUO/lwvKSARjONujUnYXDPIaZV01j9zxqZRgFscVX8l4/lPZ3Cy37IVZH02QTHqQ9FAXvyvMi2Unecz6qbr4i+5qq7gPQuBh1KRu8pHaw+gFgOJGbHE1xRSfnlNDLiMx+dmvWGI6ZKfl8d7r+qfDKLxEgO/MjS4A6T/eNqYWapXkkj0BHv6GdfGPef60eboG/uroMX9gRSvg5WQ+orDy5B+DtHcYFuAdRb/57sgFqoat5FP4vCojsYRwtHu3zWdZCLw8hXXb8VcjFZy0PXgQnPIQdZWFoWb0HtLYFkNSRtRILZGz26d9Kc4rA9REFBTqg9zqA84HnA8mmTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH v5 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Tue,  4 Nov 2025 14:33:15 -0600
Message-ID: <20251104203315.85706-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: d24f6811-21d8-4e69-594d-08de1be19a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fosNfvW9boUzwNPg7+imoAAkcacPXW4eS70k84gRXgz0T0HrmEkmBz6KsXp1?=
 =?us-ascii?Q?h/NQtcOUzA4uesHXlnCI1NZGFzJyH5RrF4TjO4z2fbTNg/5VI6f5WpbpW890?=
 =?us-ascii?Q?vmCSiV8Rk0zTvwsdrysvl5PLPGKZatbYsTraUTbbXl92AruWFild5Yca6KJt?=
 =?us-ascii?Q?ZQIlmuuvdwFIR7acXPiMebgykrHD/3lojdsJ4+LahhZyYzqa82cI0Fjo22rf?=
 =?us-ascii?Q?Mx+GSxIOvKl9lp40C7dqtAhiY3C0lXokKhpUZdEHYbTrSsiPW3WWJYoIUz86?=
 =?us-ascii?Q?iJTWr4vb1GkL0lv5wYVdx51CnyXrP3P9aK/sZ79q31XqeHp+x4giHk+8rdvN?=
 =?us-ascii?Q?JzgIZHNEcSeRdiR9J9TcYihQKhLcEPTHZp1yZNWPCOuGonnKKQEoStfT6Dr9?=
 =?us-ascii?Q?fpXJuFRbra9Mn0XKAzzO0maVYCqeVa66XJGikG3H2S7h9ZWd0BPfGApz/5Dg?=
 =?us-ascii?Q?NQom8zEndbFFsLzT2Utmky/UO3awTrKC9R5drKxp0antzYUBTJ7SzEwz/Pju?=
 =?us-ascii?Q?lVf+4e6mXKbaqG1MP/FQE4H6LS5MWrK35k9eqh+JsZ4PxcVbaRTLHwwAyniq?=
 =?us-ascii?Q?ltgnXL9x8+t6WKz+3GcnjjEDN+n7wkgW3OVuKU5ByHQMEsdYC91V4hX9GjPf?=
 =?us-ascii?Q?cBzAJoPMH9ets2ka1BNDX/oqX5xUpAbunhBAe2g8CVwA7T4UUPwAGcYzD84M?=
 =?us-ascii?Q?+oKe8qbNzXadxPHiQiItJDM5cASkkOil9NK2IM06B8IcQiDkLNs4E2x2P7LO?=
 =?us-ascii?Q?oFAaUWINLUZw+g9MXLQemw8I4ddGZoFUZmrejw43Z6nGmjseNa7ZjlaCrarr?=
 =?us-ascii?Q?wWrobGttUDcLEN4EaYs6UIZqElNdb9sjulO+EtNH6HdKx/oKcUpZ575Wnk6N?=
 =?us-ascii?Q?aSvgeBdgB9e5u0CrGoGZqRMixT0UprKs6HwzMaq8l3uGaHQrCtnXSySY2SlE?=
 =?us-ascii?Q?6a8tsdlQljnF4PkE0Dv5zAmToRPgVvNx1JfzJCTZmso124yz+h/SJQqoAv4z?=
 =?us-ascii?Q?i3FRaw6DIPRHIENYqz0uIZjY3hHitapnxXOo06yf8xk3QwSbKCnpSGNVNmMQ?=
 =?us-ascii?Q?N7dXWzqyxNDChTLyEVFPv0ai6U+PwTpI8cORtpwOM5OG6ZArjeHm1pAnOUla?=
 =?us-ascii?Q?/Sit22hWNs8T5V7+a2KF1qxlwJp1FYt35AOCNt7xcjugvl++RL5aQsp7ryu8?=
 =?us-ascii?Q?W/YCY2SUofoilPewZ9tRdWIIB//5aBH33s8R8UD8cvtmw2iyrlNVrYZ+9+0I?=
 =?us-ascii?Q?lUsqlNdduJKgtFKGWMKlNPDpLi05VY3G9AoztDxtX8Y1/vB7BKdivHNNaVtg?=
 =?us-ascii?Q?bO9LTWuVe0NKAfvhyNR4EkWZ3DXoLcu8/9sfZZ817s6t0hV01KpI7pyEga1E?=
 =?us-ascii?Q?PSE3Xr5QgtoJW1Zd4NfiWl8oAVIERpptjjlENHksCx8fvWQe/W2pb5tZlBNu?=
 =?us-ascii?Q?qv2qEl5ktS5CvBziwDNffVWDbcwSohXzDcrXnZVJFqWUwYkYecimjsgOoMds?=
 =?us-ascii?Q?iSg3nbZqLqtcM/3EaZYn+Cpv4OQaTlBnQtnzN+qw1LhvizSsWyO+DrjI1A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b5JNXRh2H4UWZANOPjR/qiw5Q5/mZu4/t2usRh9GLmJFqBXnOcxdBIMU4/fQ?=
 =?us-ascii?Q?g9MeDy5aAbYjy7wxzPeqkelHHmvFcjvoVSvKMC0cnGvzTyGP4MVTmLAeXEYT?=
 =?us-ascii?Q?yGNvLevCGhopuvhkluQepsUM/GekLsAYz/AFCHnUUeQj3nyiiRe4GDlC74n5?=
 =?us-ascii?Q?7UmzA/JzdM7v37NH8+EwZJNYsM9D5kG5Sf1NGq0QV4hmRNPuqNZRv2iQCTrS?=
 =?us-ascii?Q?oABryHD2FVDPZpP9JULmGaxOPAxA3woOaEWHSOHA0rIqcEdHq+i+Uam7dCpQ?=
 =?us-ascii?Q?gtGj3uaOYfPR6VK0oPh9H2w0RORkDGoBGrabfgdzvr5DCbsE0e31Y/8myGmK?=
 =?us-ascii?Q?VcU2LKSuBhIfIzt42ixm4eRWt1j1Q+IbntSQe9VYNibZ2D3V/HPIqpqjo8GR?=
 =?us-ascii?Q?+Rz7+NRSNl/3/U/GXBTI3PEfCYbF2hOrkUIM4y+odYdpWzHTK+33Qc9INtqy?=
 =?us-ascii?Q?9TTgHksTOqbqrVX07QH9jcWRR2Sbz0LZVs5acmKKKquviZnagojoj8VfDIj0?=
 =?us-ascii?Q?38KsMN/TR/rvUzHxBk9NnnhsfpHnIS19ojg9AFzpo5i9EulbymAruhVGF5/q?=
 =?us-ascii?Q?jVLqxwmA6gLMb4uhz75B0YB72fzjDqU5kLoXu0dC1MkCiUl52tkfazBpv3IZ?=
 =?us-ascii?Q?YGcAdTGbDzQSqvKxJcLSCmqUdELJgHLfNPpb81khIT2pgnamPtp/aPPtY5AW?=
 =?us-ascii?Q?+qSlRCDwUWPOGwRAEq9RYK9MKvjA7tMctFhJvUSrv2Hc9LTqA8ae8yTFmSOs?=
 =?us-ascii?Q?yEhD97hH7xTfNzV+CL1GXtEiS2ut99cygiQCKaKYJALlQFrVi8b4zd+xXyEh?=
 =?us-ascii?Q?yYs9y8P4SIgiS73KOSYcgTTt5VzO7WX3j7leBqkj5deT7xO/NAE4Z/GmKZFb?=
 =?us-ascii?Q?utqVyEyV+wxdy4dcX+UkXkXSVjI6tLP/yYBcnKJ1PNhTEmF0lIzygLFYIT8x?=
 =?us-ascii?Q?T6lfpPMjbfPsludlxvi/OzcMGeD2X+IZirfI00jIgQNKT+iJ8EGAWI2QmR/p?=
 =?us-ascii?Q?CqCqF/lMagZtGx+cHdsuKphDBfknMqzZLGZzjxEIj7QSfQXHqwFacOTLTQBr?=
 =?us-ascii?Q?fNMPmbhmSyfzg130FJbVC7oKyzVkAXiWXhX0JV6wpTySdFrl74GrX3dADdp/?=
 =?us-ascii?Q?CcLzHdYV9OadsKy876q1E6xV30sGkTuq6rIUb0Va1H20d8D+ROWYXc8rBLcy?=
 =?us-ascii?Q?v8FUMv96GREUIh78T/4v0gNw6Nf/ogoHxmtUlvhlAfc9U9YvNxIDJrtbgccB?=
 =?us-ascii?Q?khkMBeELb9l2nwxrCbG7Pe81KYr1DwxSDGCM5U4ws4D4PsCU4OBxsWTdk2/e?=
 =?us-ascii?Q?kb5CPLRcPCSmx+gakDi0UmMEyeHQ35lcMnDTQzscKDEZhskevw3dzr/lbRz1?=
 =?us-ascii?Q?QsFnlssglv2gzbjRXu76izu4iNcVbsLxF+jvfiY9cDl3ZPa2i3WDMPYlfTfG?=
 =?us-ascii?Q?JbTs4XBLnW1MvxTo+UUVzlEAERpKQION8oakuRMdaT/8eAgS0d8P3PEudvTJ?=
 =?us-ascii?Q?1iTQaj29XfO3AMdxRPJsT3maiRVdnc9I1W2fW5qi1dIaP7NByPB/NsjEPwVr?=
 =?us-ascii?Q?gYTjeudrQOPHfrXkXkaEuW51Npv88GiUhZ0u3rF7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24f6811-21d8-4e69-594d-08de1be19a25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:50.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWrZl+0c0QgZd0NNiLH3sRv01xAfa0aqkayLsj2oBdhwKJJz3ncGv/Q+C0oLI8xfnnsxrNZcHaXXLhT3IlLF4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..6ab1c12a3bc1 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,33 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpioa>;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "fsl,imx-rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+					interrupt-parent = <&rpmsg_gpiob>;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0

