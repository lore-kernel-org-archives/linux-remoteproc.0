Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2076.outbound.protection.outlook.com [40.107.6.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C44182D8;
	Fri,  7 Jun 2024 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717773581; cv=fail; b=Sy1qcc7TNwHBIWf201k09vHL04/zNdelp6dq7ntSiK79XQ0btGbhWqEthb4986xhY4ck+JmWgHzg8/nHsuuNsWTIWLY9YPIkIAeNKRbZk0Uj3Y4Dtv9EMFFIpb/jSeBnBSmvK0wLXWNy7zK9tQ6I1XYtbcJVkNxIT+v+3VbGYgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717773581; c=relaxed/simple;
	bh=8IjLk4iQ/f8cfxRdRkb9TG8GJ287TFbuNMZisSpYmRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c1/TWd/UzAAs/jp2o4942/1Gykl/tTEk3sjwwy3rKwavTYZoBxspaLKrSSoO0EBd9FG4s/ctozhE/O9/2DA3mgamzHB3Ki8KCeoCklIP/iw+3oin+QdGj3m6DidhG46X1EWzcaM1Gtbc/izelNpM4AYs/0FDkqydetBEoO+yMAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=EYG4XRyJ; arc=fail smtp.client-ip=40.107.6.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="EYG4XRyJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkv0fvFAP0pB3uorqHELTf2HBXsn2Pm2fC19lFQHtvA1mfZcjtJ+1eLUgXQdyjo+c4UKpC3/3JSdu/ochxDHoMnE+D0Qs2XbN7ga5LH/qI8OqPdklh//ppPc5UDc4Nh01dI3XjlbfdxO89fwJfk6jg+pkI0V6BRNE64N8pCGu6Il/vEgRDmfD+E/KuegJ3i8GVved816ZXXwlhhWn9SrdMxHcs1TsDX6SRRcAEBCLmyXKjolwX7maYHPLEhXFAsAOiqolXUdndRT+B/h29EXLsB4Lqo2KnT2SoLZVTV+JGrWzthZAXJ2vsyIJaMZFa4B75T1L7wbheIpMMV4UUo9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWnMCayxbbSHSlJko1DTLLifqQQGaM3dRMbGzB5udK4=;
 b=Y7Rd5Fqr60hbQx6zXUlL/SHTR7d0THqFldO2kLniQXuOB5LSS1VYbnVOiSf0gY0JRG8obPw8OOCqcXcXfUuaPce3Q4iYtm+ed3O+zeodaLIz5OKTHfTF5cWGws48RCwpgvvShSaFKOq+MXHjPvYG+kyNpvJ/LOkzL9Vcely39uC3o0h6Cu6NgAl2X835IibU2cntrl3F7zTRUmLWzVlLqLpbtrxQ4oxXuKWNqpebGFLzV70ZyWSFAIT8YJWTALfpXSny5FbCZ8WXh4ODP5d/NfEsNUsQ6RoefZia0OrmoxnJoz3+VKhJ2vxnTjPgfFpniVsN+IwrqbFvPbrQuMmZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWnMCayxbbSHSlJko1DTLLifqQQGaM3dRMbGzB5udK4=;
 b=EYG4XRyJcBhE1RszXkltm1mLeb3AGjKE63kIN4ZAY6OgduG9T4GfiXTJydLnEOCbQVF1qfbI0BNWVk+pBui4ZJZcACAedimomfD9UoHuDbOeQokxF0A/iwhscLLN0YdD8jJltNyk3pIOhcsM6EVZpwOCEGLBqGTzzFG5zg8pbps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10266.eurprd04.prod.outlook.com (2603:10a6:800:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 15:19:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 15:19:36 +0000
Date: Fri, 7 Jun 2024 11:19:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org, peng.fan@nxp.com, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: imx_rproc: add minItems
 for power-domain
Message-ID: <ZmMk/T3I1jNcxKOB@lizhi-Precision-Tower-5810>
References: <20240606150030.3067015-1-Frank.Li@nxp.com>
 <19058054-5138-4d37-860f-dd430abd3a0f@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19058054-5138-4d37-860f-dd430abd3a0f@kernel.org>
X-ClientProxiedBy: BYAPR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10266:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aec2b50-3b71-4ffd-fb17-08dc87053dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|366007|7416005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UN/q+Ie1RqCQKGdcrHnRtuLpKmBq4DYUDfM/GNnsYdSF1FQ7WOrVz9v06je2?=
 =?us-ascii?Q?UlyzYMEuTf+quYnggmRbzKscOw0aolzn3qQwipoGTi97JbFa8f7dZ/KdP7mt?=
 =?us-ascii?Q?5wmAdi0rIQBGWxjtneVVa21yVezYNTLp6ko4xIOC8P+WTF0L5tVsItXmQbuV?=
 =?us-ascii?Q?vGiAiS09B+B3lpG2NANOdSSRSAbMNN/ekXbEbf/gE+2ht71DZndBzckfKQK+?=
 =?us-ascii?Q?3SU/ZNun5VIOi6ropgsSkODWESVi/gZ9T0uCnBKroJs9r+mGSnW2RXvqWxwB?=
 =?us-ascii?Q?2ViY9+UfIuKdJmKK1PeiiOdVq3Np1zd/kGIoX7zcgs4GiEX+lL8l17eoK1Zk?=
 =?us-ascii?Q?f27RRANb7IIikJZIE2OTq2n+NInQOEYflL+MWVsn3BxaX6HtnnB3tkgyuJLi?=
 =?us-ascii?Q?RY6BU3mlChzrxGw+49xItrKonNoCe2Ai3u7mhakCxvXo4/axfT7SyXpZUNW1?=
 =?us-ascii?Q?7bDmgO9naf6mVuIgKIB6MrqioZ9zoq5Qkoj0swdbjZLs2CQLYCIBRUnyQQOk?=
 =?us-ascii?Q?SFDSJtRpk7N9etI2H6dNY9PWblPB4S0X5BLvohKVkg38nXNM/D7Pd9el6qUE?=
 =?us-ascii?Q?YxF12h4SrqJsJsNdK4/MqAXxwH1DIaXufnGOeouCVMMD6PZL4+L1VL1WHdYU?=
 =?us-ascii?Q?x7EusOrhBXnmGtyPfwggjV/N39BKVRCNy8MmFE6O35ST8ypFKwjRYEuYT6hF?=
 =?us-ascii?Q?nnEJDhF65WqnS0UNK5ZqkuNKFNNcY1SOeHk3ImdbN+fgr5WmRIiLBrsGc2mV?=
 =?us-ascii?Q?0vtGptC38Wn/KxqrDeQQEPxH2uEImn0a2bvoDi0Qn0EPnIdmpcpVezX6NK9Z?=
 =?us-ascii?Q?o0zX+M1K1O/gxQkf7w7zgILGcE4Csn19WLSZdIrZsyyHE8BmC/Evip1CCdXM?=
 =?us-ascii?Q?i0pr+5+HbXf5g72U8syZKbzDf7ygRv3xPlAiLi5SBHRkn3tVuQVHfrZeH8LP?=
 =?us-ascii?Q?62SMhLl2quJ+70XNnDfpr6W2bu3fCaSGH/CCg2bEwg8d842X1fTfUrZ66DZZ?=
 =?us-ascii?Q?bQ5g+VqQ+go5i/1z+wjGaIv0PbWgIyXXspiGL4dCzQtxg1vRv4jjPNKkMsKD?=
 =?us-ascii?Q?p5SDv1HMD95pNUB/9cikVIlTorgv8Ss5LN618JCnibgeAWMQuCV+cukbCgKL?=
 =?us-ascii?Q?Sm8r8KEPPeiKzs/XXOyc7IwpF+HlaBrcJx6ynRhueB6LIirCwE7TyU7XQRJC?=
 =?us-ascii?Q?k4B2DfSgau2QF6kgqhDLFSPMLyb8e9MvvFlFIXNV6aciuFxjlW8hFwmJcrAP?=
 =?us-ascii?Q?MG6cv6/4GN3OVOvk6KdENZB/Ne4XpsEUZRzIk7OEHKhu/q+ow+8oYcVK7AlB?=
 =?us-ascii?Q?NmHd55aAyNJlzV95ohYKklm5T7svD2djbFNagqaDJDsJ2/BZ5tNDEhXe/iUT?=
 =?us-ascii?Q?RAZY/jo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(366007)(7416005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ekJNv7Z9qFggu730EZRQ3QMJoTiaQRs1kSlYJ9wzviCzSdmOeK36tgdqTKRY?=
 =?us-ascii?Q?Xw5JlTBf6lPdsDagPSKIJatvLWyo1f+5bGrAEjKSwDleNyQCezue9985qF9q?=
 =?us-ascii?Q?uwpOJjce7tvPK54GsaOSiizD6PVyHcUMA0WZx5XCVmMAFLHfdDo2jIQyiZmW?=
 =?us-ascii?Q?s0uAb4nz4aun5Kk0VoeKKIcakUOfW8DrJTSVNK68vCQz5qnc7btzLWm3e4N2?=
 =?us-ascii?Q?yDJtJ8GEXgV50FKq9uirFu1vSYj3/z70Abb4WDQJTF7eZvfUXYI43x76uccD?=
 =?us-ascii?Q?AYFWze2ve4DJgeqc1LIzohCwZ696Jt0UA7al+indQjR1zhhlMJxwrOLeZ5q1?=
 =?us-ascii?Q?nUomrqXp0IAa+QWqSF8TBN4SB868YkET9S6VuE1sTw3uhsrWTF8W+Skyd+bJ?=
 =?us-ascii?Q?eBp8cZiDLFfModJRfsk9qpmhOGms3PWd1KMC3W83u/NkZPNtfTJVVvjqcnm5?=
 =?us-ascii?Q?VJJi8LMONPHzcBEEi94tJdQQifqbjArs2BikkMDZibZ+V0sxeSrwyZNSXP0q?=
 =?us-ascii?Q?weKl74yM4uVZRMgBY4bfQS2dEJuD1q+CzpN9gOCpZ2XgDyy+irv5y0IR+vru?=
 =?us-ascii?Q?kNQiy+8FjCVZQy7C/bEEMfsWngutadbrCPgeo5rbXZfLUQJMnvOCGTKbhWfv?=
 =?us-ascii?Q?6Cug5J6CKzpbR4QoF2XevPu5SGjR0IXqEKJWfc6V/X12KASyQHjLG8GS0HeN?=
 =?us-ascii?Q?tfpkv/6Qvi/wNcEd56KlJ1SHlmN8hgCRH0v+fEr0nVwmQTz9/2TJZ5Kq8LMT?=
 =?us-ascii?Q?K02dBF5QGCqSW2WyoQ6Yg/kuBb3069k2tDlDGgQ41Mso431N+VlUJvCC2jjP?=
 =?us-ascii?Q?cNziars/y7IRSQz9nMjt7yKUPTPUt7DhFlcquzKvj/WFU+CgHpViMM39BFO4?=
 =?us-ascii?Q?7h5RTB5Ixzzy8zmDzPhh/+/UWRLJ0RBUVrQry4FGGBe6IoxFUghIrqZdMzTH?=
 =?us-ascii?Q?G8wx02vKJyXdmBOSkNhvcm1ttR6n3+7+kBtup3gD3aeH9XxwIc7UCjzTQGHe?=
 =?us-ascii?Q?iMBTb5vH5RkgBbdB7vVX93HW1XH+2siOg0xKCldRaHMjDwx4tdhTU7CmNr1V?=
 =?us-ascii?Q?26Z21dEmnjHR1uzZxr/Ov0pucMiSbgMhXIINuuEY00Kt7eI/QJJIO4nfi11R?=
 =?us-ascii?Q?rK3ZVv2Xyu40nUoWmIspQkuIaWeDf/OAPz24GG4afmwAydqj5kd6xyZbx82E?=
 =?us-ascii?Q?CsbwjUlFEubfAn2p32QVFhWx8+RPilx8jql3TDoiaY0S3JfLVXVWRliGijc9?=
 =?us-ascii?Q?oP417eeBb1sFydozVJqRzDGulnagpNkXAWJhdEzzF4X9peaA8iMktnSb3Wax?=
 =?us-ascii?Q?vwp8z8IgOckWv8JAJSq++uXKmM2UDMUuH2/dhDLqHuAvWwWJ+vDDTLTXTQLt?=
 =?us-ascii?Q?ij28TWW7IwXYrEZm1VqWsrBI3Pso2UkUCkpeIV+UG78gNo7bmZ4pE/M+47pl?=
 =?us-ascii?Q?L0wYrBBs1rXndEqCPqc1EYs4L6lxR+Bui6m1na/zUv1s7ovqn6T+gMvUvgSF?=
 =?us-ascii?Q?S1KpEsYA9hvvSDbunyUmE7j+YQV/xetfakg7Hx9H0lsbwlt8UPzUGu3phNAK?=
 =?us-ascii?Q?OD0aRlCs9Oi9+pcRr/K4iBOF5XZ8r/AV9ZEPT2/v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aec2b50-3b71-4ffd-fb17-08dc87053dde
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 15:19:36.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhSoULCLd63KruNETzNTYlykYd+BHU2e7tARvOM792rtMCQmq/VM3LVlPooM3Eg5vwrRvPoYcmiLuFPXTTYwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10266

On Fri, Jun 07, 2024 at 09:32:26AM +0200, Krzysztof Kozlowski wrote:
> On 06/06/2024 17:00, Frank Li wrote:
> > "fsl,imx8qxp-cm4" and "fsl,imx8qm-cm4" need minimum 2 power domains. Keep
> > the same restriction for other compatible string.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > 
> > Notes:
> >     Change from v1 to v2
> >     - set minitem to 2 at top
> >     - Add imx8qm compatible string also
> >     - use not logic to handle difference compatible string restriction
> >     - update commit message.
> >     
> >     pass dt_binding_check.
> >     
> >     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-rproc.yaml
> >       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >       CHKDT   Documentation/devicetree/bindings
> >       LINT    Documentation/devicetree/bindings
> >       DTEX    Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dts
> >       DTC_CHK Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.example.dtb
> > 
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > index df36e29d974ca..da108a39df435 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > @@ -59,6 +59,7 @@ properties:
> >      maxItems: 32
> >  
> >    power-domains:
> > +    minItems: 2
> >      maxItems: 8
> >  
> >    fsl,auto-boot:
> > @@ -99,6 +100,19 @@ allOf:
> >        properties:
> >          fsl,iomuxc-gpr: false
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          not:
> > +            contains:
> > +              enum:
> > +                - fsl,imx8qxp-cm4
> > +                - fsl,imx8qm-cm4
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          minItems: 8
> 
> What happened with the "else:"? How many power domains is needed for
> other devices?

So far, only fsl,imx8qxp-cm4 ind fsl,imx8qm-cm4 need power domain (2-8). 
Power-domains is option property. 

Can I just remove whole "if"?

Frank 


> 
> Best regards,
> Krzysztof
> 
