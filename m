Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A140B37C;
	Thu, 11 Jun 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187864; cv=fail; b=jJV1mUry52kyb3u2hsDZ5BH5Y2ArKzj7pnlor1qLrxrsAGzdQ2cV4RVDJTZhEVg5Ocs1OVFuz/0M3ZLHxno9MZ2Sv/4GenWctwXwEF8Z5LJlb7l5bTsxysJGfoLxowKyWBox2uxvaEmR0rb4SbF33bOibSe5/sejWO/r5Q2Ui5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187864; c=relaxed/simple;
	bh=FQMOTQ0OLbrd2Fu6RBWGOg0vtsmg7cn3NkC2K9uVE4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Eq9n8Vx9xzR8qvJHgL9G3VV3jujDl6yQ24vz6o87dL0Ny5FU46r1vPifZL+Gj3hCWyNdipUz0CuMrjYZQdKb/66tf4Cr9V9s2lgMBe4lKPhKUCcFPFY56qiaIF4T63LYWexzinTOAcHJi9Y8L5WZQ2tzV8iFZrjv4QrEXabG0gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WN6+B1lP; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WN6+B1lP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMeg+76vJJ80KDwFCIqDW6oFxLaIwJnB1dtrG81eEeLoZalzUBIQIuAvFbUlZU+HgYDceuX7ANINAF8WUEqc2Xp/0T1yshXl7hEB1gYsPJ6AKyYjkNi+DJAqaTVZgKc43gGXMpR3dH47qmDLz/nFyWT+nZyj/T7Rdwrqj01MB5JBmZR8NrXN6Nad/CDqCgQzo0ZOK94JYGm8LHgTt4VoHqmuRwi71ak+GTbVnNIMZbE7x/zJGofAT1von4DbDVwbqUVFNwe2ITy94vOKad1lwmBqYqBDKEmb21WB4rEfZMwRIigp1Hs6XdI62lG8lxfGYjW8RslBYTLfh7I2mnLtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7IqFC9ihtjEneC4EZoLoeTj7S+sFsnYLBXtu2KQza4=;
 b=QnJYxrxshiq6QxtpI/MKFRpaQ+g5E5ZokNvEnwTK5bNYcfeGK6wJ+8jMUVFTAylZ+l37Tt/RI04jLqUO2b9Jv0fZ/y0/RbhkGpe4q2LWLSOZJ7vfeWcDaZBwtOeCnlXiXQm3ybLNzIiVaFUw9ajAJW90ICd3cQAk3JGRuyr496t13EwaA9Ik24hgrwmBv3Otwi0zPbOi2qXoiUaSdKJAwRRa6ExjegA4QHs259H9P7WWsx3T+5A5yAkpnkkR0M+HFReF7tdws0fBgYRSzSFhRdmXq4L58AbG7i1c4WJF9+7PN/IZ0lAPxaXJDm29RGRWF4s3FRcXSkJFMP658iMNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7IqFC9ihtjEneC4EZoLoeTj7S+sFsnYLBXtu2KQza4=;
 b=WN6+B1lPBZwgsZKo7Mv5neK7CCWM1TOKBpwWcYAGK/UIGFtmp8uJwadW7l/SW7Edh4IjbFaMenVggqz37+lUQqEBqpSjq8U4PH+Gog+e1vufq/D+7BwuU1/NQpzmdJwOF7irEKqzVsu3vuQUifjnCURXG4wDNYEW23ACLGi4g7rhx9rly41cuG0k81SLp5IuCvuhbGmNp0WmpMDTpS8jUf+0xr2s2ZjTa14NhLSXNsqjFhOOSoOQLjnftL3/5PtauuztIfjhaNvp3CoWPFyuLI9TCcINpyKirLCtVBsmqf1jiTVzOf5mxzsYvEiZkYvV/w95ZP6ULay4AIHJs1s7Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11878.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:24:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:24:19 +0000
Date: Thu, 11 Jun 2026 10:24:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <airFCYTIPiOUG3DJ@lizhi-Precision-Tower-5810>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <aihB5rVLsVqzg6cb@p14s>
 <aihIIwt_9T7yYxP3@SMW015318>
 <CANLsYkxw6rbWNom8rNfKurKAXKpihqV1LTd51D5YXG4oFP6-wg@mail.gmail.com>
 <20260610-accomplished-antique-mink-cf0ead@quoll>
 <ail0sH1UhnQBPRkr@SMW015318>
 <562096a5-6601-42ae-9d88-90a72ee075fc@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <562096a5-6601-42ae-9d88-90a72ee075fc@kernel.org>
X-ClientProxiedBy: PH8PR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:510:2da::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11878:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef94f4c-671e-4d0d-bf1a-08dec7c51fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rNeFHRijJB9jzmRUMx+Rau6k6LlEm++G4xFFYk6kU7YkRt3Q2Vhv4Sht5tYujYcOqLBMRWXwritFjyV0LqPivDBvLSj020KVE2EAb5W83OYLBo1MjNk7DAHe6HX0hNmNpOlkDTCvcuWRyOEOcvqAPG2hER2X3PRvJm6ffZY7ymjI1Rs7ce7BHrd3+i7z6WT6ZqjRVnBwSjul78tljjbPiCy0ns1qRQs5xu10Uol9FR+D6MfCCYlobjviGcl42KGS032wbSaJTHPJiQghuTB/lIwJbUi32HXIYEcaOxYcYGbNeSFPkycX/0weRMpaht5C5NcQQ11YRK8Cf70hUL8JP6kJ79lMe8RUHdxPFjBiTU/FryVM97Q7Qci5k8LM0GkU4kbYTETVe0ezNUr8+ca5Vpp1tqIH5JZ0gKj+SiuwyQyA7KQhSgw9AW+8dzE08sVrbvmzO7AY2UwoRNcatLt7QZGVXm1LJOK54THxq04ksOgUsnkvlysoHft8yk7UZAXrhsvoLDUTWk4jczMimOdDEGIaocEtH8aWi1NvSti630uo3LjzGTLxPm2CThSGTIc6EvPBEVmug3NdbgnVp6DsLNQJxPrJscSjUZlIE9wBAEs9KFGCGePxTBQcfGp7dxAfhfFlMe6BCVaimkXzqrnatKZfdJl5B8Q+nzuIC6fmouqjn4z7+Vaf82UqgikGyUUr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uto3eMpZQ6uXaG0Sj6TJh8aIwRU6K7O6LkHJZhTVZULy3xCqVPmYfc8dwu9o?=
 =?us-ascii?Q?F+AX6yW99OwlF84EKPKAzlSlCkuadgZncYqQneP0WlxD4Ff0HqDfUvjTpjkz?=
 =?us-ascii?Q?4ozfZE+bYhP6Ut0ZeiOg8zh5l8a6/b27pY+rySlaSn77EZN9msMZjSzjH41U?=
 =?us-ascii?Q?MCPAWwHFc27rXc63uW5geJLqBw3Jijh5Rzqj65Q/EX/rEycOo68JCiD+JEE9?=
 =?us-ascii?Q?rroMRFUzFIY9bkTeSP1xKvEKMzDMMxmtSDKde/OgiX3j2g1feei81tGy63PF?=
 =?us-ascii?Q?Y+gs3StLL+yZa1fW32v1ZaxhtEQtd2Wk1mZfmqZXB0KWofbPCzVIooNfXJyO?=
 =?us-ascii?Q?nkTNUXS3fX1GHVTDM9gNrZeeRaT8YZye3Mf72K2kj3FlWKu7/+ENyXBclniU?=
 =?us-ascii?Q?UJCksIMRMWpMiyai2SagDyd7uPHtGv/fNqCQ0dUfp9VIF1BaiohKyFq6YHUE?=
 =?us-ascii?Q?oMbYC9MJOWkOjQ3mIIpYAEBZGLoPZcbly+0gJHKz3PPTxUhHTBUaKqEK+/+r?=
 =?us-ascii?Q?JPmYjqz1X2UPnfWSxgQ/0EnpL36X3oIigVKXvuSr/ozNSu1Bm5Hu6Ps3jD9q?=
 =?us-ascii?Q?o1X4qAcmSYIFJyL3ewrWiNqg5V/xpmF1XiF0ByMCbJvc7vUXntYmL7XAm6Zf?=
 =?us-ascii?Q?hE6X6WhtzvfE1LYDWE9XWn4WBPzbEJFHYOABytoMXgGK3ls3yampj1lrGpkC?=
 =?us-ascii?Q?j8OOPSPpzo5FVOLCBP97Pvh+34qdL7Ix6HPWfTeuFsd/toM8w9WX7YP5KTiM?=
 =?us-ascii?Q?R3yjEz5H1ReW07wdbTrgTJKGHRDrMNpkxkfwCoAeEe3DAM0c7lyuqYJE146S?=
 =?us-ascii?Q?5mOERKX21cKjBO/qhGtXLIVDrsxno7w9fmggyWh0UHB/elvGcW4+lPpvOl/Q?=
 =?us-ascii?Q?kykLIKE6Snj7zwct6+yBJzEQWvctfqYiP+MqQ/MSSPAnZSB3IL2BN/jwYfQZ?=
 =?us-ascii?Q?vpTt/KJ+U+mMoC388wEQFV2D1CcL2fqx+SzBifDEDN2S9D0Ia6pAjYvHH+RP?=
 =?us-ascii?Q?NT2Lns7/KSyEnAYAhuuX/2SYGXN42w9SKqNr7MQMYQLlgI60I4Nh+Q/lNpWA?=
 =?us-ascii?Q?KkedqGQwHRPrHJ/noDS7243eEprooKsQSx+YFuvtyoP+zz2bAffWssczZ1BR?=
 =?us-ascii?Q?TpWaxUSCc2k65uT9c3eRqEnqV0BbsyPhvVvg546Z9n10n1Ufn+DhyZdt0ZkM?=
 =?us-ascii?Q?9AyVNihfrYu2PLduG8v+DVWipT8TYmGZP1tjK5rb42UFGDYMrP9BBrKlS1h0?=
 =?us-ascii?Q?Z8yxk1/B0OLokCJ6zKJUF2//VgpPqPTlUpb1ocXEuNPxlwkRP3/zdwWV+eXj?=
 =?us-ascii?Q?oCubxNIoIgJHkfGPw8mUZRq0+1j711OC6xMBD1ggF4pIoOfiviIpWlhxpRpW?=
 =?us-ascii?Q?pUOrZHwZmHl9RqNF3gL7bdmyHs3ZJ3zFApgF8s6l9hGz01Bx0NydWaHWeKpd?=
 =?us-ascii?Q?fPzo83isbLft/S5Kr4v2Nz5qK/bzm3FlcqlpFvOdgg63lHWe3IxXRdnQS1IP?=
 =?us-ascii?Q?6BPexVj3zhNxmWYSqhYlMRzHONuSXIP381z0YfJU7Mk0piz6dWDn/oGsLtz0?=
 =?us-ascii?Q?QQ/Il9e4Jur8TL+dTSRVI7Xdjr5tUd/vFqV6JHKCa6pdVZIJbqRMuZSth58k?=
 =?us-ascii?Q?MWhDhA8QCPGA/OYPDooSewGj1sq8hyCGrqDpeUlNOdpYJpx1Hun4L7Hbx5WL?=
 =?us-ascii?Q?dNeWDxkElAjQu9j7JNPEY5Rc5/4sks9eeQyTO4nQeL+UxyJzR/opzynt88fO?=
 =?us-ascii?Q?prRPxBoo0Zu3ikZTqB217s6vNg8fm/tCkGgZU6YP+8vLPn1rLn/b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef94f4c-671e-4d0d-bf1a-08dec7c51fa1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:24:18.9172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfsncWlML7vi/P081A4xH7B9ztrAYEeR4KhaqqNaB37CZwu4EHBBZYCBf+Omldgckmr3GXY8n6GnhD0Vqi/wOjBEHhs0VPsI+1FkwXgo96Fa4d8Xq+9vOeb8Fn3dHDe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11878

On Thu, Jun 11, 2026 at 03:47:00PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2026 16:29, Frank Li wrote:
> > For example:
> >
> > rsc_table: rsc-table@90000000
> > {	ret  = <0x90000000>;
> > 	no-map;
> > }
> >
> > m4 {
> > 	...
> > 	memory-region = <&rsc_table>;
> > }
> >
> > If you change node name "rsc-table" to "memory", driver will failure
> > because it parse node name "rsc-table", which phandle point to. but no
> > binding to restrict node name to "rsc-table". So rsc-table became hidden
> > ABI.
>
> Then you need to fix the driver to not parse the node names. Node names
> are not supposed to be ABI.

Yes, that is this patch set's purpose. Just need below steps to do smooth
migration.
1. allow memory-region-name as options for binding
2. update driver to parse memory-region-names
3. update all dts to add memory-region-names
4. remove old Node name code and change binding to force memory-region-names

Frank

>
> Best regards,
> Krzysztof
