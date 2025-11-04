Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C566E2ED165;
	Tue,  4 Nov 2025 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288473; cv=fail; b=ody5vrceHbXVu68fmN1SSl9Oq4PoTKz/BM57rVDr3NwiGE2krRwRJ9W/cjlcrbj40roXxTOzkAQvvZ4dkAfEIYjjt+in6njszu3HgWWaVSpNHrNuatn1F1O5G9rmm8BJ8Fk4UxrDjWlZuWS7s/PtxGYqummnwik5jpCeLg3D4H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288473; c=relaxed/simple;
	bh=dJvN3PVdWTU0uEkXZDJ6LK2XGCjZQ/LHcxCeyghw8qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IvOdMB6PxclCc64Y9OXMfkoAI/VMjshxWUz4PtOyMBqO+FzZFanNdfJSFEKVMPPTStq16PahdrCa3kQxymGGn+hogcsP+cpvb7EfPN3VKxeaxSinF13eCQ4NIoMIiE6bfdZRfEKLsHReoSiJ6tNTKPAs+xPIkXbsNkDFEFgiPxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e1K7RNir; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e1K7RNir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ft7iWKzoa5mdVv+ir9qa6jSS7c0CkT44znXbXABMLWxPnANfc/xsuEe1dSdceDDVoKxjvvbc1JvNOwQIxCyrA5f0OrNXOB/iDxgBFCpv2Irsufo/Yk2JayMAv8NvmacU8DXf+/KLGrBob4CvTqrrv0P0g13lTm1h0Ky3VSM94LHHSwuK8+9Mp5KIdMc9gIt7HGHA2EfbqpP2By+7ElDaJ3wE5NgriyTa2m/cruR+NpkRX7tU7sU6eukPyBuJT8K6n/xLM+AO3JdD9Kco0LereImXN77/vkGezIgHnJnFBoKBSMwKZTmj8f18KzA/8QnmOYL6tglQ5Lh3sRJpCP8dMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=xRXzY4QfzCbx1oypsntolUfrHLwjSGC25LAcGoeIG6P2J/kF3oor3JZAMqmOKT7cQ7X8AifSaKbsZmx7Bp+PJIATIk53pbZXA0M9sE6a02zQXRz/RqSxaL4jXfgO7QCle4vj6xJ0ohc1hHZdDeVsh3Hvhs3MpUa01AbxuyTM01RJZ2tyB55+/SsQzLvnAD4heKROiqLo5LUzJyvQB2jZ3es0Ksa/N4+mEiFi08Gcl8vEjPZxrcDRUP1LUvS8VEP4SYwpqxni0Rt8icoO3+5LFPscruA6fNx3ZPlDDoHG5875py8W2D8TXKOygUC3Lasz8k62xl+ZL61D31EuHYn0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9Zqh2PoVASX1qQmYJ5tb0TRXoIF1kP9kIekkcjS+ZA=;
 b=e1K7RNirNJ9pDrMErIw2Re2isbMDmczEpLJGAQakTPnHnH8mDKit+aQ7Ui6doqVFzW6izx915mCI5NHne+uwbQXvTTaFlOFL+F8xUn7hiIg4fPzf9D3d5EvPSPHumX5iVDHt8pMv801M8yycQqv66XJwnzU2kEKHXGjMJLvu8Hgs50Le9EgXRzuX7BdnYvu38h4ZeFPFIFdRox6Uep57P6zHPhbdDrdWky+9BYHMU+GsqhSHBc6NgPomrC1+uLLChjcCleZpjRR+dFv3WcFdiaZMyv6fLeeVG6+NFWpu1UpcfjmKHl+hIDnG7Ng7P6DG38wS0vRyoC/kjaDgtMJk4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:28 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:28 +0000
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
Subject: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
Date: Tue,  4 Nov 2025 14:33:11 -0600
Message-ID: <20251104203315.85706-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd76d18-a7f3-4b6e-a573-08de1be18d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|19092799006|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fmlTZVodTDphWvQoTSaysUoZsqPDRNOP7O/UqlkXOa33gfDrIt0w4QTLVoH?=
 =?us-ascii?Q?Y7Xski1EH1c48+8nq0NPl0GbF5ir3ynJijbt2D5Sg19PjXj5gHv+Cad+nKdC?=
 =?us-ascii?Q?lGv0MOLWzBiP1JPJ5glC8pxunNc2Z1gdsF5QjHLIUtIwQRiNwwcMDSbdF0NX?=
 =?us-ascii?Q?e4x0vTRsA9hie/EcVu5xQR4IhGLyaqO8QY5pr0GGygA3RQg6iM0DXhiM1M93?=
 =?us-ascii?Q?opAeKs0d4XkxDw1StOk//PoprV7WjwsZmhDicMyXHumNE2P7UbV+9LA5wwSs?=
 =?us-ascii?Q?R1c6JGa+wnIAGixuTgnXLQ1x/fqP7e6KAuNCevoJL1nyS2mUWS50jXPrvf+r?=
 =?us-ascii?Q?HKfOTuiP9KP9Z3b+2ioVxnOm183Cp2HeetjmA3pKPNC+DijbJAxK4iakZjy6?=
 =?us-ascii?Q?D0TM4aZheJN/RDxvaxMfFrgZ7SQj1wGavOi/oXwKaCnwIXqYBkvekm37yCtu?=
 =?us-ascii?Q?emNxbHVDHVa86ItjYMwEngcvl/3U+HK25QX+SxZPElLlgkLTb2YggkBYmGrQ?=
 =?us-ascii?Q?mUujr6eGlQjC96N/OY3Mp1KlOxA+s43hJQ7/kXEwTNBJmtqFG/yzHXSVY7rk?=
 =?us-ascii?Q?UPMvidhXftDlDe7FRB3eogTskpOhSAJObJMINkIphG8KwTDUQ2h5tnSbQ1XY?=
 =?us-ascii?Q?ooa69kOXkNzjXIrRRvJbgNPQV11joaPYDdF+CC6Ls0bj3gjJz3fP5ZV6fF6H?=
 =?us-ascii?Q?dXJlffIX4QgBWVVPQkH6uNLUkGJlZp/UxiJUdkkABJwP21Hy10iBRJSIsTES?=
 =?us-ascii?Q?DRbm8/d0x2EoHV7a9YA1srHKKf6wJFkZCQobb/rtX+qu6YeKM2bRWPifibEj?=
 =?us-ascii?Q?IzmOxoJ7mzmPWC7J75MklZ9K6yi25vjxGbKhimmWI5QqvNlneJcC1TVi1ZUn?=
 =?us-ascii?Q?o4bFmr9w+FAP5B1vr1zCnEcKDyloByTpR9GP6IJ+9s3dJjJf1Nv/F4MzWv7B?=
 =?us-ascii?Q?w17S+JH+h7QMS3SYXPA9S1fJYMkveBCMZYXNu8Ldtq7zQgZQat+XpdZj1Xmm?=
 =?us-ascii?Q?Fxumcj1Uiioc23j7sWWNc5JXNKheJXuI+hyX/cy4YX4LarZGxbqiIYmjWjFu?=
 =?us-ascii?Q?97sw9olZjyvmU6wWlcm4aZr2Co5ug/rTtcI9V4xuI0S4XG1xdu75j9foLYHR?=
 =?us-ascii?Q?G2Fnmr/k44TWoRckJndztoAtpbeV5gh7RQ0q9YA2qkVfTyK66dWvtOmRqqbc?=
 =?us-ascii?Q?cA5JQTUow5jHmSfG+Khrs6NiLPUbVxhflilUHpwOKHc6ld460CgqzLTydMOS?=
 =?us-ascii?Q?lw0ZXxud4EoyPc/i9rmkDJLcKC8kyZd5bXUG31xjN9YoFfmoHWsZ+3giwYOW?=
 =?us-ascii?Q?H6cEzffk/gFni2a5GKnMCkoYX4Z4rhGbIBDHm92CG7XoMAPPN2vll4WZjFFJ?=
 =?us-ascii?Q?JT/fDy44geOEPzUW7w8++Wz9lltFPpeHXALtFje0MudMRjIpjZEOg9Zg3iM1?=
 =?us-ascii?Q?H8E+lw0S4KjUcyf+2lPh63CB4OdtmIyagf+qcjOZRIV6ILjkwG71Qjlrulro?=
 =?us-ascii?Q?1HACk5Xt82zs+IXptAyZgYl1ZnYBaxtnbkG6Tf1N8VmcMlu5V7IzIXfaSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PL2geAOv//FCjHG4X2baf8GV540XJE6Wp9aBbd20HlFuO9kM2ePIoOwLf4ub?=
 =?us-ascii?Q?OjZ9KUCTxnB/yqJKSffOlDp9Do0phuB3u6y1w7IhU12sicdabDQjXhqa3M4X?=
 =?us-ascii?Q?bjQhlFp10H4vzlxxRZWkiHwa95KJo3ygGSukJABgcpyi3cdS3U/hHt45Ys92?=
 =?us-ascii?Q?t9lnSDQY/lTPlv8lQNky0u6kav4nQbGsmrZGD0oA8z73uYHJ1lZqhG1VHn5k?=
 =?us-ascii?Q?hTkqt1QmH3LhyS4V5s0Qn6JiKg6nJwW6aMiY8PwSkntDOPY6Yybsxlc2Tq/0?=
 =?us-ascii?Q?U04Dtp6cSFqZULAkGF1AAiKHX99Diu/e3lyzN2Fi8de4WVt3bIowzaNFYkic?=
 =?us-ascii?Q?VmKboQizKXfOmPj15owgmS7KX/PXoFBR0CVQHZSm/e7RBt8IuUXlYhz7xZb0?=
 =?us-ascii?Q?q/tihpAkE+fcyRsDSXBT65553Da8uMOXQdM/t6Yg3fRY4qoL5Ba77x1ktIHU?=
 =?us-ascii?Q?K8UEA9DCgAs0iz0/AVi6dsMmcPvrrJ5vqhcFowzkqWJaNkS43eMqbw+UIRvc?=
 =?us-ascii?Q?nKVW+kbVuKjppIWyi+M9YNQCMOgSPkxnQrCxmrzxfDQhU489puRw5ER+F4nI?=
 =?us-ascii?Q?p+7Xui2WLzAG3TmCwsw1A6wtm+wq5sYI+wzaXQX2b+YqFeVqnTH0/755Cl1j?=
 =?us-ascii?Q?o6HmY6NdidAQdlpFNtGOPMjGc/Eiom6uqjR0Yowwv3ocW7JHDZsQIydmEAnT?=
 =?us-ascii?Q?bUTyNf0rOw6H3OcwFNjqmguu8DWhoGIM8eHSCMWhcjgb3PYOs0IFvpB9hAeL?=
 =?us-ascii?Q?3RmahrrnvszcJa8j5CmQj06a4jnHBNeaq/zuFSXDSn19Qdmpl0CnjxST4gYO?=
 =?us-ascii?Q?0HAtXsGfXVu8wtknGJd1Fv+FdNxcgEF3kpRp+Cj6II08spMfAwbkqkRVEIsS?=
 =?us-ascii?Q?V6vJ4Jg9vydh2Aw7k+sjBxbwVgx1aOHyq7PoYGkaf38F2dcONVBOyQZdktJ9?=
 =?us-ascii?Q?dGVy5oFN76Aiiw29H+VYKqt6Gni69v2rTpuiWpuXF4LSDL9vWLRUn7GcYlco?=
 =?us-ascii?Q?AVpa9GFtX4mIwhfK3N+h78yC4zd1bsiyGT0p0x7SDkS3PvMxoHzpsy61hxnd?=
 =?us-ascii?Q?aco2TuYh7k8ACcunJM+kmdjV2WUBwAN0lwhRpx51uJ2nzYczes88bxYipOZW?=
 =?us-ascii?Q?BHFMGdUA3dkGYC8sK2dYd0C7OdY4hq8dOWd5nrLlAE6BJPeNyP7rcQyNR1fB?=
 =?us-ascii?Q?HOM6s0ac8w1hUr1RIuXKeJvA3uapUOLCDgfnGCauG+fDA+f1YBTYRj/BF4CG?=
 =?us-ascii?Q?ZkVK0JhMCNiIwjg57KqD1FR1uuJuih5ufLnQdKg44deS7fsgMySXjkDfx0F2?=
 =?us-ascii?Q?cA52h/5agrK0DySyahxW/lSE3RvpSVj3NAwcBQ0dPILn4JEBF/LarRcS1D5Y?=
 =?us-ascii?Q?D9mDK3jDhqaPdCAkmuQ00rGcFuOZ4e3X7tNjM5xzK7iAAUdH09dUBHqvK7IQ?=
 =?us-ascii?Q?FNwPiGUNXjTnkKCl5cU4Zuq0kgqBs1z2V7XgrIFYdyRknFiuDwz2QxzvsOTm?=
 =?us-ascii?Q?jc2yfj6tWQUaWb+Dgu1j0Pw9TUIBFtsViwEPUTYNjWrjITAFGnHG+l8L8Y1B?=
 =?us-ascii?Q?fQ0tnIWKiPRjk4Cg4O+06MzDCQT+1npXdUCUPTpY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd76d18-a7f3-4b6e-a573-08de1be18d2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:28.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcilHU34+zIYwMrHYomleVNFVevv+xEeuX2HT88AnIGfpni+1mmEElBjpumbbkuSJTj7uw8Uk1Nsoz4Y9XfUIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

Remote processors may announce multiple devices (e.g., I2C, GPIO) over
an RPMSG channel. These devices may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

Define an RPMSG node to work as a container for a group of RPMSG channels
under the imx_rproc node.

Each subnode within "rpmsg" represents an individual RPMSG channel. The
name of each subnode corresponds to the channel name as defined by the
remote processor.

All remote devices associated with a given channel are defined as child
nodes under the corresponding channel node.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 57d75acb0b5e..897a16c4f7db 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -84,6 +84,92 @@ properties:
       This property is to specify the resource id of the remote processor in SoC
       which supports SCFW
 
+  rpmsg:
+    type: object
+    additionalProperties: false
+    description:
+      Present a group of RPMSG channel devices.
+
+    properties:
+      rpmsg-io-channel:
+        type: object
+        additionalProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "gpio@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-gpio
+
+              reg:
+                maxItems: 1
+
+              "#gpio-cells":
+                const: 2
+
+              gpio-controller: true
+
+              interrupt-controller: true
+
+              "#interrupt-cells":
+                const: 2
+
+            required:
+              - compatible
+              - reg
+              - "#gpio-cells"
+              - "#interrupt-cells"
+
+            allOf:
+              - $ref: /schemas/gpio/gpio.yaml#
+              - $ref: /schemas/interrupt-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
+      rpmsg-i2c-channel:
+        type: object
+        unevaluatedProperties: false
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+        patternProperties:
+          "i2c@[0-9a-f]+$":
+            type: object
+            unevaluatedProperties: false
+            properties:
+              compatible:
+                enum:
+                  - fsl,imx-rpmsg-i2c
+
+              reg:
+                maxItems: 1
+
+            required:
+              - compatible
+              - reg
+
+            allOf:
+              - $ref: /schemas/i2c/i2c-controller.yaml#
+
+        required:
+          - '#address-cells'
+          - '#size-cells'
+
 required:
   - compatible
 
@@ -146,5 +232,42 @@ examples:
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
       syscon = <&src>;
+
+      rpmsg {
+        rpmsg-io-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          gpio@0 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpioa>;
+          };
+
+          gpio@1 {
+            compatible = "fsl,imx-rpmsg-gpio";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            #interrupt-cells = <2>;
+            interrupt-controller;
+            interrupt-parent = <&rpmsg_gpiob>;
+          };
+        };
+
+        rpmsg-i2c-channel {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          i2c@0 {
+            compatible = "fsl,imx-rpmsg-i2c";
+            reg = <0>;
+          };
+        };
+      };
     };
 ...
-- 
2.43.0

