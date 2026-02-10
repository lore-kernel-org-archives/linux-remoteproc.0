Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E1422B8AB;
	Tue, 10 Feb 2026 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737949; cv=fail; b=UQcoNOVmubpo4Z3cncEm8oQv2qtaUFoCJtEau+Nhjr4bMztsV4qgHINnsrwwhgD8aTdCeKibNQSoOmhmOJK1Q2Da12xwTI+XOpo3aUKoGJUDwBZDWoArJSGEK61Rdr3T4iClIBDEzXbq0W04yLlUAdxB96RRKRi+mumxZG+fmig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737949; c=relaxed/simple;
	bh=xUonJNE2uv5yQTfoix/NgIQcMToDR+kWGkRz1S5iv64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=muI3WSlsCPrkUUHy7NmFPHSuA9S8O0QqqCcHO+MCZ/XSWNv3Ex2Qzxe/jku2Ub0M3j7f/K8BvWiF8sq9RK9YetDTJ3Z4jTATt2QgoAg1kOyqlAO5xZqcTWgB++MpZLz6qNLJAe/LhO8/GcIcAMCCKYXE3B0/JpnqLgSf/hCFh8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qa+JcuSb; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qa+JcuSb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFy64/SNZ+rewm3F/IuvkjOGXqgy+3WR90Om+Do3IUYxZqiGHsH+T0+LC3mqYlz3rivqQo8dRzHingUIWn0FSX3nSBigZK9UXnacGuKA/4tTqta4FUFPta6cMkuXhzzNOUXk66snMiBBtZqU34fXGfMVS1npr6FLQQbh/QHHHgVsz5EgKNc4K/QOBbg4UQIpl2P4f7RBrlwWv7X3ZsDnKXfAA5NnGhZcup8TGlm04P5n6Ee9WBElClLNTaG2e9UN/gH7TUvGy7XghPgB1ITEd4SUgl/UxKWLn3BKNvK4p0yMAxbFDo/0GsWAUUzXxQmN7E7D2D/Q14B3REzEhO2KTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8CSpJKarNaH7aj7dAjFAHwSL8dmQCEFEHngzMjFtVI=;
 b=ru6eOuNpPbeFNuXpaLKShQmnMET/QM8a7GSPbJCqfINj1JgXw1JQDS8dGAkn+8xzWbcqbv09mNVblFrNNRCwhFRWE1WFSwOLNp0gf+vo6a616OSUU55TyAAUGyOsoHco4LMBiomO7IlxxHtrt00d3wGTK2giK7IHFJ+uvxitoQdPSvC1PuGHGHsEFRZ6vBhJj08zDh4tNnYhmQk+NutFHAnHeNZ3Qy9zKFnYpiGZF6CsPU4zl/6leVZRPaxf0gQ0W2X9VpBcFIFatVe2IItI3Qn0ZAvQSpDsNCfo9ftmspTklVr8kZpSZjtjBCSPlbd8nYWv3PQe+IE3A06/AiEXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8CSpJKarNaH7aj7dAjFAHwSL8dmQCEFEHngzMjFtVI=;
 b=Qa+JcuSbjoJk3jQ4c/l7hYXiafAgImiTiCNaPfM6DqviR5GuJ55ws9QvMjoZtnTbtheQ3n6cMolSK+sW4Qzh0Cyba5Of//C+B7RSRPknDxfhrZ5xh0BSREkUbTEZisBDhq+OZ0LteFtVTY88mM6GzSfhIM1CxWbnahV8vCXVLTsT4a/ORxVmE5SUiMmNhijx2VTjvNBMoEQcT0YCEK0w/60l0DiOoG361t7dsEaiM1bP7Mm/cBfHRHiP3MBFMy3zbxxOCp+ReuOpufEfTdmlF+6VLS02Z/1mognBLK9dhRZMzN2UqAwKZZp2uMWXtG1dDUT+n4UOcrp3bxBvAbzzlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7396.eurprd04.prod.outlook.com (2603:10a6:20b:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 15:39:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 15:39:04 +0000
Date: Tue, 10 Feb 2026 10:38:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: peng.fan@nxp.com, andersson@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Message-ID: <aYtREmdWHf9BdN0w@lizhi-Precision-Tower-5810>
References: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
 <20260210050744.1902425-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210050744.1902425-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: PH2PEPF0000384C.namprd17.prod.outlook.com
 (2603:10b6:518:1::70) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f59f08-e0bf-4cc8-18e8-08de68ba858d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G3f4l8ygtBApG+dnf7sqpDVQsp4JZ4cnrAy5lyyYVuXXqJte9j30dm2MBKov?=
 =?us-ascii?Q?ofkVObWr2EFHIZpDcyszfgGOES+R3SzUB3N3yzU2m8YLrKxH/CWkVgI46q6Y?=
 =?us-ascii?Q?JM/HtWpmM0TeTi1HVg8Bxmw8XbhXXwmV9mrz3D3xZk3LzV5NHm6Sr5SR7I2z?=
 =?us-ascii?Q?BqcCJgcwrUqKE2yxa2QUC+S8MYsvt1vMHMd3adZJaYdJhklMgcu0BtYh6FZM?=
 =?us-ascii?Q?BvZDM7ZLCAOyc3Bjfk5aIAiqFtqr6RNeXhIZ+4HKPcFvs+vC0gKW2I1rQyV6?=
 =?us-ascii?Q?5iI2f2eF9lsDmY83JNZmacjc6SbS+asesAeKxfdTgd8Ze4t0qbQUDBRW2EJt?=
 =?us-ascii?Q?F+HrFAged1qJqGdybR7TF4RTh/Yax71N99jgrRyQYW5ziYBqstETnSc+PwK9?=
 =?us-ascii?Q?GVHzP0efH085aq5ntgn1i6uro+TFz865q5al0Q+ScygbFTFTCDAuCq8v4dBW?=
 =?us-ascii?Q?VXypPBtOldfOYH56C7+ObaC1oDoz9h6zpjLx9OYTJIAV4skAahQAlZRaxrY8?=
 =?us-ascii?Q?L/fVayEVHCFJWhKbb3wA52MuMa/6pDerFJUlv34OlyrQDVSwsaLePqxihJnw?=
 =?us-ascii?Q?VFktB/crzYxpow30PvqCjw0R0KhchmTzT/8PEb26IpTWiBdXMfQUHeScZIJn?=
 =?us-ascii?Q?Drr9bfso07B29j0ZsPmA4PmSQguGRSu8CirOn5fh8ukhCA2LE8KZvb8uKOkM?=
 =?us-ascii?Q?GYHTE0b2rKDDPZcETjsSrTydrCqRCO4evFyEe8f7VYVbzuSfcgHjQ/KuIl3G?=
 =?us-ascii?Q?nNZtkkTpWq4XSu6GOM6jo0nKFT2OjNw6FidEtV0IVglWDKIo8r36/zc/UEkm?=
 =?us-ascii?Q?VahU9tPBjJXcOFEaW9xEre32LmY/1Z1Am/79noJDt5VWd9HRIqun5iecSJIM?=
 =?us-ascii?Q?40yktpkcPB69+95CLq2qCmf6Op945Jx8Lc0e0h+SRzTXPg/JBmorP9HWdMa7?=
 =?us-ascii?Q?+ZkqOqGn8ZhhNHiNSdzwLtrro7E1oQL5EH1NIf6I/5HNqG1oGKfwwAfjE3fO?=
 =?us-ascii?Q?TF9NZRDUdKywHksUB5P0umg0pQdj8nDQciAS9tvoIrGu33I5zIBHuOjQvRhM?=
 =?us-ascii?Q?JrWkxAKKPQNVUZAXmL8tiJensjCzE9BNF7vIPbkOiNS8PBGpJ/zOtMlYidox?=
 =?us-ascii?Q?8Navm92dCiAXu7AR6o0iky3kz9zI/cfJeHejpzK6gvca6dnsuLtF3Ms1+ehX?=
 =?us-ascii?Q?bRPy2YYSwY7VFIEJbqGbUm5M9VYIi1veQPseb/scBtIJ7/DHm6uhwRNLOvsr?=
 =?us-ascii?Q?W/KBQp3374X9NG4Xc9ab/DaO12JWO35tSmTXXZmdCmLS8lPWx+93hG4TARQe?=
 =?us-ascii?Q?BV1O+w11uLhoX8WrHTwDC+P7NtQVYOlSR1kuaXF4SCSjXa4x3jmetdu2efn6?=
 =?us-ascii?Q?mEwWZsv48H5ZrwrjoubEaJIBvm3rTskzNurDIgh163eA3PULw38q6VF3HnDM?=
 =?us-ascii?Q?bT0m6hsAgtCT7rMZiSK+pd2goiL2+uVT77Q3XgwMnAPuKRc519ARdKSPhBEx?=
 =?us-ascii?Q?Oc8HfUu3JHuY5otwiNJnHJNk7BdTKJAtYdf/JbS3PJ/9dsq46m+6OTfxKNiw?=
 =?us-ascii?Q?egNBoBoE0ZNxH1LZni1XHCTQ3FdIkhSkf/JG9I08z9ePSuWA2Q1yz4KOJQDo?=
 =?us-ascii?Q?geIyM4dQdUOE7Y7LI4Cvkjw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUI3XasPjfBlj5yFcQKigr2hhg+OTnUHsgj0mFY2NyCBiB97x1Khz9+YYcTx?=
 =?us-ascii?Q?gUd0X44Dx6Pd+QbcwQBggVFV9G6qLn5N9DCwNODcR4OxAMIT2AQiiRFN6n/+?=
 =?us-ascii?Q?iqqc4RDFRcUUCOqDVs/r1fuSbQW4nwfhvFXl8ho2V5MVX08bSPEsdGjyf1GV?=
 =?us-ascii?Q?zIOEkoHhDRFVATEOIL8GajTWZHGSn4PjcRr64ALgscmCHkMaUGjouVNahghZ?=
 =?us-ascii?Q?33aBfpnmG11l61dFAjXRceGbTjyAXmNJtk2UIkeCfTtV/0pHsjGPE4rJMr4L?=
 =?us-ascii?Q?OclLeQW5MScyOFKFLMos6pwwyKIQiulxp9827mj229Di/McNTrfEwm1YqSUV?=
 =?us-ascii?Q?PSyLwNKHbAgewce0TbcHb9mP53z9qhAamArL/gSz5iuJRBHssfy5o5QVa6vv?=
 =?us-ascii?Q?kkQ0SeuqJrQmuXvpT+8lVnCBhVYDE5tK/DjoOh+Z9Qw6itfdhd/luLlwsRzh?=
 =?us-ascii?Q?V04o5UoQ1XP51hqh9f99+7F3DogxrhZqNEp2OyQKvfZkuF+g7s0L0NdASFK1?=
 =?us-ascii?Q?qGV4K0clPf6euxaaCW8GeW1jngTDIrntE/JWyihV9l106vNjNsXd883lbr5N?=
 =?us-ascii?Q?s7N0IrZKnf5U138g3tUo4Zw3PPa4OMO8vi+4hh278v6DcUKW0IcKdC1ZN2f9?=
 =?us-ascii?Q?h7TGlgurOIKwnVMQoNgK95+IBGsS3dtWfNuiqFL3Wz2Lg54NPYWlhNXNq7c1?=
 =?us-ascii?Q?8fg/jKSwPL+w1+v9lvPYXtRh3qkxhL/Tlakq/LnP7RR27MkXiY/IEreyb76q?=
 =?us-ascii?Q?h8Kbs6+NC2M3mTiMraCd+OBVbLM7zoce66vXklsTyZjfyBoknClL/HKydK3L?=
 =?us-ascii?Q?aTnU93/WmkHWznQTHb2dbhk1bOXoOJT79FMijivA5IHUz9/2S3OoerKB/hxA?=
 =?us-ascii?Q?ybmxFAb1VY47rR8przx7WtrusY1XiPyQnm++NiSXOUsbDu38bVNCWZ/giwZ7?=
 =?us-ascii?Q?/z9MpXTJpVeXLBzQ8dcklQOS/NuEq4S047EC6Nns828Ies9rW46i6RF61iQl?=
 =?us-ascii?Q?CIz+8ZaJ73BCD6n9ECPYUCDSoCSMvTo2/7fctCVfa9VDtj4ITKbPWj8o8ngN?=
 =?us-ascii?Q?Dh3f8zU/jap2Od5macsFzQ8rwr8n0WALVOS0tzw2C19wJmV/cNEnSXkoV/8h?=
 =?us-ascii?Q?zuxe5b+/DH866NOO5fT8tn6KXjJAf+WTxISbtYwlelV2/TiJ8SNivZxHCwsj?=
 =?us-ascii?Q?hB2t8hTic7SviH65J82Xb/jIMnCnBbcW5qFxda1aNLV6TSM5HTPigOFT5gkj?=
 =?us-ascii?Q?QWwQkLqxhom9R+MoY3RjBwv+lC0uf5lgiKv3JUnygzOtWmPgQtijYCY4cl6Y?=
 =?us-ascii?Q?lceElrKZq4hyMv4gKUByyocT5I32ujTkRc7vFd8ujt3sJmD3nulC4zC2mb6p?=
 =?us-ascii?Q?EAbXuIzaFcUO+3mbQbyvfnvAKvh6jRChAkTO0qjFkPc8LpFuWsUNBxiW7RFP?=
 =?us-ascii?Q?FWpJhIUaGbHzPI/O6ACaplGa8bsvHdiy2RvtEkgQ3inmTXi4qDCrby2PFaOY?=
 =?us-ascii?Q?rrb7lJkdI/yrmQTs4+uXf8/odxNQqk9bwQX90qB8vVWvingI9qW/r9denYcJ?=
 =?us-ascii?Q?Wk08TiJDgs0GYXhRE9shGej3LDOJ0bPziIfIW+Xu8Scf4ZSgC1fZOGwvBTcj?=
 =?us-ascii?Q?23wo7DSQL95hFBpVqulKeVxiPZMGGVrbOrF3vTIvdAAGmuZ0Tt75hblHpgsJ?=
 =?us-ascii?Q?t5xsfmzlwSQ9wadOzO8VQR6gomSos009vw6Ph6g2X3zVpL4t3gUCRIdi9ueI?=
 =?us-ascii?Q?vHmm89KXPQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f59f08-e0bf-4cc8-18e8-08de68ba858d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:39:04.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0A9oQ3Pt2GGukVfSjqU06YL2JjzLE3hhJqnjKJBgmiGKJ71KQU33PiKMJyTylHv3G0D+Sdf3xfIG0/aS/Gs9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7396

On Tue, Feb 10, 2026 at 01:07:44PM +0800, Chen Ni wrote:
> On Mon, Feb 09, 2026 at 11:36:51AM -0500, Frank Li wrote:
> > On Mon, Feb 09, 2026 at 01:14:07PM +0800, Chen Ni wrote:
> > > Changes in v2:
> > > - Use dev_err() + return ret instead of dev_err_probe()
> >
> > why?
> >
> > Frank
>
> Hi Frank,
>
> The replacement of dev_err_probe() with dev_err() + return ret is based
> on two key reasons:
>
> 1. Consistency with existing code style in imx_rproc_mmio_detect_mode():
>    The upper-level probe function already uses dev_err_probe() to handle
>    errors from this function, and all other error paths here also use
>    "dev_err() + return ret", so this change aligns with the existing
>    coding style.

You should update existing code to use dev_err_probe()

>
> 2. Technical rationale from community feedback:
>    regmap_attach_dev() only returns -ENOMEM errors, and dev_err_probe() is
>    silent for -ENOMEM errors [1]. Using dev_err() ensures the error is
>    logged clearly, while returning the original ret maintains proper error
>    propagation.
>
> [1] 2f3cfd2f4b7c ("driver core: Make dev_err_probe() silent for -ENOMEM")
>

That means you needn't error message. just "return ret" is enough.

Frank

> Best regards,
> Chen Ni
>
