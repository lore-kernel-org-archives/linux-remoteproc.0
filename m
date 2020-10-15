Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243DEC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:28:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B437F22257
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 01:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TJ9V6yXA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732179AbgJOB2q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:28:46 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:50503
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727165AbgJOB2p (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 21:28:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ1OWoB9vpvvco3BXdCV6bpqQs0L4i7QdhosHtiIvB0UE7Eas8mlPaDkt/jO1I9XkXtVuQ+xVx5s7ChgDG3d9c5+pmovZUpO7DNUczLIbdPICdnQQY9DtZA+h4IV0PztCP6907nc6aN1QGPUlwT2s6GOETpyTeo2JOOopNPjTmJNTHNa0U+xog6DMsZTJz81C0CLAzvjv8Bkfvel3cxkZKXnZ5F2+ykRZvf/Ekhz0+p5bv737zWE30AqozV2nG/H6F8XmsNVNTXuImArynEmW8MiP3WA+7YMdTNsH3+uEDj68N72d9sjxdshpGwwkg5pElFUMsdgioITHXKyAP2aqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56ELpbfK29barcXOKo9eHiFHg5dgIyQnfxNDhsQWT5I=;
 b=gL1CHGGgmDq0ivYxw1ZM8p/59YHZS/Un2VFouRQvEDZHWbAZZhoSIZ2F8EI0lx6azAGzFqKJhL4caL/RhUUPddCKWzayQxF9UqYxUrZSYTWlFyIQcGXLh1lJwrYbVRGF24igq8//krDNs3aEqkWHqJ9kDSIflf2Zwj/NVnXep7d5aP2iT/Jn2wReDusiCvtEFgJz4vNmfaMVLRGfdVAN5wSXWxXztsAlVJhdLAvvHU733eLA0aH0K4UMTqEbXFFbFT5rF8YQVXfbSO8BfM11PhcXlTieYMeR51DNhHtTXA/B7FgGwsywJg8lwqz0iZMwda+4AkCblhGJPE6UuZoe1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56ELpbfK29barcXOKo9eHiFHg5dgIyQnfxNDhsQWT5I=;
 b=TJ9V6yXACKZEvWzJK8eUjCdHgqlC4dCprxkU4wJpDOZHIvYlPymxvDcz0VITNUpsjuEWGfuEfs0TC0CGDCXwDhyPioYmUV2H4Q8TI5tsqnm2J6zW/5i7w0Gx2QdMIBuPhYgRn7HQU5u+4LpJYe/TRT0a3rxztOWWkbcq8JcQzS4=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4090.eurprd04.prod.outlook.com (2603:10a6:5:28::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 01:28:41 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 01:28:41 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 01/13] remoteproc: Re-check state in rproc_shutdown()
Thread-Topic: [PATCH 01/13] remoteproc: Re-check state in rproc_shutdown()
Thread-Index: AQHWe8jP8/+8ndV5lUW//Ng5RVV1N6mYLUFw
Date:   Thu, 15 Oct 2020 01:28:40 +0000
Message-ID: <DB6PR0402MB2760DB90DA376F4BB2DBB9D888020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200826164529.224476-1-mathieu.poirier@linaro.org>
 <20200826164529.224476-2-mathieu.poirier@linaro.org>
In-Reply-To: <20200826164529.224476-2-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9f1f220e-cb78-42d5-c183-08d870a9a620
x-ms-traffictypediagnostic: DB7PR04MB4090:
x-microsoft-antispam-prvs: <DB7PR04MB4090D5AC07A03269A177609888020@DB7PR04MB4090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PRKsmw++ELgfZnM9YhBzGpyUzdVa/htAfs+6xQShbGPhdUTsu66/i7bClfXlAHZtY78y1dVycQ8bKvVKx9KMUhl8vzLQPnq/IcCoAC3jYaM5QinjOrqV5QK+rowtXDT4wEuSm0ejX1XnmFwA36iEZxJ+wYsmMfcKtx7xuJQxreLP/TrRy4h3bPlDCLe4eLm23N1nWlqjUYQyHcB8smT79Cf0EufRAAIqI0OU8Gjs4aRkU7Tm+pBpzbYn3SLhYRW66Ds+4LtpJx3h78W+UuRaRT6k3fGT0jMXAP+VR/arnjrpX5JP+22IarduscZMBlpgaUQ4coKFm0WbN+Zb9ix8ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(55016002)(9686003)(26005)(478600001)(4326008)(8676002)(2906002)(7696005)(186003)(8936002)(52536014)(44832011)(64756008)(33656002)(4744005)(6506007)(54906003)(316002)(110136005)(66556008)(76116006)(66446008)(66476007)(5660300002)(86362001)(71200400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FecdOnY0GJXkIp6nJKvqkovKUei3FU6wQ3ENJ89qJMQpubGJMgh9p8onssUJIdibEXlwdQIlEag+b/oNz+t4HP6d5zh5ZIL9V0cxhPDz/VI7vViPiNlwtuUfoz2YWID7Or6kAC4689crQuqPLJ/EXFxyYXriK3wkKIbXoTJq+6VdQU1ANxhoPSwj3M9jU7/b7SONiaMCaDvOJWrh8rbKeBzkLGI4UZLziV6Lga7USV+R8DmF6dUeCKIKgp4T/hkIXAlU/p2AEwZYmzJZF4dMUGU4/KH81eFhQX3Qm3euxWPMbCX0oLX5DuBdW91wn3s3HYSjBtnouKi9pJVSYvbg48Mq/ftlZR0JQmb0sUEpvKH7xlQntjODzWqAp1WF+t2ZWAEnstMd9/twm+kfQ1xAjF56Wot0Ns+m5drMOFGtDaFAE9hUiRLVwqIdrPTQg0AZqOUkfcmhbcYBptZ/juwSuLJ15qTBmd3Dimd2Wavb/NWRPSUyjQo6BV0n0suCBY0io0ENnw+5wX3feMwtU505Kd5WdJB0XtcuugEhQTi7Nys2NIGBWlmJgrZ6y2pTKNJVP4Gmpb8mGiOB/hj36WIUDAOLFASJOkTQ+dz2emrtd2z2XkL9yikHNfiVFl/temVGPMtEGHulHtok1Hb1x7HIlg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1f220e-cb78-42d5-c183-08d870a9a620
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 01:28:40.9964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5oOvAO3bRRg0kESrPkSltRAifrdF1h43Fly1Y7zHMMdEPF7+GCRlPfEevsOUZIyWRzam22qgVOWu+66mm2tSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4090
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 01/13] remoteproc: Re-check state in rproc_shutdown()
>=20
> The state of the remote processor may have changed between the time a cal=
l
> to rproc_shutdown() was made and the time it is executed.  To avoid movin=
g
> forward with an operation that may have been cancelled, recheck while
> holding the mutex.
>=20
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> index 7f90eeea67e2..fb2632cbd2df 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1834,6 +1834,9 @@ void rproc_shutdown(struct rproc *rproc)
>  		return;
>  	}
>=20
> +	if (rproc->state !=3D RPROC_RUNNING)
> +		goto out;
> +
>  	/* if the remote proc is still needed, bail out */
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
