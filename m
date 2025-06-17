Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C28F54;
	Tue, 17 Jun 2025 01:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750123602; cv=fail; b=IsqJvnC2g4We1a88hISZF7YWJQEjMaTOdxGveF2YUtv5LnwhInoa/h2NxhwLVC7yv19JmHw7aMJyVUSBj9jR+Ee74ZLydIAYZp59AzSe3M90aZEiDyaLR9GcVToQOFm7sQRjLkoa9Hkl6Ow8YS/9YCoLm3SaBSLTrtRE+uOXKq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750123602; c=relaxed/simple;
	bh=3D+elsMc5jEPprzAPgo9agZeRKGHNYAgnYauv4Gp91M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=euQh9bApdbWWqHIkS3jYj5129ZG2KZy7f7Qp0+ms+FC8cr3AVIlCY0IyZa7E+hWEUd6XnIVh3XioSO7EXmQWNActXeZDdybzagOYphiRkLpqvYaXfq3xp/djzKzooustWBo0aZ1IXSlt/jxF87Nkh7jNL2Acgn9p8oYL0cMnwEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tMtq9Anw; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tMtq9Anw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaYTvmzEKMAb+zFPh4J0vBs8CXrohq8roskYas06EPKp13HjDnA2DehkUBtgw73OaSODtH8xTZF5vn0Xz04WqLdjjAk+ZPARAnpaBjlh4FuSd8MurisnOfDOrIWkn467eCz/LFsOSYsaxv238erkqtZif2Q6MY6Wz/GAE72wdey5POkKpb4ZG969DpA2vRDL0gHMFwbDBUVhAHT12aIZBmiY6WEZXJSksjeavnQRTrh09HFQV0OMRhPcnQeq3KCtVWDEefIApvCeHrxzavc2+bNFbrkbSZlVa/P7fc+WswiV8lkV8Go5zCVWFY8CVS6xEXrKNxibmDs/so2WKexOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvT5oX9KzNJYynuGg2e/MSME3z+22mZ6KK4Um1he664=;
 b=VLjZ3wAwk4Q23Hhv4zK01G/OjqX3DtSPNkeOkMvnC64lpxpo+L9SA2knD3ENSnYvPtBJVl0AM+GMSb1b3FRqheKSDhmfHp+VcctsG495ZkvSzQuJRZ4gjApCeCWbYKZVdfBI/yxcaD+mgyPf7puf9XZL22CFYkYYpKwgQBm2uMIS+y2jJiaWnDkx6U3uIw1kC6FpmnrsaHK70dyZUwF91lGwbYNR04IzuqAkzPuCvmeUNnwzUreuWu5ig4qgpa0T9IimPRrcSCfjdWCkiOvLSEsI8OJEq0U2ooWWE4ZFDeYe9BnCc2zyXQ/0HR7KfW2uE/ogqpRnhUnS8o/lZ4+qCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvT5oX9KzNJYynuGg2e/MSME3z+22mZ6KK4Um1he664=;
 b=tMtq9AnweMlVIZVXadXRKBHJ1lJJQblyDhx584I0iX/rdIq8F7YNr1G+v/OykwmJD+NxUQ89E+NKiuGBr0EL5t5XsAjUJb73OtIhM2uoOSwF9dSfnuDVNbQ5Ypz1aqKjlH4t3tZ1IrBFZkb7kKSewgw+ucJW7eDe4j/xnZHVsBXIr/sZE71HbGzbrkqb8H/YGM8wxY4ix79kZEpMcx10RQya7SGCv5gxWvwjKgoyX3HW1t53tI689f5H9maOSi1SF824r+N/vc/Pvo+RdAx+dHJM4RB2q7QpgQJdDyR7/3p4thCPLephlvahMkzJyryXOUSw41iN/ngLQSkDALRmEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 01:26:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:26:36 +0000
Date: Tue, 17 Jun 2025 10:36:46 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: fsl,imx-rproc: Add
 support for i.MX95
Message-ID: <20250617023646.GA30636@nxa18884-linux>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
 <20250606-imx95-rproc-1-v2-1-a2bd64438be9@nxp.com>
 <CAEnQRZCQj5b9GSb=i2cTn4YKtAsQPTwJ6DkiqaZjmrmboim-8A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEnQRZCQj5b9GSb=i2cTn4YKtAsQPTwJ6DkiqaZjmrmboim-8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e5bfa3-cb1d-47aa-598a-08ddad3e0084
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JiK3kus9ATjw7fuyGoM2yPEWQxdP/UTIJLgwRAAc0UE519IiwcJBTJlRjHEo?=
 =?us-ascii?Q?oVJS6z5opqEzh+2QTJsEr7z0Wxy3oV0rpiC+Vhfv5rI7BHwgWal+pNh4x8sR?=
 =?us-ascii?Q?7NHr6I/cCy31EDffxZSjmzkToMXjRc9V+SB75A1lsHPS2KCk0WCIKDgW2Zgg?=
 =?us-ascii?Q?bk1vABssJFTLccDWJT4YaOiktY7qjtUw/yb45vTRCU4VMb2I2kS294pzKeiP?=
 =?us-ascii?Q?36BWZlnyBOLDI0A26cytouifadwXpy2lkrOVtJHFIBqo8PPN6VFukMp0GzCd?=
 =?us-ascii?Q?BicwzEiy6O4AGbnxX9mECjaIBvXxRcrWFcsePqUJ4zufwn4cPme/6+T8EpDt?=
 =?us-ascii?Q?fzFLafRIW9iAg/aMqXfWxU834RdFaDRydPQANVYd1Rb53ytkMBgAFhJHojCS?=
 =?us-ascii?Q?zsmtdNRXclavEPDA5HYRdQGToCmXcP0Ts7uSMA4UGIGm6nSkFtALVwfMMEs+?=
 =?us-ascii?Q?Q8C2VACg5YIYb1W3vmDdxz5vwTAbfgVUE2qnAMxBgBZxPrurX+XeYypePyOC?=
 =?us-ascii?Q?Py+a45vG5nLIyGFvLIKpbesO1zJeJ2ciQk1SzMb5ojVpIaTI/kpX55IUWL8p?=
 =?us-ascii?Q?hfD4aOrS+QpKOztJIcyx2U9oE4bFsvvhSDQWFgLrSA/JzIHMzrGLOPsgj7jq?=
 =?us-ascii?Q?7ygYmFIFLrbYnSDIj5UhgPkL9dD56zlwnnP/S1pPSPvYRQydevcKnmeHfQ8L?=
 =?us-ascii?Q?/WAXGE2PBLTalFH2Ett/90Uf1GdQ2xSD90TagP4H7NURnnB5I5TtyPcDcDnF?=
 =?us-ascii?Q?qaNEqd53M/f/PFX7Oox9h41ldGHtsfaC81n9w5ghECvV5jX+W/aVR5a4AcWc?=
 =?us-ascii?Q?J1YDe3aTaI3lXdc+hLnnSo0jgc5kztuVfRb4sCTl/jw90O3rsP68FZ+zS9IM?=
 =?us-ascii?Q?JJow2TjRoSJu0dUPOjEehXHinXQ2t8XYXZwMdcrPTG6p5MwT/OYJ2bM/xqVZ?=
 =?us-ascii?Q?uPwDjYCm4OIpjyyq8tfeA7r0ZsPWFa9yYzjkpOZuMAYoL2iOLaVaLbn2Cud0?=
 =?us-ascii?Q?V0xU0Z1BzAH3MViUBJC6Gdxv8zOHCqZ/1KhYYqY4DnqjeRhHKfzxM1YSBXM/?=
 =?us-ascii?Q?nGE/0cphZeGtlds+4+RXfzTlxHpnaBm/kFwRrDmDSzV56u+SYZafEd7Jny9D?=
 =?us-ascii?Q?v92sTMk2DdnQPLQuhNUOxd/joMsUI43nAfoyFuTLO+ghPacv5t36N/ZTsNGT?=
 =?us-ascii?Q?eW8txGw1NE36TIKr0sCb90cWTMhyKuZ1I4xcXGIpmpFvuoOT1qn+H32+NI8r?=
 =?us-ascii?Q?iVAoCgENdkvr+aWTE3JqIMFXME8MHnXkNwl/3m0r7y3NK6fOSHJbljFxi5IU?=
 =?us-ascii?Q?BpY7yKkDnBhY6CVdxwt0IefmHnLzGfqHlrCrlOQxfwZ/3vtFMuI4zJLclBQa?=
 =?us-ascii?Q?k4z6PHx1+JbWtDwHn3RpgNFNwO9KwBhP0GgwmHa/SFwO4bXF9BBdIwpprdAN?=
 =?us-ascii?Q?EFiifmk/xnnK+Or0UlwCO6G1Mh8X+HLK8JVO5zA88zA0AyjQKru1LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WX5TJzriSVrx9IjUT36Cppy7dTnn8uZ41MSSPU/MTO58vqROfwGPPsisdqH?=
 =?us-ascii?Q?E6lASwfnkLZEy7/fRITwIB2Z2ENLUjkClJ/OtsK9PE6rwe+7WroGSbCUsOP0?=
 =?us-ascii?Q?qY5L7QSoPZXX83bARzP/Umo8TN26MrVZRzQVXk51O5vweCYOVmAmFHSe9WOb?=
 =?us-ascii?Q?eA/xEWb94iE09Wrdmb48PcPmB+5sypNEKRpi44cmrkjdSI2k6Smf1guH2STv?=
 =?us-ascii?Q?OgY8Z4xlbDq3DBsFOStb+BTxxVfo9ZSq03xf8kHOBqC7CndA3dX6iDrLt0DJ?=
 =?us-ascii?Q?3ru8BCa719VjU6pXh5vLQ+M/GO94v37qJrOSuucUGKFVXWmbUA+fcBgQKf9a?=
 =?us-ascii?Q?ilOHNrrPQx/NnxgBUN9FVz5I0BSSRrj6O889QNWqozpL+MPxeGYRTpCOmzCc?=
 =?us-ascii?Q?KcB1KzjEip5DSwQlfJuaff5FIjuvrjXNCz/S0lCuvR5dKTvPy/9HC25l1cEX?=
 =?us-ascii?Q?XNMEZ+0mGcFiMgmrs8T/+Stz2SxAZpb8kzT0D1bB7ylsA+TXf0xokNGo8qJt?=
 =?us-ascii?Q?zlytOFYSIpT/OzJpNhQjKEkyprpq8MDpJjBEbYQETOun6HNXpt7xipY8BxrF?=
 =?us-ascii?Q?c03jJv73EkjOLpHG1nuuCKYeIK9pHo5PPDli4iZCfMNd+o73/BJVrG5QlVzP?=
 =?us-ascii?Q?Xi6F6no9bTT7edSEeD5CaPLYiGAPGrHUF37qBuP54vFPgZuts9/2iDiAn/0J?=
 =?us-ascii?Q?6v/dDL6Sn8U+7JJbwv/LIzC5bybzbJI7Pg/dOICGyB85KXQV7x8vX3qjKGtN?=
 =?us-ascii?Q?qmnVtPBWVzAb6ixzzr9n0X2zSFXd/ydBCD1pGKeKTYvea+BVue4YGVz+AaQb?=
 =?us-ascii?Q?ETep34VsLil8Yr5em4SVl/w8KapqktHf+VhtaDeyf7SvHxi09clsnEHrT+OW?=
 =?us-ascii?Q?VlB7DhwjeYZ9TxOXYblObaYQ2o7fq9RyLMASBBtupCPCtasG1S+dX7JrOE3G?=
 =?us-ascii?Q?fKqNjn8zrtZN3hPquoYnHcpUh7+zGgwHsMAeJ1/i+8qhOCYgzEQhYQHO84gA?=
 =?us-ascii?Q?H3bi3GbRM4FTRUOsIXZ59cWYtnBO137dhLwTQqIqytK+W0HRILDLWy2tWdFx?=
 =?us-ascii?Q?hfYAPww9+ynIfRJm+bIzVj8nqS8L24kZSJiWcA8Fg4xqWa1lOPlsAI+w/f8m?=
 =?us-ascii?Q?xP42HpQ2LUcqvo/uhEGbKU+MPeLKlf7iGKh37xhiiRoHKWgx+k1OZd07hWos?=
 =?us-ascii?Q?uYZxN7qK9hf83R/xhx43sJTM+RNLcjfh2ozhBypLV0k9cx7EiMXlbAxKoZ+D?=
 =?us-ascii?Q?dhNWiafRsrA3+8b2JHMabV/30uDToKNJIQ6kJ1dCCbnOFSD5nDdDpbS1fvhB?=
 =?us-ascii?Q?dIKx7hKZ+v0i6bQkJh+dF2WMzUlu8ZYfSjU82mHqCmcjQMT1OGONK7Xy37xp?=
 =?us-ascii?Q?5nzYdomB8cdW4Bw+qcrYt1y56wNiGYZnjpOghdX/Lr5selxlGuJjDuafdqDf?=
 =?us-ascii?Q?8jqhOEfUcgr91YGRoL4HP6/kUYw7cOFb8s1Tdd+UC/lu+7v1xhVEQQ2AKFLQ?=
 =?us-ascii?Q?Dh6ip+5E9yMdaw29jaj//EJOJ15Bwx0eSd+UpiajpjV6FFWoy27GUD2g+GhZ?=
 =?us-ascii?Q?lIsp0GqVzYaECONo40SyOX3OeHiB853Vtev0TlvM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e5bfa3-cb1d-47aa-598a-08ddad3e0084
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 01:26:36.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG9d2DOJ+3ZUWbieRoWzguXwATB/Sy3RLqVIsLEJqq4Oi2dq4j60OD7W2t9g2o982sKsLGDProeKVMMJZ9yOHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681

Hi Daniel,

On Mon, Jun 16, 2025 at 04:07:02PM +0300, Daniel Baluta wrote:
>On Fri, Jun 6, 2025 at 4:57???AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>>
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> i.MX95 has a System Manager(SM) core runs the System Control Management
>> Interface(SCMI) firmware. Vendor extenions are implemented in the
>> firmware, Logical Machine Management(LMM) protocol to manage
>> Logical Machines and CPU protocol to manage cores. The documentation
>> could be found in file drivers/firmware/arm_scmi/vendors/imx/imx95.rst.
>>
>> Add below to support i.MX95
>>  - compatible string for i.MX95 M7
>>  - fsl,lmm-id to indicate the LMM ID of M7 LM
>>  - fsl,cpu-id to indicate the CPU ID of M7
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> index 57d75acb0b5e52ca49d1361176fdebc18a0bf7a2..a3ffab60df52be6f1d7cf4846ca5ba1c40f03bde 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> @@ -28,6 +28,7 @@ properties:
>>        - fsl,imx8qxp-cm4
>>        - fsl,imx8ulp-cm33
>>        - fsl,imx93-cm33
>> +      - fsl,imx95-cm7
>>
>>    clocks:
>>      maxItems: 1
>> @@ -68,6 +69,12 @@ properties:
>>        Indicate whether need to load the default firmware and start the remote
>>        processor automatically.
>>
>> +  fsl,cpu-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This property is to specify the CPU ID of the remote processor
>> +      in SoC which supports System Manager
>> +
>>    fsl,entry-address:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      description:
>> @@ -78,6 +85,12 @@ properties:
>>      description:
>>        Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT bit.
>>
>> +  fsl,lmm-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      This property is to specify the Logical Machine ID of the remote processor
>> +      in SoC which supports System Manager
>> +
>>    fsl,resource-id:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      description:
>> @@ -114,6 +127,20 @@ allOf:
>>        properties:
>>          power-domains: false
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: fsl,imx95-cm7
>> +    then:
>> +      required:
>> +        - fsl,lmm-id
>> +        - fsl,cpu-id
>> +    else:
>> +      properties:
>> +        fsl,lmm-id: false
>> +        fsl,cpu-id: false
>
>Hi Peng,
>
>Can you remind me why do we need the else branch here?
>
>I mean if the compatible is not fsl,imx95-cm7 then the properties
>fsl,lmm-id and fsl,cpu-id are not required and I think that's fine.

It is not required, but we should also block others wrongly add
the properties. Such as dt-schema should report error if user wrongly add
these properties in DTS.

DT maintainers may help comment more.

Thanks,
Peng

