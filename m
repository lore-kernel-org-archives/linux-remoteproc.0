Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B59C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB66A22257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SoJf6Toy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgJOBbX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:31:23 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:48128
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727165AbgJOBbX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKmG2l2FF5kHfhR87sagIhukeTMVNyj1ZK7HMclSqnMaBGBo4GHwf75vIm2SFYP1/rA4Ug1z+9gb4cPbxPB2ajdDFxJej5oSK353SDDLbnaLlrH6iU6O9rTS3/JpbVlq+mu+GMeGnEk5YsBFDL8L1fDcaF47wjBx1QcsAsoGpY5KHqqZqqgLpqYPvv3W2pVGcTvx5hxXWen8mf0tfkrkACyIiBFCswwaDGMERXsA6qoD0dontea1660sWKRJHVOQnZN/tuR3qAC7EwBrF5iDmcrC+jrRvjZPdvK3V7DDMFu104IRXTW12zA8jnL4hho9gRDb7+A/VNS/55SVJk8geA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyMirBMRu5VwiaRhxw0CsNsHR4jWUIu77yo/QQHgp/w=;
 b=LvpM4xcTlziSZC8hK8vaWL5qhnAkAsia92neKwXedRFOGHtcEMMArUUpLjiVKUgbxmsHE5LMSbuxKNO0Rv3NtK6GXvgNkEPTG3Hf9qu7Qb3Fdm6M9iP0YEoSTkhLDwhY+TfIq5W3WY4wBVb2ICIGW2L1iYmMbx9ZbWYtzfANDzStCvKcF8IRXzDCTxY4e8VgdW+nL7qI2GkMC9IlywmTlvO9gjUNHIbAx/oFm2MXyZhY0Q7bpfVt474kmxkmjuoTnLwueKLyK4vgyhZscNQLjgUV44qe7PVvBJssc+BCaHfHj27aqzEvzW6uVqx8bVuQtevT9oKKbQSGGZqaHgOM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyMirBMRu5VwiaRhxw0CsNsHR4jWUIu77yo/QQHgp/w=;
 b=SoJf6Toy816WJet2sig8xTSq/PNUl4mrDeztTg8bWB+kzQEbY/mWbojoEneg4IS14J8v4/3+sEUlVnHPzJRpryiMFlQ4lTIHFIUMxFxyZauK7lTGmH6HZJne+VdJtiIeWqg0/2Y03A9nHeEwbZybK/GsGK28QFOAB3n2rCMgkZM=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 01:31:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:31:19 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 03/13] remoteproc: Add new RPROC_ATTACHED state
Thread-Topic: [PATCH 03/13] remoteproc: Add new RPROC_ATTACHED state
Thread-Index: AQHWe8jI7hAKG8ZDjkOTKmZvrQGg5amYLhjQ
Date:   Thu, 15 Oct 2020 01:31:19 +0000
Message-ID: <DB6PR0402MB2760A4B2009B221B462FE0AB88020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-4-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-4-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 01a15206-c9fc-49b0-cbf8-08d870aa0457
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-microsoft-antispam-prvs: <DB7PR04MB40900171F5A6ACFD4BC2AE4988020@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MqzKybMN6AlYJQ/UrEW9J3nk92RmEt46cSYcwfsaPu1wnlL9M9oc3cBNRsZmoJUS+HmszfAWCd+68Z1+fPfkoS3rWwScRr/ePbt8kqIEkV+HAQ/CrrbeJuhICRpWl8KKffTA39qI/CdiWSNR7F9z41fTQqjUCpTTkj5svj+TDrhiZqR6AB/dnT7ObdjeRF5xOiARJYlmWmp2KHJ+Jbbs+g0jiAPJxj6Q/N5q+YUKFu8dXTrjVBOG4CNvgZsJYgniU7aMn9BDpQE+fcuJ3BREN0NX4TvG3oogXgglweum0qFWykvvyljye87A6Ma8Nu3xWVkwEwGPY8nj8TrwP3rNGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(55016002)(9686003)(26005)(478600001)(4326008)(8676002)(2906002)(7696005)(186003)(8936002)(52536014)(44832011)(64756008)(83380400001)(33656002)(6506007)(54906003)(316002)(110136005)(66556008)(76116006)(66446008)(66476007)(5660300002)(86362001)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: RZSDFpLpdI5Da8ekYKgQaROgg6EtxHh0YuYgqG3yOzaSOtCI9DhYv0DfnJ5Vqxa1Qjn1LvBkOUZWSDAszPUjjo0MWLFKewSeCP3OQnPoE1HCZo0dIktqmR6OH0OHZxm1ASAuxFfH6zKmT285xeGWXhTRCC07R3l7BPZFikh4Gmh4Urz7yr/WCZ1/rxaBCelSORZ/aD8mao9kvNPAEaSqX+vhylmaKEE369xH4NM2irv8ilopjZhBfugQWS3AfGOqiS4hFarXO7gmfKeinq0A7GEqa80EwEa46dlOZgHQl2pzub+ZPNpkYVCWiYaEXI/7Xg+HFiUKPxLpxiJljmSo8o3Y/KywAVdU2WrXEOCHMPNnem7RjyVRzChtarSLk+B3l4ct/ho8/91t2PzctFpPQFIerGoe5R02BfmXBDVY71BHFm4z1/dJRk+JYyeXXW352aTGzRrbwpgX6CqPlChYrDk2xxONw5ikzrHg19yYwVtdevZTXzky9GK4jSsnzvyVbfrgOn6E/Y3oBt+Jxhxuzi/i8cne8KpKMZG6MA7FXCVq2MpH/GYMI6jo02ChlHN/6NcVvRMnajaXKmBM1N4gfX6N3dE8oflwpf2n7cwvnZCuG8PML9XMi71271XcjUSDvI37BAxyM1XYe1XnEjajjA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a15206-c9fc-49b0-cbf8-08d870aa0457
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:31:19.1399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iwIarMiXPTQ647cPnzEqOsqg9H4LuqRwfrx+Hq5iX6WWW3CF/4g/hcY7GwA2gdMHNV65N5Wk1eqqzEe4ZUynNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 03/13] remoteproc: Add new RPROC_ATTACHED state
>=20
> Add a new RPROC_ATTACHED state to take into account scenarios where the
> remoteproc core needs to attach to a remote processor that is booted by
> another entity.
>=20
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 1 +
>  include/linux/remoteproc.h            | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
> b/drivers/remoteproc/remoteproc_sysfs.c
> index eea514cec50e..2d575e6c9eb8 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -84,6 +84,7 @@ static const char * const rproc_state_string[] =3D {
>  	[RPROC_RUNNING]		=3D "running",
>  	[RPROC_CRASHED]		=3D "crashed",
>  	[RPROC_DELETED]		=3D "deleted",
> +	[RPROC_ATTACHED]	=3D "attached",
>  	[RPROC_DETACHED]	=3D "detached",
>  	[RPROC_LAST]		=3D "invalid",
>  };
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h inde=
x
> 2fa68bf5aa4f..4e107615121a 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -403,6 +403,8 @@ struct rproc_ops {
>   * @RPROC_RUNNING:	device is up and running
>   * @RPROC_CRASHED:	device has crashed; need to start recovery
>   * @RPROC_DELETED:	device is deleted
> + * @RPROC_ATTACHED:	device has been booted by another entity and
> the core
> + *			has attached to it
>   * @RPROC_DETACHED:	device has been booted by another entity and
> waiting
>   *			for the core to attach to it
>   * @RPROC_LAST:		just keep this one at the end
> @@ -419,8 +421,9 @@ enum rproc_state {
>  	RPROC_RUNNING	=3D 2,
>  	RPROC_CRASHED	=3D 3,
>  	RPROC_DELETED	=3D 4,
> -	RPROC_DETACHED	=3D 5,
> -	RPROC_LAST	=3D 6,
> +	RPROC_ATTACHED	=3D 5,
> +	RPROC_DETACHED	=3D 6,
> +	RPROC_LAST	=3D 7,
>  };
>=20
>  /**
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
