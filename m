Return-Path: <SRS0=3tFr=C3=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81DABC43463
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 18:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10E5D21734
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Sep 2020 18:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="XPtmalzS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgIRSBX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Sep 2020 14:01:23 -0400
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com ([40.107.94.89]:1633
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726007AbgIRSBW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Sep 2020 14:01:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDrd4e202UgWdx+qQpB17IwAniy3Pn/kYFVb+JIDjxS0iky+0LneAleXsc7UkqmkrrpV3QD0Wt8/+7gQ3+dmE5sLQjUvWSSvylA3ZsCiAQFUImiW4PiVQI8kFODaAXdyFJf3YRnermMChBhHUYdiSjIwiD3o3WKRK98x1Lnd2kn+ovR9raKJi+PMMsgtLc0mlHR+V9qT+2WJXNlZLMfP80sJ4ZIcvli23teeZNmB+j05WeWyWA67lAD6RUfKcWTuimc7AxzjUmvdwg4My+7ucmoegGCnW9sXJHY3G5YFJPC1U0OyWaWhpe8xoLyTJqYqRG5QnMYfTm/bejzcXsYH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK6Hp2j6OF0rniuw+TGS7AFTjLXNm3qNtJzX+m+Bi80=;
 b=hXZuhErp6Jx5PQYj7foBlCBHAuJqqQnBv85ef7NiBWU/RhHJnFSWHq7+VJhpGCVSVydtJKdNYf+KcJUr2CtnIjitLzG7bGJVGF8uYFpwqil7+8swDPbRmwyBdOPZCONgSwygkJqq+DBVMD5/RsmC1Q3EnAwiclA2esRlPNeboCed+DTKTtNqqNJDDMgGMssWp+cshX4cLhWeAsTD0RPaF9tuixEcaJB/Icrg2bvYBabqWSGLpZzeee03QY7kZsPG5CABppI55YQl0A1+77HRdcBPThXXlXP+ALAqYatOs97SxQZjUpR27icQlM3L5IewVRC3URoWwIvyKTqLTtpyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK6Hp2j6OF0rniuw+TGS7AFTjLXNm3qNtJzX+m+Bi80=;
 b=XPtmalzSEZqW2CAvICTk/5/GMyN5cgkaXCD+dHc6xz5yG7w2amRwH+JgargQ9MpQT1MSuZyCNcZIsTVS5a3r5ui2RcpE507g2XKm4QoRAdPFa8t9uiNF5w6cnE+z9gBSdcLIXgGTOmwxRNDe77ZMpAER/TgHnpofSdz8lsnErYA=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BY5PR02MB6611.namprd02.prod.outlook.com (2603:10b6:a03:205::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 18 Sep
 2020 18:01:20 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5%5]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 18:01:20 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>,
        "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWjSzx2v36zrUuJk25DA+tFuTaOqltZJcAgAAAbzCAAAnbcIABIlmAgAAd03A=
Date:   Fri, 18 Sep 2020 18:01:19 +0000
Message-ID: <BYAPR02MB44073FBEF86F4AA2379D8A11B53F0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20200918160721.GD15530@xaphan>
In-Reply-To: <20200918160721.GD15530@xaphan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0117ca30-c783-4a8e-37f5-08d85bfcd8e1
x-ms-traffictypediagnostic: BY5PR02MB6611:
x-microsoft-antispam-prvs: <BY5PR02MB661170CE6B0D837DE6B6E2FFB53F0@BY5PR02MB6611.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t7iZhCgRX1CTD7LiWuzyTkfz5xz7Q1yriuk0T0okh5uhkc3Hxr85AlhVhxfgGFn2USNyVP0Ge25fdI2M9IpTJcKS2p6sqTjeQ5SnWVQwE1SVvSW68loLXuiq2bccfgqTRKOI4hxTDys3BmhfO35WlWzLUNMcImScIby2786nv94hmjUAPUTFQ/zz7TApUde8eFN46X1B4mo8AiuO4ncCfWQb7MmCaeAii/ZTsJ/v2QH6fkhHxcFDdVDfGfidE/cq8jgQRXSXjWolbicIcSGd+MIsQqDcdMP5pFVBujJBBc1TO2X+DAUf8+yMqIMyvLeVZiUQmfDqb8miNlcZCzA7ZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(39860400002)(396003)(376002)(53546011)(52536014)(66946007)(8676002)(6506007)(86362001)(66446008)(9686003)(5660300002)(7696005)(66476007)(71200400001)(54906003)(64756008)(33656002)(66556008)(110136005)(76116006)(316002)(186003)(2906002)(26005)(55016002)(4326008)(478600001)(83380400001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ZdYWWshinkv7vbjqmZjHcy26V95JzzATETRwuNFuHQcLcZ5QAz7zlSrZTLb7/gHS7KNOwkTlzLpKYqJ21vQJU6wKJOeyyVXn8scadLlfoVV6lK6e90JEpZIaRo5uyy95YoADXFqiwcDshKOxcg79J1ZgX6wy1cNHc8njgLv81hL6KVmQ+31App6BoOoTyCD1EWyKDLqATL8lDk0o9/Apg7MfCNE9qOwBq8arG6ssubC11WgRbR2u9ScJOtlPI2BdT1qpfeXlUvZWg4OY2VZt32DGIP45tN0O896ZMNg2mweVh3l6+CxIGjy4jR7+tzAtWeVdYBGk+gcLWcbbmlXcacT15G7IjPoHWTha9hnJoYY+iakAtg8wfSI7NweaMURNB7Rtw1SFhqaGxXWleR6ydrcYg8lrgiCobvahEO2vHJCxKqstU1Ce9TptTVNPtkjde6KgHJQR6LXyF4gpOWGTwDF8cbWaSlNwU2fx/WuVdZi4+fU2yTZcEd84bOgvmWlP2DwetL5YBx3pBc8W7wQng8s93s1vIH+ut1XC3SnnRGWAllAN143ECFBhJeAirmVz2MLP7MlZYQyfmHgy6EEjejRPhsz4kH15zjEY6rdLFA8UtXLxCkoVcAp3y1xGrxqRcGLMZWO2xBw77IKHQFctdA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0117ca30-c783-4a8e-37f5-08d85bfcd8e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 18:01:19.9411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfG0bNa6HpGcz6UYwHNz0qsWKX2OSt995FEbhDiQrElMVcQfyHRBBqVH1pAL4mhv3S1YStZ5qccfDeSMjdpjiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6611
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Michael, Punit,

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Friday, September 18, 2020 9:07 AM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5
> remoteproc driver
>=20
> On Thu, Sep 17, 2020 at 10:50:42PM +0000, Ben Levinsky wrote:
> > In addition to device tree, is there particular linker script you use
> > for your R5 application? For example with OCM? As presently this
> > driver only has DDR and TCM as supported regions to load into
>=20
> The firmware is being loaded to TCM.
>=20
> I'm able to use this driver to load and run my firmware on both R5
> cores, but only after I change the incorrect:
>=20
> 	rpu_mode =3D lockstep_mode
>=20
> assignment to:
>=20
> 	rpu_mode =3D lockstep_mode ? PM_RPU_MODE_LOCKSTEP
> 				 : PM_RPU_MODE_SPLIT;
There was a point raised by Punit that as "it is possible to set R5 to oper=
atore in split or lock-step mode dynamically" which is true and can be done=
 via sysfs and the Xilinx firmware kernel code. A suggestion that might cle=
an up the driver so that the whole rpu_mode, tcm_mode configuration can be =
simplified and pulled out of the driver:
- as Punit suggested, remove the lockstep-mode property
- the zynqmp_remoteproc_r5 driver ONLY loads firmware and does start/stop.
- the zynqmp_remoteproc_r5 driver does not configure and memory regions or =
the RPU. Let the Xilinx firmware sysfs interface handle this.

Few advantages to this:
1. no extra configuration code in the zynqmp r5 remoteproc probe() for eith=
er R5 in the RPU cluster
2. less state to manage in the remoteproc driver
3. simpler documentation in the device tree binding

Again thank you both for the thoughtful review comments on this
Thanks
Ben
