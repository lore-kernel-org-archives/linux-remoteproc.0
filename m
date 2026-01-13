Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5127FD51;
	Tue, 13 Jan 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768321774; cv=fail; b=LdrYXkDSmXuDlUTnQBlYJlcbSPd9/6Vevg2jdGGSKqNUBshtUXUgd8la8wwJZJGTVxgKlDX3+xZOD088KxrFy9xNnkzw9CwUa2Nccac+A0BaAdBMzpdcfjr21UbyE3DOgXot9qHlnWwIExDFikSj6MQCbD8tO9txM0lC/luDrkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768321774; c=relaxed/simple;
	bh=CXIywrFuFlAnULzqaDAXfAfacyPIFUBUJDrkfppfu0A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W24t4kvnK+1apvpatKEkomDR0blZ1ReCvd/HE//pVSNYkMyoNlNqEhKijXVH9vdzDmtrIoRneFa5c0/qx+PT75byU/YwZipEsEfjOP+/13v1uy/tG1JxYfGkAbjx/4QAglU6kR9JUmdfqxgchSfuefmqV8gp/RBO799zNLJkpck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R45WKOEB; arc=fail smtp.client-ip=52.101.56.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R45WKOEB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1ntOu58E7o420TxWsN2RJIXCotb7eqvrXk/8M8dYmcOaP6W2jHfbSaGIqiH5hBJqGvzWIdGeV5A8tyh723caZBCnmRumJdOW78KMqRkEx5VGbJrkiLvfOxXUQzqyZ3kxmQmi9ekTWvYU7QGWgqTydEGnHnYrRgBYfmHBbNH0imQmFauI4qnYCmcIJt0EMrsFWxxEdEclspXW/RYAP4pvj90kMbEyZ/QJL0lk3Noy2Gsm2n8A70L4KpDdxh9wpA4ZdLXmtocgw4CY6U9ErluPfHOoIjxYZa6gi8Q1nWL3qZ0RSbZ2VU4738bpqcHLK5stpbjGUpftKMgkEI+9zwkgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3Nr8ialqxZbEIZ06b753URl0qRRT9pahEbTECOC/pw=;
 b=R7AMiHsYo1ShjGipx+ssmRJua77mcGCMLwXwuEiOrYVuR9q7P68CJpEQmovFgdRyuHGBBx4ZrZ3XHQAWCw9UMZ9qPKVt7vYJio5XZD7EVYDWg4gX7H3Rd5mvnAbKXY9D7ExoRyCwfs5HZ6vjrLMv2sAduclXB9wF5dmq6KXLugHvBN6Gcv7sqHB+2twwEFK3C6D835od5Hw3/KRa89JJbZmFGc0D4RZ4mMO4vn7shdagdfASCGJNhzQKqu5YDhwXsX7vucRQIcRIvZm2bUpOW0s1NS2Accz25nnQd3Tiirg8RDxnDxvDTGJvVjrW/N19MchIBRL8rnOKY4fQmGzl0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3Nr8ialqxZbEIZ06b753URl0qRRT9pahEbTECOC/pw=;
 b=R45WKOEBKxJJCwz8L4qVESRHiZ0rPMw00TrQqG6M+AyBPYe8eRpBeZGYR0YOlobx9IwJx7x0Gv+OAG9jo/MUcZnW0nbWcSh9/BGZndgOXPQnyY216aP4K/OTxU2Btd9Hdr1jAZeKO81b8Z6tucsEcRR0XSQ/sdhBKgTXLoSeMMw=
Received: from MN2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:208:239::21)
 by CO6PR10MB5537.namprd10.prod.outlook.com (2603:10b6:303:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:29:30 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::74) by MN2PR08CA0016.outlook.office365.com
 (2603:10b6:208:239::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:29:29 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:29:27 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:29:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:29:27 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DGTR2c2555396;
	Tue, 13 Jan 2026 10:29:27 -0600
Date: Tue, 13 Jan 2026 10:29:27 -0600
From: Nishanth Menon <nm@ti.com>
To: "Padhi, Beleswar" <b-padhi@ti.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: ti:
 k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
Message-ID: <20260113162927.hmf5dnkm44kyefpt@stained>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-3-b-padhi@ti.com>
 <20260109192735.rijejfwwrkunosdp@gauging>
 <8a4692f8-4366-49f2-bcef-b087a7bcc24c@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a4692f8-4366-49f2-bcef-b087a7bcc24c@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|CO6PR10MB5537:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fb576e-4114-497b-a5ca-08de52c0ecba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WdplwGRmyewNHPRngd11BUq4TBV65N2NhI8xcQas3mPDL61DsqIeY0IkFB3X?=
 =?us-ascii?Q?jgtDMUk7m6OOWNbgrvSXqLOZDeLu7B7UFw/lSuIPBFmpAuqO2LLW1k7QkRxz?=
 =?us-ascii?Q?xoKgcVbGWNgBPgwCUgcTCmCttoE5OpOPaXDJQvIevb0q2RhCgWfcbosIe2j4?=
 =?us-ascii?Q?mASLKiECME48L+syjrWT19GEvIo7DlDE5qHvb3GVxaAh90K/9iPFwxAAYoFu?=
 =?us-ascii?Q?9zeMTR8sWA2TkwALgW77c/MiUmiJ/gafg1kNGeDiMZrOVTfFTOcqApiKlpOn?=
 =?us-ascii?Q?bAFH7HZo9BnwqeqJYRKIHKz7QPpWCmXYaF3ir4zgfJ/uyq4rCLIruGokouRb?=
 =?us-ascii?Q?IPrVPCwbl7ZxAsI8acayesS3o80DvTHExElqL6j7H4+GU+iOajSymU24pzN0?=
 =?us-ascii?Q?GTFaRgOv4YUAVPMjoVAgBaO5crYAGxn0Zusx1U9+0xzatB5zni7Q5dbqPjOF?=
 =?us-ascii?Q?eXMaso9yCEd7q2iR/5Vz6lCPIe1W5R8h8wSjGZSSUnd1NszFWKFYEG+/lUP3?=
 =?us-ascii?Q?wi0xafCjDM+L9fdynDFNeaBBK/aNHckePyFnvF9+VQgbZnW98bcUP9d2JSIX?=
 =?us-ascii?Q?qtSriY5ETLiBTvW9oEeheISiHvL/ViAASGycYPEcnPbB/6r1RUWezBYXnWxo?=
 =?us-ascii?Q?rmiCybo5vRHnzScq9aoZMktmvpnqfsU2q/43lARhy7XUUcKzzB6fEOqKd044?=
 =?us-ascii?Q?ocbAPct8HIzez7snitQFY9WDAGAIb8csGi3Gmp8/lZoEXAw/H0yJvsDMjGaQ?=
 =?us-ascii?Q?iIhaw/7NhKcCTDLe2tpi4rPVRPIp8Ih8gHUho3V39SLI8bBFw4MbWwgnyHsm?=
 =?us-ascii?Q?6oFyCUjfbXHQqq8GBP40Mw8dVmpWXrwXcuEVShUrAIjqQJq0FpiO38wQast8?=
 =?us-ascii?Q?gpk0S497m0BLm7VQPy1vJHZwTaVDJB2cI6yIeBVWLyhLarPF8M4DfdRsmpNX?=
 =?us-ascii?Q?lxbSAXneCK0l3LX1kXWCGFGHG9NQFm//sTlldAwqjQ4hv1AzpoDNF9dSlZzK?=
 =?us-ascii?Q?nwciFksTbWEytcqaKwsLDUoLhboJ8BK89iAoTBIkudPiwuY2KpxyJLqi2mcZ?=
 =?us-ascii?Q?/sBksV8+wSS6eskrJGkeYidf18fmMZauF3Iq2gMs1xx7znn9fDybOSbWjZZa?=
 =?us-ascii?Q?3oZBrNfA5TKo9HOAO8utp2ihzdIO5w9ZNJQCzLYg5PvGv88vwevscNYH7Rim?=
 =?us-ascii?Q?WlRm/u8pT6JCiCyIQlmluGJdWCaqFQeQBe/C8mKvsZosCGdwy7Z1yuRlg5o+?=
 =?us-ascii?Q?EYO+GAONwukShsEGnXmNt2DC81RTXn5c7cMMMPKkacjtifjlJdiRaGMKvHcF?=
 =?us-ascii?Q?nBMg+Saifha+QpCwSK/zZfVDd85qxW2g/UZQF+dQ6NEH3ANF5e9iqkbAYU53?=
 =?us-ascii?Q?uwsbHC3IFsj1jzrFY7BIDwt6rxqLAv9lJJdR4cy9bQoxDlQOS6reID4x5GYO?=
 =?us-ascii?Q?slas5OWM2JfHp2rhWvFloE6yWHpXfHRq8PrEZG3Z8fHA+ViauvVlzZMUgtVK?=
 =?us-ascii?Q?5iCNq37fEyn8599C9jWCgy4zDSFAdyL6T3VlmGJjq2uhm6dPpSfWhP6xNFrQ?=
 =?us-ascii?Q?UfnAeBlfqd3k7yE5eOk=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:29:29.0817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fb576e-4114-497b-a5ca-08de52c0ecba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5537

On 21:34-20260113, Padhi, Beleswar wrote:
[...]

> > > +		reg-names = "sram0_0", "sram0_1", "sram1";
> > > +		resets = <&k3_reset 304 1>;
> > > +		firmware-name = "hsm.bin";
> > I am not a fan of putting firmware-name in SoC.dtsi - esp when it is
> > reserved,
> 
> 
> I thought the opposite way. Since it is reserved (and not a general purpose
> remote core), it is unlikely boards out there are going to use a separate

Fair enough.. I see that the base firmware name is in SoC.dtsi on a per
SoC basis. Agreed that exception can be an override if required
(unlikely in this case). Please document that rationale in the commit
message.

Since we just have a single HSM in each of the SoCs, am62p-hsm-m4f-fw
j722s-hsm-m4f-fw etc in SoC.dtsi would make sense.. just dont do a
generic hsm.bin kind of deal.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
